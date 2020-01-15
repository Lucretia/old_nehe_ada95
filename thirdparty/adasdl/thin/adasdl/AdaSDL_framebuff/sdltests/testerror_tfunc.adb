
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
with SDL.Error;
with SDL.Thread;
with SDL.Types; use SDL.Types;
with SDL.Timer;

package body TestError_TFunc is

   package Er renames SDL.Error;
   package T  renames SDL.Thread;
   package Tm renames SDL.Timer;
   function To_chars_ptr  is
      new Ada.Unchecked_Conversion (System.Address, CS.chars_ptr);
   --  ======================================
   function ThreadFunc (data : System.Address) return Interfaces.C.int is
   begin
      Er.Set_Error ( "Thread " & CS.Value (To_chars_ptr (data))
                     & " (" & Uint32'Image (T.ThreadID) & ") "
                     & "had a problem: nevermind");
      while alive /= 0 loop
         Put_Line ("Thread '" &
                    CS.Value (To_chars_ptr (data)) &
                    "' is alive!");
         Tm.SDL_Delay (1 * 1000);
      end loop;
      Put_Line ("Child thread error string: " & Er.Get_Error);
      return 0;
   end ThreadFunc;


end TestError_TFunc;
