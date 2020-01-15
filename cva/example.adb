---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
--with Ada.Real_Time;
with Interfaces.C;
with Text_Io; use Text_Io;
with GL;
with GLU;
with GL.EXT;
with GLUtils;
with Mesh;

use type GL.GLbitfield;
use type GL.EXT.glLockArraysEXTPtr;
use type GL.EXT.glUnlockArraysEXTPtr;

package body Example is

  function Get_glLockArraysEXT is new GLUtils.GetProc(GL.EXT.glLockArraysEXTPtr);
  function Get_glUnlockArraysEXT is new GLUtils.GetProc(GL.EXT.glUnlockArraysEXTPtr);
  
  glLockArraysEXT   : GL.EXT.glLockArraysEXTPtr   := null;
  glUnlockArraysEXT : GL.EXT.glUnlockArraysEXTPtr := null;
  Cube              : Mesh.Object;

  procedure FindNeededExtensions is

  begin

    if GLUtils.IsExtensionAvailable("GL_EXT_compiled_vertex_array") = True then
      
      HaveCVA := True;

    else

      Put_Line("Cannot find GL_EXT_compiled_vertex_array extension");
      
    end if;
    
    if HaveCVA = True then
    
      glLockArraysEXT   := Get_glLockArraysEXT("glLockArraysEXT");
      glUnlockArraysEXT := Get_glUnlockArraysEXT("glUnlockArraysEXT");
    
      if glLockArraysEXT = null then
    
        Put_Line("Error getting glLockArraysEXT");
      
      end if;
    
      if glUnlockArraysEXT = null then
    
        Put_Line("Error getting glUnlockArraysEXT");
      
      end if;
      
    end if;

  end FindNeededExtensions;
  
  
  procedure GenerateCube(MeshData : in out Mesh.Object) is
  
    TotalFaces    : constant Integer := 6;
    TotalVertices : constant Integer := 4 * TotalFaces;
    
  begin

    MeshData.Primitive := GL.GL_QUADS;
    MeshData.Vertices  := new Mesh.VertexArray(0 .. TotalVertices - 1);
    MeshData.Normals   := new Mesh.NormalArray(0 .. TotalVertices - 1);
    MeshData.Indices   := new Mesh.IndexArray(0 .. TotalVertices - 1);

    -- Front face.
    MeshData.Vertices(0) := (-1.0, -1.0, 1.0);
    MeshData.Vertices(1) := ( 1.0, -1.0, 1.0);
    MeshData.Vertices(2) := ( 1.0,  1.0, 1.0);
    MeshData.Vertices(3) := (-1.0,  1.0, 1.0);
    
    MeshData.Normals(0) := (0.0, 0.0, 1.0);
    MeshData.Normals(1) := (0.0, 0.0, 1.0);
    MeshData.Normals(2) := (0.0, 0.0, 1.0);
    MeshData.Normals(3) := (0.0, 0.0, 1.0);
    
    MeshData.Indices(0) := 0;
    MeshData.Indices(1) := 1;
    MeshData.Indices(2) := 2;
    MeshData.Indices(3) := 3;

    -- Back face.
    MeshData.Vertices(4) := (-1.0, -1.0, -1.0);
    MeshData.Vertices(5) := (-1.0,  1.0, -1.0);
    MeshData.Vertices(6) := ( 1.0,  1.0, -1.0);
    MeshData.Vertices(7) := ( 1.0, -1.0, -1.0);
    
    MeshData.Normals(4) := (0.0, 0.0, -1.0);
    MeshData.Normals(5) := (0.0, 0.0, -1.0);
    MeshData.Normals(6) := (0.0, 0.0, -1.0);
    MeshData.Normals(7) := (0.0, 0.0, -1.0);
    
    MeshData.Indices(4) := 4;
    MeshData.Indices(5) := 5;
    MeshData.Indices(6) := 6;
    MeshData.Indices(7) := 7;

    -- Left face.
    MeshData.Vertices(8)  := (-1.0, -1.0, -1.0);
    MeshData.Vertices(9)  := (-1.0, -1.0,  1.0);
    MeshData.Vertices(10) := (-1.0,  1.0,  1.0);
    MeshData.Vertices(11) := (-1.0,  1.0, -1.0);
    
    MeshData.Normals(8)  := (-1.0, 0.0, 0.0);
    MeshData.Normals(9)  := (-1.0, 0.0, 0.0);
    MeshData.Normals(10) := (-1.0, 0.0, 0.0);
    MeshData.Normals(11) := (-1.0, 0.0, 0.0);
    
    MeshData.Indices(8)  := 8;
    MeshData.Indices(9)  := 9;
    MeshData.Indices(10) := 10;
    MeshData.Indices(11) := 11;
    
    -- Right face.
    MeshData.Vertices(12) := (1.0, -1.0, -1.0);
    MeshData.Vertices(13) := (1.0,  1.0, -1.0);
    MeshData.Vertices(14) := (1.0,  1.0,  1.0);
    MeshData.Vertices(15) := (1.0, -1.0,  1.0);
    
    MeshData.Normals(12) := (1.0, 0.0, 0.0);
    MeshData.Normals(13) := (1.0, 0.0, 0.0);
    MeshData.Normals(14) := (1.0, 0.0, 0.0);
    MeshData.Normals(15) := (1.0, 0.0, 0.0);
    
    MeshData.Indices(12) := 12;
    MeshData.Indices(13) := 13;
    MeshData.Indices(14) := 14;
    MeshData.Indices(15) := 15;
    
    -- Top face.
    MeshData.Vertices(16) := (-1.0, 1.0, -1.0);
    MeshData.Vertices(17) := (-1.0, 1.0,  1.0);
    MeshData.Vertices(18) := ( 1.0, 1.0,  1.0);
    MeshData.Vertices(19) := ( 1.0, 1.0, -1.0);
    
    MeshData.Normals(16) := (0.0, 1.0, 0.0);
    MeshData.Normals(17) := (0.0, 1.0, 0.0);
    MeshData.Normals(18) := (0.0, 1.0, 0.0);
    MeshData.Normals(19) := (0.0, 1.0, 0.0);
    
    MeshData.Indices(16) := 16;
    MeshData.Indices(17) := 17;
    MeshData.Indices(18) := 18;
    MeshData.Indices(19) := 19;
    
    -- Bottom face.
    MeshData.Vertices(20) := (-1.0, -1.0, -1.0);
    MeshData.Vertices(21) := ( 1.0, -1.0, -1.0);
    MeshData.Vertices(22) := ( 1.0, -1.0,  1.0);
    MeshData.Vertices(23) := (-1.0, -1.0,  1.0);
    
    MeshData.Normals(20) := (0.0, -1.0, 0.0);
    MeshData.Normals(21) := (0.0, -1.0, 0.0);
    MeshData.Normals(22) := (0.0, -1.0, 0.0);
    MeshData.Normals(23) := (0.0, -1.0, 0.0);
    
    MeshData.Indices(20) := 20;
    MeshData.Indices(21) := 21;
    MeshData.Indices(22) := 22;
    MeshData.Indices(23) := 23;
    
  end GenerateCube;
  
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
    Put_Line("Cursor keys   => Rotate");
    Put_Line("Page Down/Up  => Zoom in/out");
    Put_Line("F1            => Toggle Fullscreen");
    Put_Line("L             => Toggle Lighting");
    Put_Line("S             => Select Smooth/Flat Shading");
    Put_Line("C             => Toggle CVA rendering");
    Put_Line("Escape        => Quit");

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

    subtype LightVectorRange is Integer range 1 .. 4;
    type LightVectorArray is array(LightVectorRange) of aliased GL.GLfloat;

    LightAmbient  : Mesh.ColourArray := (0.5, 0.5, 0.5, 1.0);
    LightDiffuse  : Mesh.ColourArray := (1.0, 1.0, 1.0, 1.0);
    LightPosition : LightVectorArray := (0.0, 2.0, 4.0, 1.0);

  begin

    FindNeededExtensions;
    
    GL.glClearColor(0.0, 0.0, 0.0, 0.0);                        -- Black Background.
    GL.glClearDepth(1.0);                                       -- Depth Buffer Setup.
    GL.glDepthFunc(GL.GL_LEQUAL);                               -- The Type Of Depth Testing (Less Or Equal).
    GL.glEnable(GL.GL_DEPTH_TEST);                              -- Enable Depth Testing.
    GL.glShadeModel(GL.GL_SMOOTH);                              -- Select Smooth Shading.
    GL.glHint(GL.GL_PERSPECTIVE_CORRECTION_HINT, GL.GL_NICEST); -- Set Perspective Calculations To Most Accurate.
    GL.glFrontFace(GL.GL_CCW);
    GL.glCullFace(GL.GL_BACK);
    GL.glEnable(GL.GL_CULL_FACE);

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

    GenerateCube(Cube);

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
        
        Put_Line("Lighting on");

      else

        GL.glDisable(GL.GL_LIGHTING);
        
        Put_Line("Lighting off");

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
        
        Put_Line("Smooth shading");

      else

        GL.glShadeModel(GL.GL_FLAT);
        
        Put_Line("Flat shading");

      end if;

    end if;

    if Keys(SDL.Keysym.K_s) = False then

      PressedS := False;

    end if;

    if Keys(SDL.Keysym.K_c) = True and PressedC = False then

      PressedC := True;
      UseCVA   := UseCVA xor True;

      if UseCVA = True then

        Put_Line("CVA rendering enabled");

      else

        Put_Line("CVA rendering disabled");

      end if;

    end if;

    if Keys(SDL.Keysym.K_c) = False then

      PressedC := False;

    end if;

  end Update;


  procedure Draw is

    LeftCubeAmbient  : Mesh.ColourArray := (0.0, 0.5, 0.5, 1.0);
    RightCubeAmbient : Mesh.ColourArray := (0.5, 0.5, 0.0, 1.0);
    
