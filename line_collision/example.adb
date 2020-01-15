---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
--with Ada.Real_Time;
with Interfaces.C;
with Unchecked_Conversion;
with Text_Io; use Text_Io;
with GL;
with GLU;
with GL.EXT;
with Ada.Strings.Maps;
with Ada.Strings.Fixed;
with System;
with Geometrical_Methods;
with GLUtils;

use type GL.GLbitfield;
use type GL.EXT.glLockArraysEXTPtr;
use type GL.EXT.glUnlockArraysEXTPtr;

package body Example is

  package GM renames Geometrical_Methods;
  
  procedure PrintGLInfo is
  
  begin
  
    Put_Line("GL Vendor     => " & GLUtils.GL_Vendor);
    Put_Line("GL Version    => " & GLUtils.GL_Version);
    Put_Line("GL Renderer   => " & GLUtils.GL_Renderer);
    Put_Line("GL Extensions => " & GLUtils.GL_Extensions);
    New_Line;

    Put_Line("GLU Version    => " & GLUtils.GLU_Version);
    Put_Line("GLU Extensions => " & GLUtils.GLU_Extensions);
    New_Line;
    
  end PrintGLInfo;
  
  
  procedure PrintUsage is
  
  begin
  
    Put_Line("Keys");
    Put_Line("Cursor keys         => Rotate");
    Put_Line("Page Down/Up        => Zoom in/out");
    Put_Line("F1                  => Toggle Fullscreen");
    Put_Line("Escape              => Quit");
    Put_Line("N & M/N & M + Shift => Move Dot in X");
    Put_Line("O & K/O & K + Shift => Move Dot in Y");
    Put_Line("D/D + Shift         => Move Plane");
    Put_Line("R                   => Reset");

  end PrintUsage;


  procedure CalculateFPS is
  
    CurrentTime         : Float := Float(SDL.Timer.GetTicks) / 1000.0;
    ElapsedTime         : Float := CurrentTime - LastElapsedTime;
    FramesPerSecond     : String(1 .. 10);
    MillisecondPerFrame : String(1 .. 10);
    
    package Float_InOut is new Text_IO.Float_IO(Float);
    use Float_InOut;

  begin
  
    FrameCount := FrameCount + 1;
    
    if ElapsedTime > 1.0 then
    
      FPS := Float(FrameCount) / ElapsedTime;
    
      Put(FramesPerSecond, FPS, Aft => 2, Exp => 0);
      Put(MillisecondPerFrame, 1000.0 / FPS, Aft => 2, Exp => 0);

      SDL.Video.WM_Set_Caption_Title(Example.GetTitle & "  " & FramesPerSecond & " fps  " & MillisecondPerFrame & " ms/frame");
      
      LastElapsedTime := CurrentTime;
      FrameCount      := 0;
      
    end if;
    
  end CalculateFPS;
  

  function Initialise return Boolean is

  begin

    GL.glClearColor(0.0, 0.0, 0.0, 0.0);                        -- Black Background.
    GL.glClearDepth(1.0);                                       -- Depth Buffer Setup.
    GL.glDepthFunc(GL.GL_LEQUAL);                               -- The Type Of Depth Testing (Less Or Equal).
    GL.glEnable(GL.GL_DEPTH_TEST);                              -- Enable Depth Testing.
    GL.glShadeModel(GL.GL_SMOOTH);                              -- Select Smooth Shading.
    GL.glHint(GL.GL_PERSPECTIVE_CORRECTION_HINT, GL.GL_NICEST); -- Set Perspective Calculations To Most Accurate.
--    GL.glFrontFace(GL.GL_CCW);
--    GL.glCullFace(GL.GL_NONE);
--    GL.glEnable(GL.GL_CULL_FACE);

    return True;

  end Initialise;


  procedure Uninitialise is

  begin

    null;

  end Uninitialise;


