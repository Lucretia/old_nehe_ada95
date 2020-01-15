--
--    PLAYMUS: Port to the Ada programming language of a test application for the
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
with SDL_Mixer;
package PlayMus_Sprogs is
   package C renames Interfaces.C;
   use type C.int;
   package Mix renames SDL_Mixer;
   use type Mix.Music_ptr;

   audio_open : Boolean := False;
   music : Mix.Music_ptr := Mix.null_Music_ptr;

   procedure CleanUp;
   pragma Convention (C, CleanUp);
   procedure the_exit (number : C.int);
   pragma Convention (C, the_exit);
end PlayMus_Sprogs;
