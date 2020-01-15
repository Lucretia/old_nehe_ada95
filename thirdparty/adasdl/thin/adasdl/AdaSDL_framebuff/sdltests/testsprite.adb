
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

with Interfaces.C;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Command_Line;
with Ada.Characters.Handling;
with Ada.Numerics.Discrete_Random;
with GNAT.OS_Lib;
with SDL.Types; use SDL.Types;
with SDL.Video;
with SDL.Error;
with SDL.Events;
with SDL.Quit;
with SDL.Timer;
with SDL_Framebuffer;


procedure Testsprite is

   package C  renames Interfaces.C;
   use type C.int;
   use type C.double;
   use type C.unsigned;
   package CL renames Ada.Command_Line;
   package CH renames Ada.Characters.Handling;
   package Uint8_IO is new Ada.Text_IO.Modular_IO (Uint8);
   package V  renames SDL.Video;
   use type V.Surface_ptr;
   use type V.Palette_ptr;
   use type V.Surface_Flags;
   package T  renames SDL.Timer;
   package Er renames SDL.Error;
   package Ev renames SDL.Events;
   package Fb renames SDL_Framebuffer;

   NUM_SPRITES   : constant :=  100;
   MAX_SPEED     : constant :=    1;
   Screen_Width  : constant :=  640; -- 640 800 1024
   Screen_Height : constant :=  480; -- 480 600  768

   sprite : V.Surface_ptr;
   numsprites : C.unsigned;
   screen : V.Surface_ptr;
   type Rects_Array_Access is access V.Rects_Array;
   sprite_rects, positions, velocities : Rects_Array_Access;
   sprites_visible : C.int;

   --  Packages for random generation numbers

   type Screen_Width_Type is range 0 .. Screen_Width - 1;
   package Random_w is new Ada.Numerics.Discrete_Random (
      Screen_Width_Type);
   Width_Generator : Random_w.Generator;

   type Screen_Height_Type is range 0 .. Screen_Height - 1;
   package Random_h is new Ada.Numerics.Discrete_Random (
      Screen_Height_Type);
   Height_Generator : Random_h.Generator;

   type Velocity_Type is range 0 .. MAX_SPEED * 2 + 1;
   package Random_Velocity is new Ada.Numerics.Discrete_Random (
      Velocity_Type);
   Velocity_Generator : Random_Velocity.Generator;

   --  ##################################
   function LoadSprite (screen : V.Surface_ptr; file : String)
      return C.int
   is
      temp : V.Surface_ptr;
   begin
      --  Load the sprite image
      sprite := V.LoadBMP (file);
      if sprite = null then
         Put_Line ("Couldn't load " & file & " : " & Er.Get_Error);
         return -1;
      end if;

      --  Set transparent pixel as the pixel at (0,0)
      if sprite.format.palette /= null then
         V.SetColorKey (
            sprite,
            (V.SRCCOLORKEY or V.RLEACCEL),
            Fb.Get_Framebuffer (sprite).all);
      end if;

      --  Convert sprite to video format
      temp := V.DisplayFormat(sprite);
      if temp = null then
         Put_Line ("Couldn't convert background: " & Er.Get_Error);
         return -1;
      end if;
      sprite := temp;

      --  we're ready to roll. :)
      return 0;
   end LoadSprite;

   --  ##################################

   procedure MoveSprites (screen : V.Surface_ptr; background : Uint32)
   is
      nupdates : C.unsigned;
      area : V.Rect;
      type Rect_Access is access all V.Rect;
      position, velocity : Rect_Access;
   begin
      nupdates := 0;
      --  Erase all sprites if necessary
      if sprites_visible /= 0 then
         V.FillRect(screen, null, background);
      end if;

      --  Move the sprite, bounce at the wall, and draw
      for i in sprite_rects'Range loop
         position :=  positions(i)'Access;
         velocity :=  velocities(i)'Access;
         position.x := position.x + velocity.x;
         if (position.x < 0) or (C.int (position.x) >= screen.w) then
            velocity.x := -velocity.x;
            position.x := position.x + velocity.x;
         end if;
         position.y := position.y + velocity.y;
         if (position.y < 0) or (C.int (position.y) >= screen.h) then
            velocity.y := -velocity.y;
            position.y := position.y + velocity.y;
         end if;

         --  Blit the sprite onto the screen
         area := position.all;
         V.BlitSurface (sprite, null, screen, area);
         sprite_rects (nupdates) := area;
         nupdates := nupdates + 1;
      end loop;

      --  Update the screen
      if (screen.flags and V.DOUBLEBUF) = V.DOUBLEBUF then
         V.Flip (screen);
      else
         V.UpdateRects (screen, C.int (nupdates), sprite_rects.all);
      end if;

      sprites_visible := 1;
   end MoveSprites;

   --  ##################################
   function FastestFlags(flags : V.Surface_Flags)
      return V.Surface_Flags
   is
      info : V.VideoInfo_ConstPtr;
      new_flags : V.Surface_Flags := flags;
   begin

      --  Hardware aceleration is only used in fullscreen mode
      new_flags := new_flags or V.FULLSCREEN;

      --  Check for various video capabilities
      info := V.GetVideoInfo;
      if (info.blit_hw_CC /= 0) and (info.blit_fill /= 0) then
         --  We use accelerated colorkeying and color filling
         new_flags := new_flags or V.HWSURFACE;
      end if;
      --  If we have enough video memory, and will use accelerated
      --  blits directly to it, then use page flipping.
      if (new_flags and V.HWSURFACE) = V.HWSURFACE then
         --  Direct hardware blitting without double-buffering
         --  causes really bad flickering.
         if info.video_mem > Screen_Width * Screen_Height then
            new_flags := new_flags or V.DOUBLEBUF;
         else
            new_flags := new_flags and not V.HWSURFACE;
         end if;
      end if;

      --  Return the flags
      return new_flags;

   end FastestFlags;

   --  ##################################
   video_bpp : Uint8;
   videoflags : V.Surface_Flags;
   background : Uint32;
   done : C.int;
   event : Ev.Event;
   and_then, now, frames : Uint32;
   argc : Natural := CL.Argument_Count;
   PollEvent_Result : C.int;

   --  ##################################

