--  Copyright (c) Mark J. Kilgard, 1994.
--  Ported to Ada by Antonio F. Vargas
--  http://www.adapower.net/~avargas
--  mailto: avargas@adapower.net
--  /**
--  * (c) Copyright 1993, Silicon Graphics, Inc.
--  * ALL RIGHTS RESERVED
--  * Permission to use, copy, modify, and distribute this software for
--  * any purpose and without fee is hereby granted, provided that the above
--  * copyright notice appear in all copies and that both the copyright notice
--  * and this permission notice appear in supporting documentation, and that
--  * the name of Silicon Graphics, Inc. not be used in advertising
--  * or publicity pertaining to distribution of the software without specific,
--  * written prior permission.
--  *
--  * THE MATERIAL EMBODIED ON THIS SOFTWARE IS PROVIDED TO YOU "AS-IS"
--  * AND WITHOUT WARRANTY OF ANY KIND, EXPRESS, IMPLIED OR OTHERWISE,
--  * INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF MERCHANTABILITY OR
--  * FITNESS FOR A PARTICULAR PURPOSE.  IN NO EVENT SHALL SILICON
--  * GRAPHICS, INC.  BE LIABLE TO YOU OR ANYONE ELSE FOR ANY DIRECT,
--  * SPECIAL, INCIDENTAL, INDIRECT OR CONSEQUENTIAL DAMAGES OF ANY
--  * KIND, OR ANY DAMAGES WHATSOEVER, INCLUDING WITHOUT LIMITATION,
--  * LOSS OF PROFIT, LOSS OF USE, SAVINGS OR REVENUE, OR THE CLAIMS OF
--  * THIRD PARTIES, WHETHER OR NOT SILICON GRAPHICS, INC.  HAS BEEN
--  * ADVISED OF THE POSSIBILITY OF SUCH LOSS, HOWEVER CAUSED AND ON
--  * ANY THEORY OF LIABILITY, ARISING OUT OF OR IN CONNECTION WITH THE
--  * POSSESSION, USE OR PERFORMANCE OF THIS SOFTWARE.
--  *
--  * US Government Users Restricted Rights
--  * Use, duplication, or disclosure by the Government is subject to
--  * restrictions set forth in FAR 52.227.19(c)(2) or subparagraph
--  * (c)(1)(ii) of the Rights in Technical Data and Computer Software
--  * clause at DFARS 252.227-7013 and/or in similar or successor
--  * clauses in the FAR or the DOD or NASA FAR Supplement.
--  * Unpublished-- rights reserved under the copyright laws of the
--  * United States.  Contractor/manufacturer is Silicon Graphics,
--  * Inc., 2011 N.  Shoreline Blvd., Mountain View, CA 94039-7311.
--  *
--  * OpenGL(TM) is a trademark of Silicon Graphics, Inc.

--  /* abgr.c - Demonstrates the use of the extension EXT_abgr.
--
--    The same image data is used for both ABGR and RGBA formats
--    in glDrawPixels and glTexImage2D.  The left side uses ABGR,
--    the right side RGBA.  The top polygon demonstrates use of texture,
--    and the bottom image is drawn with glDrawPixels.

--    Note that the textures are defined as 3 component, so the alpha
--    value is not used in applying the DECAL environment.  */
with Interfaces.C;
with Ada.Text_IO;
use  Ada.Text_IO;
with Ada.Command_Line;
with GNAT.OS_Lib;
with gl_h;
use  gl_h;
with glu_h;
use  glu_h;
with AdaGL;
use  AdaGL;
with SDL.Types; use SDL.Types;
with SDL.Video;
with SDL.Error;
with SDL.Events;
with SDL.Quit;
with SDL.Keyboard;
with SDL.Keysym;

