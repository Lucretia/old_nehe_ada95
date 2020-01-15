
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

with Interfaces.C;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Characters.Handling;
with Ada.Command_Line;
with Ada.Strings.Unbounded;
with GNAT.OS_Lib;
with SDL.Types; use SDL.Types;
with SDL.Events;
with SDL.Video;
with SDL.Error;
with SDL.Quit;
with SDL_Framebuffer;

with Testwm_Sprogs; use Testwm_Sprogs;
with Lib_C;

procedure testwm is
   package  C  renames Interfaces.C;
   use type C.int;
   use type C.size_t;

   package  CL renames Ada.Command_Line;
   package  CH renames Ada.Characters.Handling;
   package  US renames Ada.Strings.Unbounded;
   use type US.Unbounded_String;

   use type V.Surface_Flags;
   use type V.Surface_ptr;

   package  Ev renames SDL.Events;
   use type Ev.Event_Type;
   package Fb renames SDL_Framebuffer;

   package  Er renames SDL.Error;
   package  Q  renames SDL.Quit;

   --  =============================================
   Screen_Width  : constant := 640;
   Screen_Height : constant := 480;

   event        : Ev.Event;
   title        : US.Unbounded_String;
   type Title_Access_Type is access String;
   The_Title    : Title_Access_Type;
   icon         : V.Surface_ptr;
   icon_mask    : Icon_Mask_Array_Access;
   parsed       : C.int;
   buffer       : Fb.Framebuffer_8bPointer;
   screen       : V.Surface_ptr;

   palette      : V.Colors_Array (0 .. 255);

   video_flags  : V.Surface_Flags;
   argc         : Integer := CL.Argument_Count;

   package Uint8_IO is new Ada.Text_IO.Modular_IO (Uint8);
   video_bpp   : Uint8;
   Wait_Event_Result : C.int;

   --  =============================================

begin
   if SDL.Init (SDL.INIT_VIDEO) < 0 then
      Put_Line ("Couldn't initialize SDl: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;
   Q.atexit (SDL.SDL_Quit'Access);

   --  Check command line arguments
   video_bpp   := 8;
   video_flags := V.SWSURFACE;
   parsed      := 1;
   while parsed /= 0 loop
      if argc >= 1 and then CL.Argument (argc) = "-fullscreen" then
         video_flags := video_flags or V.FULLSCREEN;
         argc := argc - 1;
      elsif (argc >= 2) and then
            (CL.Argument (argc - 1) = "-bpp") and then
            CH.Is_Digit (CL.Argument (argc) (1)) then
         declare
            last : positive;
            use Uint8_IO;
         begin
            Get (CL.Argument (argc), video_bpp, last);
         end;
         argc := argc - 2;
      elsif (argc >= 2) and then
            (CL.Argument (argc - 1) = "-title") then
            The_Title := new String'(CL.Argument (argc));
            argc := argc - 2;
      else
         parsed := 0;
      end if;
   end loop;

   --  Set the icon -- this must be done before the first mode set
   LoadIconSurface ("icon.bmp", icon_mask, icon);
   if icon /= null then
      V.WM_SetIcon(icon, icon_mask.all);
      --  V.WM_SetIcon(icon, null);
   end if;

   if  The_Title = null then
      The_Title := new String'("Testing 1.. 2.. 3...");
   end if;

   V.WM_Set_Caption (The_Title.all, "testwm");

   --  See if it it's really set
   V.WM_Get_Caption_Title (title);

   if title /= US.Null_Unbounded_String then
      Put_Line ("Title was set to: " & US.To_String (title));
   else
      Put_Line ("No window title was set!");
   end if;

   --  Initialize the display
   screen := V.SetVideoMode (Screen_Width, Screen_Height,
                             C.int (video_bpp), video_flags);
   if screen = null then
      Put_Line ("Couldn't set " & Integer'Image (Screen_Width) &
                "x" & Integer'Image (Screen_Height) &
                " video mode: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;
   Put ("Running in ");
   if (screen.flags and V.FULLSCREEN) /= 0 then
      Put (" fullscreen");
   else
      Put (" windowed");
   end if;
   Put_Line (" mode");

   --  Set an event filter that discards everything but QUIT
   Ev.SetEventFilter (FilterEvents'Access);

   --  Ignore key up events, they don't even get filtered
   declare
      Dummy_Uint8 : Uint8;
   begin
      Dummy_Uint8 :=  Ev.EventState (Ev.KEYUP, Ev.IGNORE);
   end;

   --  Set the surface pixels and refresh!
   for i in C.size_t range 0 .. 255 loop
      palette (i) := (Uint8 (255 - i),
                      Uint8 (255 - i),
                      Uint8 (255 - i),0);
   end loop;

   V.SetColors (screen, palette, C.int (palette'First), palette'Length);
   if V.LockSurface (screen) < 0 then
      Put_Line ("Couldn't lock display surface: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (2);
   end if;

   buffer := Fb.Get_Framebuffer (screen);
   for i in 0 .. screen.h - 1 loop
      Fb.Paint_Line_Unchecked (screen, buffer, (i * 255 ) / screen.h);
      buffer := Fb.Next_Line_Unchecked (screen, buffer);
   end loop;

   V.UnlockSurface (screen);
   V.UpdateRect (screen, 0, 0, 0, 0);

   --  Loop, wait for QUIT
   loop
      Ev.Wait_Event (Wait_Event_Result,event);
      exit when Wait_Event_Result = 0;
      case event.the_type is
         when Ev.ISUSEREVENT =>
            Put_Line ("Handling internal quit request");
            Put_Line ("Bye bye..");
            return;
         when Ev.QUIT =>
            Put_Line ("Bye bye..");
            return;
         when others =>
            --  this should never happen
            Put_Line("Warning: Event " &
                     Ev.Event_Type'Image (event.the_type) &
                     " wasn't filtered");
      end case;
   end loop;
   Put_Line ("WaitEvent error: " & Er.Get_Error);
   GNAT.OS_Lib.OS_Exit (0);
end testwm;