begin

   if SDL.Init (SDL.INIT_VIDEO) < 0 then
      Put_Line ("Couldn't initialize SDL: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   SDL.Quit.atexit (SDL.SDL_Quit'Access);

   numsprites := NUM_SPRITES;
   videoflags := V.SWSURFACE or V.ANYFORMAT;
   video_bpp := 8;

   Put_Line ("Número de argumentos: " & Natural'Image (argc));

   while argc > 0 loop
      if (argc > 1) and then
            (CL.Argument (argc - 1) = "-bpp") and then
            CH.Is_Digit (CL.Argument (argc) (1)) then
         declare
            use Uint8_IO;
            last : Positive;
         begin
            Get (CL.Argument (argc), video_bpp, last);
         end;
         videoflags := videoflags and not V.ANYFORMAT;
         argc := argc - 2;
         Put_Line ("-bpp" & Uint8'Image (video_bpp));
      elsif CL.Argument (argc) = "-fast" then
         videoflags := FastestFlags (videoflags);
         argc := argc - 1;
         Put_Line ("-fast");
      elsif CL.Argument (argc) = "-hw" then
         videoflags := videoflags xor V.DOUBLEBUF;
         argc := argc -1;
         Put_Line ("-hw");
      elsif CL.Argument (argc) = "-fullscreen" then
         videoflags := videoflags xor V.FULLSCREEN;
         argc := argc - 1;
         Put_Line ("-fullscreen");
      elsif CH.Is_Digit (CL.Argument (argc) (1)) then
         declare
            package unsigned_IO is new Modular_IO (C.unsigned);
            use unsigned_IO;
            last : Positive;
         begin
            Get (CL.Argument (argc), numsprites, last);
            argc := argc - 1;
            Put ("numsprites: "); Put (numsprites);
            New_Line;
         end;
      else
         Put_Line ("Usage: " & CL.Command_Name & " " &
                   "[-bpp N] [-hw] [-flip] [-fast] " &
                   "[-fullscreen] [numsprites]");
         GNAT.OS_Lib.OS_Exit (1);
      end if;
   end loop;

   sprite_rects := new V.Rects_Array (0 .. numsprites - 1);
   positions    := new V.Rects_Array (0 .. numsprites - 1);
   velocities   := new V.Rects_Array (0 .. numsprites - 1);

   --  Set video mode
   screen := V.SetVideoMode (Screen_Width, Screen_Height,
                             C.int (video_bpp), videoflags);
   if screen = null then
      Put_Line ("Couldn't set " & Integer'Image (Screen_Width) &
                "x" & Integer'Image (Screen_Height) &
                " video mode: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   --  Load the sprite
   if LoadSprite (screen, "icon.bmp") < 0 then
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   Random_w.Reset (Width_Generator,  17);
   Random_h.Reset (Height_Generator, 13);

   for i in 0 .. numsprites - 1 loop
      positions (i).x := Sint16 (Random_w.Random (Width_Generator));
      positions (i).y := Sint16 (Random_h.Random (Height_Generator));
      positions (i).w := Uint16 (sprite.w);
      positions (i).h := Uint16 (sprite.h);
      velocities (i).x := 0;
      velocities (i).y := 0;
      while (velocities (i).x = 0) and (velocities (i).y = 0) loop
         velocities (i).x := Sint16 (Random_Velocity.Random (Velocity_Generator)
            - MAX_SPEED);
         velocities (i).y := Sint16 (Random_Velocity.Random (Velocity_Generator)
            - MAX_SPEED);
      end loop;
   end loop;
   background := V.MapRGB (screen.format, 16#00#, 16#00#, 16#00#);

   --  Print out information about our surfaces
   Put_Line ("Screen is at " & Uint8'Image (screen.format.BitsPerPixel) &
             " bits per pixel");
   if (screen.flags and V.HWSURFACE) = V.HWSURFACE then
      Put_Line ("Screen is in video memory");
   else
      Put_Line ("Screen is in system memory");
   end if;

   if (screen.flags and V.DOUBLEBUF) = V.DOUBLEBUF then
      Put_Line ("Screen has double-buffering enabled");
   end if;

   if (sprite.flags and V.HWSURFACE) = V.HWSURFACE then
      Put_Line ("Sprite is in video memory");
   else
      Put_Line ("Sprite in in system memory");
   end if;

   --  Run a sample blit to trigger blit aceleration
   declare
      dst : V.Rect;
   begin
      dst.x := 0;
      dst.y := 0;
      dst.w := Uint16 (sprite.w);
      dst.h := Uint16 (sprite.h);
      V.BlitSurface (sprite, null, screen, dst);
      V.FillRect(screen, dst, background);
   end;

   if (sprite.flags and V.HWACCEL) = V.HWACCEL then
      Put_Line ("Sprite blit uses hardware acceleration");
   end if;

   if (sprite.flags and V.RLEACCEL) = V.RLEACCEL then
      Put_Line ("Sprite blit uses RLE acceleration");
   end if;

   --  Loop, blitting sprite and waiting for a keystroke
   frames := 0;
   and_then := T.GetTicks;
   done := 0;
   sprites_visible := 0;
   while done = 0 loop
      --  Check for events
      frames := frames + 1;
      loop
         Ev.PollEventVP (PollEvent_Result, event);
         exit when PollEvent_Result = 0;
         case event.the_type is
            when Ev.KEYDOWN =>
               --  any keypress quits teh app
               done := 1;
            when Ev.QUIT =>
               done := 1;
            when others => null;
         end case;
      end loop;
      MoveSprites (screen, background);
   end loop;
   V.FreeSurface (sprite);

   --  Print out some timing information
   now := T.GetTicks;
   if now > and_then then
      Put (Float (frames) * 1000.0 / Float (now - and_then),
           3, 2, 0);
      Put_Line (" frames per second");
   end if;

end Testsprite;
