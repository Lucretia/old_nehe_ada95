
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

--  ----------------------------------------------------------------- --
--  WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING
--  ----------------------------------------------------------------- --
--  SERIOUS WARNING: The Ada code in this files may, at some points,
--  rely directly on pointer arithmetic which is considered very
--  unsafe and PRONE TO ERROR. The AdaSDL_Framebuffer examples are
--  more appropriate and easier to understand. They should be used in
--  replacement of this files. Please go there.
--  This file exists only for the sake of completness and to test
--  AdaSDL without the dependency of AdaSDL_Framebuffer.
--  ----------------------------------------------------------------- --
--  WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING
--  ----------------------------------------------------------------- --


with System.Address_To_Access_Conversions;
with Lib_C;
with Interfaces.C.Strings;
with Ada.Text_IO;
use  Ada.Text_IO;
with Ada.Command_Line;
with Ada.Characters.Handling;
with GNAT.OS_Lib;
with SDL.Types; use SDL.Types;
with SDL.Video;
with SDL.Thread;
with SDL.Error;
with SDL.Quit;
with SDL.Keyboard;
with SDL.Timer;

with ThreadWin_Sprogs;
use  ThreadWin_Sprogs;

procedure ThreadWin is

   package C  renames Interfaces.C;
   use type C.int;
   use type C.size_t;
   package CS renames Interfaces.C.Strings;
   package CL renames Ada.Command_Line;
   package CH renames Ada.Characters.Handling;
   package V  renames SDL.Video;
   use type V.Surface_Flags;
   use type V.Surface_ptr;
   package Tr renames SDL.Thread;
   use type SDL.Init_Flags;
   package Er renames SDL.Error;
   package Kb renames SDL.Keyboard;
   package Tm renames SDL.Timer;

   use Uint8_Ptrs;
   use Uint8_PtrOps;

   Screen_Width  : constant := 640;
   Screen_Height : constant := 480;

   screen       : V.Surface_ptr;
   icon         : V.Surface_ptr;
   parsed       : Boolean;
   buffer       : Uint8_PtrOps.Pointer;
   palette      : V.Colors_Array (0 .. 255);
   init_flags   : SDL.Init_Flags;
   video_bpp    : Uint8;
   video_flags  : V.Surface_Flags;
   mouse_thread : Tr.SDL_Thread_ptr;
   keybd_thread : Tr.SDL_Thread_ptr;
   argc         : Integer := CL.Argument_Count;
   argv_i       : Integer := 1;

begin
   --  Set the options, based on command line arguments
   init_flags := SDL.INIT_VIDEO;
   video_bpp := 8;
   video_flags := V.SWSURFACE;
   parsed := True;
   while parsed loop
      --  If the threaded option is enabled, and the SDL library hasn't
      --  been compiled with threaded events enabled, then the mouse and
      --  keyboard won't respond.
      if argc >= 1 and then CL.Argument (argv_i) = "-threaded" then
         init_flags := init_flags or SDL.INIT_EVENTTHREAD;
         argc := argc - 1;
         argv_i := argv_i + 1;
         Put_Line ("Running with threaded events");
      elsif argc >= 1 and then CL.Argument (argv_i) = "-fullscreen" then
         video_flags := video_flags or V.FULLSCREEN;
         argc := argc - 1;
         argv_i := argv_i + 1;
      elsif (argc >= 2) and then
            (CL.Argument (argv_i) = "-bpp") and then
            CH.Is_Digit (CL.Argument (argv_i + 1) (1)) then
         declare
            package Uint8_IO is
               new Modular_IO (Uint8);
            use Uint8_IO;
            last : Positive;
         begin
            Uint8_IO.Get (CL.Argument (argv_i), video_bpp, last);
         end;
         argc := argc - 2;
         argv_i := argv_i + 2;
      else
         parsed := False;
      end if;
   end loop;

   --  Initialize SDL with the requested flags
   if SDL.Init (init_flags) < 0 then
      Put_Line ("Couldn't initialize SDL: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;
   SDL.Quit.atexit (SDL.SDL_Quit'Access);

   --  Set the icon --  this must be done before the first mode set
   LoadIconSurface ("icon.bmp", icon_mask, icon);
   if icon /= null then
      V.WM_SetIcon (icon, icon_mask.all);
      --  V.WM_SetIcon (icon, null);
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

   --  Enable printable characters
   Kb.EnableUNICODE (1);

   --  Set an event filter that discards everything but QUIT;
   Ev.SetEventFilter (FilterEvents'Access);

   --  Create the event handling threads
   mouse_thread := Tr.CreateThread (HandleMouse'Access, System.Null_Address);
   keybd_thread := Tr.CreateThread (HandleKeyboard'Access, System.Null_Address);

   --  Set the surface pixels and refresh!
   for i in C.size_t range 0 .. 255 loop
      palette (i) := (Uint8 (255 - i),
                      Uint8 (255 - i),
                      Uint8 (255 - i),0);
   end loop;

   V.SetColors (screen, palette, C.int(palette'First), palette'Length);
   if V.LockSurface (screen) < 0 then
      Put_Line ("Couldn't lock display surface: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (2);
   end if;

   buffer := Pointer (To_Pointer (screen.pixels));
   for i in 0 .. screen.h - 1 loop
      buffer := Pointer (To_Pointer (
         Lib_C.memset (
            To_Address (Object_Pointer (buffer)),
            (i * 255)/screen.h,
             C.size_t(screen.w) * C.size_t(screen.format.BytesPerPixel))));
      buffer := buffer + C.ptrdiff_t (screen.pitch);
   end loop;

   V.UnlockSurface (screen);
   V.UpdateRect (screen, 0, 0, 0, 0);

   --  Loop, wait for QUIT
   while not done loop
      if (init_flags and SDL.INIT_EVENTTHREAD) = 0 then
         Ev.PumpEvents; --  Need when event thread is off
      end if;
      if Ev.PeepEvents (null, 0, Ev.PEEKEVENT, Ev.QUITMASK) /= 0 then
         done := True;
      end if;
      --  Give up some CPU so the events can accumulate
      Tm.SDL_Delay (20);
   end loop;


   Tr.WaitThread (mouse_thread, null);
   Tr.WaitThread (keybd_thread, null);

   GNAT.OS_Lib.OS_Exit (0);
end ThreadWin;
