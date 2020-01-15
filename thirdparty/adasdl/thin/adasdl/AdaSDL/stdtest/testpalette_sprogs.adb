
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


with Interfaces.C.Pointers;
with GNAT.OS_Lib;
with SDL.Types; use SDL.Types;
with SDL.Error; use SDL.Error;
with Ada.Text_IO; use Ada.Text_IO;

package body  TestPalette_Sprogs is

   package It renames Interfaces;
   package Er  renames SDL.Error;

   use SDL.Types.Uint8_Ptrs;

   use SDL.Types.Uint8_PtrOps;

   use type C.int;
   use type V.Surface_ptr;
   use Random_Integer;


   --  ======================================
   procedure sdlerr (when_err : String) is
   begin
      Put_Line ("SDL error: " & when_err & " : " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end sdlerr;

   --  ======================================

   --  create a background surface
   function make_bg (screen : V.Surface_ptr; startcol : C.int)
      return V.Surface_ptr
   is
      bg : V.Surface_ptr := V.CreateRGBSurface (
              V.SWSURFACE, screen.w, screen.h,
              8, 0, 0, 0, 0);
   begin
      if bg = null then
         sdlerr ("creating background surface");
      end if;

      --  set the palette to the logical screen palette so that blits
      --  won't be translated
      V.SetColors (bg, screen.format.palette.colors, 0, 256);

      --  Make a wavy background pattern using colours 0-63
      if V.LockSurface (bg) < 0 then
         sdlerr ("locking background");
      end if;
      for i in 0 .. SCRH - 1 loop
         declare
            p    : Uint8_Ptrs.Object_Pointer;
            d : C.int;
         begin
            p := Object_Pointer ( Pointer (
                    To_Pointer (bg.pixels)) + C.ptrdiff_t (i * Integer (bg.pitch)));
            d := 0;
            for j in 0 .. SCRW - 1 loop
               declare
                  v : C.int := C.int'Max (d, -2);
                  use Interfaces;
               begin
                  v := C.int'Min (v, 2);
                  if i > 0 then -- ?
                     v := v
                          + C.int (Object_Pointer (
                                    Uint8_PtrOps.Pointer (p) - C.ptrdiff_t (bg.pitch)
                                  ).all)
                          + 65
                          - startcol;
                  end if;
                  Object_Pointer (
                     Uint8_PtrOps.Pointer (p) + C.ptrdiff_t (j)
                  ).all := Uint8 (
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
      V.UnlockSurface (bg);
      return bg;
   end make_bg;

   --  ======================================
   --  Return a surface flipped horisontally. Only works for 8bpp;
   --  extensions to arbitrary bitness is left as an exercise for
   --  reader.
   function hflip (s : V.Surface_ptr) return V.Surface_ptr
   is
      z : V.Surface_ptr := V.CreateRGBSurface (V.SWSURFACE,
                                               s.w, s.h, 8,
                                               0, 0, 0, 0);
   begin
      --  copy pallete
      V.SetColors (z, s.format.palette.colors,
                                0, s.format.palette.ncolors);
      if (V.LockSurface (s) < 0) or (V.LockSurface (z) < 0) then
         sdlerr ("locking flip images");
      end if;
      for i in 0 .. s.h - 1 loop
         declare
            from : Uint8_Ptrs.Object_Pointer := Object_Pointer (Pointer (
                  To_Pointer (s.pixels)) + C.ptrdiff_t (i * C.int (s.pitch)));
            to   : Uint8_Ptrs.Object_Pointer := Object_Pointer (Pointer (
                  To_Pointer (z.pixels)) + C.ptrdiff_t (i * C.int (z.pitch) + s.w - 1));
         begin
            for j in 0 .. s.w - 1 loop
               Object_Pointer (Pointer(to) - C.ptrdiff_t (j)).all :=
                  Object_Pointer (Pointer (from) + C.ptrdiff_t (j)).all;
            end loop;
            V.UnlockSurface (z);
            V.UnlockSurface (s);
         end;
      end loop;
      return z;
   end hflip;
   --  ======================================

end TestPalette_Sprogs;

