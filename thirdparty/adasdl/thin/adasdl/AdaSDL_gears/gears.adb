--  3-D gear wheels.
--  -----------------------------------------------------
--  A more simple version of this program was originaly
--  created in C by Brian Paul.
--  -----------------------------------------------------
--  Conversion to Ada + SDL, and extensions, written by:
--     Antonio F. Vargas - Ponta Delgada - Azores - Portugal
--     avargas@adapower.net
--     www.adapower.net/~avargas
--  -----------------------------------------------------

--  This program is in the public domain

--  -----------------------------------------------------
--  Command line options:
--      -info      Print GL implementation information
--                 (this is the original option).
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
procedure gears is

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

   T0 : GLint := 0;
   Frames : GLint := 0;

   --  ===================================================================
   --  Draw a gear wheel.  You'll probably want to call this function when
   --  building a display list since we do a lot of trig here.

   --  Input:  inner_radius - radius of hole at center
   --          outer_radius - radius at center of teeth
   --          width - width of gear
   --          teeth - number of teeth
   --          tooth_depth - depth of tooth
   --  ===================================================================
   procedure gear (
      inner_radius : GLfloat;
      outer_radius : GLfloat;
      width        : GLfloat;
      teeth        : GLint;
      tooth_depth  : GLfloat)
   is
      r0, r1, r2 : GLfloat;
      angle, da  : GLfloat;
      u, v, len  : GLfloat;

      Pi : constant := Ada.Numerics.Pi;

      package GLfloat_Math is new
         Ada.Numerics.Generic_Elementary_Functions (GLfloat);
      use GLfloat_Math;

   begin
      r0 := inner_radius;
      r1 := outer_radius - tooth_depth / 2.0;
      r2 := outer_radius + tooth_depth / 2.0;

      da := 2.0 * Pi / GLfloat (teeth) / 4.0;

      glShadeModel (GL_FLAT);
      glNormal3f (0.0, 0.0, 1.0);

      --  Draw front face
      glBegin (GL_QUAD_STRIP);
      for i in GLint range 0 .. teeth loop
         angle := GLfloat (i) * 2.2 * Pi / GLfloat (teeth);

         glVertex3f (r0 * Cos (angle), r0 * Sin (angle), width * 0.5);
         glVertex3f (r1 * Cos (angle), r1 * Sin (angle), width * 0.5);
         if i < teeth then
            glVertex3f (r0 * Cos (angle), r0 * Sin (angle), width * 0.5);
            glVertex3f (r1 * Cos (angle + 3.0 * da),
                        r1 * Sin (angle + 3.0 * da),
                        width * 0.5);
         end if;
      end loop;
      glEnd;

      --  draw front sides of teeth
      glBegin (GL_QUADS);
      da := 2.0 * Pi / GLfloat (teeth) / 4.0;
      for i in GLint range 0 .. teeth - 1 loop
         angle := GLfloat (i) * 2.0 * Pi / GLfloat (teeth);

         glVertex3f (r1 * Cos (angle), r1 * Sin (angle), width * 0.5);
         glVertex3f (r2 * Cos (angle + da), r2 * Sin (angle + da), width * 0.5);
         glVertex3f (r2 * Cos (angle + 2.0 * da),
                     r2 * Sin (angle + 2.0 * da),
                     width * 0.5);
         glVertex3f (r1 * Cos (angle + 3.0 * da),
                     r1 * Sin (angle + 3.0 * da),
                     width * 0.5);
      end loop;
      glEnd;

      glNormal3f (0.0, 0.0, -1.0);

      --  draw back face
      glBegin (GL_QUAD_STRIP);
      for i in GLint range 0 .. teeth loop
         angle := GLfloat (i) * 2.0 * Pi / GLfloat (teeth);
         glVertex3f (r1 * Cos (angle), r1 * Sin (angle), -width * 0.5);
         glVertex3f (r0 * Cos (angle), r0 * Sin (angle), -width * 0.5);
         if i < teeth then
            glVertex3f (r1 * Cos (angle + 3.0 * da),
                        r1 * Sin (angle + 3.0 * da),
                        -width * 0.5);
            glVertex3f (r0 * Cos (angle),
                        r0 * Sin (angle),
                        -width * 0.5);
         end if;
      end loop;
      glEnd;

      --  draw back sides of teeth
      glBegin (GL_QUADS);
      da := 2.0 * Pi / GLfloat (teeth) /4.0;
      for i in GLint range 0 .. teeth - 1 loop
         angle := GLfloat (i) * 2.0 * Pi / GLfloat (teeth);

         glVertex3f (r1 * Cos (angle + 3.0 * da),
                     r1 * Sin (angle + 3.0 * da),
                     -width * 0.5);
         glVertex3f (r2 * Cos (angle + 2.0 * da),
                     r2 * Sin (angle + 2.0 * da),
                     -width * 0.5);
         glVertex3f (r2 * Cos (angle + da),
                     r2 * Sin (angle + da),
                     -width * 0.5);
         glVertex3f (r1 * Cos (angle),
                     r1 * Sin (angle),
                     -width * 0.5);

      end loop;
      glEnd;

      --  draw outward face of teeth
      glBegin (GL_QUAD_STRIP);
      for i in GLint range 0 .. teeth - 1 loop
         angle := GLfloat (i) * 2.0 * Pi / GLfloat (teeth);

         glVertex3f (r1 * Cos (angle), r1 * Sin (angle), width * 0.5);
         glVertex3f (r1 * Cos (angle), r1 * Sin (angle), -width * 0.5);
         u := r2 * Cos (angle + da) - r1 * Cos (angle);
         v := r2 * Sin (angle + da) - r1 * Sin (angle);
         len := Sqrt (u**2 + v**2);
         u := u / len;
         v := v / len;

         glNormal3f (v, -u, 0.0);
         glVertex3f (r2 * Cos (angle + da), r2 * Sin (angle + da), width * 0.5);
         glVertex3f (r2 * Cos (angle + da), r2 * Sin (angle + da), -width * 0.5);
         glNormal3f (Cos (angle), Sin (angle), 0.0);
         glVertex3f (r2 * Cos (angle + 2.0 * da),
                     r2 * Sin (angle + 2.0 * da),
                     width * 0.5);
         glVertex3f (r2 * Cos (angle + 2.0 * da),
                     r2 * Sin (angle + 2.0 * da),
                     -width * 0.5);
         u := r1 * Cos (angle + 3.0 * da) - r2 * Cos (angle + 2.0 * da);
         v := r1 * Sin (angle + 3.0 * da) - r2 * Sin (angle + 2.0 * da);
         glNormal3f (v, -u, 0.0);
         glVertex3f (r1 * Cos (angle + 3.0 * da),
                     r1 * Sin (angle + 3.0 * da),
                     width * 0.5);
         glVertex3f (r1 * Cos (angle + 3.0 * da),
                     r1 * Sin (angle + 3.0 * da),
                     -width * 0.5);
         glNormal3f (Cos (angle), Sin (angle), 0.0);
      end loop;

      glVertex3f (r1 * Cos (0.0), r1 * Sin (0.0), width * 0.5);
      glVertex3f (r1 * Cos (0.0), r1 * Sin (0.0), -width * 0.5);

      glEnd;

      glShadeModel (GL_SMOOTH);

      --  draw inside radius cylinder
      glBegin (GL_QUAD_STRIP);
      for i in GLint range 0 .. teeth loop
         angle := GLfloat (i) * 2.0 * Pi / GLfloat (teeth);
         glNormal3f (-Cos (angle), -Sin (angle), 0.0);
         glVertex3f (r0 * Cos (angle), r0 * Sin (angle), -width * 0.5);
         glVertex3f (r0 * Cos (angle), r0 * Sin (angle), width * 0.5);
      end loop;

      glEnd;

   end gear;

   --  ===================================================================

   view_rotx : GLfloat := 20.0;
   view_roty : GLfloat := 30.0;
   view_rotz : GLfloat :=  0.0;
   gear1, gear2, gear3 : GLuint;
   angle : GLfloat := 0.0;

   --  ===================================================================
   procedure draw is
   begin
      glClear (GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);

      glPushMatrix;
      glRotatef (view_rotx, 1.0, 0.0, 0.0);
      glRotatef (view_roty, 0.0, 1.0, 0.0);
      glRotatef (view_rotz, 0.0, 0.0, 1.0);

      glPushMatrix;
      glTranslatef (-3.0, -2.0, 0.0);
      glRotatef (angle, 0.0, 0.0, 1.0);
      glCallList (gear1);
      glPopMatrix;

      glPushMatrix;
      glTranslatef (3.1, -2.0, 0.0);
      glRotatef (-2.0 * angle - 9.0, 0.0, 0.0, 1.0);
      glCallList (gear2);
      glPopMatrix;

      glPushMatrix;
      glTranslatef (-3.1, 4.2, 0.0);
      glRotatef (-2.0 * angle - 25.0, 0.0, 0.0, 1.0);
      glCallList (gear3);
      glPopMatrix;

      glPopMatrix;

      Vd.GL_SwapBuffers;

      Frames := Frames + 1;

      declare
         t : GLint := GLint (Tm.GetTicks);
      begin
         if t - T0 >= 5000 then
            declare
               seconds : GLfloat := GLfloat (t - T0) / 1000.0;
               fps : GLfloat := GLfloat (Frames) / seconds;
               package GLfloat_IO is new Ada.Text_IO.Float_IO (GLfloat);
               use GLfloat_IO;
            begin
               Put (GLint'Image (Frames) & " frames in ");
               Put (seconds, 4, 2, 0); Put (" seconds = ");
               Put (fps, 4, 2, 0); Put_Line (" FPS");
               T0 := t;
               Frames := 0;
            end;
         end if;
      end; --  declare
   end draw;

   --  ===================================================================
   procedure idle is
   begin
      angle := angle + 2.0;
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
   procedure init (info : Boolean) is
      pos   : Four_GLfloat_Vector := (5.0, 5.0, 10.0, 0.0);
      red   : Four_GLfloat_Vector := (0.8, 0.1, 0.0, 1.0);
      green : Four_GLfloat_Vector := (0.0, 0.8, 0.2, 1.0);
      blue  : Four_GLfloat_Vector := (0.2, 0.2, 1.0, 1.0);
   begin
      glLightfv (GL_LIGHT0, GL_POSITION, pos);
      glEnable (GL_CULL_FACE);
      glEnable (GL_LIGHTING);
      glEnable (GL_LIGHT0);
      glEnable (GL_DEPTH_TEST);

      --  make the gears
      gear1 := glGenLists (1);
      glNewList (gear1, GL_COMPILE);
      glMaterialfv (GL_FRONT, GL_AMBIENT_AND_DIFFUSE, red);
      gear (1.0, 4.0, 1.0, 20, 0.7);
      glEndList;

      gear2 := glGenLists (1);
      glNewList (gear2, GL_COMPILE);
      glMaterialfv (GL_FRONT, GL_AMBIENT_AND_DIFFUSE, green);
      gear (0.5, 2.0, 2.0, 10, 0.7);
      glEndList;

      gear3 := glGenLists (1);
      glNewList (gear3, GL_COMPILE);
      glMaterialfv (GL_FRONT, GL_AMBIENT_AND_DIFFUSE, blue);
      gear (1.3, 2.0, 0.5, 10, 0.7);
      glEndList;

      glEnable (GL_NORMALIZE);

      if info then
         Put_Line ("GL_RENDER     = " & glGetString (GL_RENDER));
         Put_Line ("GL_VERSION    = " & glGetString (GL_VERSION));
         Put_Line ("GL_VENDOR     = " & glGetString (GL_VENDOR));
         Put_Line ("GL_EXTENSIONS = " & glGetString (GL_EXTENSIONS));
      end if;
   end init;


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
   Info        : Boolean := False;
   Full_Screen : Boolean := True;
   Sound       : Boolean := True;
   argc        : Integer := CL.Argument_Count;
   Video_Flags : Vd.Surface_Flags := 0;
   Initialization_Flags : SDL.Init_Flags := 0;

   --  ===================================================================
   procedure Manage_Command_Line is
   begin
      while argc > 0 loop
         if CL.Argument (argc) = "-slow" then
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
         elsif CL.Argument (argc) = "-info" then
            Info := True;
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
   Gears_Working_Wave : Mix.Chunk_ptr := Mix.null_Chunk_ptr;
   System_Rotation_Wave : Mix.Chunk_ptr := Mix.null_Chunk_ptr;

   --  ===================================================================
   procedure Initialize_Sound is
   begin
      if Sound then
         if Mix.OpenAudio (22050, Au.AUDIO_S16, 2, 4096) < 0 then
            Put_Line ("Couldn't open audio " & Mix.Get_Error);
            GNAT.OS_Lib.OS_Exit (2);
         end if;

         Load_Sound (Gears_Working_Wave, "gears_working.wav");
         Mix.PlayChannel (0, Gears_Working_Wave, -1);

         Load_Sound (System_Rotation_Wave, "system_rotation.wav");
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

            if Kb.Is_Key_Pressed (keys, Ks.K_UP) then
               view_rotx := view_rotx + 5.0;
               Mix.PlayChannel (-1, System_Rotation_Wave, 0);
            end if;

            if Kb.Is_Key_Pressed (keys, Ks.K_DOWN) then
               view_rotx := view_rotx - 5.0;
               Mix.PlayChannel (-1, System_Rotation_Wave, 0);
            end if;

            if Kb.Is_Key_Pressed (keys, Ks.K_LEFT) then
               view_roty := view_roty + 5.0;
               Mix.PlayChannel (-1, System_Rotation_Wave, 0);
            end if;

            if Kb.Is_Key_Pressed (keys, Ks.K_RIGHT) then
               view_roty := view_roty - 5.0;
               Mix.PlayChannel (-1, System_Rotation_Wave, 0);
            end if;

            if Kb.Is_Key_Pressed (keys, Ks.K_z) then
               if (Kb.GetModState and Ks.KMOD_SHIFT) /= 0 then
                  view_rotz := view_rotz - 5.0;
                  Mix.PlayChannel (-1, System_Rotation_Wave, 0);
               else
                  view_rotz := view_rotz + 5.0;
                  Mix.PlayChannel (-1, System_Rotation_Wave, 0);
               end if;
            end if;

            --  Allow the user what's happening
            if Slowly then
               Tm.SDL_Delay (23);
            end if;
            draw;
         end; -- declare
      end loop;
   end Main_System_Loop;

   --  ===================================================================
   --                         Gears Procedure body
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

   Vd.WM_Set_Caption ("Gears", "gears");

   Initialize_Sound;

   init (Info);

   reshape (screen.w, screen.h);
   done := False;

   Main_System_Loop;

   if Sound then
      Stop_Sound (Gears_Working_Wave);

      Mix.CloseAudio;
   end if; -- Sound

   SDL.SDL_Quit;
end gears;
