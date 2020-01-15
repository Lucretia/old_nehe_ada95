
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

with Interfaces.C.Strings;
with Ada.Unchecked_Conversion;
with SDL.Timer;
with SDL.Types; use SDL.Types;
with Ada.Text_IO; use Ada.Text_IO;
package body TestSem_Sprogs is
   package T  renames SDL.Timer;
   function To_int  is
      new Ada.Unchecked_Conversion (System.Address, C.int);
   --  ======================================
   function ThreadFunc (data : System.Address) return C.int
   is
   begin
      while alive loop
         M.SemWait (sem);
         Put_Line ("Thread number " & C.int'Image (To_int (data)) &
                   " has got the semaphore (value = " &
                   Uint32'Image (M.SemValue (sem)) & ")!");
         T.SDL_Delay (200);
         M.SemPost (sem);
         Put_Line ("Thread number " & C.int'Image (To_int (data)) &
                   " has released the semaphore (value = " &
                   Uint32'Image (M.SemValue (sem)) & ")!");
         T.SDL_Delay (1); --  For the scheduler
      end loop;
      Put_Line ("Thread number " & C.int'Image (To_int (data)) & " exiting");
      return 0;
   end ThreadFunc;

   --  ======================================
   procedure killed (sig : C.int) is
   begin
      alive := False;
   end killed;

   --  ======================================
end TestSem_Sprogs;
