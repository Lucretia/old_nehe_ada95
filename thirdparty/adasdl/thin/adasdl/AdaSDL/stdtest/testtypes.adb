
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
with GNAT.OS_Lib;
with SDL.Types; use SDL.Types;
procedure TestTypes is
   package C  renames Interfaces.C;
   use type C.int;
   package CL renames Ada.Command_Line;
   error : C.int := 0;
   verbose : Boolean := True;
begin
   if CL.Argument_Count > 0 and then CL.Argument (1) = "-q" then
      verbose := False;
   end if;

   if Uint8'Size / C.CHAR_BIT /= 1 then
      if verbose then
         Put_Line ("Size of Uint8 is different from 1, instead =" &
                  Integer'Image (Uint8'Size / C.CHAR_BIT));
      end if;
      error := error + 1;
   end if;

   if Uint16'Size / C.CHAR_BIT /= 2 then
      if verbose then
         Put_Line ("Size of Uint16 is different from 2, instead =" &
                  Integer'Image (Uint16'Size / C.CHAR_BIT));
      end if;
      error := error + 1;
   end if;

   if Uint32'Size / C.CHAR_BIT /= 4 then
      if verbose then
         Put_Line ("Size of Uint32 is different from 4, instead =" &
                  Integer'Image (Uint32'Size / C.CHAR_BIT));
      end if;
      error := error + 1;
   end if;

   if Uint64'Size / C.CHAR_BIT /= 8 then
      if verbose then
         Put_Line ("Size of Uint64 is different from 8, instead =" &
                  Integer'Image (Uint64'Size / C.CHAR_BIT));
      end if;
      error := error + 1;
   end if;

   if verbose and error = 0 then
      Put_Line ("All data types are the expected size");
   end if;


   if error > 0 then
      GNAT.OS_Lib.OS_Exit (1);
   else
      GNAT.OS_Lib.OS_Exit (0);
   end if;

end TestTypes;
