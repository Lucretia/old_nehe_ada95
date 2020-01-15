
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

with System.OS_Interface;
with Interfaces.C;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line;
with Ada.Characters.Handling;
with Ada.Strings.Unbounded;
with GNAT.OS_Lib;
with Lib_C;
with SDL.Timer;
with SDL.Types; use SDL.Types;
with SDL.Audio;
with SDL.Quit;
with SDL_Mixer;
with PlayMus_Sprogs;
use PlayMus_Sprogs;
procedure PlayMus is

   package C   renames Interfaces.C;
   use type C.int;
   package CL  renames Ada.Command_Line;
   package US  renames Ada.Strings.Unbounded;
   package CH  renames Ada.Characters.Handling;
   package A   renames SDL.Audio;
   use type A.Format_Flag;
   package T   renames SDL.Timer;
   package Mix renames SDL_Mixer;
   use type Mix.Music_ptr;

   argv0 : US.Unbounded_String;

   --  ======================================
   procedure Usage (argv0 : US.Unbounded_String) is
   begin
      Put_Line ("Usage: " & US.To_String (argv0)
                & " [-i] [-l] [-8] [-r rate] [-b buffers] [-s] <musicfile>");
   end Usage;

   --  ======================================
   procedure Menu is
      buf : Character;
   begin
      Put_Line ("Available commands: (p)ause (r)esume (h)alt > ");
      Get_Immediate (buf);
      Put_Line ("buf is: " & buf);
      case buf is
         when 'p' | 'P' => Mix.PauseMusic;
         when 'r' | 'R' => Mix.ResumeMusic;
         when 'h' | 'H' => Mix.HaltMusic;
         when others => null;
      end case;
      Put ("Music playing: ");
      if Mix.PlayingMusic /= 0 then
         Put ("yes");
      else
         Put ("no");
      end if;
      Put (" Paused: ");
      if Mix.PausedMusic /= 0 then
         Put_Line ("yes");
      else
         Put_Line ("no");
      end if;
   end Menu;

   --  ======================================
   audio_rate      : C.int;
   audio_format    : A.Format_Flag;
   audio_channels  : C.int;
   audio_buffers   : C.int;
   looping         : C.int := 0;
   interactive     : Boolean := False;
   i : Integer;
begin
   --  Initialize variables
   audio_rate      := 22050;
   audio_format    := A.AUDIO_S16;
   audio_channels  := 2;
   audio_buffers   := 4096;

   --  Check command line usage
   i := 1;
   while (i <= CL.Argument_Count)
         and then (CL.Argument (i) (1) = '-') loop
      if CL.Argument (i) = "-r"
            and then CL.Argument_Count >= i + 1
            and then CH.Is_Digit (CL.Argument (i + 1) (1)) then
         i := i + 1;
         declare
            package int_IO is new Ada.Text_IO.Integer_IO (C.int);
            use int_IO;
            last : Positive;
         begin
            Get (CL.Argument (i), audio_rate, last);
         end;
      elsif  CL.Argument (i) = "-b"
            and then CL.Argument_Count >= i + 1
            and then CH.Is_Digit (CL.Argument (i + 1) (1)) then
         i := i + 1;
         declare
            package int_IO is new Ada.Text_IO.Integer_IO (C.int);
            use int_IO;
            last : Positive;
         begin
            Get (CL.Argument (i), audio_buffers, last);
         end;
      elsif CL.Argument (i) = "-m" then
         audio_channels := 1;
      elsif CL.Argument (i) = "-l" then
         looping := -1;
      elsif CL.Argument (i) = "-i" then
         interactive := True;
      elsif CL.Argument (i) = "-8" then
         audio_format := A.AUDIO_U8;
      else
         Usage (US.To_Unbounded_String (CL.Command_Name));
         GNAT.OS_Lib.OS_Exit (1);
      end if;
      i := i + 1;
   end loop;

   if CL.Argument_Count < i then
      Usage (US.To_Unbounded_String (CL.Command_Name));
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   --  Initialize the SDL library
   if SDL.Init (SDL.INIT_AUDIO) < 0 then
      Put_Line ("Couldn't initialize SDL: " & Mix.Get_Error);
      GNAT.OS_Lib.OS_Exit (255);
   end if;

   SDL.Quit.atexit (CleanUp'Access);

   Lib_C.Set_Signal (System.OS_Interface.SIGINT,  the_exit'Access);
   Lib_C.Set_Signal (System.OS_Interface.SIGTERM, the_exit'Access);

   --  Open the audio device
   if Mix.OpenAudio (audio_rate, audio_format, audio_channels, audio_buffers) < 0 then
      Put_Line ("Couldn't open audio: " & Mix.Get_Error);
      GNAT.OS_Lib.OS_Exit (2);
   else
      Mix.Query_Spec (audio_rate, audio_format, audio_channels);
      Put ("Opened audio at " & C.int'Image (audio_rate)
           & " Hz " & A.Format_Flag'Image (audio_format and 16#FF#) & " bit ");
      if audio_channels > 1 then
         Put ("stereo, ");
      else
         Put ("mono, ");
      end if;
      Put_Line (C.int'Image (audio_buffers) & " bytes audio buffer");
   end if;

   audio_open := True;

   --  Set the external music player, if any
   Mix.Set_Music_CMD (GNAT.OS_Lib.Getenv ("MUSIC_CMD").all);

   --  Load the requested music file
   music := Mix.Load_MUS (CL.Argument (i));
   if music = Mix.null_Music_ptr then
      Put_Line ("Couldn't load " & CL.Argument (i) & ": " & Mix.Get_Error);
      GNAT.OS_Lib.OS_Exit (2);
   end if;

   --  Play and then exit
   Mix.FadeInMusic (music, looping, 4000);
   while Mix.PlayingMusic /= 0 or Mix.PausedMusic /= 0 loop
      if interactive then
         Menu;
      else
         T.SDL_Delay (100);
      end if;
   end loop;

   GNAT.OS_Lib.OS_Exit (0);

end PlayMus;
