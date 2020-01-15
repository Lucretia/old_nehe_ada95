---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
with SDL.Types; use SDL.Types;
with SDL.Keysym; use SDL.Keysym;
with SDL.Video; use SDL.Video;
with SDL.Timer;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Camera;
with Vector3;
with Matrix3x3;
with Matrix4x4;

use type Matrix3x3.Object;
use type Matrix4x4.Object;
use type Vector3.Object;

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

  type KeysArray is array (SDL.Keysym.K_FIRST .. SDL.Keysym.K_LAST) of Boolean;

  Title           : String                := "Bounding Volume in Ada/SDL";
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
  HaveCVA         : Boolean               := False;
  UseCVA          : Boolean               := True;
  PressedF2       : Boolean               := False;
  PressedF3       : Boolean               := False;
  PressedF4       : Boolean               := False;
  PressedF5       : Boolean               := False;
  PressedL        : Boolean               := False;
  PressedC        : Boolean               := False;
  PressedS        : Boolean               := False;
  PressedW        : Boolean               := False;
  LightingOn      : Boolean               := True;
  CameraMoving    : Boolean               := False;
  SmoothShadingOn : Boolean               := True;
  WireframeOn     : Boolean               := False;
  AABBs_On        : Boolean               := False;
  OBBs_On         : Boolean               := False;
  Spheres_On      : Boolean               := False;
  XSpeed          : Float                 := 0.0;
  YSpeed          : Float                 := 0.0;
  LastElapsedTime : Float                 := 0.0;
  FrameCount      : Integer               := 0;
  FPS             : Float                 := 0.0;
  ViewCamera      : Camera.Object         := Camera.Create(0.0, 0.0, 6.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);

end Example;