--    package Integer_InOut is new Text_IO.Integer_IO(Integer);
--    use Integer_InOut;
    
--    package Seconds_Count_InOut is new Text_IO.Integer_IO(Ada.Real_Time.Seconds_Count);
--    use Seconds_Count_InOut;
    
--    package Float_InOut is new Text_IO.Float_IO(Float);
--    use Float_InOut;

--    CurrentTime : Ada.Real_Time.Time;
--    Span        : Ada.Real_Time.Time_Span;
--    Seconds     : Ada.Real_Time.Seconds_Count;
    
  begin

--    CurrentTime := Ada.Real_Time.Clock;
    
--    Ada.Real_Time.Split(CurrentTime, Seconds, Span);
    
--    LastTime := ThisTime;
--    ThisTime := Float(Ada.Real_Time.To_Duration(Span)) * 1000.0;
    
--    Put("Duration: ");
--    Put(Duration'Image(Ada.Real_Time.To_Duration(Span)));
--    Put("   Seconds: ");
--    Put(Seconds);
--    Put("   ThisTime: ");
--    Put(ThisTime, Fore => 5, Aft => 2, Exp => 0);
--    New_Line;
    
    GL.glClear(GL.GL_COLOR_BUFFER_BIT or GL.GL_DEPTH_BUFFER_BIT); -- Clear Screen And Depth Buffer.
    GL.glLoadIdentity;                                            -- Reset The Modelview Matrix.

    -- Move the camera aound the scene.
    GL.glTranslatef(0.0, 0.0, Zoom);
    GL.glRotatef(CameraXSpeed, 1.0, 0.0, 0.0); -- Rotate On The Y-Axis By angle.
    GL.glRotatef(CameraYSpeed, 0.0, 1.0, 0.0); -- Rotate On The Y-Axis By angle.

    -- Cube.
    GL.glMaterialfv(GL.GL_FRONT, GL.GL_AMBIENT, LeftCubeAmbient(LeftCubeAmbient'First)'Unchecked_Access);
    --GL.glMaterialfv(GL.GL_FRONT, GL.GL_AMBIENT, RightCubeAmbient(RightCubeAmbient'First)'Unchecked_Access);

--    Put("Vertices: ");
--    Put(Cube.Vertices(0)'Length);
--    Put("   Indices: ");
--    Put(Cube.Indices'Length);
--    New_Line;

--    Put("Sizeof GLpointer: ");
--    Put(GL.GLpointer'Size);
--    Put("   Sizeof VertexArrayPtr: ");
--    Put(VertexArrayPtr'Size);
--    New_Line;

    GL.glEnableClientState(GL.GL_VERTEX_ARRAY);
    GL.glVertexPointer(3, GL.GL_FLOAT, 0, Mesh.GetVertices(Cube));

    GL.glEnableClientState(GL.GL_NORMAL_ARRAY);
    GL.glNormalPointer(GL.GL_FLOAT, 0, Mesh.GetNormals(Cube));

    --GL.glEnableClientState(GL.GL_COLOR_ARRAY);
    --GL.glColorPointer(4, GL.GL_FLOAT, 0, To_GLpointer(Colours(Colours'First)'Access));

    if HaveCVA = True and UseCVA = True then
    
      glLockArraysEXT.all(GL.GLint(Cube.Indices.all'First), Cube.Indices.all'Length);
      
    end if;

    GL.glDrawElements(Cube.Primitive, Cube.Indices.all'Length, GL.GL_UNSIGNED_INT, Mesh.GetIndices(Cube));

    if HaveCVA = True and UseCVA = True then
    
      glUnlockArraysEXT.all;
      
    end if;

    GL.glDisableClientState(GL.GL_VERTEX_ARRAY);
    GL.glDisableClientState(GL.GL_NORMAL_ARRAY);
    --GL.glDisableClientState(GL.GL_COLOR_ARRAY);
    
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
