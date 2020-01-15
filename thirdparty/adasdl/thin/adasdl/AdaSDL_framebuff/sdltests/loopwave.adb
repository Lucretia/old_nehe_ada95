
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

--  ---------------------------------------------------------------
--  This is a possible translation to Ada of the program loopwave.c
--  originally writen by -- Sam Lantinga.--

--  Translation made by -- A. M. F. Vargas --

--  ---------------------------------------------------------------
--  Program to load a wave file and loop playing it using SDL sound

--  This is only for simple WAVEs

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

with System.OS_Interface;
with Interfaces.C.Strings;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;
with GNAT.OS_Lib;
with SDL.Types; use SDL.Types;
with SDL.Timer;
with SDL.Error;
with SDL.Audio;
with SDL.Quit;
with Lib_C;
with Loopwave_Callback; use Loopwave_Callback;

procedure Loopwave is

   --  These could be avoided with use clauses.
   --  but I like to trace the origin of things
   package A  renames SDL.Audio;
   package C  renames Interfaces.C;
   package CS renames Interfaces.C.Strings;
   package Er renames SDL.Error;
   package T  renames SDL.Timer;
   use type C.int;
   use type A.audiostatus;
   use type A.AudioSpec_ptr;
   --  -------------------------------------


   name : CS.chars_ptr :=
      CS.New_String ("                                    ");
   Valid_WAV : Boolean := True;
begin

   --  Load the SDL library
   if SDL.Init (SDL.INIT_AUDIO) < 0 then
      Put_Line ("Couldn't load SDL: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   SDL.Quit.atexit (SDL.SDL_Quit'Access);

   if Argument_Count = 0 then
      Put_Line ("Usage: " & Command_Name & " <wavefile>");
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   --  Load the wave file into memory

   --  A.Load_WAV (
   --     CS.New_String (Argument (1)),
   --     wave.spec,
   --     wave.sound,
   --     wave.soundlen,
   --     Valid_WAV);

   A.Load_WAV (
      CS.New_String (Argument (1)),
      wave.spec'Access,
      wave.sound'Access,
      wave.soundlen'Access,
      Valid_WAV);
   if not Valid_WAV then
      Put_Line("Couldn't load " & Argument (1) & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   wave.spec.callback := fillerup'Access;

   --  Set the signals
   --  #ifdef SIGHUP
   --  Lib_C.Set_Signal (System.OS_Interface.SIGHUP,  poked'Access);
   --  #endif
   Lib_C.Set_Signal (System.OS_Interface.SIGINT,  poked'Access);
   --  #ifdef SIGQUIT
   --  Lib_C.Set_Signal (System.OS_Interface.SIGQUIT, poked'Access);
   --  #endif
   Lib_C.Set_Signal (System.OS_Interface.SIGTERM, poked'Access);

   --  Initialize fillrup variables
   if A.OpenAudio(wave.spec'Access, null) < 0 then
      Put_Line ("Couldn't open audio: " & Er.Get_Error);
      A.FreeWAV (wave.sound);
      GNAT.OS_Lib.OS_Exit (2);
   end if;

   A.PauseAudio (0);

   --  Let the audio run
   Put_Line ("using audio driver: " &
             CS.Value (A.AudioDriverName (
                          name,
                          32)));
   declare
      i : Integer := 0;
   begin
      while done = 0 and  A.GetAudioStatus = A.AUDIO_PLAYING loop
         T.SDL_Delay (1000);
      end loop;
   end;

   Put_Line ("Closing audio");
   A.CloseAudio;
   Put_Line ("Free WAV");
   A.FreeWAV (wave.sound);

   Put_Line ("The End");
end Loopwave;
