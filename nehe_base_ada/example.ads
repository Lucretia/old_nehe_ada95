---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
with Interfaces.C; use Interfaces.C;

with GL;

use type GL.GLfloat;
use type GL.GLbitfield;

with SDL.Types; use SDL.Types;
with SDL.Keysym; use SDL.Keysym;
with SDL.Video; use SDL.Video;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Example is

  procedure PrintUsage;
  function Initialise return Boolean;
  procedure Uninitialise;
  procedure Update(Ticks : in Integer);
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
  
  Title         : String                := "NeHe Base Code in Ada/SDL";
  Width         : Integer               := 640;
  Height        : Integer               := 480;
  BitsPerPixel  : Integer               := 16;
  IsFullScreen  : Boolean               := False;
  Keys          : KeysArray             := (others => False);
  IsVisible     : Boolean               := False;
  LastTickCount : Integer               := 0;
  ScreenSurface : SDL.Video.Surface_Ptr := null;
  AppActive     : Boolean               := True;
  AppQuit       : Boolean               := False;
  XSpeed        : GL.GLfloat            := 0.0;
  YSpeed        : GL.GLfloat            := 0.0;
  Zoom          : GL.GLfloat            := -6.0;

end Example;
