---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
with Ada.Numerics;
with Interfaces.C; use Interfaces.C;
with Unchecked_Conversion;
with Text_Io; use Text_Io;
with GL;
with GLU;
with GLUtils;
with Matrix4x4;

package body Example is

  subtype ColourRange is Integer range 1 .. 4;
  subtype VectorRange is Integer range 1 .. 4;

  type ColourArray is array(ColourRange) of aliased GL.GLfloat;
  type VectorArray is array(VectorRange) of aliased GL.GLfloat;

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
    Put_Line("Cursor keys          => Rotate cube/move camera");
    Put_Line("Page Down/Up         => Zoom in/out");
    Put_Line("Shift + Page Up/Down => Look up/down");
    Put_Line("F1                   => Toggle Fullscreen");
    Put_Line("F4                   => Select Left Cube for rotation");
    Put_Line("F5                   => Select Right Cube for rotation");
    Put_Line("C                    => Select Camera for movement");
    Put_Line("L                    => Toggle Lighting");
    Put_Line("S                    => Select Smooth/Flat Shading");
    Put_Line("Escape               => Quit");

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

    LightAmbient  : ColourArray := (0.5, 0.5, 0.5, 1.0);
    LightDiffuse  : ColourArray := (1.0, 1.0, 1.0, 1.0);
    LightPosition : VectorArray := (0.0, 2.0, 4.0, 1.0);

  begin

    GL.glClearColor(0.0, 0.0, 0.0, 0.0);                        -- Black Background.
    GL.glClearDepth(1.0);                                       -- Depth Buffer Setup.
    GL.glDepthFunc(GL.GL_LEQUAL);                               -- The Type Of Depth Testing (Less Or Equal).
    GL.glEnable(GL.GL_DEPTH_TEST);                              -- Enable Depth Testing.
    GL.glShadeModel(GL.GL_SMOOTH);                              -- Select Smooth Shading.
    GL.glHint(GL.GL_PERSPECTIVE_CORRECTION_HINT, GL.GL_NICEST); -- Set Perspective Calculations To Most Accurate.

    -- Start of user initialisation.
    GL.glLightfv(GL.GL_LIGHT1, GL.GL_AMBIENT, LightAmbient(LightAmbient'First)'Unchecked_Access);
    GL.glLightfv(GL.GL_LIGHT1, GL.GL_DIFFUSE, LightDiffuse(LightDiffuse'First)'Unchecked_Access);
    GL.glLightfv(GL.GL_LIGHT1, GL.GL_POSITION, LightPosition(LightPosition'First)'Unchecked_Access);
    GL.glEnable(GL.GL_LIGHT1);

    if LightingOn = True then

      GL.glEnable(GL.GL_LIGHTING);

    else

      GL.glDisable(GL.GL_LIGHTING);

    end if;

    return True;

  end Initialise;


  procedure Uninitialise is

  begin

    null;

  end Uninitialise;


  procedure Update(Ticks : in Integer) is

    Result       : Interfaces.C.int;
    ShiftPressed : Boolean := False;

  begin

    -- Handle the modifiers.
    if Keys(SDL.Keysym.K_LSHIFT) = True or Keys(SDL.Keysym.K_RSHIFT) = True then
    
      ShiftPressed := True;
      
    end if;

    -- Now handle the other keys.
    if Keys(SDL.Keysym.K_F1) = True then

      Result := SDL.Video.WM_ToggleFullScreen(ScreenSurface);

    end if;

    if Keys(SDL.Keysym.K_LEFT) = True then

      if CameraMoving = True then

        ViewCamera.Eye.X := ViewCamera.Eye.X - 0.1;

      else

        YSpeed(Cube) := YSpeed(Cube) - 0.1;

      end if;

    end if;

    if Keys(SDL.Keysym.K_RIGHT) = True then

      if CameraMoving = True then

        ViewCamera.Eye.X := ViewCamera.Eye.X + 0.1;

      else

        YSpeed(Cube) := YSpeed(Cube) + 0.1;

      end if;

    end if;

    if Keys(SDL.Keysym.K_UP) = True then

      if CameraMoving = True then

        ViewCamera.Eye.Y := ViewCamera.Eye.Y - 0.1;

      else

        XSpeed(Cube) := XSpeed(Cube) - 0.1;

      end if;

    end if;

    if Keys(SDL.Keysym.K_DOWN) = True then

      if CameraMoving = True then

        ViewCamera.Eye.Y := ViewCamera.Eye.Y + 0.1;

      else

        XSpeed(Cube) := XSpeed(Cube) + 0.1;

      end if;

    end if;

    if Keys(SDL.Keysym.K_PAGEUP) = True then

      if ShiftPressed = True then
      
        ViewCamera.Centre.Y := ViewCamera.Centre.Y + 0.01;
        
      else
      
        ViewCamera.Eye.Z := ViewCamera.Eye.Z + 0.1;
      
      end if;

    end if;

    if Keys(SDL.Keysym.K_PAGEDOWN) = True then

      if ShiftPressed = True then
      
        ViewCamera.Centre.Y := ViewCamera.Centre.Y - 0.01;
        
      else
      
        ViewCamera.Eye.Z := ViewCamera.Eye.Z - 0.1;
      
      end if;

    end if;

    if Keys(SDL.Keysym.K_ESCAPE) = True then

      AppQuit := True;

    end if;

    if Keys(SDL.Keysym.K_l) = True and PressedL = False then

      PressedL   := True;
      LightingOn := LightingOn xor True;

      if LightingOn = True then

        GL.glEnable(GL.GL_LIGHTING);

      else

        GL.glDisable(GL.GL_LIGHTING);

      end if;

    end if;

    if Keys(SDL.Keysym.K_l) = False then

      PressedL := False;

    end if;

    if Keys(SDL.Keysym.K_s) = True and PressedS = False then

      PressedS        := True;
      SmoothShadingOn := SmoothShadingOn xor True;

      if SmoothShadingOn = True then

        GL.glShadeModel(GL.GL_SMOOTH);

      else

        GL.glShadeModel(GL.GL_FLAT);

      end if;

    end if;

    if Keys(SDL.Keysym.K_s) = False then

      PressedS := False;

    end if;

    if Keys(SDL.Keysym.K_F4) = True and CameraMoving = False then

      Cube := LEFT;

    end if;

    if Keys(SDL.Keysym.K_F5) = True and CameraMoving = False then

      Cube := RIGHT;

    end if;

    if Keys(SDL.Keysym.K_c) = True and PressedC = False then

      PressedC     := True;
      CameraMoving := CameraMoving xor True;

    end if;

    if Keys(SDL.Keysym.K_c) = False then

      PressedC := False;

    end if;

  end Update;


  procedure Draw is

    ViewCameraInverse : Matrix4x4.Object         := Camera.GetMatrix(ViewCamera);
    FloorAmbient      : ColourArray              := (0.0, 0.0, 0.5, 1.0);
    LeftCubeAmbient   : ColourArray              := (0.5, 0.0, 0.5, 1.0);
    RightcubeAmbient  : ColourArray              := (0.0, 0.5, 0.5, 1.0);

    function Matrix4x4_To_GLfloat is new Unchecked_Conversion(Source => Matrix4x4.View, Target => GL.GLfloatPtr);

  begin

    GL.glClear(GL.GL_COLOR_BUFFER_BIT or GL.GL_DEPTH_BUFFER_BIT); -- Clear Screen And Depth Buffer.
--    GL.glLoadIdentity;                                            -- Reset The Modelview Matrix.

    -- Move the camera aound the scene.
    Camera.Set(ViewCamera);

--    Matrix4x4.Inverse(ViewCameraInverse);

    -- Floor.
    declare
    
      FloorRotation  : Matrix3x3.Object         := Matrix3x3.Identity;
      FloorTransform : Matrix4x4.Object         := Matrix4x4.Identity;
      FloorTM        : aliased Matrix4x4.Object := Matrix4x4.Identity;

    begin
    
      -- Construct the floor's matrix.
      Matrix3x3.Scale(FloorRotation, 4.0, 1.0, 4.0);
      
      FloorTransform := Matrix4x4.Compose(FloorRotation, Vector3.Object'(0.0, -1.0, 0.0));
      FloorTM        := FloorTransform * ViewCameraInverse;
    
      GL.glLoadMatrixf(Matrix4x4_To_GLfloat(FloorTM'Unchecked_Access));
      
    end;

    GL.glMaterialfv(GL.GL_FRONT, GL.GL_AMBIENT, FloorAmbient(FloorAmbient'First)'Unchecked_Access);

    GL.glBegin(GL.GL_QUADS);
    GL.glNormal3f(GL.GLFloat'( 0.0),  1.0,  0.0);
    GL.glVertex3f(GL.GLFloat'(-1.0), -1.0, -1.0);
    GL.glVertex3f(GL.GLFloat'( 1.0), -1.0, -1.0);
    GL.glVertex3f(GL.GLFloat'( 1.0), -1.0,  1.0);
    GL.glVertex3f(GL.GLFloat'(-1.0), -1.0,  1.0);
    GL.glEnd;

    -- Left cube.
    declare
    
      LeftCubeRotX      : Matrix3x3.Object         := Matrix3x3.Identity;
      LeftCubeRotY      : Matrix3x3.Object         := Matrix3x3.Identity;
      LeftCubeRotTM     : Matrix3x3.Object         := Matrix3x3.Identity;
      LeftCubeTransform : Matrix4x4.Object         := Matrix4x4.Identity;
      LeftCubeTM        : aliased Matrix4x4.Object := Matrix4x4.Identity;

    begin
    
      -- Construct the left cube's matrix.
      Matrix3x3.FromAngleAxis(LeftCubeRotX, Float(XSpeed(LEFT)) * (Ada.Numerics.PI / 180.0), Vector3.Object'(1.0, 0.0, 0.0));
      Matrix3x3.FromAngleAxis(LeftCubeRotY, Float(YSpeed(LEFT)) * (Ada.Numerics.PI / 180.0), Vector3.Object'(0.0, 1.0, 0.0));
      
      LeftCubeRotTM     := LeftCubeRotX * LeftCubeRotY;
      LeftCubeTransform := Matrix4x4.Compose(LeftCubeRotTM, Vector3.Object'(-1.5, 0.0, 0.0));
      LeftCubeTM        := LeftCubeTransform * ViewCameraInverse;
    
      GL.glLoadMatrixf(Matrix4x4_To_GLfloat(LeftCubeTM'Unchecked_Access));
      
    end;
    
    GL.glMaterialfv(GL.GL_FRONT, GL.GL_AMBIENT, LeftCubeAmbient(LeftCubeAmbient'First)'Unchecked_Access);

    GL.glBegin(GL.GL_QUADS);
      -- Front.
      GL.glNormal3f(GL.GLFloat'( 0.0),  0.0, 1.0);
      GL.glVertex3f(GL.GLFloat'(-1.0), -1.0, 1.0);
      GL.glVertex3f(GL.GLFloat'(-1.0),  1.0, 1.0);
      GL.glVertex3f(GL.GLFloat'( 1.0),  1.0, 1.0);
      GL.glVertex3f(GL.GLFloat'( 1.0), -1.0, 1.0);

      -- Back.
      GL.glNormal3f(GL.GLFloat'( 0.0),  0.0, -1.0);
      GL.glVertex3f(GL.GLFloat'(-1.0), -1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'(-1.0),  1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'( 1.0),  1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'( 1.0), -1.0, -1.0);

      -- Left.
      GL.glNormal3f(GL.GLFloat'(-1.0),  0.0,  0.0);
      GL.glVertex3f(GL.GLFloat'(-1.0), -1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'(-1.0),  1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'(-1.0),  1.0,  1.0);
      GL.glVertex3f(GL.GLFloat'(-1.0), -1.0,  1.0);

      -- Right.
      GL.glNormal3f(GL.GLFloat'(1.0),  0.0,  0.0);
      GL.glVertex3f(GL.GLFloat'(1.0), -1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'(1.0),  1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'(1.0),  1.0,  1.0);
      GL.glVertex3f(GL.GLFloat'(1.0), -1.0,  1.0);

      -- Top.
      GL.glNormal3f(GL.GLFloat'( 0.0), 1.0,  0.0);
      GL.glVertex3f(GL.GLFloat'(-1.0), 1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'( 1.0), 1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'( 1.0), 1.0,  1.0);
      GL.glVertex3f(GL.GLFloat'(-1.0), 1.0,  1.0);

      -- Bottom.
      GL.glNormal3f(GL.GLFloat'( 0.0), -1.0,  0.0);
      GL.glVertex3f(GL.GLFloat'(-1.0), -1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'( 1.0), -1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'( 1.0), -1.0,  1.0);
      GL.glVertex3f(GL.GLFloat'(-1.0), -1.0,  1.0);
    GL.glEnd;

    -- Right cube.
    declare
    
      RightCubeRotX      : Matrix3x3.Object         := Matrix3x3.Identity;
      RightCubeRotY      : Matrix3x3.Object         := Matrix3x3.Identity;
      RightCubeRotTM     : Matrix3x3.Object         := Matrix3x3.Identity;
      RightCubeTransform : Matrix4x4.Object         := Matrix4x4.Identity;
      RightCubeTM        : aliased Matrix4x4.Object := Matrix4x4.Identity;

    begin
    
      -- Construct the right cube's matrix.
      Matrix3x3.FromAngleAxis(RightCubeRotX, Float(XSpeed(RIGHT)) * (Ada.Numerics.PI / 180.0), Vector3.Object'(1.0, 0.0, 0.0));
      Matrix3x3.FromAngleAxis(RightCubeRotY, Float(YSpeed(RIGHT)) * (Ada.Numerics.PI / 180.0), Vector3.Object'(0.0, 1.0, 0.0));
      
      RightCubeRotTM     := RightCubeRotX * RightCubeRotY;
      RightCubeTransform := Matrix4x4.Compose(RightCubeRotTM, Vector3.Object'(1.5, 0.0, 0.0));
      RightCubeTM        := RightCubeTransform * ViewCameraInverse;
    
      GL.glLoadMatrixf(Matrix4x4_To_GLfloat(RightCubeTM'Unchecked_Access));
      
    end;

    GL.glMaterialfv(GL.GL_FRONT, GL.GL_AMBIENT, RightCubeAmbient(RightCubeAmbient'First)'Unchecked_Access);

    GL.glBegin(GL.GL_QUADS);
      -- Front.
      GL.glNormal3f(GL.GLFloat'( 0.0),  0.0, 1.0);
      GL.glVertex3f(GL.GLFloat'(-1.0), -1.0, 1.0);
      GL.glVertex3f(GL.GLFloat'(-1.0),  1.0, 1.0);
      GL.glVertex3f(GL.GLFloat'( 1.0),  1.0, 1.0);
      GL.glVertex3f(GL.GLFloat'( 1.0), -1.0, 1.0);

      -- Back.
      GL.glNormal3f(GL.GLFloat'( 0.0),  0.0, -1.0);
      GL.glVertex3f(GL.GLFloat'(-1.0), -1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'(-1.0),  1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'( 1.0),  1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'( 1.0), -1.0, -1.0);

      -- Left.
      GL.glNormal3f(GL.GLFloat'(-1.0),  0.0,  0.0);
      GL.glVertex3f(GL.GLFloat'(-1.0), -1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'(-1.0),  1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'(-1.0),  1.0,  1.0);
      GL.glVertex3f(GL.GLFloat'(-1.0), -1.0,  1.0);

      -- Right.
      GL.glNormal3f(GL.GLFloat'(1.0),  0.0,  0.0);
      GL.glVertex3f(GL.GLFloat'(1.0), -1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'(1.0),  1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'(1.0),  1.0,  1.0);
      GL.glVertex3f(GL.GLFloat'(1.0), -1.0,  1.0);

      -- Top.
      GL.glNormal3f(GL.GLFloat'( 0.0), 1.0,  0.0);
      GL.glVertex3f(GL.GLFloat'(-1.0), 1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'( 1.0), 1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'( 1.0), 1.0,  1.0);
      GL.glVertex3f(GL.GLFloat'(-1.0), 1.0,  1.0);

      -- Bottom.
      GL.glNormal3f(GL.GLFloat'( 0.0), -1.0,  0.0);
      GL.glVertex3f(GL.GLFloat'(-1.0), -1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'( 1.0), -1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'( 1.0), -1.0,  1.0);
      GL.glVertex3f(GL.GLFloat'(-1.0), -1.0,  1.0);
    GL.glEnd;

    GL.glFlush; -- Flush The GL Rendering Pipeline.

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
