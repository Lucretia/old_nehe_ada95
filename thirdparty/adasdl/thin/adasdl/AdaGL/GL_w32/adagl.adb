
--  ---------------------------------------------------------------- --
--  This file contains some improvements to the gl Ada binding       --
--  in order to allow a better programming style.                    --
--  The prototypes below follow the Implementation advice from       --
--  ARM Annex B (B.3).                                               --
--  ---------------------------------------------------------------- --

-- ----------------------------------------------------------------- --
--                Copyright (C) 2001 A.M.F.Vargas                    --
--                Antonio M. F. Vargas                               --
--                Ponta Delgada - Azores - Portugal                  --
--                http://www.adapower.net/~avargas                   --
--                E-mail: avargas@adapower.net                       --
-- ----------------------------------------------------------------- --
--                                                                   --
-- This library is free software; you can redistribute it and/or     --
-- modify it under the terms of the GNU General Public               --
-- License as published by the Free Software Foundation; either      --
-- version 2 of the License, or (at your option) any later version.  --
--                                                                   --
-- This library is distributed in the hope that it will be useful,   --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of    --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU --
-- General Public License for more details.                          --
--                                                                   --
-- You should have received a copy of the GNU General Public         --
-- License along with this library; if not, write to the             --
-- Free Software Foundation, Inc., 59 Temple Place - Suite 330,      --
-- Boston, MA 02111-1307, USA.                                       --
--                                                                   --
-- As a special exception, if other files instantiate generics from  --
-- this unit, or you link this unit with other files to produce an   --
-- executable, this  unit  does not  by itself cause  the resulting  --
-- executable to be covered by the GNU General Public License. This  --
-- exception does not however invalidate any other reasons why the   --
-- executable file  might be covered by the  GNU Public License.     --
-- ----------------------------------------------------------------- --

with Interfaces.C.Strings;
use Interfaces.C.Strings;
with Ada.Unchecked_Conversion;
package body AdaGL is
   
   package CS  renames Interfaces.C.Strings;
   
   function To_chars_ptr is new Ada.Unchecked_Conversion (
      GLubyte_Ptr, CS.chars_ptr);
   
   --  ======================================
   function Get_chars_ptr (Chars_Ref : GLenum) return CS.chars_ptr is
   begin
      return To_chars_ptr (glGetString (Chars_Ref));
   end Get_chars_ptr;
   
   --  ======================================
   function glGetString (Chars_Ref : GLenum) return String is
      temp_chars_ptr : CS.chars_ptr;
   begin
      temp_chars_ptr := Get_chars_ptr (Chars_ref);
      if temp_chars_ptr /= Cs.Null_Ptr then
         return CS.Value (Get_chars_ptr (Chars_Ref));
      else
         return "";
      end if;
   end glGetString;
   
   --  ======================================
end AdaGL;
