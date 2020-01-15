
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

with Lib_C;
with Interfaces.C.Strings;
with Interfaces.C.Pointers;
with Ada.Numerics.Discrete_Random;
with Ada.Calendar;
with Ada.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;
with GNAT.OS_Lib;
with SDL.Video;
with SDL.Types; use SDL.Types;
with SDL.Events;
with SDL.Error;
with SDL.Keysym;
with SDL.Mouse;
with SDL_Framebuffer;

procedure graywin is
   package C  renames Interfaces.C;
   use  type C.int;
   package CS renames Interfaces.C.Strings;
   package CL renames Ada.Command_Line;
   package V  renames SDL.Video;
   use type V.Surface_Flags;
   use type V.Surface_ptr;
   package Ev renames SDL.Events;
   package Er renames SDL.Error;
   package Ks renames SDL.Keysym;
   use type Ks.Key;
   package M  renames SDL.Mouse;
   package Fb renames SDL_Framebuffer;

   Screen_Width  : constant := 640;
   Screen_Height : constant := 480;

   --  ===============================================
   seeded : Boolean := False;
   --  Draw a randomly sized and colored box centered about (X,Y)
   procedure DrawBox (screen : V.Surface_ptr;
                      X : C.int;
                      Y : C.int)
   is
      area  : V.Rect;
      color : Uint32;

      type Screen_Width_Type is range 0 .. Screen_Width - 1;
      package Random_w is new Ada.Numerics.Discrete_Random (
         Screen_Width_Type);
      Width_Generator : Random_w.Generator;
      use Random_w;

      type Screen_Height_Type is range 0 .. Screen_Height - 1;
      package Random_h is new Ada.Numerics.Discrete_Random (
         Screen_Height_Type);
      Height_Generator : Random_h.Generator;
      use Random_h;

      type Color_Range is range 0 .. 255;
      package Random_Color is new Ada.Numerics.Discrete_Random (
         Color_Range);
      Color_Generator : Random_Color.Generator;
      use Random_Color;

      use Ada.Calendar;
   begin
      --  See the random number generator
      --  if not seeded then
         Reset (Width_Generator);
         Reset (Height_Generator);
         Reset (Color_Generator);
      --     seeded := True;
      --   end if;

      --  Get the bounds of the rectangle
      area.w := Uint16 (Random (Width_Generator));
      area.h := Uint16 (Random (Height_Generator));
      area.x := Sint16 (Uint16 (X) - (area.w / 2));
      area.y := Sint16 (Uint16 (Y) - (area.h / 2));
      color  := Uint32 (Random (Color_Generator));
      Put_Line ("Color: " & Uint32'Image (color) & ";   " &
                "x: " & Sint16'Image (area.x) & ";   " &
                "y: " & Sint16'Image (area.y) & ";   " &
                "w: " & Uint16'Image (area.w) & ";   " &
                "h: " & Uint16'Image (area.h) & ";   ");
      --  Do is!
      --  Read the note in the "area" declaration point.
      V.FillRect (screen, area, color);
      V.Update_Rect (screen, area);
   end DrawBox;

   --  ===============================================
   function CreateScreen (w, h: Uint16; bpp : Uint8; flags : V.Surface_Flags)
      return V.Surface_ptr
   is
      screen : V.Surface_ptr;
      use type C.size_t;
      palette : V.Colors_Array (0 .. 255);

      buffer : Fb.Framebuffer_8bPointer;

   begin

      --  Set video mode
      screen := V.SetVideoMode (C.int (w), C.int (h),
                                C.int (bpp), V.Surface_Flags (flags));
      if screen = null then
         Put_Line ("Couldn't set display mode: " & Er.Get_Error);
         return null;
      end if;

      Put ("Screen is in ");
      if (screen.flags and V.FULLSCREEN) /= 0 then
         Put_Line ("fullscreen");
      else
         Put_Line ("windowed");
      end if;

      --  Set a gray colormap, reverse order from white to black
      for i in palette'Range loop
         palette (i)   := (255 - Uint8 (i),
                           255 - Uint8 (i),
                           255 - Uint8 (i), 0);
      end loop;
      V.SetColors (screen, palette, C.int (palette'First), palette'Length);

      --  Set the surface pixels and refresh!
      if V.LockSurface (screen) < 0 then
         Put_Line ("Couldn't lock display surface: " & Er.Get_Error);
         return null;
      end if;

      buffer := Fb.Get_Framebuffer (screen);
      for i in 0 .. screen.h - 1 loop
         Fb.Paint_Line_Unchecked (screen, buffer, i * 255 / screen.h);
         buffer := Fb.Next_Line_Unchecked (screen, buffer);
      end loop;
      V.UnlockSurface (screen);
      V.UpdateRect (screen, 0, 0, 0, 0);
      return screen;
   end CreateScreen;

   --  ===============================================
   screen : V.Surface_ptr;
   videoflags : V.Surface_Flags;
   done : Boolean;
   event : Ev.Event;
   argc : Integer := CL.Argument_Count;
   Wait_Event_Result : C.int;
begin
   --  Initialize SDL
   if SDL.Init (SDL.INIT_VIDEO) < 0 then
      Put_Line ("Couldn't initialize SDL: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   --  See if we try to get a hardware colormap */
   videoflags := V.SWSURFACE;

   while argc > 0 loop
      if CL.Argument (argc) = "-hw" then
         videoflags := videoflags or V.HWSURFACE;
         argc := argc - 1;
      elsif CL.Argument (argc) = "-warp" then
         videoflags := videoflags or V.HWPALETTE;
         argc := argc -1;
      elsif CL.Argument (argc) = "-fullscreen" then
         videoflags := videoflags or V.FULLSCREEN;
         argc := argc - 1;
      else
         Put_Line ("Usage: " & CL.Command_Name &
                   " [-hw] [-warp] [-fullscreen]");
         GNAT.OS_Lib.OS_Exit (1);
      end if;
   end loop;

   --  Set video mode
   screen := CreateScreen (Screen_Width, Screen_Height,
                             8, videoflags);
   if screen = null then
      GNAT.OS_Lib.OS_Exit (2);
   end if;

   --  Wait for a keystroke
   done := False;
   loop
      Ev.Wait_Event (Wait_Event_Result, event);
      exit when done or (Wait_Event_Result = 0);
      case event.the_type is
         when Ev.MOUSEBUTTONDOWN =>
            DrawBox (screen, C.int (event.button.x),
                     C.int (event.button.y));
         when Ev.KEYDOWN =>
            --  Ignore ALT-TAB for windows
            if   event.key.keysym.sym = Ks.K_LALT
                 or event.key.keysym.sym = Ks.K_TAB then
               null;
            elsif event.key.keysym.sym = Ks.K_SPACE then
               --  Center the mouse om <SPACE>
               M.WarpMouse (Screen_Width / 2, Screen_Height / 2);
            elsif event.key.keysym.sym = Ks.K_RETURN then
               --  Toggle fullscreen mode on <RETURN>
               videoflags := videoflags xor V.FULLSCREEN;
               screen := CreateScreen (Uint16 (screen.w), Uint16 (screen.h),
                                       screen.format.BitsPerPixel,
                                       videoflags);
               if screen = null then
                  Put_Line ("Couldn't toggle fullscreen mode");
                  done := True;
               end if;
            else
               --  Any other key quits the application...
               done := True;
            end if;
         when Ev.QUIT =>
            done := True;
         when others => null;
      end case;
   end loop;
   SDL.SDL_Quit;
end graywin;
