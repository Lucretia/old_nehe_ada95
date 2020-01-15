
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

with Interfaces.C.Strings;
with Ada.Text_IO; use Ada.Text_IO;
with GNAT.OS_Lib;
with SDL.Types; use SDL.Types;
with SDL.Video;
with SDL.Error; use SDL.Error;

procedure Testvidinfo is

   package C  renames Interfaces.C;
   use type C.int;
   package CS renames Interfaces.C.Strings;
   package Uint32_IO is new Ada.Text_IO.Modular_IO (Uint32);
   use Uint32_IO;
   package V  renames SDL.Video;
   use type V.Palette_ptr;
   use type V.Rect_ptr;
   use type V.Rect_ptr_ptr;
   use V.Rect_ptr_PtrOps;

   package Er renames SDL.Error;

   info : V.VideoInfo_ConstPtr;

   modes : V.Rect_ptr_ptr;

begin

   if SDL.Init (SDL.INIT_VIDEO) < 0 then
      Put_Line ("Couldn't initialize SDL: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   info := V.GetVideoInfo;

   Put_Line ("Current display: " &
             Uint8'Image (info.vfmt.BitsPerPixel) &
             " bits-per-pixel");

   if info.vfmt.palette = null then
      Put      ("               Red Mask   = ");
      Put      (info.vfmt.Rmask, Width => 12, Base => 16);
      New_Line;
      Put      ("               Green Mask = ");
      Put      (info.vfmt.Gmask, Width => 12, Base => 16);
      New_Line;
      Put      ("               Blue Mask  = ");
      Put      (info.vfmt.Bmask, Width => 12, Base => 16);
      New_Line;
   end if;

   --  Print available fullscreen video images

   --  This is C style unsafe programming
   --  it must change in the future.
   modes := V.ListModes (null, V.FULLSCREEN);
   if 0 = V.RectPP_To_Int (modes) then
      Put_Line ("No available fullscreen video modes");
   elsif -1 = V.RectPP_To_Int (modes) then
      Put_Line ("No special fullscreen video modes");
   else
      Put_Line ("Fullscreen video modes");
      declare
         tmp_mode : V.Rect_ptr_PtrOps.Pointer;
      begin
         tmp_mode := Pointer (modes);
         --  for i in 1 .. 3 loop
         while tmp_mode.all /= null loop
            Put_Line ("         " &
                      Uint16'Image (tmp_mode.all.w) &
                      " x" & Uint16'Image (tmp_mode.all.h));
            tmp_mode := tmp_mode + 1;
         end loop;
      end;
   end if;

   if info.wm_available /= 0 then
      Put_Line ("A window manager is available");
   end if;

   if info.hw_available /= 0 then
      Put_Line ("Hardware surfaces are available (" &
                Uint32'Image (info.video_mem) &
                "K video memory)");
   end if;

   if info.blit_hw /= 0 then
      Put_Line ("Copy blits between hardware surfaces are acelerated");
   end if;

   if info.blit_hw_CC /= 0 then
      Put_Line ("Colorkey blits between hardware surfaces are acelerated");
   end if;

   if info.blit_hw_A /= 0 then
      Put_Line ("Alpha blits between hardware surfaces are acelerated");
   end if;

   if info.blit_sw /= 0 then
      Put_Line ("Copy blits from software surfaces to hardware surfaces are acelerated");
   end if;

   if info.blit_sw_CC /= 0 then
      Put_Line ("Colorkey blits from software surfaces to " &
                "hardware surfaces are acelerated");
   end if;

   if info.blit_sw_A /= 0 then
      Put_Line ("Alpha blits from software surfaces to hardware surfaces are acelerated");
   end if;

   if info.blit_fill /= 0 then
      Put_Line ("Color fills on hardware surfaces are accelerated");
   end if;


   SDL.SDL_Quit;

end Testvidinfo;
