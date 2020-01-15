
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

with System;
with Interfaces.C;
with Ada.Unchecked_Conversion;
with SDL.Types; use SDL.Types;
package TortureThread_Sprogs is
   package C  renames Interfaces.C;
   use type C.int;
   function To_Address is new Ada.Unchecked_Conversion (C.int, System.Address);

   NUMTHREADS : constant := 10;

   type time_for_threads_to_die_Array is
      array (C.int range 0 .. NUMTHREADS - 1) of Uint8;
   pragma Convention (C, time_for_threads_to_die_Array);
   time_for_threads_to_die : time_for_threads_to_die_Array;
   pragma Volatile (time_for_threads_to_die);

   function SubThreadFunc (data : System.Address) return C.int;
   pragma Convention (C, SubThreadFunc);

   function ThreadFunc (data : System.Address) return C.int;
   pragma Convention (C, ThreadFunc);

end TortureThread_Sprogs;
