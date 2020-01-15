--  -----------------------------------------------------
--     Copyright (C) by:
--     Antonio F. Vargas - Ponta Delgada - Azores - Portugal
--     avargas@adapower.net
--     www.adapower.net/~avargas
--  -----------------------------------------------------

--  This program is in the public domain

--  -----------------------------------------------------
--  Command line options:
--      -slow      To slow down velocity under acelerated
--                 hardware.
--      -window    GUI window. Fullscreen is the default.
--      -nosound   To play without sound.
--      -800x600   To create a video display of 800 by 600
--                 the default mode is 640x480
--      -1024x768  To create a video display of 1024 by 768
--  -----------------------------------------------------
with Interfaces.C;
with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;
with GNAT.OS_Lib;
with SDL.Video;
with SDL.Timer;
with SDL.Error;
with SDL.Events;
with SDL.Keyboard;
with SDL.Keysym;
with SDL.Types; use SDL.Types;
with SDL_Mixer;
with SDL.Audio;
with gl_h; use gl_h;
with AdaGL; use AdaGL;
procedure GenericGLS is

   package CL renames Ada.Command_Line;
   package C  renames Interfaces.C;
   use type C.unsigned;
   use type C.int;
   use type SDL.Init_Flags;
   package Vd  renames SDL.Video;
   use type Vd.Surface_ptr;
   use type Vd.Surface_Flags;
   package Tm  renames SDL.Timer;
   package Er  renames SDL.Error;
   package Ev  renames SDL.Events;
   package Kb  renames SDL.Keyboard;
   package Ks  renames SDL.Keysym;
   package Au  renames SDL.Audio;
   use type Ks.SDLMod;
   package Mix renames SDL_Mixer;
   use type Mix.Chunk_ptr;

   --  ===================================================================
   procedure Init is
   begin
      null;
   end Init;

   --  ===================================================================
   procedure draw is
   begin
      glClear (GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);

      glPushMatrix;

      --  ...

      glPopMatrix;

      Vd.GL_SwapBuffers;

   end draw;

   --  ===================================================================
   procedure idle is
   begin
      null;
   end idle;

   --  ===================================================================
   --  New window size of exposure
   procedure reshape (width : C.int; height : C.int) is
      h : GLdouble := GLdouble (height) / GLdouble (width);
   begin
      glViewport (0, 0, GLint (width), GLint (height));
      glMatrixMode (GL_PROJECTION);
      glLoadIdentity;
      glFrustum (-1.0, 1.0, -h, h, 5.0, 60.0);
      glMatrixMode (GL_MODELVIEW);
      glLoadIdentity;
      glTranslatef (0.0, 0.0, -40.0);
   end reshape;

   --  ===================================================================
   procedure Load_Sound (wave : in out Mix.Chunk_ptr; file : String) is
   begin
      wave := Mix.Load_WAV (file);
      if wave = Mix.null_Chunk_ptr then
         Put_Line ("Couldn't load " & file & ": " & Mix.Get_Error);
         GNAT.OS_Lib.OS_Exit (2);
      end if;
   end Load_Sound;

   --  ===================================================================
   procedure Stop_Sound (wave : in out Mix.Chunk_ptr) is
   begin
      if wave /= Mix.null_Chunk_ptr then
         Mix.FreeChunk (wave);
         wave := Mix.null_Chunk_ptr;
      end if;
   end Stop_Sound;

   --  ===================================================================

   screen : Vd.Surface_ptr;
   done   : Boolean;
   keys   : Uint8_ptr;
   Screen_Width : C.int := 640;
   Screen_Hight : C.int := 480;

   Slowly      : Boolean := False;
   Full_Screen : Boolean := True;
   Sound       : Boolean := True;
   argc        : Integer := CL.Argument_Count;
   Video_Flags : Vd.Surface_Flags := 0;
   Initialization_Flags : SDL.Init_Flags := 0;

   --  ===================================================================
   procedure Manage_Command_Line is
   begin
      while argc > 0 loop
         if (argc >= 1) and then CL.Argument (argc) = "-slow" then
            Slowly := True;
            argc := argc - 1;
         elsif CL.Argument (argc) = "-window" then
            Full_Screen := False;
            argc := argc - 1;
         elsif CL.Argument (argc) = "-1024x768" then
            Screen_Width := 1024;
            Screen_Hight :=  768;
            argc := argc - 1;
         elsif CL.Argument (argc) = "-800x600" then
            Screen_Width := 800;
            Screen_Hight := 600;
            argc := argc - 1;
         elsif CL.Argument (argc) = "-nosound" then
            Sound := False;
            argc := argc - 1;
         else
            Put_Line ("Usage: " & CL.Command_Name & " " &
                      "[-slow] [-nosound] [-window] [-h] " &
                      "[[-800x600] | [-1024x768]]");
            argc := argc - 1;
            GNAT.OS_Lib.OS_Exit (0);
         end if;
      end loop;
   end Manage_Command_Line;

   --  ===================================================================
   Background_Wave : Mix.Chunk_ptr := Mix.null_Chunk_ptr;
   Sample_Wave     : Mix.Chunk_ptr := Mix.null_Chunk_ptr;
   --  ===================================================================
   procedure Initialize_Sound is
   begin
      if Sound then
         if Mix.OpenAudio (22050, Au.AUDIO_S16, 2, 4096) < 0 then
            Put_Line ("Couldn't open audio " & Mix.Get_Error);
            GNAT.OS_Lib.OS_Exit (2);
         end if;

         Load_Sound (Background_Wave, "background.wav");
         Mix.PlayChannel (0, Background_Wave, -1);

         Load_Sound (Sample_Wave, "sample.wav");
      end if; -- Sound
   end Initialize_Sound;

   --  ===================================================================
   procedure Main_System_Loop is
   begin
      while not done loop
         declare
            event : Ev.Event;
            PollEvent_Result : C.int;
         begin
            idle;
            loop
               Ev.PollEventVP (PollEvent_Result, event);
               exit when PollEvent_Result = 0;

               case event.the_type is
                  when Ev.VIDEORESIZE =>
                     screen := Vd.SetVideoMode (
                                  event.resize.w,
                                  event.resize.h,
                                  16,
                                  Vd.OPENGL or Vd.RESIZABLE);
                     if screen /= null then
                        reshape (screen.w, screen.h);
                     else
                        --  Uh oh, we couldn't set the new video mode??
                        null;
                     end if;
                  when Ev.QUIT =>
                     done := True;
                  when others => null;
               end case;
            end loop;
            keys := Kb.GetKeyState (null);

            if Kb.Is_Key_Pressed (keys, Ks.K_ESCAPE) then
               done := True;
            end if;

            if Kb.Is_Key_Pressed (keys, Ks.K_s) then
               Mix.PlayChannel (-1, Sample_Wave, 0);
            end if;

            draw;
         end; -- declare
      end loop;
   end Main_System_Loop;

   --  ===================================================================
   --                         GenerigGLS Procedure body
   --  ===================================================================
