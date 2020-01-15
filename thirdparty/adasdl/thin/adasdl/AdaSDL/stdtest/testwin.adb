
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


with Interfaces.C;
with Interfaces.C.Strings;
with Lib_C;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line;
with Ada.Characters.Handling;
with GNAT.OS_Lib;
with SDL.Video;
with SDL.Error;
with SDL.Types; use SDL.Types;
with SDL.Timer;
with SDL.Quit;
procedure TestWin is
   package C  renames Interfaces.C;
   use type C.int;
   use type C.size_t;
   package CS renames Interfaces.C.Strings;
   package CL renames Ada.Command_Line;
   package CH renames Ada.Characters.Handling;
   package V  renames SDL.Video;
   use type V.Surface_ptr;
   use type V.Surface_Flags;
   use type V.Palette_ptr;
   package Er renames SDL.Error;
   package Tm renames SDL.Timer;

   type Colors_Array_Ptr is access V.Colors_Array;

   --  ======================================
   procedure DrawPict (screen : V.Surface_ptr; bmpfile_name :CS.chars_ptr;
                       speedy : C.int; flip : C.int; nofade : C.int) is
      package It renames Interfaces;
      use type It.Unsigned_32;
      use type CS.chars_ptr;
      use V.Color_PtrOps;
      bmpfile : CS.chars_ptr := bmpfile_name;
      picture : V.Surface_ptr;
      dest : V.Rect;
      update : V.Rect;
      centered : C.int;
      i : C.size_t;
      ncolors  : C.int;
      --  cmap, colors : V.Color_ptr;
      cmap, colors : Colors_Array_Ptr;
   begin
      --  Load the image into a surface
      if bmpfile = CS.Null_Ptr then
         bmpfile := CS.New_String ("sample.bmp"); --  Sample image
      end if;

      Put_Line ("Loading picture: " & CS.Value (bmpfile));

      picture := V.LoadBMP (bmpfile);

      if picture = null then
         Put_Line ("Couldn't load " & CS.Value (bmpfile) & ": " & Er.Get_Error);
         return;
      end if;

      --  Set the display colors -- on a hicolor display this is a no-op
      if picture.format.palette /= null then
         ncolors := picture.format.palette.ncolors;
         colors  := new V.Colors_Array (0 .. C.size_t (ncolors) - 1);
         cmap    := new V.Colors_Array (0 .. C.size_t (ncolors) - 1);
         colors.all := Value (Pointer (picture.format.palette.colors),
                              C.ptrdiff_t (ncolors));
      else
         --  Allocate 256 color palette
         ncolors := 256;
         colors  := new V.Colors_Array (0 .. C.size_t (ncolors) - 1);
         cmap    := new V.Colors_Array (0 .. C.size_t (ncolors) - 1);

         --  Set a 3,3,2 color cube
         for r in Uint8 range 0 .. 7 loop
            for g in Uint8 range 0 .. 7 loop
               for b in Uint8 range 0 .. 3 loop
                  i := C.size_t (Shift_Left (r, 5)
                              or Shift_Left (g, 2)
                              or b);
                  colors (i).r := Shift_Left (r, 5);
                  colors (i).g := Shift_Left (g, 5);
                  colors (i).b := Shift_Left (b, 6);
               end loop;
            end loop;
         end loop;
      end if;

      Put_Line ("testwin: setting colors");

      declare
         Result : C.int;
      begin
         Result := V.SetColors (screen, colors.all, 0, ncolors);
         if Result = 0 and screen.format.palette /= null then
            Put_Line ("Warning: Couldn't set all of the colors, but SDL will " &
                      "map the image");
            Put_Line ("(colormap fading will suffer - try the -warp option)");
         end if;
      end;

      --  Set the screen to black (not really necessary)
      if V.LockSurface (screen) = 0 then
         declare
            black : Uint32;
            pixels : Uint8_PtrOps.Pointer;
            use Uint8_Ptrs;
            use Uint8_PtrOps;
         begin
            black := V.MapRGB (screen.format, 0, 0, 0);
            pixels := Uint8_PtrOps.Pointer (To_Pointer (screen.pixels));
            for i in 0 .. screen.h - 1 loop
               Lib_C.Mem_Set (To_Address (Object_Pointer (pixels)),
                              C.int (black),
                              C.size_t (screen.w)
                                 * C.size_t (screen.format.BytesPerPixel));
               pixels := pixels + C.ptrdiff_t (screen.pitch);
            end loop;
            V.UnlockSurface (screen);
            V.UpdateRect (screen, 0, 0, 0, 0);
         end;
      end if;

      --  Display the picture
      if speedy /= 0 then
         declare
            displayfmt : V.Surface_ptr;
         begin
            Put_Line ("Converting picture");
            displayfmt := V.DisplayFormat (picture);
            if displayfmt = null then
               Put_Line ("couldn't convert image: " & Er.Get_Error);
               goto done;
            end if;
            V.FreeSurface (picture);
            picture := displayfmt;
         end;
      end if;

      Put ("(image surface located in ");
      if (picture.flags and V.HWSURFACE) /= 0 then
         Put ("video");
      else
         Put ("system");
      end if;
      Put_Line (" memory");

      centered := (screen.w - picture.w) / 2;
      if centered < 0 then
         centered := 0;
      end if;

      dest.y := Sint16 ((screen.h - picture.h) / 2);
      dest.w := Uint16 (picture.w);
      dest.h := Uint16 (picture.h);

      Put_Line ("testwin: moving image");
      for i in 0 .. centered - 1 loop
         dest.x := Sint16 (i);
         update := dest;
         if V.BlitSurface (picture, null, screen, update) < 0 then
            Put_Line ("Blit failed: " & Er.Get_Error);
         end if;

         if flip /= 0 then
            V.Flip (screen);
         else
            V.Update_Rect (screen, update);
         end if;
      end loop;

      --  #ifdef SCREENSHOT
      if V.SaveBMP (screen, CS.New_String ("screen.bmp")) < 0 then
         Put_Line ("Couldn't save screen: " & Er.Get_Error);
      end if;
      --  #endif

      --  #ifndef BENCHMARK_SDL
      --  Let it sit there for a while
      --  Tm.SDL_Delay (5 * 1000);
      --  #endif

      --  Fade the colormap
      if nofade = 0 then
         declare
            maxstep : C.int;
            final   : V.Color;
            palcolors : Colors_Array_Ptr :=
               new V.Colors_Array (0 .. C.size_t (ncolors) - 1);
            type cdist_Rec is
               record
                  r, g, b : Sint16;
               end record;
            type cdist_Array is
               array (C.size_t range <>) of cdist_Rec;
            type cdist_Array_ptr is access cdist_Array;
            cdist : cdist_Array_ptr :=
               new cdist_Array (0 .. C.size_t (ncolors) - 1);
         begin
            Put_Line ("testwin: fading out ...");
            cmap.all := colors.all;
            maxstep := 32 - 1;
            final.r := 16#FF#;
            final.g := 16#00#;
            final.b := 16#00#;
            palcolors.all := colors.all;
            for i in cdist'Range loop
               cdist (i).r := Sint16 (final.r - palcolors (i).r);
               cdist (i).g := Sint16 (final.g - palcolors (i).g);
               cdist (i).b := Sint16 (final.b - palcolors (i).b);
            end loop;

            for i in 0 .. maxstep / 2 loop --  halfway fade
               for count in C.size_t range 0 .. C.size_t (ncolors) - 1 loop
                  colors (count).r := Uint8 (
                     Sint16 (palcolors (count).r) + (cdist (count).r * Sint16 (i))
                                                    / Sint16 (maxstep));
                  colors (count).g := Uint8 (
                     Sint16 (palcolors (count).g) + (cdist (count).g * Sint16 (i))
                                                    / Sint16 (maxstep));
                  colors (count).b := Uint8 (
                     Sint16 (palcolors (count).r) + (cdist (count).b * Sint16 (i))
                                                    / Sint16 (maxstep));
               end loop;
               V.SetColors (screen, colors.all, 0, ncolors);
               Tm.SDL_Delay (1);
            end loop;
            final.r := 16#00#;
            final.g := 16#00#;
            final.b := 16#00#;
            palcolors.all := colors.all;
            for i in cdist'Range loop
               cdist (i).r := Sint16 (final.r - palcolors (i).r);
               cdist (i).g := Sint16 (final.g - palcolors (i).g);
               cdist (i).b := Sint16 (final.b - palcolors (i).b);
            end loop;
            maxstep := maxstep / 2;
            for i in 0 .. maxstep - 1 loop --  finish fade out
               for count in C.size_t range 0 .. C.size_t (ncolors) - 1 loop
                  colors (count).r := Uint8 (
                     Sint16 (palcolors (count).r) + (cdist (count).r * Sint16 (i))
                                                    / Sint16 (maxstep));
                  colors (count).g := Uint8 (
                     Sint16 (palcolors (count).g) + (cdist (count).g * Sint16 (i))
                                                    / Sint16 (maxstep));
                  colors (count).b := Uint8 (
                     Sint16 (palcolors (count).r) + (cdist (count).b * Sint16 (i))
                                                    / Sint16 (maxstep));
               end loop;
               V.SetColors (screen, colors.all, 0, ncolors);
               Tm.SDL_Delay (1);
            end loop;
            for i in colors'Range loop
               colors (i).r := final.r;
               colors (i).g := final.g;
               colors (i).b := final.b;
            end loop;
            V.SetColors (screen, colors.all, 0, ncolors);
            Put_Line ("testwin: fading in ..");
            palcolors.all := colors.all;
            for i in cdist'Range loop
               cdist (i).r := Sint16 (final.r - palcolors (i).r);
               cdist (i).g := Sint16 (final.g - palcolors (i).g);
               cdist (i).b := Sint16 (final.b - palcolors (i).b);
            end loop;
            for i in 0 .. maxstep - 1 loop --  32 step fade
               for count in C.size_t range 0 .. C.size_t (ncolors) - 1 loop
                  colors (count).r := Uint8 (
                     Sint16 (palcolors (count).r) + (cdist (count).r * Sint16 (i))
                                                    / Sint16 (maxstep));
                  colors (count).g := Uint8 (
                     Sint16 (palcolors (count).g) + (cdist (count).g * Sint16 (i))
                                                    / Sint16 (maxstep));
                  colors (count).b := Uint8 (
                     Sint16 (palcolors (count).r) + (cdist (count).b * Sint16 (i))
                                                    / Sint16 (maxstep));
               end loop;
               V.SetColors (screen, colors.all, 0, ncolors);
               Tm.SDL_Delay (1);
            end loop;
            Put_Line ("testing: fading over");
         end; -- declare
      end if; -- nofade = 0

   <<done>>
      --  Free the picture and return
      V.FreeSurface (picture);
   end DrawPict;

   --  ======================================

   package int_IO is
      new Ada.Text_IO.Integer_IO (C.int);
   use int_IO;
   screen : V.Surface_ptr;
   --  Options
   speedy, flip, nofade : C.int;
   the_delay : C.int;
   w, h : C.int;
   desired_bpp : C.int;
   video_flags : V.Surface_Flags;
   --  #ifdef BENCHMARK_SDL
   and_then, now : Uint32;
   --  #endif;

   argc : Integer := CL.Argument_Count;
   argv_i : Integer := 1;
   bmpfile_name : CS.chars_ptr := CS.Null_Ptr;
