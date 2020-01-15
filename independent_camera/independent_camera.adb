---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
with Interfaces.C; use Interfaces.C;
with Text_Io; use Text_Io;

with SDL.Types; use SDL.Types;
with SDL.Keyboard;
with SDL.Keysym;
with SDL.Video;
with SDL.Events;
with SDL.Timer;
with SDL.Active;

use type SDL.Init_Flags;
use type SDL.Active.Active_State;
use type SDL.Video.Surface_Flags;
use type SDL.Video.Surface_Ptr;
use type SDL.Video.VideoInfo_ConstPtr;

with Example;
with GL;
with GLU;

use type GL.GLdouble;


-- A simple example of a cube drawn with a display list.
procedure Independent_Camera is

  pragma Link_With("-lSDL");

  VideoFlags : SDL.Video.Surface_Flags := SDL.Video.OPENGL or SDL.Video.HWPALETTE or SDL.Video.RESIZABLE;
  Result     : Boolean                 := False;
  TickCount  : Integer                 := 0;

  procedure ReshapeGL(Width, Height : in GL.GLint) is

    AspectRatio : constant GL.GLdouble := GL.GLdouble(Width) / GL.GLdouble(Height);

  begin

    GL.glViewport(0, 0, GL.GLsizei(Width), GL.GLsizei(Height)); -- The Current Viewport.
    GL.glMatrixMode(GL.GL_PROJECTION);                          -- The Projection Matrix.
    GL.glLoadIdentity;                                          -- The Projection Matrix.
    GLU.gluPerspective(45.0, AspectRatio, 1.0, 100.0);          -- Calculate The Aspect Ratio Of The Window.
    GL.glMatrixMode(GL.GL_MODELVIEW);                           -- The Modelview Matrix.
    GL.glLoadIdentity;                                          -- Reset The Modelview Matrix.

  end ReshapeGL;


  procedure CreateWindowGL(Result : out Boolean) is

    VideoInfo: SDL.Video.VideoInfo_ConstPtr;

  begin

    if SDL.Init(SDL.INIT_VIDEO or SDL.INIT_TIMER) = -1 then

      Put_Line("Error Initialising SDL");

      Result := False;

    else

      VideoInfo := SDL.Video.GetVideoInfo;

      if VideoInfo = null then

        Put_Line("Error Retrieving video information");

        Result := False;

      else

        if VideoInfo.hw_available = 1 then

          VideoFlags := VideoFlags or SDL.Video.HWSURFACE;

        else

          VideoFlags := VideoFlags or SDL.Video.SWSURFACE;

        end if;

        if VideoInfo.blit_hw = 1 then

          VideoFlags := VideoFlags or SDL.Video.HWACCEL;

        end if;

        SDL.Video.GL_SetAttribute(SDL.Video.GL_RED_SIZE, 5);
        SDL.Video.GL_SetAttribute(SDL.Video.GL_GREEN_SIZE, 5);
        SDL.Video.GL_SetAttribute(SDL.Video.GL_BLUE_SIZE, 5);
        SDL.Video.GL_SetAttribute(SDL.Video.GL_DEPTH_SIZE, 16);
        SDL.Video.GL_SetAttribute(SDL.Video.GL_DOUBLEBUFFER, 1);

        Example.SetSurface(SDL.Video.SetVideoMode(C.int(Example.GetWidth), C.int(Example.GetHeight), C.int(Example.GetBitsPerPixel), VideoFlags));

        if Example.GetSurface = null then

          Put_Line("Error setting video mode");

          Result := False;

        else

          SDL.Video.WM_Set_Caption_Title(Example.GetTitle);
          ReshapeGL(GL.GLint(Example.GetWidth), GL.GLint(Example.GetHeight));

        end if;

      end if;

    end if;

    Result := True;

  end CreateWindowGL;


  procedure DestroyWindowGL is

  begin

    SDL.SDL_Quit;

  end DestroyWindowGL;


  procedure PollEvents is

    Event : aliased SDL.Events.Event;

  begin

    while SDL.Events.PollEvent(Event'Unchecked_Access) /= 0 loop

      case Event.the_type is
        when SDL.Events.QUIT =>
          Put_Line("Quitting...");

          Example.SetQuit(True);

        when SDL.Events.KEYDOWN =>
          Example.SetKey(Event.Key.Keysym.sym, True);

        when SDL.Events.KEYUP =>
          Example.SetKey(Event.Key.Keysym.sym, False);

        when SDL.Events.VIDEORESIZE =>
          Example.SetSurface(SDL.Video.SetVideoMode(Event.Resize.w, Event.Resize.h, C.int(Example.GetBitsPerPixel), VideoFlags));
          ReshapeGL(GL.GLint(Event.Resize.w), GL.GLint(Event.Resize.h));

        when SDL.Events.ISACTIVEEVENT =>
          if Event.Active.Gain = 0 then

            Example.SetActive(False);

          else

            Example.SetActive(True);

          end if;

        when others =>
          null;
      end case;

    end loop;

  end PollEvents;

begin

  CreateWindowGL(Result);
  
  Example.PrintGLInfo;
  Example.PrintUsage;

  if Result = True then

    if Example.Initialise = True then

      while Example.Quit = False loop

        PollEvents;

        if Example.IsActive = True then

          TickCount := Integer(SDL.Timer.GetTicks);

          Example.Update(TickCount);
          Example.SetLastTickCount(TickCount);
          Example.Draw;
          Example.CalculateFPS;

          SDL.Video.GL_SwapBuffers;

        end if;

      end loop;

      Example.Uninitialise;

    end if;

    DestroyWindowGL;

  end if;

end Independent_Camera;
