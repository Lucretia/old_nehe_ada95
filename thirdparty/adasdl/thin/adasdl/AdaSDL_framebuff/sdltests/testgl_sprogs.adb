
-- ----------------------------------------------------------------- --
--                                                                   --
-- This is free software; you can redistribute it and/or             --
-- modify it under the terms of the GNU General Public               --
-- License as published by the Free Software Foundation; either      --
-- version 2 of the License, or (at your option) any later version.  --
--                                                                   --
-- This software is distributed in the hope that it will be useful,  --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of    --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU --
-- General Public License for more details.                          --
--                                                                   --
-- You should have received a copy of the GNU General Public         --
-- License along with this library; if not, write to the             --
-- Free Software Foundation, Inc., 59 Temple Place - Suite 330,      --
-- Boston, MA 02111-1307, USA.                                       --
--                                                                   --
-- ----------------------------------------------------------------- --

-- ----------------------------------------------------------------- --
-- This is a translation, to the Ada programming language, of the    --
-- original C test files written by Sam Lantinga - www.libsdl.org    --
-- translation made by Antonio F. Vargas - www.adapower.net/~avargas --
-- ----------------------------------------------------------------- --

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with GNAT.OS_Lib;
with SDL.Video;
with SDL.Keysym;
with SDL.Keyboard;
with SDL.Active;
with SDL.Types; use SDL.Types;
with SDL.Timer;
with SDL.Error;
with gl_h;  use gl_h;
with glu_h; use glu_h;
with AdaGL; use AdaGL;
package body TestGL_Sprogs is

   use type C.unsigned;
   use type C.int;
   use type C.C_float;

   package Ks renames SDL.Keysym;
   use type Ks.Key;
   use type Ks.SDLMod;

   package Kb renames SDL.Keyboard;
   package A  renames SDL.Active;
   use type A.Active_State;

   package T  renames SDL.Timer;
   package Er renames SDL.Error;

   use type V.Surface_Flags;
   use type V.GrabMode;
   use type V.Surface_ptr;

   --  ======================================
   procedure HotKey_ToggleFullScreen is
      screen : V.Surface_ptr;
   begin
      screen := V.GetVideoSurface;
      if V.WM_ToggleFullScreen (screen) /= 0 then
         Put ("Toggle fullscreen mode - now ");
         if (screen.flags and V.FULLSCREEN) /= 0 then
            Put_Line (" fullscreen");
         else
            Put_Line ("windowed");
         end if;
      else
         Put_Line ("Unable to toggle fullscreen mode");
      end if;
   end HotKey_ToggleFullScreen;

   --  =============================================
   procedure HotKey_ToggleGrab is
      mode : V.GrabMode;
   begin
      Put_Line ("Ctrl-G: toggling input grab!");
      mode := V.WM_GrabInput (V.GRAB_QUERY);
      if mode = V.GRAB_ON then
         Put_Line ("Grab was on");
      else
         Put_Line ("Grab was off");
      end if;

      if mode /= 0 then
         mode := 0;
      else
         mode := 1;
      end if;

      mode := V.WM_GrabInput (mode);
      if mode = V.GRAB_ON then
         Put_Line ("Grab is now on");
      else
         Put_Line ("Grab is now off");
      end if;
   end HotKey_ToggleGrab;
   --  ======================================
   procedure HotKey_Iconify is
   begin
      Put_Line ("Ctrl-Z: iconifying window!");
      V.WM_IconifyWindow;
   end HotKey_Iconify;

   --  ======================================
   procedure HandleEvent (Result : out Boolean; event : in out Ev.Event) is
      done : Boolean := False;
   begin
      case event.the_type is
         when Ev.ISACTIVEEVENT =>
            --  See what happened
            Put ("App");
            if event.active.gain /= 0 then
               Put ("gained ");
            else
               Put ("lost ");
            end if;
            if (event.active.state and A.APPACTIVE) /= 0 then
               Put ("active ");
            elsif (event.active.state and A.APPMOUSEFOCUS) /= 0 then
               Put ("mouse ");
            elsif (event.active.state and A.APPINPUTFOCUS) /= 0 then
               Put ("input ");
            end if;
            Put_Line ("focus");
         when Ev.KEYDOWN =>
            if event.key.keysym.sym = Ks.K_ESCAPE then
               done := True;
            end if;
            if (event.key.keysym.sym = Ks.K_g) and
               ((event.key.keysym.the_mod and Ks.KMOD_CTRL) /= 0)
            then
               HotKey_ToggleGrab;
            end if;
            if (event.key.keysym.sym = Ks.K_z) and
               ((event.key.keysym.the_mod and Ks.KMOD_CTRL) /= 0)
            then
               HotKey_Iconify;
            end if;
            if (event.key.keysym.sym = Ks.K_RETURN) and
               ((event.key.keysym.the_mod and Ks.KMOD_ALT) /= 0)
            then
               HotKey_ToggleFullScreen;
            end if;
            Put_Line ("key '" &
            CS.Value (Kb.GetKeyName (event.key.keysym.sym)) &
            "' pressed");
         when Ev.QUIT =>
            done := True;
         when others => null;
      end case;
      Result := done;
   end HandleEvent;

   --  ======================================
   image : V.Surface_ptr := null;
   x : C.int := 0;
   y : C.int := 0;
   delta_x : C.int := 1;
   delta_y : C.int := 1;
   last_moved : Uint32 := 0;
   --  ======================================
   procedure DrawSDLLogo is
      dst : V.Rect;
      screen : V.Surface_ptr;
   begin
      if image = null then
         declare
            temp : V.Surface_ptr;
         begin
            temp := V.LoadBMP ("icon.bmp");
            if temp = null then
               return;
            end if;
            image := V.CreateRGBSurface (
                        V.SWSURFACE,
                        temp.w, temp.h,
                        32,
                        --  BYTEORDER = LIL_ENDIAN
                        16#000000FF#,
                        16#0000FF00#,
                        16#00FF0000#,
                        16#FF000000#
                        --  BYTEORDER /= LILL_ENDIAN
                        --  16#FF000000#,
                        --  16#00FF0000#,
                        --  16#0000FF00#,
                        --  16#000000FF#
                        );
            if image /= null then
               V.BlitSurface (temp, null, image, null);
            end if;
            V.FreeSurface (temp);
            if image = null then
               return;
            end if;
         end;
      end if;
      screen := V.GetVideoSurface;

      --  show the image on the screen
      dst := (Sint16 (x), Sint16 (y),
                  Uint16 (image.w), Uint16 (image.h));

      --
      --  Move it around
      --  Note that we do not clear the old position.  This is because we
      --  perform a glClear() which clears the framebuffer and then only
      --  update the new area.
      --  Note that you can also achieve interesting effects by modifying
      --  the screen surface alpha channel.  It's set to 255 by default..
      if T.GetTicks - last_moved > 100 then
         x := x + delta_x;
         if x < 0 then
            x := 0;
            delta_x := -delta_x;
         elsif x + image.w > screen.w then
            x := screen.w  - image.w;
            delta_x := -delta_x;
         end if;
         y := y + delta_y;
         if y < 0 then
            y := 0;
            delta_y := -delta_y;
         elsif y + image.h > screen.h then
            y := screen.h -  image.h;
            delta_y := -delta_y;
         end if;
         V.BlitSurface (image, null, screen, dst);
      end if;
      V.Update_Rect (screen, dst);
   end DrawSDLLogo;

   --  ======================================
   procedure RunGLTest (video_flags : in out V.Surface_Flags;
                       logo     : Boolean; slowly : Boolean;
                       bppixel  : C.int; gamma  : C.C_float)
   is
      bpp : C.int := bppixel;
      type rgb_size_Array is array (0 .. 2) of C.int;
      pragma Convention (C, rgb_size_Array);
      rgb_size: rgb_size_Array;
      w : C.int := 800; -- 1024; --  640;
      h : C.int := 600; --  768; --  480;
      done : Boolean := False;
      frames : C.int;
      start_time, this_time : Uint32;

      type Colors_Array is array (0 .. 7) of Three_GLfloat_Vector;
      color : Colors_Array :=   ((1.0, 1.0, 0.0),
                                 (1.0, 0.0, 0.0),
                                 (0.0, 0.0, 0.0),
                                 (0.0, 1.0, 0.0),
                                 (0.0, 1.0, 1.0),
                                 (1.0, 1.0, 1.0),
                                 (1.0, 0.0, 1.0),
                                 (0.0, 0.0, 1.0));

      type Vertices_Array is array (0 .. 7) of Three_GLfloat_Vector;

      cube : Vertices_Array := (( 0.5,  0.5, -0.5),
                                ( 0.5, -0.5, -0.5),
                                (-0.5, -0.5, -0.5),
                                (-0.5,  0.5, -0.5),
                                (-0.5,  0.5,  0.5),
                                ( 0.5,  0.5,  0.5),
                                ( 0.5, -0.5,  0.5),
                                (-0.5, -0.5,  0.5));
      value : aliased C.int;
      use type C.char;
      Poll_Event_Result : C.int;

   begin
      if SDL.Init (SDL.INIT_VIDEO) < 0 then
         Put_Line ("Couldn't initialize SDl: " & Er.Get_Error);
         GNAT.OS_Lib.OS_Exit (1);
      end if;
      --  See if we should detect the display depth
      if bpp = 0 then
         if V.GetVideoInfo.vfmt.BitsPerPixel <= 8 then
            bpp := 8;
         else
            bpp := 16; -- More doesn seem to work
         end if;
      end if;
      --  set the flags we want to use for setting the video mode
      if logo then
         video_flags := video_flags or V.OPENGLBLIT;
      else
         video_flags := video_flags or V.OPENGL;
      end if;
      --  if CL.Argument_Count > 0 then
      --     if CL.Argument (1) = "-fullscreen" then
      --        video_flags := video_flags or V.FULLSCREEN;
      --     end if;
      --  end if;
      --  Initilize the display
      case bpp is
         when 8       => rgb_size := (2, 3, 3);
         when 15 | 16 => rgb_size := (5, 5, 5);
         when others  => rgb_size := (8, 8, 8);
      end case;
      V.GL_SetAttribute (V.GL_RED_SIZE,    rgb_size (0));
      V.GL_SetAttribute (V.GL_GREEN_SIZE,  rgb_size (1));
      V.GL_SetAttribute (V.GL_BLUE_SIZE,   rgb_size (2));
      V.GL_SetAttribute (V.GL_DEPTH_SIZE,  16);
      V.GL_SetAttribute (V.GL_DOUBLEBUFFER, 1);
      if V.SetVideoMode (w, h, bpp, video_flags) = null then
         Put_Line ("Couldn't set GL mode: " & Er.Get_Error);
         SDL.SDL_Quit;
         GNAT.OS_Lib.OS_Exit (1);
      end if;
      New_Line;
      Put_Line ("Vendor     :" & glGetString (GL_VENDOR));
      Put_Line ("Renderer   :" & glGetString (GL_RENDERER));
      Put_Line ("Version    :" & glGetString (GL_VERSION));
      Put_Line ("Extensions :" & glGetString (GL_EXTENSIONS));
      New_Line;

      V.GL_GetAttribute (V.GL_RED_SIZE, value);
      Put_Line ("GL_RED_SIZE: requested " &
                C.int'Image (rgb_size (0)) & ", got" &
                C.int'Image (value));
      V.GL_GetAttribute (V.GL_GREEN_SIZE, value);
      Put_Line ("GL_GREEN_SIZE: requested " &
                C.int'Image (rgb_size (1)) & ", got" &
                C.int'Image (value));
      V.GL_GetAttribute (V.GL_BLUE_SIZE, value);
      Put_Line ("GL_BLUE_SIZE: requested " &
                C.int'Image (rgb_size (2)) & ", got" &
                C.int'Image (value));
      V.GL_GetAttribute (V.GL_DEPTH_SIZE, value);
      Put_Line ("GL_DEPTH_SIZE: requested " &
                C.int'Image (bpp) & ", got" &
                C.int'Image (value));
      V.GL_GetAttribute (V.GL_DOUBLEBUFFER, value);
      Put_Line ("GL_DOUBLEBUFFER_SIZE: requested 1, got" &
                C.int'Image (value));

      --  Set the window manager title bar
      V.WM_SetCaption (CS.New_String ("SDL GL test"),
                       CS.New_String ("testgl"));

      --  Set the gamma for the window
      if gamma /= 0.0 then
         V.SetGamma (gamma, gamma, gamma);
      end if;

      glViewport (0, 0, GLsizei (w), GLsizei (h));
      glMatrixMode (GL_PROJECTION);
      glLoadIdentity;

      glOrtho (-2.0, 2.0, -2.0, 2.0, -20.0, 20.0);

      glMatrixMode (GL_MODELVIEW);
      glLoadIdentity;

      glEnable (GL_DEPTH_TEST);

      glDepthFunc (GL_LESS);

      glShadeModel (GL_SMOOTH);

      --  Loop until done
      start_time := T.GetTicks;
      frames := 0;
      while not done loop
         declare
            gl_error  : GLenum;
            sdl_error : CS.chars_ptr;
            event     : Ev.Event;
         begin
            --  Do our drawing, too
            glClearColor (0.0, 0.0, 0.0, 1.0);
            glClear (GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);

            glBegin (GL_QUADS);

            --  SHADED_CUBE
            glColor3fv  (color (0));
            glVertex3fv (cube  (0));
            glColor3fv  (color (1));
            glVertex3fv (cube  (1));
            glColor3fv  (color (2));
            glVertex3fv (cube  (2));
            glColor3fv  (color (3));
            glVertex3fv (cube  (3));

            glColor3fv  (color (3));
            glVertex3fv (cube  (3));
            glColor3fv  (color (4));
            glVertex3fv (cube  (4));
            glColor3fv  (color (7));
            glVertex3fv (cube  (7));
            glColor3fv  (color (2));
            glVertex3fv (cube  (2));

            glColor3fv  (color (0));
            glVertex3fv (cube  (0));
            glColor3fv  (color (5));
            glVertex3fv (cube  (5));
            glColor3fv  (color (6));
            glVertex3fv (cube  (6));
            glColor3fv  (color (1));
            glVertex3fv (cube  (1));

            glColor3fv  (color (5));
            glVertex3fv (cube  (5));
            glColor3fv  (color (4));
            glVertex3fv (cube  (4));
            glColor3fv  (color (7));
            glVertex3fv (cube  (7));
            glColor3fv  (color (6));
            glVertex3fv (cube  (6));

            glColor3fv  (color (5));
            glVertex3fv (cube  (5));
            glColor3fv  (color (0));
            glVertex3fv (cube  (0));
            glColor3fv  (color (3));
            glVertex3fv (cube  (3));
            glColor3fv  (color (4));
            glVertex3fv (cube  (4));

            glColor3fv  (color (6));
            glVertex3fv (cube  (6));
            glColor3fv  (color (1));
            glVertex3fv (cube  (1));
            glColor3fv  (color (2));
            glVertex3fv (cube  (2));
            glColor3fv  (color (7));
            glVertex3fv (cube  (7));
            --  FLAT CUBE
            --  glColor3f(1.0, 0.0, 0.0);
            --  glVertex3fv(cube (0));
            --  glVertex3fv(cube (1));
            --  glVertex3fv(cube (2));
            --  glVertex3fv(cube (3));

            --  glColor3f(0.0, 1.0, 0.0);
            --  glVertex3fv(cube (3));
            --  glVertex3fv(cube (4));
            --  glVertex3fv(cube (7));
            --  glVertex3fv(cube (2));

            --  glColor3f(0.0, 0.0, 1.0);
            --  glVertex3fv(cube (0));
            --  glVertex3fv(cube (5));
            --  glVertex3fv(cube (6));
            --  glVertex3fv(cube (1));

            --  glColor3f(0.0, 1.0, 1.0);
            --  glVertex3fv(cube (5));
            --  glVertex3fv(cube (4));
            --  glVertex3fv(cube (7));
            --  glVertex3fv(cube (6));

            --  glColor3f(1.0, 1.0, 0.0);
            --  glVertex3fv(cube (5));
            --  glVertex3fv(cube (0));
            --  glVertex3fv(cube (3));
            --  glVertex3fv(cube (4));

            --  glColor3f(1.0, 0.0, 1.0);
            --  glVertex3fv(cube (6));
            --  glVertex3fv(cube (1));
            --  glVertex3fv(cube (2));
            --  glVertex3fv(cube (7));
            --  END CUBE

            glEnd;

            glMatrixMode (GL_MODELVIEW);
            glRotatef (5.0, 1.0, 1.0, 1.0);

            --  Draw 2D logo onto the 3D display
            if logo then
               DrawSDLLogo;
            end if;
            V.GL_SwapBuffers;

            --  Check for errors conditions
            gl_error := glGetError;

            if gl_error /= GL_NO_ERROR then
               Put_Line ("testgl: SDL error '" &
                       GLenum'Image(gl_error));
            end if;
            sdl_error := Er.GetError;
            if CS.Value (sdl_error)(0) /= C.nul then
               Put_Line ("testgl: SDL error '" &
                         CS.Value (sdl_error));
               Er.ClearError;
            end if;

            --  Allow the user what's happening
            if slowly then
               T.SDL_Delay (20);
            end if;

            --  Check if there's a pending event
            loop
               Ev.PollEventVP (Poll_Event_Result, event);
               exit when Poll_Event_Result = 0;
               HandleEvent (done, event);
            end loop;
            frames := frames + 1;
         end;
      end loop;

      --  Print out the frames per second
      this_time := T.GetTicks;
      if this_time /= start_time then
         Put ((Float (frames) / Float (this_time - start_time)) * 1000.0,
              3, 2, 0);
         Put_Line (" FPS");
      end if;

      --  Destroy our GL context, etc
      SDL.SDL_Quit;
   end RunGLTest;
   --  ======================================
end TestGL_Sprogs;
