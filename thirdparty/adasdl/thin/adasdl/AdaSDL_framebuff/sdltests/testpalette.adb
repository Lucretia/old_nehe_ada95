
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
with Ada.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Generic_Elementary_Functions;
with GNAT.OS_Lib; use GNAT.OS_Lib;
with SDL.Quit;
with SDL.Error;
with SDL.Types; use SDL.Types;
with SDL.Timer;
with SDL.Events;
with SDL_Framebuffer;
with TestPalette_Sprogs; use TestPalette_Sprogs;

procedure TestPalette is

   --  ======================================
   package  It renames Interfaces;
   use type It.Unsigned_32;
   package  C  renames Interfaces.C;
   use type C.int;
   use type C.size_t;
   use type C.unsigned;
   use type C.C_float;
   package  CL renames Ada.Command_Line;
   package  Er renames SDL.Error;
   package  Ev renames SDL.Events;
   use type Ev.Event_Type;
   package  T  renames SDL.Timer;
   use type Vd.Surface_Flags;
   use type Vd.Surface_ptr;
   use Random_Integer;
   use Vd.Color_PtrOps;
   package Fb renames SDL_Framebuffer;

   package M is new Ada.Numerics.Generic_Elementary_Functions (C.C_float);

   screen, bg : Vd.Surface_ptr;
   type boat_Array is array (0 .. 1) of Vd.Surface_ptr;
   boat : boat_Array;
   vidflags : Vd.Surface_Flags := 0;
   start   : C.unsigned;
   fade_max : C.int := 400;
   fade_level, fade_dir : C.int;
   boatcols, frames, red : C.int;
   type boats_Array is array (C.unsigned range 0 .. NBOATS - 1) of C.int;
   boatx, boaty, boatdir : boats_Array;
   gamma_fade : C.int := 0;
   gamma_ramp : C.int := 0;
   argc : Integer := CL.Argument_Count;

