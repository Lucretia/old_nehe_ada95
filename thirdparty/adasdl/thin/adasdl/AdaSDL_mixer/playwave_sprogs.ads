--
--    PLAYWAVE: Port to the Ada programming language of a test application for the
--    the SDL mixer library.
--
--    The original code was written in C by Sam Lantinga  http://www.libsdl.org.
--
--    This program is free software; you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation; either version 2 of the License, or
--    (at your option) any later version.
--
--    This program is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.
--
--    You should have received a copy of the GNU General Public License
--    along with this program; if not, write to the Free Software
--    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--
--    Ada code written by:
--                Antonio M. F. Vargas                               --
--                Ponta Delgada - Azores - Portugal                  --
--                E-mail: avargas@adapower.net                       --
--                http://www.adapower.net/~avargas                   --

with Interfaces.C;
with Ada.Strings.Unbounded;
with SDL_Mixer;
package PlayWave_Sprogs is

   package C renames Interfaces.C;
   package Mix renames SDL_Mixer;
   use type Mix.Chunk_ptr;
   package US  renames Ada.Strings.Unbounded;

   audio_open : Boolean := False;
   wave : Mix.Chunk_ptr := Mix.null_Chunk_ptr;
   argv0 : US.Unbounded_String;

   procedure CleanUp;
   pragma Convention (C, CleanUp);

   procedure Usage (argv0 : US.Unbounded_String);

   procedure the_exit (number : C.int);
   pragma Convention (C, the_exit);

end PlayWave_Sprogs;