--  procedure Update(Ticks : in Integer) is
  procedure Update is

    Result : Interfaces.C.int;

  begin

    -- Check the modifiers  
    if Keys(SDL.Keysym.K_LSHIFT) = True or Keys(SDL.Keysym.K_RSHIFT) = True then
    
      ShiftPressed := True;

    else
    
      ShiftPressed := False;
      
    end if;
    
    if Keys(SDL.Keysym.K_LCTRL) = True or Keys(SDL.Keysym.K_RCTRL) = True then
    
      CtrlPressed := True;

    else
    
      CtrlPressed := False;
      
    end if;
    
    if Keys(SDL.Keysym.K_F1) = True then

      Result := SDL.Video.WM_ToggleFullScreen(ScreenSurface);

    end if;

    -- Move the camera.
    if Keys(SDL.Keysym.K_LEFT) = True then

      CameraYSpeed := CameraYSpeed - 0.1;

    end if;

    if Keys(SDL.Keysym.K_RIGHT) = True then

      CameraYSpeed := CameraYSpeed + 0.1;

    end if;
      
    if Keys(SDL.Keysym.K_UP) = True then

      CameraXSpeed := CameraXSpeed - 0.1;

    end if;

    if Keys(SDL.Keysym.K_DOWN) = True then

      CameraXSpeed := CameraXSpeed + 0.1;

    end if;

    if Keys(SDL.Keysym.K_PAGEUP) = True then

      Zoom := Zoom + 0.1;

    end if;

    if Keys(SDL.Keysym.K_PAGEDOWN) = True then

      Zoom := Zoom - 0.1;

    end if;

    if Keys(SDL.Keysym.K_ESCAPE) = True then

      AppQuit := True;

    end if;

    if Keys(SDL.Keysym.K_R) = True then

      TestLine.StartPoint := Vector3.Object'(-1.0, 0.0, 0.0);
      TestLine.EndPoint   := Vector3.Object'(1.0, 0.0, 0.0);
      TestPlane.Distance  := 0.0;

    end if;

    -- Move the dot.
    if Keys(SDL.Keysym.K_N) = True and NPressed = False then
    
      NPressed := True;
      
      if ShiftPressed = True then
      
        TestLine.StartPoint.X := TestLine.StartPoint.X - LineSmallDelta;
        TestLine.EndPoint.X   := TestLine.EndPoint.X - LineSmallDelta;
          
      else
        
        TestLine.StartPoint.X := TestLine.StartPoint.X - LineDelta;
        TestLine.EndPoint.X   := TestLine.EndPoint.X - LineDelta;
        
      end if;

    end if;

    if Keys(SDL.Keysym.K_N) = False then

      NPressed := False;
    
    end if;
    
    if Keys(SDL.Keysym.K_M) = True and MPressed = False then

      MPressed := True;
    
      if ShiftPressed = True then
      
        TestLine.StartPoint.X := TestLine.StartPoint.X + LineSmallDelta;
        TestLine.EndPoint.X   := TestLine.EndPoint.X + LineSmallDelta;
          
      else
        
        TestLine.StartPoint.X := TestLine.StartPoint.X + LineDelta;
        TestLine.EndPoint.X   := TestLine.EndPoint.X + LineDelta;
      
      end if;
      
    end if;

    if Keys(SDL.Keysym.K_M) = False then
    
      MPressed := False;
      
    end if;
    
    if Keys(SDL.Keysym.K_O) = True and OPressed = False then
    
      OPressed := True;
      
      if ShiftPressed = True then
      
        TestLine.StartPoint.Y := TestLine.StartPoint.Y + LineSmallDelta;
        TestLine.EndPoint.Y   := TestLine.EndPoint.Y + LineSmallDelta;
          
      else
        
        TestLine.StartPoint.Y := TestLine.StartPoint.Y + LineDelta;
        TestLine.EndPoint.Y   := TestLine.EndPoint.Y + LineDelta;
        
      end if;

    end if;

    if Keys(SDL.Keysym.K_O) = False then

      OPressed := False;
    
    end if;
    
    if Keys(SDL.Keysym.K_K) = True and KPressed = False then

      KPressed := True;
    
      if ShiftPressed = True then
      
        TestLine.StartPoint.Y := TestLine.StartPoint.Y - LineSmallDelta;
        TestLine.EndPoint.Y   := TestLine.EndPoint.Y - LineSmallDelta;
          
      else
        
        TestLine.StartPoint.Y := TestLine.StartPoint.Y - LineDelta;
        TestLine.EndPoint.Y   := TestLine.EndPoint.Y - LineDelta;
      
      end if;
      
    end if;

    if Keys(SDL.Keysym.K_K) = False then
    
      KPressed := False;
      
    end if;

    -- Move the plane along the normal (Distance).
    if Keys(SDL.Keysym.K_D) = True and DPressed = False then

      DPressed := True;
    
      if ShiftPressed = True then
      
        TestPlane.Distance := TestPlane.Distance - 0.5;
          
      else
        
        TestPlane.Distance := TestPlane.Distance + 0.5;
      
      end if;
      
    end if;

    if Keys(SDL.Keysym.K_D) = False then
    
      DPressed := False;
      
    end if;

  end Update;


  procedure Draw is
  
    Collision : Boolean := False;

  begin

    GL.glClear(GL.GL_COLOR_BUFFER_BIT or GL.GL_DEPTH_BUFFER_BIT); -- Clear Screen And Depth Buffer.
    GL.glLoadIdentity;                                            -- Reset The Modelview Matrix.

    -- Move the camera aound the scene.
    GL.glTranslatef(0.0, 0.0, Zoom);
    GL.glRotatef(CameraXSpeed, 1.0, 0.0, 0.0); -- Rotate On The Y-Axis By angle.
    GL.glRotatef(CameraYSpeed, 0.0, 1.0, 0.0); -- Rotate On The Y-Axis By angle.

    Collision := GM.CollisionDetected(TestPlane, TestLine);
    
    -- Draw plane.
    GL.glBegin(GL.GL_QUADS);

      if Collision = True then
      
        GL.glColor3f(1.0, 0.0, 0.0);
      
      else

        GL.glColor3f(0.0, 0.2, 0.5);

      end if;
      --GL.glColor3f(0.0, 0.2, 0.5);
      
      GL.glVertex3f(GL.GLfloat(TestPlane.Distance), -1.0, -1.0);
      GL.glVertex3f(GL.GLfloat(TestPlane.Distance),  1.0, -1.0);
      GL.glVertex3f(GL.GLfloat(TestPlane.Distance),  1.0,  1.0);
      GL.glVertex3f(GL.GLfloat(TestPlane.Distance), -1.0,  1.0);

      GL.glNormal3f(GL.GLfloat(TestPlane.Normal.X), GL.GLfloat(TestPlane.Normal.Y), GL.GLfloat(TestPlane.Normal.Z));
      
    gl.glEnd;
    
    GL.glBegin(GL.GL_LINES);
    
      if Collision = True then
      
        GL.glColor3f(1.0, 1.0, 0.0);
      
      else

        GL.glColor3f(1.0, 1.0, 1.0);

      end if;
      
      GL.glVertex3f(GL.GLfloat(TestLine.StartPoint.X), GL.GLfloat(TestLine.StartPoint.Y), GL.GLfloat(TestLine.StartPoint.Z));
      GL.glVertex3f(GL.GLfloat(TestLine.EndPoint.X), GL.GLfloat(TestLine.EndPoint.Y), GL.GLfloat(TestLine.EndPoint.Z));
    GL.glEnd;
    
    GL.glFlush; -- Flush The GL Rendering Pipeline.
    
