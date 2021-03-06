
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

with GNAT.OS_Lib;
with Ada.Text_IO; use Ada.Text_IO;


with SDL.Timer;
package body PlayWave_Sprogs is

   package T renames SDL.Timer;

   --  ======================================
   procedure CleanUp is
   begin

      if wave /= Mix.null_Chunk_ptr then
         Mix.FreeChunk (wave);
         wave := Mix.null_Chunk_ptr;
      end if;

      if audio_open then
         Mix.CloseAudio;
         audio_open := False;
      end if;

      SDL.SDL_Quit;

   end CleanUp;


   --  ======================================
   procedure Usage (argv0 : US.Unbounded_String) is
   begin
      Put_Line ("Usage: " & US.To_String (argv0)
                & " [-8] [-r rate] [-l] [-m] <wavefile>");
   end Usage;

   --  ======================================
   procedure the_exit (number : C.int)  is
   begin
      GNAT.OS_Lib.OS_Exit (Integer (number));
   end the_exit;

   --  ======================================

end PlayWave_Sprogs;
