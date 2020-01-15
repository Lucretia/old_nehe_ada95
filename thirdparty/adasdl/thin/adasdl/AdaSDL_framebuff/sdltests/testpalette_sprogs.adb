
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

with GNAT.OS_Lib;
with SDL.Types; use SDL.Types;
with SDL.Error; use SDL.Error;
with SDL_Framebuffer;
with Ada.Text_IO; use Ada.Text_IO;

package body  TestPalette_Sprogs is

   package It renames Interfaces;
   package Er  renames SDL.Error;

   use type C.int;
   use type Vd.Surface_ptr;

   package Fb renames SDL_Framebuffer;

   use Random_Integer;


   --  ======================================
   procedure sdlerr (when_err : String) is
   begin
      Put_Line ("SDL error: " & when_err & " : " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end sdlerr;

   --  ======================================

   --  create a background surface
   function make_bg (screen : Vd.Surface_ptr; startcol : C.int)
      return Vd.Surface_ptr
   is
      bg : Vd.Surface_ptr := Vd.CreateRGBSurface (
              Vd.SWSURFACE, screen.w, screen.h,
              8, 0, 0, 0, 0);
   begin
      if bg = null then
         sdlerr ("creating background surface");
      end if;

      --  set the palette to the logical screen palette so that blits
      --  won't be translated
      Vd.SetColors (bg, screen.format.palette.colors, 0, 256);

      --  Make a wavy background pattern using colours 0-63
      if Vd.LockSurface (bg) < 0 then
         sdlerr ("locking background");
      end if;
      for i in Natural range 0 .. Natural (SCRH - 1) loop
         declare
            p    : Fb.Framebuffer_8bPointer;
            d : C.int;
         begin
            p := Fb.Goto_Line_Unchecked (bg, i);
            d := 0;
            for j in Natural range 0 .. Natural (SCRW - 1) loop
               declare
                  v : C.int := C.int'Max (d, -2);
                  use Interfaces;
               begin
                  v := C.int'Min (v, 2);
                  if i > 0 then -- ?
                     v := v
                          + C.int (Fb.Prev_Line_Unchecked (bg, p).all)
                          + 65
                          - startcol;
                  end if;
                  Fb.Go_Right_Unchecked (p, j).all := Uint8 (
                     startcol + C.int (
                        (Unsigned_32 (v) and Unsigned_32 (63))));
                  d := d
                       + C.int (
                           It.Shift_Right (
                              It.Unsigned_32 (Random (Integer_Generator)),
                              3)
                           mod 3)
                       - 1;
               end;
            end loop;
         end;
      end loop;
      Vd.UnlockSurface (bg);
      return bg;
   end make_bg;

   --  ======================================
   --  Return a surface flipped horisontally. Only works for 8bpp;
   --  extensions to arbitrary bitness is left as an exercise for
   --  reader.
   function hflip (s : Vd.Surface_ptr) return Vd.Surface_ptr
   is
      z : Vd.Surface_ptr := Vd.CreateRGBSurface (Vd.SWSURFACE,
                                               s.w, s.h, 8,
                                               0, 0, 0, 0);
   begin
      --  copy palette
      Vd.SetColors (z, s.format.palette.colors,
                                0, s.format.palette.ncolors);
      if (Vd.LockSurface (s) < 0) or (Vd.LockSurface (z) < 0) then
         sdlerr ("locking flip images");
      end if;
      for i in Natural range  0 .. Natural (s.h - 1) loop
         declare
            from : Fb.Framebuffer_8bPointer := Fb.Goto_Line_Unchecked (s, i);
            to   : Fb.Framebuffer_8bPointer := Fb.Goto_Line_End_Unchecked (z, i);
         begin
            for j in Natural range 0 .. Natural (s.w - 1) loop
               Fb.Go_Left_Unchecked (to, j).all := Fb.Go_Right_Unchecked (from,j).all;
            end loop;
            Vd.UnlockSurface (z);
            Vd.UnlockSurface (s);
         end;
      end loop;
      return z;
   end hflip;
   --  ======================================

end TestPalette_Sprogs;

