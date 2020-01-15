
-- ----------------------------------------------------------------- --
--                                                                   --
-- This is free software; you can redistribute it and/or             --
-- modify it under the terms of the GNU General Public               --
-- License as published by the Free Software Foundation; either      --
-- version 2 of the License, or (at your option) any later version.  --
--                                                                   --
-- This software is distributed in the hope that it will be useful,  --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of    --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU --
-- General Public License for more details.                          --
--                                                                   --
-- You should have received a copy of the GNU General Public         --
-- License along with this library; if not, write to the             --
-- Free Software Foundation, Inc., 59 Temple Place - Suite 330,      --
-- Boston, MA 02111-1307, USA.                                       --
--                                                                   --
-- ----------------------------------------------------------------- --

-- ----------------------------------------------------------------- --
-- This is a translation, to the Ada programming language, of the    --
-- original C test files written by Sam Lantinga - www.libsdl.org    --
-- translation made by Antonio F. Vargas - www.adapower.net/~avargas --
-- ----------------------------------------------------------------- --

with Ada.Text_IO; use Ada.Text_IO;
with SDL.Active;
with SDL.Mouse;
with SDL.Keysym;
with SDL_Framebuffer;

package body Testwm_Sprogs is

   package  It renames Interfaces;

   package  A  renames SDL.Active;
   use type A.Active_State;

   package Ks  renames SDL.Keysym;
   use type Ks.Key;
   use type Ks.SDLMod;

   use type C.int;
   use type V.Surface_Flags;
   use type V.Surface_ptr;
   use type V.Palette_ptr;
   use type V.GrabMode;
   package Fb renames SDL_Framebuffer;

   package M  renames SDL.Mouse;
   use type M.Mouse_Button_State;

   visible : C.int := 1;

   --  =============================================
   procedure LoadIconSurface (
      file   : in string;
      maskp  : in out Icon_Mask_Array_Access;
      icon   : out V.Surface_ptr)
   is
      use type Interfaces.Unsigned_8;
      mlen   : C.int;
      i : Integer;

      pixels    : Fb.Framebuffer_8bPointer;
      use V.Color_PtrOps;

   begin
      --  Load the icon surface
      icon := V.LoadBMP (file);
      if icon = null then
         Put_Line ("Couldn't load " & file & Er.Get_Error);
         return;
      end if;

      --  Check width and height
      if icon.w mod 8 /= 0 then
         Put_Line ("Icon width must be a multiple of 8!");
         V.FreeSurface (icon);
         icon := null;
         return;
      end if;

      if icon.format.palette = null then
         Put_Line ("Icon must have a palette!");
         V.FreeSurface (icon);
         icon := null;
         return;
      end if;

      --  Set the colorkey
      V.SetColorKey (icon, V.SRCCOLORKEY,
                     Fb.Get_Framebuffer (icon).all);

      --  Create the mask
      pixels := Fb.Get_Framebuffer (icon);
      Put_Line ("Transparent pixel: (" &
         Uint8'Image (Fb.Get_Palette_Red (icon, pixels.all))
         & "," &
         Uint8'Image (Fb.Get_Palette_Green (icon, pixels.all))
         & "," &
         Uint8'Image (Fb.Get_Palette_Blue (icon, pixels.all))
         & ")");

      mlen := icon.w * icon.h;
      maskp := new V.Icon_Mask_Array(0 .. Integer(mlen/8 - 1));
      maskp.all := (others => 0);
      i := 0;
      while i < Integer (mlen) loop
         if Fb.Go_Right_Unchecked (pixels, i).all /= pixels.all then
            maskp (i / 8) := Uint8 (
               It.Unsigned_8 (maskp (i / 8)) or 16#01#);
         end if;
         i := i + 1;
         if i mod 8 /= 0 then
            maskp (i / 8) := Shift_Left (maskp (i / 8), 1);
         end if;
      end loop;
   end LoadIconSurface;

   --  =============================================
   procedure HotKey_ToggleFullScreen is
      screen : V.Surface_ptr;
   begin
      screen := V.GetVideoSurface;
      if V.WM_ToggleFullScreen (screen) /= 0 then
         Put ("Toggled fullscreen mode - now ");
         if (screen.flags and V.FULLSCREEN) /= 0 then
            Put_Line ("fullscreen");
         else
            Put_Line ("windowed");
         end if;
      else
         Put_Line ("Unable to toggle fullscreen mode");
      end if;
   end HotKey_ToggleFullScreen;

   --  =============================================
   procedure HotKey_ToggleGrab is
      mode : V.GrabMode;
   begin
      Put_Line ("Ctrl-G: toggling input grab!");
      mode := V.WM_GrabInput (V.GRAB_QUERY);
      if mode = V.GRAB_ON then
         Put_Line ("Grab was on");
      else
         Put_Line ("Grab was off");
      end if;

      if mode /= 0 then
         mode := 0;
      else
         mode := 1;
      end if;

      mode := V.WM_GrabInput (mode);
      if mode = V.GRAB_ON then
         Put_Line ("Grab is now on");
      else
         Put_Line ("Grab is now off");
      end if;
   end HotKey_ToggleGrab;

   --  =============================================
   procedure HotKey_Iconify is
   begin
      Put_Line ("Ctrl-Z: iconifying window!");
      V.WM_IconifyWindow;
   end HotKey_Iconify;

   --  =============================================
   procedure HotKey_Quit is
      event : Ev.Event;
   begin
      Put_Line ("Posting internal quit request");
      event.the_type := Ev.ISUSEREVENT;
      Ev.PushEvent (event);
   end HotKey_Quit;

   --  =============================================

   reallyquit : C.int := 0;
   function  FilterEvents (event : Ev.Event_ptr) return C.int is
   begin
      case event.the_type is
         when Ev.ISACTIVEEVENT =>
            --  See what happened
            Put("App ");
            if event.active.gain /= 0 then
               Put ("gained ");
            else
               Put ("lost ");
            end if;
            if (event.active.state and A.APPACTIVE) /= 0 then
               Put ("active ");
            end if;
            if (event.active.state and A.APPMOUSEFOCUS) /= 0 then
               Put ("mouse ");
            end if;
            Put_Line ("focus");

            --  See if we are iconified or restored
            if (event.active.state and A.APPACTIVE) /= 0 then
               Put ("App has been ");
               if event.active.gain /= 0 then
                  Put_Line ("restored");
               else
                  Put_Line ("iconified");
               end if;
            end if;
            return 0;

         --  We want to toggle visibility on buttonpress
         when Ev.MOUSEBUTTONDOWN | Ev.MOUSEBUTTONUP =>
            if event.button.state = M.PRESSED then
               if visible /= 0 then
                  visible := 0;
               else
                  visible := 1;
               end if;
               M.ShowCursor (visible);
            end if;
            Put ("Mouse button " &
                 Uint8'Image (event.button.button) &
                 " has been");
            if event.button.state = M.PRESSED then
               Put_Line (" pressed");
            else
               Put_Line (" released");
            end if;
            return 0;

         --  Show relative mouse motion
         when Ev.MOUSEMOTION =>
            Put_Line ("Mouse relative motion: {" &
                      Sint16'Image (event.motion.xrel) &
                      ", " &
                      Sint16'Image (event.motion.yrel) &
                      "}");
            return 0;
         when Ev.KEYDOWN =>
            if event.key.keysym.sym = Ks.K_ESCAPE then
               HotKey_Quit;
            end if;
            if (event.key.keysym.sym = Ks.K_g) and
               ((event.key.keysym.the_mod and Ks.KMOD_CTRL) /= 0)
            then
               HotKey_ToggleGrab;
            end if;
            if (event.key.keysym.sym = Ks.K_z) and
               ((event.key.keysym.the_mod and Ks.KMOD_CTRL) /= 0)
            then
               HotKey_Iconify;
            end if;
            if (event.key.keysym.sym = Ks.K_RETURN) and
               ((event.key.keysym.the_mod and Ks.KMOD_ALT) /= 0)
            then
               HotKey_ToggleFullScreen;
            end if;
            return 0;
         --  this is important! Queue it if we want to quit.
         when Ev.QUIT =>
            if reallyquit = 0 then
               reallyquit := 1;
               Put_Line ("Quit requested");
               return 0;
            end if;
            Put_Line ("Quit demanded");
            return 1;

         --  This will never happen because events queued directly
         --  to the event queue are not filtred.
         when Ev.ISUSEREVENT =>
            return 1;

         --  Drop all other events
         when others =>
            return 0;

      end case;
   end FilterEvents;

end Testwm_Sprogs;