begin
   --  Set default option and check command-line
   speedy := 0;
   flip := 0;
   nofade := 0;
   the_delay := 1;
   w := 640;
   h := 480;
   desired_bpp := 0;
   video_flags := 0;
   while argc > 0 loop
      if CL.Argument (argv_i) = "-speedy" then
         speedy := 1;
         argv_i := argv_i + 1;
         argc := argc - 1;
      elsif CL.Argument (argv_i) = "-nofade" then
         nofade := 1;
         argv_i := argv_i + 1;
         argc := argc - 1;
      elsif (argc > 1) and then
            (CL.Argument (argv_i) = "-delay") then
         if CH.Is_Digit (CL.Argument (argv_i + 1) (1)) then
            declare
               last : Positive;
            begin
               Get (CL.Argument (argc), the_delay, last);
            end;
            argv_i := argv_i + 2;
            argc := argc - 2;
         else
            Put_Line ("The -delay requires a numeric argument");
            GNAT.OS_Lib.OS_Exit (1);
         end if;
      elsif (argc > 1) and then
            (CL.Argument (argv_i) = "-width") then
         if CH.Is_Digit (CL.Argument (argv_i + 1) (1)) then
            declare
               last : Positive;
            begin
               Get (CL.Argument (argc), w, last);
            end;
            argv_i := argv_i + 2;
            argc := argc - 2;
         else
            Put_Line ("The -width requires a numeric argument");
            GNAT.OS_Lib.OS_Exit (1);
         end if;
      elsif (argc > 1) and then
            (CL.Argument (argv_i) = "-height") then
         if CH.Is_Digit (CL.Argument (argv_i + 1) (1)) then
            declare
               last : Positive;
            begin
               Get (CL.Argument (argc), h, last);
            end;
            argv_i := argv_i + 2;
            argc := argc - 2;
         else
            Put_Line ("The -height requires a numeric argument");
            GNAT.OS_Lib.OS_Exit (1);
         end if;
      elsif (argc > 1) and then
            (CL.Argument (argv_i) = "-bpp") then
         if CH.Is_Digit (CL.Argument (argv_i + 1) (1)) then
            declare
               last : Positive;
            begin
               Get (CL.Argument (argc), desired_bpp, last);
            end;
            argv_i := argv_i + 2;
            argc := argc - 2;
         else
            Put_Line ("The -bpp requires a numeric argument");
            GNAT.OS_Lib.OS_Exit (1);
         end if;
      elsif CL.Argument (argv_i) = "-warp" then
         video_flags := video_flags or V.HWPALETTE;
         argv_i := argv_i + 1;
         argc := argc -1;
      elsif CL.Argument (argv_i) = "-hw" then
         video_flags := video_flags or V.HWSURFACE;
         argv_i := argv_i + 1;
         argc := argc - 1;
      elsif CL.Argument (argv_i) = "-flip" then
         video_flags := video_flags or V.DOUBLEBUF;
         argv_i := argv_i + 1;
         argc := argc - 1;
      elsif CL.Argument (argv_i) = "-fullscreen" then
         video_flags := video_flags or V.FULLSCREEN;
         argv_i := argv_i + 1;
         argc := argc - 1;
      elsif CL.Argument (argv_i) = "-help" then
         Put_Line ("Usage: " & CL.Command_Name & " " &
                   "[-speedy] [-nofade] [-delay N] [-width N] [-height -N] " &
                   "[-bpp N] [-warp] [-hw] [-flip] [-fullscreen] [-help]");
         GNAT.OS_Lib.OS_Exit (1);
      else
         bmpfile_name := CS.New_String (CL.Argument (argv_i));
         argv_i := argv_i + 1;
         argc := argc - 1;
      end if;
   end loop;

   if SDL.Init (SDL.INIT_VIDEO) < 0 then
      Put_Line ("Couldn't initialize SDL: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   --  Set video mode
   screen := V.SetVideoMode (w, h,
                             C.int (desired_bpp), video_flags);
   if screen = null then
      Put_Line ("Couldn't set " & C.int'Image (w) &
                "x" & C.int'Image (h) &
                " video mode: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   Put_Line ("Set " & C.int'Image (screen.w) & "x"
             & C.int'Image (screen.h) & "x"
             & Uint8'Image (screen.format.BitsPerPixel)
             & " mode");
   Put ("(video surface located in ");
   if (screen.flags and V.HWSURFACE) /= 0 then
      Put ("video");
   else
      Put ("system");
   end if;
   Put_Line (" memory");
   if (screen.flags and V.DOUBLEBUF) /= 0 then
      Put_Line ("Double-buffering enabled");
      flip := 1;
   end if;

   --  Set the window manager title bar
   V.WM_SetCaption (CS.New_String ("SDL test window"), CS.New_String ("testwin"));

   SDL.Quit.atexit (SDL.SDL_Quit'Access); --  Clean up on exit

   --  Do all the drawing work
   --  #ifdef BENCHMARK_SDL
   and_then := Tm.GetTicks;
   DrawPict (screen, bmpfile_name, speedy, flip, nofade);
   now := Tm.GetTicks;
   Put_Line ("Time: " & Uint32'Image (now - and_then) &
             " milliseconds");
   --  #else
   --  DrawPict (screen, bmpfile_name, speedy, flip, nofade);
   --  #endif
   Tm.SDL_Delay (Uint32 (the_delay * 1000));

   GNAT.OS_Lib.OS_Exit (0);
end TestWin;