--    Text_IO.Put_Line("Dot: " & Vector3.Output(Dot));

  end Draw;


  function GetTitle return String is

  begin

    return Title;

  end GetTitle;


  function GetWidth return Integer is

  begin

    return Width;

  end GetWidth;


  function GetHeight return Integer is

  begin

    return Height;

  end GetHeight;


  function GetBitsPerPixel return Integer is

  begin

    return BitsPerPixel;

  end GetBitsPerPixel;


  procedure SetLastTickCount(Ticks : in Integer) is

  begin

    LastTickCount := Ticks;

  end SetLastTickCount;


  procedure SetSurface(Surface : in SDL.Video.Surface_Ptr) is

  begin

    ScreenSurface := Surface;

  end SetSurface;


  function GetSurface return SDL.Video.Surface_Ptr is

  begin

    return ScreenSurface;

  end GetSurface;


  procedure SetKey(Key : in SDL.Keysym.Key; Down : in Boolean) is

  begin

    Keys(Key) := Down;

  end SetKey;


  procedure SetActive(Active : in Boolean) is

  begin

    AppActive := Active;

  end SetActive;


  function IsActive return Boolean is

  begin

    return AppActive;

  end IsActive;


  procedure SetQuit(Quit : in Boolean) is

  begin

    AppQuit := Quit;

  end SetQuit;


  function Quit return Boolean is

  begin

    return AppQuit;

  end Quit;

end Example;
