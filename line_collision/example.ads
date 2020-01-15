---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
with Interfaces.C; use Interfaces.C;

with SDL.Types; use SDL.Types;
with SDL.Keysym;
with SDL.Video;
with SDL.Timer;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with GL;
with GL.EXT;
with Vector3;
with Line_Segment;
with Plane;

use type GL.GLfloat;


package Example is

  procedure PrintGLInfo;
  procedure PrintUsage;
  procedure CalculateFPS;
  function Initialise return Boolean;
  procedure Uninitialise;
  procedure Update;--(Ticks : in Integer);
  procedure Draw;
  function GetTitle return String;
  function GetWidth return Integer;
  function GetHeight return Integer;
  function GetBitsPerPixel return Integer;
  procedure SetLastTickCount(Ticks : in Integer);
  procedure SetSurface(Surface : in SDL.Video.Surface_Ptr);
  function GetSurface return SDL.Video.Surface_Ptr;
  procedure SetKey(Key : in SDL.Keysym.Key; Down : in Boolean);
  procedure SetActive(Active : in Boolean);
  function IsActive return Boolean;
  procedure SetQuit(Quit : in Boolean);
  function Quit return Boolean;

private

  type KeysArray is array(SDL.Keysym.K_FIRST .. SDL.Keysym.K_LAST) of Boolean;

  GLVendor        : Unbounded_String;
  GLVersion       : Unbounded_String;
  GLRenderer      : Unbounded_String;
  GLExtensions    : Unbounded_String;
  GLUVersion      : Unbounded_String;
  GLUExtensions   : Unbounded_String;
  Title           : String                := "Line Collision Demo in Ada/SDL";
  Width           : Integer               := 640;
  Height          : Integer               := 480;
  BitsPerPixel    : Integer               := 16;
  IsFullScreen    : Boolean               := False;
  Keys            : KeysArray             := (others => False);
  IsVisible       : Boolean               := False;
  LastTickCount   : Integer               := 0;
  ScreenSurface   : SDL.Video.Surface_Ptr := null;
  AppActive       : Boolean               := True;
  AppQuit         : Boolean               := False;
  CameraXSpeed    : GL.GLfloat            := 0.0;
  CameraYSpeed    : GL.GLfloat            := 0.0;
  Zoom            : GL.GLfloat            := -6.0;
  ShiftPressed    : Boolean               := False;
  CtrlPressed     : Boolean               := False;
  NPressed        : Boolean               := False;
  MPressed        : Boolean               := False;
  OPressed        : Boolean               := False;
  KPressed        : Boolean               := False;
  DPressed        : Boolean               := False;
  LastElapsedTime : Float                 := 0.0;
  FrameCount      : Integer               := 0;
  FPS             : Float                 := 0.0;
  TestPlane       : Plane.Object          := Plane.CreateX;
  TestLine        : Line_Segment.Object   := Line_Segment.Create(Vector3.Object'(-1.0, 0.0, 0.0), Vector3.Object'(1.0, 0.0, 0.0));
  LineDelta       : Float                 := 0.5;
  LineSmallDelta  : Float                 := 0.1;

end Example;