procedure abgr is

   package C  renames Interfaces.C;
   use type C.int;
   package CL renames Ada.Command_Line;
   package Vd renames SDL.Video;
   use type Vd.Surface_Flags;
   use type Vd.Surface_ptr;
   package Er renames SDL.Error;
   package Ev renames SDL.Events;
   package Kb renames SDL.Keyboard;
   package Ks renames SDL.Keysym;

   doubleBuffer : GLenum;
   ubImage : GLubyte_Array (0 .. 65535);

   --  ===================================================================
   procedure Init is
      img_index : Integer;
      imgWidth : GLsizei := 128;
   begin
      glMatrixMode (GL_PROJECTION);
      glLoadIdentity;
      gluPerspective (60.0, 1.0, 0.1, 1000.0);
      glMatrixMode (GL_MODELVIEW);
      glDisable (GL_DITHER);

      --  Create image
      img_index := 0;
      for j in 0 .. 31 * imgWidth loop
         ubImage (img_index .. img_index + 3) := (16#ff#, 16#00#, 16#00#, 16#ff#);
         img_index := img_index + 4;
      end loop;
      for j in 0 .. 31 * imgWidth loop
         ubImage (img_index .. img_index + 3) := (16#ff#, 16#00#, 16#ff#, 16#00#);
         img_index := img_index + 4;
      end loop;
      for j in 0 .. 31 * imgWidth loop
         ubImage (img_index .. img_index + 3) := (16#ff#, 16#ff#, 16#00#, 16#00#);
         img_index := img_index + 4;
      end loop;
      for j in 0 .. 31 * imgWidth loop
         ubImage (img_index .. img_index + 3) := (16#00#, 16#ff#, 16#00#, 16#ff#);
         img_index := img_index + 4;
      end loop;
   end Init;

   --  ===================================================================
   procedure TextFunc is
   begin
      glEnable (GL_TEXTURE_2D);
      glTexParameterf (GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, Float (GL_REPEAT));
      glTexParameterf (GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, Float (GL_REPEAT));
      glTexParameterf (GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, Float (GL_NEAREST));
      glTexEnvf (GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, Float (GL_DECAL));

      --  #if GL_EXT_abgr
      glTexImage2D (GL_TEXTURE_2D, 0, 3, 128, 128, 0,
                    GL_ABGR_EXT, GL_UNSIGNED_BYTE, ubImage);
      glBegin (GL_POLYGON);
      glTexCoord2f (1.0, 1.0);
      glVertex3f (-0.2, 0.8, -100.0);
      glTexCoord2f (0.0, 1.0);
      glVertex3f (-0.8, 0.8, -2.0);
      glTexCoord2f (0.0, 0.0);
      glVertex3f (-0.8, 0.2, -2.0);
      glTexCoord2f (1.0, 0.0);
      glVertex3f (-0.2, 0.2, -100.0);
      glEnd;
      --  #endif

      glTexImage2D (GL_TEXTURE_2D, 0, 3, 128, 128, 0, GL_RGBA,
                    GL_UNSIGNED_BYTE, ubImage);

      glBegin (GL_POLYGON);
      glTexCoord2f (1.0, 1.0);
      glVertex3f (0.8, 0.8, -2.0);
      glTexCoord2f (0.0, 1.0);
      glVertex3f (0.2, 0.8, -100.0);
      glTexCoord2f (0.0, 0.0);
      glVertex3f (0.2, 0.2, -100.0);
      glTexCoord2f (1.0, 0.0);
      glVertex3f (0.8, 0.2, -2.0);
      glEnd;

      glDisable (GL_TEXTURE_2D);

   end TextFunc;

   --  ===================================================================
   procedure Draw is
   begin
      glClearColor (0.0, 0.0, 0.0, 1.0);
      glClear (GL_COLOR_BUFFER_BIT);

      --  #if GL_EXT_abgr
      glRasterPos3f (-0.8, -0.8, -1.5);
      glDrawPixels (128, 128, GL_ABGR_EXT, GL_UNSIGNED_BYTE, ubImage);
      --  #endif

      glRasterPos3f (0.2, -0.8, -1.5);
      glDrawPixels (128, 128, GL_RGBA, GL_UNSIGNED_BYTE, ubImage);

      TextFunc;

      if doubleBuffer /= 0 then
         Vd.GL_SwapBuffers;
      else
         glFlush;
      end if;
   end Draw;

   --  ===================================================================
   argc : Integer := CL.Argument_Count;
   Screen_Width : C.int := 640;
   Screen_Hight : C.int := 480;
   Full_Screen  : Boolean := True;

   --  ===================================================================
   procedure Args is
   begin
      doubleBuffer := GL_TRUE;
      for i in 1 .. argc loop
         if argc >= 1 then
            if CL.Argument (argc) = "-sb" then
               doubleBuffer := GL_FALSE;
               argc := argc - 1;
            elsif CL.Argument (argc) = "-db" then
               doubleBuffer := GL_TRUE;
               argc := argc - 1;
            elsif CL.Argument (argc) = "-window" then
               Full_Screen := False;
               argc := argc - 1;
            elsif CL.Argument (argc) = "-1024x768" then
               Screen_Width := 1024;
               Screen_Hight :=  768;
               argc := argc - 1;
            elsif CL.Argument (argc) = "-800x600" then
               Screen_Width := 800;
               Screen_Hight := 600;
               argc := argc - 1;
            else
               Put_Line ("Usage: " & CL.Command_Name & " " &
                         "[ -sb | -db ] [-window] [-h] " &
                         "[-800x600 | -1024x768]");
               GNAT.OS_Lib.OS_Exit (0);
            end if;
         end if;
      end loop;
   end Args;

   --  ===================================================================
   screen   : Vd.Surface_ptr;
   Video_Flags  : Vd.Surface_Flags;
   keys   : Uint8_ptr;
   Done   : Boolean := False;

   --  ===================================================================
   procedure Main_System_Loop is
   begin
      while not Done loop
         declare
            event : Ev.Event;
            PollEvent_Result : C.int;
         begin
            loop
               Ev.PollEventVP (PollEvent_Result, event);
               exit when PollEvent_Result = 0;

               case event.the_type is
                  when Ev.QUIT =>
                     Done := True;
                  when others => null;
               end case;
            end loop;
            keys := Kb.GetKeyState (null);

            if Kb.Is_Key_Pressed (keys, Ks.K_ESCAPE) then
               Done := True;
            end if;

            Draw;
         end; -- declare
      end loop;
   end Main_System_Loop;

   --  ===================================================================
   --                         Abgr Procedure body
   --  ===================================================================
begin

   Args;

   if SDL.Init (SDL.INIT_VIDEO) < 0 then
      Put_Line ("Couldn't load SDL: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   Video_Flags := Vd.OPENGL;

   if Full_Screen then
         Video_Flags := Video_Flags or Vd.FULLSCREEN;
   end if;

   screen := Vd.SetVideoMode (Screen_Width, Screen_Hight, 16, Video_Flags);
   if screen = null then
      Put_Line ("Couldn't set " & C.int'Image (Screen_Width) & "x" &
                C.int'Image (Screen_Hight) & " GL video mode: " & Er.Get_Error);
      SDL.SDL_Quit;
      GNAT.OS_Lib.OS_Exit (2);
   end if;

   Vd.WM_Set_Caption ("ABGR extension", "abgr");

   Init;

   Main_System_Loop;

   SDL.SDL_Quit;
end abgr;
