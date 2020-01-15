
-- ----------------------------------------------------------------- --
--                Copyright (C) 2001 A.M.F.Vargas                    --
--                Antonio M. F. Vargas                               --
--                Ponta Delgada - Azores - Portugal                  --
--                E-mail: avargas@adapower.net                       --
--                http://www.adapower.net/~avargas/                  --
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

with SDL.Types; use SDL.Types;
with SDL.Video;
with SDL.Error;
with SDL.Quit;
with GNAT.OS_Lib;
with Interfaces.C.Strings;
with Ada.Text_IO; use Ada.Text_IO;

--  =====================================
procedure Simple01 is
   package C renames Interfaces.C;
   package V renames SDL.Video;
   package E renames SDL.Error;
   package S renames C.Strings;
   use type SDL.Init_Flags;
   use type C.int;
   use type V.Surface_ptr;
   
   Main_Surface : SDL.Video.Surface_ptr;
   
   ch : Character;

   --  -----------------------------------
   procedure RS_Blit (
      bitmap : V.Surface_ptr;
      x      : Sint16;
      y      : Sint16)
   is
      dest : aliased V.Rect;
   begin
      dest.x := x;
      dest.y := y;
      dest.w := Uint16 (bitmap.w);
      dest.h := Uint16 (bitmap.h);
      V.BlitSurface (bitmap, null, Main_Surface, dest);
   end RS_Blit;
   
   --  ----------------------------------
   procedure Get_Background_Image (
      Surface : V.Surface_ptr;
      x       : C.int;
      y       : C.int)
   is
      Source      : aliased V.Rect;
      Destination : aliased V.Rect;
   begin
      Source.x := Sint16 (x);
      Source.y := Sint16 (y);
      Source.w := Uint16 (Surface.w);
      Source.h := Uint16 (Surface.h);
      
      Destination.x := 0;
      Destination.y := 0;
      Destination.w := Uint16 (Surface.w);
      Destination.h := Uint16 (Surface.h);

      V.BlitSurface (Main_Surface, Source, Surface, Destination);
                                  
   end Get_Background_Image;

   --  ---------------------------------
   Procedure Put_Background_Image
   is
      Image : V.Surface_ptr := V.LoadBmp ( 
                     S.New_String ("background00.bmp"));
   begin
      if Image /= null then
         RS_Blit (image, 0, 0);
         V.Flip (Main_Surface);
      end if;
   end Put_Background_Image;
      
   --  ---------------------------------
   
begin

   if SDL.Init (SDL.INIT_TIMER or SDL.INIT_VIDEO) < 0 then
      Put_Line ("Couldn't load SDL: " & C.Strings.Value (E.GetError));
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   SDL.Quit.atexit (SDL.SDL_Quit'Access);

   SDL.Video.WM_SetCaption (S.New_String (" Olá mundo "), S.Null_Ptr);

   Main_Surface := V.SetVideoMode (
                      800, 600, 16, V.SWSURFACE);
   if Main_Surface = null then
      Put_Line ("Couldn't set video mode" & S.Value (E.GetError));
      GNAT.OS_Lib.OS_Exit (1);
   end if;
   
   Put_Background_Image;
   
   Get_Immediate (ch);
   
   V.FreeSurface (Main_Surface);

end Simple01;
