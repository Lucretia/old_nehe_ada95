
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

package body Loopwave_Callback is

   use Uint8_PtrOps;
   --  ---------------------------------
   procedure fillerup (userdata : void_ptr; --  userdata is not used here
                       the_stream   : Uint8_ptr;
                       the_len      : C.int)
   is
      stream   : Uint8_ptr := the_stream;
      waveptr  : Uint8_ptr;
      waveleft : C.int;
      len  : C.int := the_len;
   begin
      --  Set up the pointers
      waveptr := Uint8_ptr (
         Pointer (wave.sound) + C.ptrdiff_t (wave.soundpos));
      waveleft := C.int (wave.soundlen) - wave.soundpos;

      --  Go!
      while waveleft <= len loop
         A.MixAudio (stream, waveptr, Uint32 (waveleft), A.MIX_MAXVOLUME);
         stream := Uint8_ptr (
            Pointer (stream) + C.ptrdiff_t (waveleft));
         len := len - waveleft;
         waveptr := wave.sound;
         waveleft := C.int (wave.soundlen);
         wave.soundpos := 0;
      end loop;
      A.MixAudio (stream, waveptr, Uint32 (len), A.MIX_MAXVOLUME);
      wave.soundpos := wave.soundpos + len;
   end fillerup;

   --  ---------------------------------
   procedure poked (sig : C.int) is
   begin
      done := 1;
   end poked;
   --  ======================================

end Loopwave_Callback;
