---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
with Text_Io; use Text_Io;


package body Example is

  procedure PrintUsage is
  
  begin
  
    Put_Line("Keys");
    Put_Line("Cursor keys  => Rotate");
    Put_Line("Page Down/Up => Zoom in/out");
    Put_Line("F1           => Toggle Fullscreen");
    Put_Line("Escape       => Quit");

  end PrintUsage;
  
  
  function Initialise return Boolean is
  
  begin
  
    GL.glClearColor(0.0, 0.0, 0.0, 0.0);                          -- Black Background
    GL.glClearDepth(1.0);                                          -- Depth Buffer Setup
    GL.glDepthFunc(GL.GL_LEQUAL);                                  -- The Type Of Depth Testing (Less Or Equal)
    GL.glEnable(GL.GL_DEPTH_TEST);                                -- Enable Depth Testing
    GL.glShadeModel(GL.GL_SMOOTH);                                -- Select Smooth Shading
    GL.glHint(GL.GL_PERSPECTIVE_CORRECTION_HINT, GL.GL_NICEST);    -- Set Perspective Calculations To Most Accurate
        
    -- Start of user initialisation
  
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

      XSpeed := XSpeed - 0.1;
    
    end if;

    if Keys(SDL.Keysym.K_RIGHT) = True then

      XSpeed := XSpeed + 0.1;
      
    end if;
    
    if Keys(SDL.Keysym.K_UP) = True then

      YSpeed := YSpeed - 0.1;
    
    end if;

    if Keys(SDL.Keysym.K_DOWN) = True then

      YSpeed := YSpeed + 0.1;
      
    end if;
    
    if Keys(SDL.Keysym.K_PAGEUP) = True then

      Zoom := Zoom - 0.1;
    
    end if;
    
    if Keys(SDL.Keysym.K_PAGEDOWN) = True then

      Zoom := Zoom + 0.1;
    
    end if;
    
    if Keys(SDL.Keysym.K_ESCAPE) = True then

      AppQuit := True;
      
    end if;
    
  end Update;


  procedure Draw is
  
  begin
  
    GL.glClear(GL.GL_COLOR_BUFFER_BIT or GL.GL_DEPTH_BUFFER_BIT);  -- Clear Screen And Depth Buffer
    GL.glLoadIdentity;                                            -- Reset The Modelview Matrix
    GL.glTranslatef(0.0, 0.0, Zoom);                              -- Translate 6 Units Into The Screen
    GL.glRotatef(XSpeed, 0.0, 1.0, 0.0);                          -- Rotate On The Y-Axis By angle
    GL.glRotatef(YSpeed, 1.0, 0.0, 0.0);                          -- Rotate On The Y-Axis By angle

    GL.glBegin(GL.GL_TRIANGLES);                                -- Begin Drawing Triangles
      GL.glColor3f(1.0, 0.0, 0.0);  GL.glVertex3f( 0.0,  1.0, 0.0);
      GL.glColor3f(0.0, 1.0, 0.0);  GL.glVertex3f(-1.0, -1.0, 1.0);
      GL.glColor3f(0.0, 0.0, 1.0);  GL.glVertex3f( 1.0, -1.0, 1.0);
    GL.glEnd;                                                -- Done Drawing Triangles
    
    for Rot1 in 0 .. 2 loop

      GL.glRotatef(90.0, 0.0, 1.0, 0.0);      -- Rotate 90 Degrees On The Y-Axis
      GL.glRotatef(180.0, 1.0, 0.0, 0.0);      -- Rotate 180 Degress On The X-Axis

      for Rot2 in 0 .. 2 loop

        GL.glRotatef(180.0, 0.0, 1.0, 0.0);  -- Rotate 180 Degrees On The Y-Axis
        
        GL.glBegin(GL.GL_TRIANGLES);            -- Drawing Triangles
          GL.glColor3f(1.0, 0.0, 0.0);  GL.glVertex3f( 0.0,  1.0, 0.0);
          GL.glColor3f(0.0, 1.0, 0.0);  GL.glVertex3f(-1.0, -1.0, 1.0);
          GL.glColor3f(0.0, 0.0, 1.0);  GL.glVertex3f( 1.0, -1.0, 1.0);
        GL.glEnd;                            -- Done Drawing Triangles
      
      end loop;
      
    end loop;

    GL.glFlush;  -- Flush The GL Rendering Pipeline
  
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