begin

   Manage_Command_Line;

   Initialization_Flags := SDL.INIT_VIDEO;
   if Sound then
      Initialization_Flags := Initialization_Flags or SDL.INIT_AUDIO;
   end if;

   if SDL.Init (Initialization_Flags) < 0 then
      Put_Line ("Couldn't load SDL: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   Video_Flags := Vd.OPENGL or Vd.RESIZABLE;
   if Full_Screen then
         Video_Flags := Video_Flags or Vd.FULLSCREEN;
   end if;

   screen := Vd.SetVideoMode (Screen_Width, Screen_Hight, 16, Video_Flags);
   if screen = null then
      Put_Line ("Couldn't set " & C.int'Image (Screen_Width) & "x" &
                C.int'Image (Screen_Hight) & " GL video mode: " & Er.Get_Error);
      SDL.SDL_Quit;
      GNAT.OS_Lib.OS_Exit (2);
   end if;

   Vd.WM_Set_Caption ("Generic Sound", "Generic");

   Initialize_Sound;

   Init;

   reshape (screen.w, screen.h);
   done := False;

   Main_System_Loop;

   if Sound then
      Stop_Sound (Background_Wave);
      Mix.CloseAudio;
   end if; -- Sound

   SDL.SDL_Quit;
end GenericGLS;
