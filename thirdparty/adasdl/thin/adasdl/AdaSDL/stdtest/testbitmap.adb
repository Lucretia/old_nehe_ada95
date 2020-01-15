
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


with Interfaces.C.Strings;
with Ada.Command_Line;
with Ada.Characters.Handling;
with Ada.Text_IO; use Ada.Text_IO;
with GNAT.OS_Lib;
with SDL.Types; use SDL.Types;
with SDL.Video;
with SDL.Events;
with SDL.Error;
with SDL.Quit;
with Picture_xbm; use Picture_xbm;
with Lib_C;


procedure TestBitmap is

   package C  renames Interfaces.C;
   use type C.int;
   package CS renames C.Strings;
   package CL renames Ada.Command_Line;
   package CH renames Ada.Characters.Handling;
   package V  renames SDL.Video;
   use type V.Surface_ptr;
   use type V.Surface_Flags;
   package Ev renames SDL.Events;
   package Er renames SDL.Error;

   Screen_Width  : constant := 640;
   Screen_Height : constant := 480;

   package Uint8_IO is new Modular_IO (Uint8);

   use SDL.Types.Uint8_PtrOps;
   use SDL.Types.Uint8_Ptrs;

   --  ===============================================
   function LoadXBM (screen : V.Surface_ptr;
                     w, h   : C.int;
                     bits   : Uint8_PtrOps.Pointer) return V.Surface_ptr
   is
      ww : C.int := w;
      hh : C.int := h;
      The_Bits : Uint8_PtrOps.Pointer := bits;
      bitmap : V.Surface_ptr;
      line   : SDL.Types.Uint8_PtrOps.Pointer;
   begin
      --  Allocate the bitmap
      bitmap := V.CreateRGBSurface (
                   V.SWSURFACE, w, h, 1, 0, 0, 0, 0);
      if bitmap = null then
         Put_Line ("Couldn't allocate bitmap: " & Er.Get_Error);
         return null;
      end if;

      --  Copy the pixels
      line := Pointer (Uint8_Ptrs.To_Pointer (bitmap.pixels));
      ww := (ww + 7) / 8;
      while hh > 0 loop
         hh := hh - 1;
         Uint8_PtrOps.Copy_Array (The_Bits, line, C.ptrdiff_t (ww));
         --  X11 Bitmap images have the bits reversed
         declare
            i : C.int;
            buf  : Uint8_PtrOps.Pointer;
            byte : Uint8;
            use Interfaces;
         begin
            buf := line;
            i := 0;
            while i < ww loop
               byte := buf.all;
               buf.all := 0;
               for j in reverse 0 .. 7 loop
                  buf.all := buf.all
                             or Shift_Left (
                                   byte and 16#01#,
                                   j);
                  byte := Shift_Right (byte, 1);
               end loop;
               i := i + 1;
               Increment (buf);
            end loop;
         end;
         line := line + C.ptrdiff_t (bitmap.pitch);
         The_Bits := The_Bits + C.ptrdiff_t (ww);
      end loop;
      return bitmap;
   end LoadXBM;

   --  ===============================================

   screen : V.Surface_ptr;
   bitmap : V.Surface_ptr;
   video_bpp : Uint8;
   videoflags : V.Surface_Flags;
   buffer : Uint8_PtrOps.Pointer;
   done : Boolean;
   event : Ev.Event;
   argc : Integer := CL.Argument_Count;
   PollEvent_Result : C.int;
begin
   --  Initialize SDL
   if SDL.Init (SDL.INIT_VIDEO) < 0 then
      Put_Line ("Couldn't initialize SDL: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;
   SDL.Quit.atexit (SDL.SDL_Quit'Access);

   video_bpp := 0;
   videoflags := V.SWSURFACE;
   while argc > 0 loop
      if (argc > 1) and then
            (CL.Argument (argc - 1) = "-bpp") and then
            CH.Is_Digit (CL.Argument (argc) (1)) then
         declare
            last : Positive;
         begin
            Uint8_IO.Get (CL.Argument (argc), video_bpp, last);
         end;
         argc := argc - 2;
      elsif CL.Argument (argc) = "-hw" then
         videoflags := videoflags or V.HWSURFACE;
         argc := argc - 1;
      elsif CL.Argument (argc) = "-warp" then
         videoflags := videoflags or V.HWPALETTE;
         argc := argc -1;
      elsif CL.Argument (argc) = "-fullscreen" then
         videoflags := videoflags or V.FULLSCREEN;
         argc := argc - 1;
      else
         Put_Line ("Usage: " & CL.Command_Name &
                   "[-bpp N] [-hw] [-warp] [-fullscreen]");
         GNAT.OS_Lib.OS_Exit (1);
      end if;
   end loop;

   --  Set video mode
   screen := V.SetVideoMode (Screen_Width, Screen_Height,
                             C.int (video_bpp), videoflags);
   if screen = null then
      Put_Line ("Couldn't set " & Integer'Image (Screen_Width) &
                "x" & Integer'Image (Screen_Height) &
                " video mode: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (2);
   end if;

   --  Set the surface pixels and refresh
   if V.LockSurface (screen) < 0 then
      Put_Line ("Couldn't lock the display surface: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (2);
   end if;

   buffer := Pointer (To_Pointer (screen.pixels));
   for i in 0 .. screen.h - 1 loop
         Lib_C.Mem_Set (To_Address (Uint8_Ptrs.Object_Pointer (buffer)),
                       (i * 255) / screen.h,
                       C.size_t (screen.pitch));
      buffer := buffer + C.ptrdiff_t (screen.pitch);
   end loop;
   V.UnlockSurface (screen);
   V.UpdateRect (screen, 0, 0, 0, 0);

   --  Load the bitmap
   bitmap := LoadXBM (screen, picture_width, picture_height,
                      Uint8_PtrOps.Pointer'(picture_bits(0)'Access));

   if bitmap = null then
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   --  Wait for a keystroke
   done := False;
   while not done loop
      loop
         Ev.PollEventVP (PollEvent_Result, event);
         exit when PollEvent_Result = 0;
         case event.the_type is
            when Ev.MOUSEBUTTONDOWN =>
               declare
                  dst : V.Rect;
               begin
                  dst.x := Sint16 (C.int (event.button.x) - bitmap.w / 2);
                  dst.y := Sint16 (C.int (event.button.y) - bitmap.h / 2);
                  dst.w := Uint16 (bitmap.w);
                  dst.h := Uint16 (bitmap.h);
                  V.BlitSurface (bitmap, null, screen, dst);
                  V.Update_Rect (screen, dst);
               end;
            when Ev.KEYDOWN => done := True;
            when Ev.QUIT => done := True;
            when others => null;
         end case;
      end loop;
   end loop;
   V.FreeSurface (bitmap);
   GNAT.OS_Lib.OS_Exit (0);
end TestBitmap;
