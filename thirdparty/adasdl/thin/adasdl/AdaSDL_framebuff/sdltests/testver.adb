
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
with Ada.Text_IO; use Ada.Text_IO;
with GNAT.OS_Lib;
with SDL.Types; use SDL.Types;
with SDL.Version; use SDL.Version;
with SDL.Byteorder.Extra;  use SDL.Byteorder.Extra;
                           use SDL.Byteorder;
with SDL.Error;
with SDL.Quit; use SDL.Quit;


procedure testver is

   package C renames Interfaces.C;
   use type C.int;

   package Er renames SDL.Error;

   compiled : SDL.Version.version;

   function Endianess return String is

   begin
      if BYTE_ORDER = LIL_ENDIAN then
         return "little";
      else
         return "big";
      end if;
   end Endianess;


begin

   if SDL.Init (0) < 0 then
      Put_Line ("Couldn't initialize SDL: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   SDL_VERSION (compiled);

   Put_Line ("Compiled version: " &
             Uint8'Image (compiled.major) & "." &
             Uint8'Image (compiled.minor) & "." &
             Uint8'Image (compiled.patch));

   Put_Line ("Linked version: "  &
             Uint8'Image (Linked_Version.major) & "." &
             Uint8'Image (Linked_Version.minor) & "." &
             Uint8'Image (Linked_Version.patch));

   Put_Line ("This is a " & Endianess & " endian machine");

   SDL.SDL_Quit;
end testver;
