
--  ----------------------------------------------------------------- --
--                                                                    --
--  This is free software; you can redistribute it and/or             --
--  modify it under the terms of the GNU General Public               --
--  License as published by the Free Software Foundation; either      --
--  version 2 of the License, or (at your option) any later version.  --
--                                                                    --
--  This software is distributed in the hope that it will be useful,  --
--  but WITHOUT ANY WARRANTY; without even the implied warranty of    --
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU --
--  General Public License for more details.                          --
--                                                                    --
--  You should have received a copy of the GNU General Public         --
--  License along with this library; if not, write to the             --
--  Free Software Foundation, Inc., 59 Temple Place - Suite 330,      --
--  Boston, MA 02111-1307, USA.                                       --
--                                                                    --
--  ----------------------------------------------------------------- --

--  ----------------------------------------------------------------- --
--  This is a translation, to the Ada programming language, of the    --
--  original C test files written by Sam Lantinga - www.libsdl.org    --
--  translation made by Antonio F. Vargas - www.adapower.net/~avargas --
--  ----------------------------------------------------------------- --
--  ----------------------------------------------------------------- --
--  WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING
--  ----------------------------------------------------------------- --
--  SERIOUS WARNING: The Ada code in this files may, at some points,
--  rely directly on pointer arithmetic which is considered very
--  unsafe and PRONE TO ERROR. The AdaSDL_Mixer examples are
--  more appropriate and easier to understand. They should be used in
--  replacement of this files. Please go there.
--  This file exists only for the sake of completness and to test
--  AdaSDL without the dependency of AdaSDL_Mixer.
--  ----------------------------------------------------------------- --
--  WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING
--  ----------------------------------------------------------------- --

with Interfaces.C;
with Interfaces.C.Pointers;
with SDL.Types; use SDL.Types;
with SDL.Audio;
package Loopwave_Callback is

   package A renames SDL.Audio;
   package C renames Interfaces.C;
   use type C.int;

   done : C.int := 0;

   type Wave_Type is
      record
         spec     : aliased A.AudioSpec;
         sound    : aliased Uint8_ptr; --  Pointer do wave data
         soundlen : aliased Uint32;    --  Length of wave data
         soundpos : C.int;             --  Current play position
      end record;
   pragma Convention (C, Wave_Type);

   wave : Wave_Type;

   procedure fillerup (userdata : void_ptr;
                       the_stream   : Uint8_ptr;
                       the_len      : C.int);

   pragma Convention (C, fillerup);

   procedure poked (sig : C.int);
   pragma Convention (C, poked);

end Loopwave_Callback;
