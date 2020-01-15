---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
with Interfaces.C; use Interfaces.C;
with Unchecked_Conversion;
with Text_Io; use Text_Io;
with GL;
with GLU;
with GLUtils;
with System;

use type GL.GLbitfield;


package body Example is

  package C renames Interfaces.C;

  subtype ColourRange is Integer range 1 .. 4;
  subtype VectorRange is Integer range 1 .. 4;

  type ColourArray is array(ColourRange) of aliased GL.GLfloat;
  type VectorArray is array(VectorRange) of aliased GL.GLfloat;

  function Address_To_GLpointer is new Unchecked_Conversion(Source => System.Address, Target => GL.GLpointer);
  function Address_To_GLuintPtr is new Unchecked_Conversion(Source => System.Address, Target => GL.GLuintPtr);
  
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
    Put_Line("Cursor keys  => Rotate");
    Put_Line("Page Down/Up => Zoom in/out");
    Put_Line("F1           => Toggle Fullscreen");
    Put_Line("L            => Toggle Lighting");
    Put_Line("S            => Select Smooth/Flat Shading");
    Put_Line("Escape       => Quit");

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

    package Integer_InOut is new Integer_Io(Integer);
    use Integer_InOut;

    LightAmbient  : ColourArray := (0.5, 0.5, 0.5, 1.0);
    LightDiffuse  : ColourArray := (1.0, 1.0, 1.0, 1.0);
    LightPosition : VectorArray := (0.0, 2.0, 4.0, 1.0);
 
  begin

    GL.glEnable(GL.GL_TEXTURE_2D);
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

    -- Generate the texture.
    TextureSurface := SDL.Video.LoadBMP("../assets/gradient.bmp");

    if TextureSurface /= null then

    GL.glGenTextures(1, Address_To_GLuintPtr(TextureID'Address));
    GL.glBindTexture(GL.GL_TEXTURE_2D, TextureID);
    GL.glTexImage2D(GL.GL_TEXTURE_2D, 0, GL.GL_RGB, GL.GLsizei(TextureSurface.w), GL.GLsizei(TextureSurface.h), 0, GL.GL_BGR, GL.GL_UNSIGNED_BYTE, Address_To_GLpointer(TextureSurface.Pixels));
    GL.glTexParameteri(GL.GL_TEXTURE_2D, GL.GL_TEXTURE_MIN_FILTER, GL.GL_LINEAR);
    GL.glTexParameteri(GL.GL_TEXTURE_2D, GL.GL_TEXTURE_MAG_FILTER, GL.GL_LINEAR);

    -- TODO: Free the texture surface.
    SDL.Video.FreeSurface(TextureSurface);

  end if;

    -- Create the display list.
    CubeList := GL.glGenLists(1);

    GL.glNewList(CubeList, GL.GL_COMPILE);
    GL.glBegin(GL.GL_QUADS);
      -- Front
      GL.glNormal3f(GL.GLFloat'(0.0),  0.0, 1.0);

      GL.glTexCoord2f(GL.GLFloat'(0.0), 1.0); GL.glVertex3f(GL.GLFloat'(-1.0), -1.0, 1.0);
      GL.glTexCoord2f(GL.GLFloat'(1.0), 1.0); GL.glVertex3f(GL.GLFloat'( 1.0), -1.0, 1.0);
      GL.glTexCoord2f(GL.GLFloat'(1.0), 0.0); GL.glVertex3f(GL.GLFloat'( 1.0),  1.0, 1.0);
      GL.glTexCoord2f(GL.GLFloat'(0.0), 0.0); GL.glVertex3f(GL.GLFloat'(-1.0),  1.0, 1.0);

      -- Back
      GL.glNormal3f(GL.GLFloat'(0.0),  0.0, -1.0);

      GL.glTexCoord2f(GL.GLFloat'(1.0), 1.0); GL.glVertex3f(GL.GLFloat'(-1.0), -1.0, -1.0);
      GL.glTexCoord2f(GL.GLFloat'(0.0), 1.0); GL.glVertex3f(GL.GLFloat'( 1.0), -1.0, -1.0);
      GL.glTexCoord2f(GL.GLFloat'(0.0), 0.0); GL.glVertex3f(GL.GLFloat'( 1.0),  1.0, -1.0);
      GL.glTexCoord2f(GL.GLFloat'(1.0), 0.0); GL.glVertex3f(GL.GLFloat'(-1.0),  1.0, -1.0);

      -- Left
      GL.glNormal3f(GL.GLFloat'(-1.0),  0.0,  0.0);
      GL.glVertex3f(GL.GLFloat'(-1.0), -1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'(-1.0),  1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'(-1.0),  1.0,  1.0);
      GL.glVertex3f(GL.GLFloat'(-1.0), -1.0,  1.0);

      -- Right
      GL.glNormal3f(GL.GLFloat'(1.0),  0.0,  0.0);
      GL.glVertex3f(GL.GLFloat'(1.0), -1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'(1.0),  1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'(1.0),  1.0,  1.0);
      GL.glVertex3f(GL.GLFloat'(1.0), -1.0,  1.0);

      -- Top
      GL.glNormal3f(GL.GLFloat'( 0.0), 1.0,  0.0);
      GL.glVertex3f(GL.GLFloat'(-1.0), 1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'( 1.0), 1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'( 1.0), 1.0,  1.0);
      GL.glVertex3f(GL.GLFloat'(-1.0), 1.0,  1.0);

      -- Bottom
      GL.glNormal3f(GL.GLFloat'( 0.0), -1.0,  0.0);
      GL.glVertex3f(GL.GLFloat'(-1.0), -1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'( 1.0), -1.0, -1.0);
      GL.glVertex3f(GL.GLFloat'( 1.0), -1.0,  1.0);
      GL.glVertex3f(GL.GLFloat'(-1.0), -1.0,  1.0);
    GL.glEnd;
    GL.glEndList;

    return True;

  end Initialise;


  procedure Uninitialise is

  begin

    null;

  end Uninitialise;


  procedure Update(Ticks : in Integer) is

    Result : Interfaces.C.int;

  begin

    if Keys(SDL.Keysym.K_F1) = True then

      Result := SDL.Video.WM_ToggleFullScreen(ScreenSurface);

    end if;

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

  end Update;


  procedure Draw is

    LeftCubeAmbient  : ColourArray := (1.0, 1.0, 1.0, 1.0);
    RightcubeAmbient : ColourArray := (0.5, 0.5, 0.0, 1.0);

  begin

    GL.glClear(GL.GL_COLOR_BUFFER_BIT or GL.GL_DEPTH_BUFFER_BIT); -- Clear Screen And Depth Buffer.
    GL.glLoadIdentity;                                            -- Reset The Modelview Matrix.

    -- Move the camera aound the scene.
    GL.glTranslatef(0.0, 0.0, Zoom);
    GL.glRotatef(CameraXSpeed, 1.0, 0.0, 0.0); -- Rotate On The Y-Axis By angle.
    GL.glRotatef(CameraYSpeed, 0.0, 1.0, 0.0); -- Rotate On The Y-Axis By angle.

    -- Cube.
    --GL.Translate(GL.GLFloat'(-1.5), 0.0, 0.0);-- Translate 6 Units Into The Scree#

    GL.glMaterialfv(GL.GL_FRONT, GL.GL_AMBIENT, LeftCubeAmbient(LeftCubeAmbient'First)'Unchecked_Access);

    GL.glCallList(CubeList);

    --GL.Translate(GL.GLFloat'(3.0), 0.0, 0.0);-- Translate 6 Units Into The Scree#

    --GL.Material(GL.FRONT, GL.AMBIENT, RightCubeAmbient);

    --GL.CallList(CubeList);

    GL.glFlush; -- Flush The GL Rendering Pipeline

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
