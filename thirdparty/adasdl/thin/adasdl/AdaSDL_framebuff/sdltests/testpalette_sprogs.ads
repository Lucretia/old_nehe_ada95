
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
with Ada.Numerics.Discrete_Random;
with SDL.Video;

package TestPalette_Sprogs is
   package Vd  renames SDL.Video;
   package C  renames Interfaces.C;
   package Random_Integer is
      new Ada.Numerics.Discrete_Random (Integer);
   Integer_Generator : Random_Integer.Generator;
   SCRW   : constant := 640; -- 800; --  640;
   SCRH   : constant := 480; -- 600; --  480;
   SPEED  : constant :=   2;
   NBOATS : constant :=   5;
   procedure sdlerr (when_err : String);
   function make_bg (screen : Vd.Surface_ptr; startcol : C.int)
      return Vd.Surface_ptr;
   function hflip (s : Vd.Surface_ptr) return Vd.Surface_ptr;
   --  wave colours: Made by taking a narrow cross-section of a wave picture
   --  in Gimp, saving in PPM ascii format and formatting with Emacs macros.
   type wavemap_Array is array (0 .. 63) of aliased Vd.Color;
   wavemap : wavemap_Array :=
              ((  0,  2,103,0), (  0,  7,110,0), (  0, 13,117,0), (  0, 19,125,0),
               (  0, 25,133,0), (  0, 31,141,0), (  0, 37,150,0), (  0, 43,158,0),
               (  0, 49,166,0), (  0, 55,174,0), (  0, 61,182,0), (  0, 67,190,0),
               (  0, 73,198,0), (  0, 79,206,0), (  0, 86,214,0), (  0, 96,220,0),
               (  5,105,224,0), ( 12,112,226,0), ( 19,120,227,0), ( 26,128,229,0),
               ( 33,135,230,0), ( 40,143,232,0), ( 47,150,234,0), ( 54,158,236,0),
               ( 61,165,238,0), ( 68,173,239,0), ( 75,180,241,0), ( 82,188,242,0),
               ( 89,195,244,0), ( 96,203,246,0), (103,210,248,0), (112,218,250,0),
               (124,224,250,0), (135,226,251,0), (146,229,251,0), (156,231,252,0),
               (167,233,252,0), (178,236,252,0), (189,238,252,0), (200,240,252,0),
               (211,242,252,0), (222,244,252,0), (233,247,252,0), (242,249,252,0),
               (237,250,252,0), (209,251,252,0), (174,251,252,0), (138,252,252,0),
               (102,251,252,0), ( 63,250,252,0), ( 24,243,252,0), (  7,225,252,0),
               (  4,203,252,0), (  3,181,252,0), (  2,158,252,0), (  1,136,251,0),
               (  0,111,248,0), (  0, 82,234,0), (  0, 63,213,0), (  0, 50,192,0),
               (  0, 39,172,0), (  0, 28,152,0), (  0, 17,132,0), (  0,  7,114,0));
   cmap : Vd.Colors_Array (0 .. 255);
end TestPalette_Sprogs;
