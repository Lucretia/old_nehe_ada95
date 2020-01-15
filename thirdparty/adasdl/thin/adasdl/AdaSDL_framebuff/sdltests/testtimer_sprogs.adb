
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

with Ada.Unchecked_Conversion;
with Ada.Text_IO; use Ada.Text_IO;
package body TestTimer_Sprogs is

   use type C.int;

   function To_int is new Ada.Unchecked_Conversion (System.Address, C.int);

   --  ======================================
   function ticktock (interval  : Uint32) return Uint32 is
   begin
      ticks := ticks + 1;
      return interval;
   end ticktock;

   --  ======================================
   function callback (interval : Uint32; param : System.Address) return Uint32 is
   begin
      Put_Line ("Timer " & Uint32'Image (interval) &
                " : param = " & C.int'Image (To_int (param)));
      return interval;
   end callback;

   --  ======================================
end TestTimer_Sprogs;
