
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

with Interfaces.C.Strings;
with Ada.Text_IO; use Ada.Text_IO;
with SDL.Error;
with SDL.Active;
with SDL.Keysym;
with SDL.Mouse;
with SDL.Timer;

package body ThreadWin_Sprogs is
   package It renames Interfaces;
   package CS renames Interfaces.C.Strings;
   use type C.int;
   use type V.Surface_ptr;
   use type V.Palette_ptr;
   package Er renames SDL.Error;
   use type Ev.Event_Mask;
   package A  renames SDL.Active;
   use type A.Active_State;
   package Ks renames SDL.Keysym;
   use type Ks.Key;
   package M  renames SDL.Mouse;
   use type M.Mouse_Button_State;
   package Tm renames SDL.Timer;

   use Uint8_Ptrs;
   use Uint8_PtrOps;

   --  Is the cursor visible
   visible : Boolean := True;

   type Mask_Array is
      array (Integer range <>) of aliased Uint8;
   pragma Convention (C, Mask_Array);
   type Mask_Array_Access is access Mask_Array;

   --  ======================================
   procedure LoadIconSurface (
      file   : in string;
      maskp  : in out Icon_Mask_Array_Access;
      icon   : out V.Surface_ptr)
   is
      use type Interfaces.Unsigned_8;
      mlen   : C.int;
      i : Integer;

      pixels    : Uint8_PtrOps.Pointer;
      use V.Color_PtrOps;

   begin
      --  Load the icon surface
      icon := V.LoadBMP (CS.New_String (file));
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
                     Uint32(To_Pointer (icon.pixels).all));

      --  Create the mask
      pixels := Uint8_PtrOps.Pointer (To_Pointer (icon.pixels));
      Put_Line ("Transparent pixel: (" &
         Uint8'Image (
            V.Color_ptr (
               V.Color_PtrOps.Pointer (
                  icon.format.palette.colors) + C.ptrdiff_t (pixels.all)
            ).all.r
         )
         & "," &
         Uint8'Image (
            V.Color_ptr (
               V.Color_PtrOps.Pointer (
                  icon.format.palette.colors) + C.ptrdiff_t (pixels.all)
            ).all.g
         )
         & "," &
         Uint8'Image (
            V.Color_ptr (
               V.Color_PtrOps.Pointer (
                  icon.format.palette.colors) + C.ptrdiff_t (pixels.all)
            ).all.b
         )
         & ")");

      mlen := icon.w * icon.h;
      maskp := new V.Icon_Mask_Array (0 .. Integer(mlen/8 - 1));
      maskp.all := (others => 0);
      i := 0;
      while i < Integer (mlen) loop
         if Uint8_PtrOps.Pointer
               (pixels + C.ptrdiff_t (i)
               ).all /= pixels.all
         then
            maskp (i / 8) := Uint8 (
               It.Unsigned_8 (maskp (i / 8)) or 16#01#);
         end if;
         i := i + 1;
         if i mod 8 /= 0 then
            maskp (i / 8) := Shift_Left (maskp (i / 8), 1);
         end if;
      end loop;
   end LoadIconSurface;

   --  ======================================
   reallyquit : Boolean := False;
   --  ======================================
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
            Put_Line ("input");

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

         --  This is important! Queue it if we want to quit.
         when Ev.QUIT =>
            if not reallyquit then
               reallyquit := True;
               Put_Line ("Quit requested");
               return 0;
            end if;
            Put_Line ("Quit demanded");
            return 1;

         --  Mouse and keyboard events go to threads
         when Ev.MOUSEMOTION
              | Ev.MOUSEBUTTONDOWN
              | Ev.MOUSEBUTTONUP
              | Ev.KEYDOWN
              | Ev.KEYUP =>
            return 1;

         --  Drop all other events
         when others =>
            return 0;
      end case;
   end FilterEvents;

   --  ======================================
   function HandleMouse (unused : System.Address) return C.int
   is
      events : Ev.Events_Array (0 .. 9);
      found : C.int;
      mask : Ev.Event_Mask;
   begin
      --  Handle mouse events here
      mask := (Ev.MOUSEMOTIONMASK or Ev.MOUSEBUTTONDOWNMASK or Ev.MOUSEBUTTONUPMASK);
      while not done loop
         Ev.PeepEventsVP (found, events, 10, Ev.GETEVENT, mask);
         for i in Natural range 0 .. Natural (found) - 1 loop
            case events (i).the_type is
               --  We want to toggle visibility on buttonpress
               when Ev.MOUSEBUTTONDOWN | Ev.MOUSEBUTTONUP =>
                  if events (i).button.state = SDL_PRESSED then
                     visible := not visible;
                     M.ShowCursor (Boolean'Pos(visible));
                  end if;
                  Put ("Mouse button '" & Uint8'Image (events (i).button.button));
                  if events (i).button.state = M.Mouse_Button_State (SDL_PRESSED) then
                     Put_Line ("' pressed");
                  else
                     Put_Line ("' released");
                  end if;
               when Ev.MOUSEMOTION =>
                  Put_Line ("Mouse relative motion: {" &
                            Sint16'Image (events (i).motion.xrel) &
                            "," & Sint16'Image (events (i).motion.yrel) & "}");
               when others => null;
            end case;
         end loop;
         --  Give up some CPU to allow events to arrive
         Tm.SDL_Delay (20);
      end loop;
      return 0;
   end HandleMouse;

   --  ======================================
   function HandleKeyboard (unused : System.Address) return C.int
   is
      events : Ev.Events_Array (0 .. 9);
      found : C.int;
      mask : Ev.Event_Mask;
   begin
      --  Handle mouse events here
      mask := (Ev.KEYDOWNMASK or Ev.KEYUPMASK);
      while not done loop
         Ev.PeepEventsVP (found, events, 10, Ev.GETEVENT, mask);
         for i in Natural range 0 .. Natural (found) - 1 loop
            case events (i).the_type is
               --  We want to toggle visibility on buttonpress
               when Ev.KEYDOWN | Ev.KEYUP =>
                  --  Allow hitting <ESC> to quit the app
                  if events (i).key.keysym.sym = Ks.K_ESCAPE then
                     done := True;
                  end if;
                  Put ("Key '" &
                       C.wchar_t'Image (C.wchar_t'Val (events (i).key.keysym.unicode)) &
                       "' has been ");
                  if events (i).key.state = Uint8 (SDL_PRESSED) then
                     Put_Line (" pressed");
                  else
                     Put_Line (" released");
                  end if;
               when others => null;
            end case;
         end loop;
         --  Give up some CPU to allow events to arrive
         Tm.SDL_Delay (20);
      end loop;
      return 0;
   end HandleKeyboard;

   --  ======================================
end ThreadWin_Sprogs;
