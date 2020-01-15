
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
with Ada.Text_IO; use Ada.Text_IO;
with GNAT.OS_Lib;
with SDL.Types; use SDL.Types;
with SDL.Timer;
with SDL.Thread;

package body TesThread_Sprogs is

   package T  renames SDL.Thread;
   package Tm renames SDL.Timer;
   package CS renames Interfaces.C.Strings;

   function To_chars_ptr  is
      new Ada.Unchecked_Conversion (System.Address, CS.chars_ptr);

   --  ======================================
   function ThreadFunc (data : System.Address) return C.int is
   begin
      Put_Line ("Started thread " & CS.Value (To_chars_ptr (data))
                & ": My thread id is " & Uint32'Image (T.ThreadID));
      while alive loop
         Put_Line ("Thread '" & CS.Value (To_chars_ptr (data)) &
                   "' is alive!");
         Tm.SDL_Delay (1 * 1000);
      end loop;
      Put_Line ("Thread '" & CS.Value (To_chars_ptr (data)) & "' is alive!");
      return 0;
   end ThreadFunc;

   --  ======================================
   procedure killed (sig : C.int) is
   begin
      Put_Line ("Killed with SIGTERM, waiting 5 seconds to exit");
      Tm.SDL_Delay (5 * 1000);
      alive := False;
      GNAT.OS_Lib.OS_Exit (0);
   end killed;

   --  ======================================
end TesThread_Sprogs;