begin
   if SDL.Init (SDL.INIT_VIDEO) < 0 then
      sdlerr ("initializing SDL");
   end if;
   SDL.Quit.atexit (SDL.SDL_Quit'Access);
   while argc > 0 loop
      if CL.Argument (argc) = "-hw" then
         vidflags := vidflags or Vd.HWSURFACE;
         argc := argc - 1;
      elsif CL.Argument (argc) = "-fullscreen" then
         vidflags := vidflags or Vd.FULLSCREEN;
         argc := argc - 1;
      elsif CL.Argument (argc) = "-nofade" then
         fade_max := 1;
         argc := argc - 1;
      elsif CL.Argument (argc) = "-gamma" then
         gamma_fade := 1;
         argc := argc - 1;
      elsif CL.Argument (argc) = "-gammaramp" then
         gamma_ramp := 1;
         argc := argc - 1;
      else
         Put_Line ("Usage: testpalette" &
                   "[-hw] [-fullscreen] [-nofade] [-gamma] " &
                   "[-gammaramp]");
         GNAT.OS_Lib.OS_Exit (1);
      end if;
   end loop;

   --  Ask explicitly for 8bpp and a hardware palette
   screen := Vd.SetVideoMode (SCRW, SCRH, 8, vidflags or Vd.HWPALETTE);
   if screen = null then
      Put_Line ("error setting " & Integer'Image (SCRW) & " " &
                Integer'Image (SCRH) & " " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   boat (0) := Vd.LoadBMP ("sail.bmp");
   if  boat (0) = null then
      sdlerr ("loading sail.bmp");
   end if;

   --  We've chosen magenta (#ff00ff) as colour key for the boat
   Vd.SetColorKey (boat (0), Vd.SRCCOLORKEY or Vd.RLEACCEL,
                  Vd.MapRGB (boat (0).format, 16#FF#, 16#00#, 16#FF#));
   boatcols := boat (0).format.palette.ncolors;
   boat (1) := hflip (boat (0));
   Vd.SetColorKey (boat (1), Vd.SRCCOLORKEY or Vd.RLEACCEL,
                  Vd.MapRGB (boat (1).format, 16#FF#, 16#00#, 16#FF#));

   --  First set the physical screen palette to black, so the user won't
   --  see our initial drawing on the screen.
   cmap := (others => (0,0,0,0));
   Vd.SetPalette (screen, Vd.PHYSPAL, cmap, C.int(cmap'First), C.int(cmap'Length));

   --  Proper palette management is important when playing games with the
   --  colormap. We have divided the palette as follows:
   --
   --  index 0..(boatcols-1):                used for the boat
   --  index boatcols..(boatcols+63):        used for the waves
   Vd.SetPalette (screen, Vd.LOGPAL,
                            boat (0).format.palette.colors, 0, boatcols);
   Vd.SetPalette (screen, Vd.LOGPAL, wavemap (0)'Access, boatcols, 64);

   --  Now the logical screen palette is set, and will remain unchanged.
   --  The boats already have the same palette so fast blits can be used.
   Vd.Color_PtrOps.Copy_Array (Pointer (screen.format.palette.colors),
                              cmap (0)'Access,
                              256);

   --  save the index of the red colour for later
   red := C.int (Vd.MapRGB (screen.format, 16#FF#, 16#00#, 16#00#));
   bg  := make_bg (screen, boatcols); -- make a nice wavy background surface

   --  initial screen contents
   if Vd.BlitSurface (bg, null, screen, null) < 0 then
      sdlerr ("blitting background to screen");
   end if;   --  actually put the background on screen

   Vd.Flip (screen); --  actually put the background on screen

   --  determine initial boat placements
   for i in C.unsigned range 0 .. NBOATS - 1 loop
      boatx (i)   := (C.int (Random (Integer_Generator))
                      mod (SCRW + boat (0).w)) - boat (0).w;
      boaty (i)   := C.int (i) * (SCRH - boat (0).h) / (NBOATS - 1);
      boatdir (i) := C.int (
                        It.Shift_Right (
                           It.Unsigned_32 (Random (Integer_Generator)),
                           5)
                        and 1)
                     * 2 - 1;
   end loop;

   start := C.unsigned (T.GetTicks);
   frames := 0;
   fade_dir := 1;
   fade_level := 0;
   loop
      declare
         e : aliased Ev.Event;
         updates : Vd.Rects_Array (0 .. NBOATS - 1);
         r : aliased  Vd.Rect;
         redphase : C.int;
      begin
         --  A small event loop: just exit on any key or mouse button event
         while Ev.PollEvent (e'Access) /= 0 loop
            if (e.the_type = Ev.KEYDOWN) or (e.the_type = Ev.QUIT)
                  or (e.the_type = Ev.MOUSEBUTTONDOWN) then
               if fade_dir < 0 then
                  fade_level := 0;
               end if;
               fade_dir := -1;
            end if;
         end loop;

         --  move boats
         for i in C.unsigned range 0 .. NBOATS - 1 loop
            declare
               old_x : C.int := boatx (i);
            begin
               --  update boat position
               boatx (i) := boatx (i) + boatdir (i) * SPEED;
               if (boatx (i) <= -boat (0).w) or (boatx (i) >= SCRW) then
                  boatdir (i) := -boatdir (i);
               end if;

               --  paint over old boat position
               r.x := Sint16 (old_x);
               r.y := Sint16 (boaty (i));
               r.w := Uint16 (boat (0).w);
               r.h := Uint16 (boat (0).h);
               if Vd.BlitSurface (bg, r,
                                 screen, r) < 0 then
                  sdlerr ("blitting background");
               end if;

               --  construct update rectangle (bounding box of old and new pos)
               updates (i).x := Sint16 (C.int'Min (old_x, boatx (i)));
               updates (i).y := Sint16 (boaty (i));
               updates (i).w := Uint16 (boat (0).w + SPEED);
               updates (i).h := Uint16 (boat (0).h);

               --  clip update rectangle to screen
               if updates (i).x < 0 then
                  updates (i).w := Uint16 (
                     Integer(updates (i).w) + Integer (updates (i).x));
                  updates (i).x := 0;
               end if;
               if C.int (updates (i).x) + C.int (updates (i).w) > SCRW then
                  updates (i).w := Uint16 (SCRW - updates (i).x);
               end if;
            end; -- declare
         end loop; -- move boats

         for i in C.unsigned range 0 .. NBOATS - 1 loop
            --  paint boat on new position
            r.x := Sint16 (boatx (i));
            r.y := Sint16 (boaty (i));
            if Vd.BlitSurface (boat (Integer((boatdir (i) + 1) / 2)),
                              null,
                              screen,
                              r) < 0 then
               sdlerr ("blitting boat");
            end if;
         end loop;

         --  cycle wave palette
         for i in 0 .. 63 loop
            cmap (C.size_t (boatcols)
                  + C.size_t ((It.Unsigned_32 (C.int (i) + frames)
                               and 63)))
            := wavemap (i);
         end loop;
         if fade_dir /= 0 then
            --  Fade the entire palette in/out
            fade_level := fade_level + fade_dir;
            if gamma_fade /= 0 then
               --  Fade linearly in gamma level (lousy)
               declare
                  level : C.C_float := C.C_float (fade_level) / C.C_float (fade_max);
               begin
                  if Vd.SetGamma (level, level, level) < 0 then
                     sdlerr ("setting gamma");
                  end if;
               end;
            elsif gamma_ramp /= 0 then
               --  Fade using gamma ramp (better)
               declare
                  ramp : Vd.ramp_Array;
               begin
                  for i in Natural range 0 .. 255 loop
                     ramp (i) := Uint16 (
                                    It.Shift_Left (
                                       It.Unsigned_32 (C.int (i) * fade_level / fade_max),
                                       8));
                  end loop;
                  if Vd.SetGammaRamp (ramp, ramp, ramp) < 0 then
                     sdlerr ("setting gamma ramp");
                  end if;
               end; --  declare
            else
               Fb.Copy_Colors (screen, cmap (0)'Access, Natural (boatcols));
               for i in C.size_t range 0 .. C.size_t (boatcols + 63) loop
                  cmap (i).r := Uint8 (C.C_float (cmap (i).r)
                                * C.C_float (fade_level) / C.C_float (fade_max));
                  cmap (i).g := Uint8 (C.C_float (cmap (i).g)
                                * C.C_float (fade_level) / C.C_float (fade_max));
                  cmap (i).b := Uint8 (C.C_float (cmap (i).b)
                                * C.C_float (fade_level) / C.C_float (fade_max));
               end loop;
            end if;
            if fade_level = fade_max then
               fade_dir := 0;
            end if;
         end if;
         --  pulse the red colour (done after the fade, for a night effect)
         redphase := frames mod 64;
         cmap (C.size_t (red)).r := Uint8 (
            C.C_float (255)
            * M.Sin (C.C_float (redphase)
                     * C.C_float (Ada.Numerics.Pi)
                     / C.C_float (64)));
         Vd.SetPalette (screen, Vd.PHYSPAL, cmap (0)'Access, 0, boatcols + 64);

         --  update changed ares of the screen
         Vd.UpdateRects (screen, updates'Length, updates);
         frames := frames + 1;
         exit when fade_level <= 0;
      end;
   end loop;
   Put (C.int'Image (frames) & " frames, ");
   Put (Float (1000.0) * Float (frames)
                / Float (T.GetTicks - Uint32 (start))
              ,3, 2, 0);
   Put_Line (" fps");
end TestPalette;
