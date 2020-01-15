
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

--  ----------------------------------------------------------------- --
--  WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING
--  ----------------------------------------------------------------- --
--  SERIOUS WARNING: The Ada code in this files may, at some points,
--  rely directly on pointer arithmetic which is considered very
--  unsafe and PRONE TO ERROR. The AdaSDL_Framebuffer examples are
--  more appropriate and easier to understand. They should be used in
--  replacement of this files. Please go there.
--  This file exists only for the sake of completness and to test
--  AdaSDL without the dependency of AdaSDL_Framebuffer.
--  ----------------------------------------------------------------- --
--  WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING
--  ----------------------------------------------------------------- --


with Interfaces.C.Pointers;
with Interfaces.C.Strings;
with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Command_Line;
with Ada.Characters.Handling;
with GNAT.OS_Lib;
with SDL.Types; use SDL.Types;
with SDL.Video;
with SDL.Timer;
with SDL.Error;
with SDL.Events;
with SDL.Mouse;
with SDL.Quit;
with Lib_C;

procedure Testalpha is
   package C  renames Interfaces.C;
   use type C.int;
   package CS renames Interfaces.C.Strings;
   package Uint8_IO is new Modular_IO (Uint8);
   package CL renames Ada.Command_Line;
   package CH renames Ada.Characters.Handling;
   use type SDL.Init_Flags;
   package V  renames SDL.Video;
   use type V.Surface_Flags;
   use type V.Surface_ptr;
   use type V.Palette_ptr;
   package T  renames SDL.Timer;
   package Er renames SDL.Error;
   package Ev renames SDL.Events;
   package M  renames SDL.Mouse;

   Screen_Width  : constant := 800; --  1024; --  640;
   Screen_Height : constant := 600; --   768; --  480;

   package AN is
      new Ada.Numerics.Generic_Elementary_Functions (float);

   FRAME_TICKS : constant := 1000 / 30;

   --  ===========================================================
   --  Create a "light" -- a yellowish surface with variable alpha
   function CreateLight (screen : V.Surface_ptr; radius : C.int)
      return V.Surface_ptr
   is
      trans, alphamask    : Uint8;
      the_range, addition : C.int;
      xdist, ydist        : C.int;
      skip                : Uint16;
      pixel               : Uint32;
      light               : V.Surface_ptr;

      --  use Uint16_Ptrs;
      --  use Uint16_PtrOps;
      --  buf : Uint16_ptrs.Object_Pointer;

      use Uint32_Ptrs;
      use Uint32_PtrOps;
      use type Interfaces.Unsigned_32;

      buf : Uint32_Ptrs.Object_Pointer;
   begin

      --  Create a 16 (4/4/4/4) bpp square with a full 4-bit alpha channel
      --  Note: this isn't any faster than a 32 bit alpha surface
      --  alphamask := 16#0000000F#;
      --  light := V.CreateRGBSurface (V.SWSURFACE, 2*radius, 2*radius, 16,
      --                               16#0000F000#, 16#00000F00#, alphamask);

      --  Create a 32 (8/8/8/8) bpp square with a full 8-bit alpha channel
      alphamask := 16#000000FF#;
      light := V.CreateRGBSurface (V.SWSURFACE, 2 * radius, 2 * radius, 32,
                  16#FF000000#, 16#00FF0000#, 16#0000FF00#, Uint32(alphamask));

      if light = null then
         Put_Line ("Couldn't create light: " & Er.Get_Error);
         return null;
      end if;

      --  Fill with a light a yellow-orange color
      skip :=Uint16 (light.pitch -
             Uint16 ((light.w *
             C.int (light.format.BytesPerPixel))));

      buf := To_Pointer (light.pixels);

      --  Get a transparent pixel value - we'll add alpha later
      pixel := V.MapRGBA (light.format, 16#FF#, 16#DD#, 16#88#, 0);
      for y in 0 .. light.h - 1 loop
         for x in 0 .. light.w - 1 loop
            buf.all := pixel;
            buf := Object_Pointer (Pointer (buf) + 1 );
         end loop;
         buf := Object_Pointer (Pointer (buf) + C.ptrdiff_t (skip));
      end loop;

      buf := To_Pointer (light.pixels);

      for y in 0 .. light.h - 1 loop
         for x in 0 .. light.w - 1 loop
            --  Slow distance formula (from center of light)
            xdist := x - (light.w / 2);
            ydist := y - (light.h / 2);
            the_range := C.int (
               AN.Sqrt (float (xdist**2 + ydist**2)));

            --  Scale distance to range of transparency (0-255)
            if the_range > radius then
               trans := alphamask;
            else
               --  Increasing transparency with distance
               trans := Uint8 (
                  float (the_range * C.int (alphamask)) / float (radius));

               --  Lights are very transparent
               addition := C.int (float (alphamask + 1) / 8.0);
               if  C.int (trans) + addition > C.int (alphamask) then
                  trans := alphamask;
               else
                  trans := trans + Uint8 (addition);
               end if;
            end if;

            --  We set the alpha component as the right N bits
            buf.all := Uint32 (
                       Interfaces.Unsigned_32 (buf.all) or
                       Interfaces.Unsigned_32 (255 - trans));
            Increment (Pointer(buf));
         end loop;
         buf := Object_Pointer (Pointer (buf) + C.ptrdiff_t (skip));
      end loop;
      --  Enable RLE acceleration of this alpha surface
      V.SetAlpha (light, V.SRCALPHA or V.RLEACCEL, 0);

      --  we're done!
      return light;
   end CreateLight;

   --  ===========================================================
   flashes   : Uint32 := 0;
   flashtime : Uint32 := 0;

   --  ===========================================================
   procedure FlashLight (screen : V.Surface_ptr;
                         light  : V.Surface_ptr;
                         x, y   : Uint16)
   is
      position : V.Rect;
      ticks1   : Uint32;
      ticks2   : Uint32;
   begin
      --  Easy, center light
      position.x := Sint16 (x - Uint16 (light.w / 2));
      position.y := Sint16 (y - Uint16 (light.h / 2));
      position.w := Uint16 (light.w);
      position.h := Uint16 (light.h);
      ticks1     := T.GetTicks;
      V.BlitSurface(light, null, screen, position);
      ticks2     := T.GetTicks;
      V.Update_Rect(screen, position);
      flashes    := flashes + 1;

      --  Update time spend doing alpha blitting
      flashtime  := flashtime + (ticks2 - ticks1);
   end FlashLight;

   --  ===========================================================

   sprite_visible : C.int := 0;
   sprite : V.Surface_ptr;
   backing : V.Surface_ptr;
   position : V.Rect;
   x_vel, y_vel : C.int;
   alpha_vel : C.int;

   --  ===========================================================

   function LoadSprite (screen : V.Surface_ptr; file : String)
      return C.int
   is
      converted : V.Surface_ptr;
      use Uint8_Ptrs;
   begin
      --  Load the sprite image
      sprite := V.LoadBMP (CS.New_String (file));
      if sprite = null then
         Put_Line ("Couldn't load " & file & Er.Get_Error);
         return -1;
      end if;

      --  set transparent pixel as the pixel as (0,0)
      if sprite.format.palette /= null then
         V.SetColorKey (sprite, V.SRCCOLORKEY,
                        Uint32 (To_Pointer ( sprite.pixels).all));
      end if;

      --  Convert sprite to video format
      converted := V.DisplayFormat (sprite);
      V.FreeSurface (sprite);
      if converted = null then
         Put_Line ("Couldn't convert background: " & Er.Get_Error);
         return -1;
      end if;
      sprite := converted;

      --  Create the background
      backing := V.CreateRGBSurface (
                    V.SWSURFACE, sprite.w, sprite.h,
                    8, 0, 0, 0, 0);

      if backing = null then
         V.FreeSurface (sprite);
         return -1;
      end if;

      --  Create background to video format
      converted := V.DisplayFormat (backing);
      V.FreeSurface (backing);
      if converted = null then
         Put_Line ("Couldn't convert background: " & Er.Get_Error);
         V.FreeSurface (sprite);
         return -1;
      end if;
      backing := converted;

      --  Set the initial position of the sprite
      position.x := Sint16 (screen.w - sprite.w) / 2;
      position.y := Sint16 (screen.h - sprite.h) / 2;
      position.w := Uint16 (sprite.w);
      position.h := Uint16 (sprite.h);
      x_vel := 0; y_vel := 0;
      alpha_vel := 1;

      --  we're ready to roll
      return 0;
   end LoadSprite;

   --  ===========================================================
   procedure AttractSprite (x : Uint16; y : Uint16) is
   begin
      x_vel := (C.int (x) - C.int (position.x)) / 10;
      y_vel := (C.int (y) - C.int (position.y)) / 10;
   end AttractSprite;

   --  ===========================================================
   procedure MoveSprite (screen : V.Surface_ptr;
                         light  : V.Surface_ptr)
   is
      updates : V.Rects_Array (0 .. 1);
      alpha  : Uint8;
   begin
      --  Erase the sprite if it was visible;
      if sprite_visible /= 0 then
         updates (0) := position;
         V.BlitSurface (backing, null, screen, updates (0));
      else
         --  updates (0).x := 0; updates (0).y := 0;
         --  updates (0).w := 0; updates (0).h := 0;
         updates (0) := (0, 0, 0, 0);
         sprite_visible := 1;
      end if;

      --  Since the sprite is off the screen, we can do other drawing
      --  without being overwriten by the saved area behing the sprite
      if light /= null then
         declare
            x, y : C.int;
            State : M.Mouse_State;
         begin
            M.Get_Mouse_State (State, x, y);
            FlashLight (screen, light, Uint16 (x), Uint16 (y));
         end;
      end if;

      --  Move the sprite, bounce at the wall
      position.x := position.x + Sint16 (x_vel);
      if (position.x < 0) or (C.int (position.x) >= screen.w) then
         x_vel := -x_vel;
         position.x := position.x + Sint16 (x_vel);
      end if;

      position.y := position.y + Sint16 (y_vel);
      if (position.y < 0) or (C.int (position.y) >= screen.h) then
         y_vel := -y_vel;
         position.y := position.y + Sint16 (y_vel);
      end if;

      --  Update transparency (fade in and out)
      alpha := sprite.format.alpha;
      if (C.int (alpha) + alpha_vel) < 0 then
         alpha_vel := -alpha_vel;
      elsif (C.int (alpha) + alpha_vel) > 255 then
         alpha_vel := -alpha_vel;
      end if;
      V.SetAlpha (sprite, V.SRCALPHA, alpha + Uint8 (alpha_vel));

      --  Save the area behind the sprite
      updates (1) := position;
      V.BlitSurface (screen, updates (1), backing, null);

      --  Blit the sprite onto the screen
      updates (1) := position;
      V.BlitSurface (sprite, null, screen, updates (1));

      --  Make it so!
      V.UpdateRects(screen, updates'Length, updates);

   end MoveSprite;

   --  ===========================================================
   procedure WarpSprite (screen : V.Surface_ptr; x, y : C.int)
   is
      updates : V.Rects_Array (0 .. 1);
   begin
      --  Erase, move, Draw, update
      updates (0) := position;
      V.BlitSurface (backing, null, screen, updates (0));
      position.x := Sint16 (x - sprite.w / 2);  --  Center about X
      position.y := Sint16 (y - sprite.h / 2);  --  Center about Y
      updates (1) := position;
      V.BlitSurface (screen, updates (1), backing, null);
      updates (1) := position;
      V.BlitSurface (sprite, null, screen, updates (1));
      V.UpdateRects (screen, updates'Length, updates);
   end WarpSprite;

   --  ===========================================================

   use Uint8_Ptrs;

   use Uint8_PtrOps;

   info : V.VideoInfo_ConstPtr;
   screen : V.Surface_ptr;
   video_bpp : Uint8;
   videoflags : V.Surface_Flags;
   buffer : Uint8_Ptrs.Object_Pointer;
   done : C.int;
   event : Ev.Event;
   light : V.Surface_ptr;
   mouse_pressed : C.int;
   ticks, lastticks : Uint32;
   argc : Integer := CL.Argument_Count;
   PollEvent_Result : C.int;

begin
   --  Initialize SDL
   if SDL.Init (SDL.INIT_VIDEO or SDL.INIT_JOYSTICK) < 0 then
      Put_Line ("Couldn't initialize SDL: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;
   SDL.Quit.atexit (SDL.SDL_Quit'Access);

   --  Alpha blending doesn't work well at 8-bit color
   info := V.GetVideoInfo;
   if info.vfmt.BitsPerPixel > 8 then
      video_bpp := info.vfmt.BitsPerPixel;
   else
      video_bpp := 16;
   end if;
   videoflags := V.SWSURFACE;

   while argc > 0 loop
      if (argc > 1) and then
            (CL.Argument (argc - 1) = "-bpp") and then
            CH.Is_Digit (CL.Argument (argc) (1)) then
         declare
            last : Positive;
         begin
            Uint8_IO.Get (CL.Argument (argc), video_bpp, last);
         end;
         argc := argc - 2;
         Put_Line ("-bpp" & Uint8'Image (video_bpp));
      elsif CL.Argument (argc) = "-hw" then
         videoflags := videoflags or V.HWSURFACE;
         argc := argc - 1;
         Put_Line ("-hw");
      elsif CL.Argument (argc) = "-warp" then
         videoflags := videoflags or V.HWPALETTE;
         argc := argc -1;
         Put_Line ("-warp");
      elsif CL.Argument (argc) = "-fullscreen" then
         videoflags := videoflags or V.FULLSCREEN;
         argc := argc - 1;
         Put_Line ("-fullscreen");
      else
         Put_Line ("Usage: " & CL.Command_Name & " " &
                   "[-bpp N] [-warp] [-hw] [-fullscreen]");
         GNAT.OS_Lib.OS_Exit (1);
      end if;
   end loop;


   --  Set video mode
   screen := V.SetVideoMode (Screen_Width, Screen_Height,
                             C.int (video_bpp), videoflags);
   if screen = null then
      Put_Line ("Couldn't set " & Integer'Image (Screen_Width) &
                "x" & Integer'Image (Screen_Height) &
                " video mode: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (2);
   end if;

   --  Set the surface pixels and refresh
   if V.LockSurface (screen) < 0 then
      Put_Line ("Couldn't lock the display surface: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (2);
   end if;

   buffer := To_Pointer (screen.pixels);
   for i in 0 .. screen.h - 1 loop
      buffer := To_Pointer (
         Lib_C.memset (To_Address (buffer),
                       (i * 255) / screen.h,
                       C.size_t (screen.pitch)));
      buffer := Object_Pointer (
         Pointer (buffer) + C.ptrdiff_t (screen.pitch));
   end loop;
   V.UnlockSurface (screen);
   V.UpdateRect (screen, 0, 0, 0, 0);

   --  Create the light
   light := CreateLight (screen, 82);
   if light = null then
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   --  Load the sprite
   if LoadSprite (screen, "icon.bmp") < 0 then
      V.FreeSurface (light);
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   --  Set a clipping rectangle do clip the outside edge of the screen
   declare
      clip : V.Rect;
   begin
      clip.x := 32;
      clip.y := 32;
      clip.w := Uint16 (screen.w - (2 * 32));
      clip.h := Uint16 (screen.h - (2 * 32));
      V.SetClipRect (screen, clip);
   end;

   --  Wait for a keystroke
   lastticks := T.GetTicks;
   done := 0;
   mouse_pressed := 0;
   while done = 0 loop
      --  Update the frame -- move the sprite
      if mouse_pressed /= 0 then
         MoveSprite (screen, light);
         mouse_pressed := 0;
      else
         MoveSprite (screen, null);
      end if;

      --  Slow down the loop to 30 frames / second
      ticks := T.GetTicks;

      if (ticks - lastticks) < FRAME_TICKS then
         --  if CHECK_SLEEP_GRANULARITY
         --  Put_Line ("Sleeping " &
         --            Uint32'Image (FRAME_TICKS - (ticks - lastticks)) &
         --            " ticks");
         T.SDL_Delay (FRAME_TICKS - (ticks - lastticks));
         --  if CHECK_SLEEP_GRANULARIRY
         --  Put_Line ("Slept " &
         --            Uint32'Image (FRAME_TICKS - (ticks - lastticks)) &
         --            " ticks");
      end if;
      lastticks := ticks;

      --  Check for events
      loop
         Ev.PollEventVP (PollEvent_Result, event);
         exit when PollEvent_Result = 0;
         case event.the_type is
            when Ev.MOUSEMOTION =>
               if event.motion.state /= 0 then
                  AttractSprite (event.motion.x,
                                 event.motion.y);
                  mouse_pressed := 1;
               end if;
            when Ev.MOUSEBUTTONDOWN =>
               if event.button.button = 1 then
                  AttractSprite (event.button.x,
                                 event.button.y);
                  mouse_pressed := 1;
               else
                  declare
                     area : V.Rect;
                  begin
                     area.x := Sint16 (event.button.x - 16);
                     area.y := Sint16 (event.button.y - 16);
                     area.w := 32;
                     area.h := 32;
                     V.FillRect (screen, area, 0);
                     V.Update_Rect (screen, area);
                  end;
               end if;
            when Ev.KEYDOWN =>
               --  Any keypress quits the app ...
               done := 1;
            when Ev.QUIT =>
               done := 1;
            when others => null;
         end case;
      end loop;
   end loop;
   V.FreeSurface (light);
   V.FreeSurface (sprite);
   V.FreeSurface (backing);

   --  print out some timing information
   if flashes > 0 then
      Put (Uint32'Image (flashes) &
                " alpha blits, ~");
      Put (Float (flashtime) / Float (flashes), 3, 2, 0);
      Put_Line (" ms per blit");
   end if;
end Testalpha;
