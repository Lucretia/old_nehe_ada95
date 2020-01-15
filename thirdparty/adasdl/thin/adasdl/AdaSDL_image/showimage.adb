
--
--    SHOWIMAGE: Port to the Ada programming language of a test application for the
--    the SDL image library.
--
--    The original code was written in C by Sam Lantinga  http://www.libsdl.org.
--
--    This program is free software; you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation; either version 2 of the License, or
--    (at your option) any later version.
--
--    This program is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.
--
--    You should have received a copy of the GNU General Public License
--    along with this program; if not, write to the Free Software
--    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--
--    Ada code written by:
--                Antonio M. F. Vargas                               --
--                Ponta Delgada - Azores - Portugal                  --
--                E-mail: avargas@adapower.net                       --
--                http://www.adapower.net/~avargas                   --

with System;
with Interfaces.C.Strings;
with Ada.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;
with GNAT.OS_Lib;
with SDL.Video;
with SDL.Types; use SDL.Types;
with SDL.Byteorder;
with SDL.Byteorder.Extra;
with SDL.Quit;
with SDL.Error;
with SDL.Events;
with SDL_Image;

procedure ShowImage is
   package C  renames Interfaces.C;
   use type C.int;
   package It renames Interfaces;
   use type It.Unsigned_32;
   package CL renames Ada.Command_Line;
   package CS renames Interfaces.C.Strings;
   package V  renames SDL.Video;
   use type V.Palette_ptr;
   use type V.Surface_ptr;
   use type V.Surface_Flags;
   package Er renames SDL.Error;
   package Ev renames SDL.Events;
   use type Ev.Event_Type;
   package IMG renames SDL_Image;

   --  Draw a Gimpish background pattern to show transparency in the image
   --  ======================================
   procedure draw_background (screen : V.Surface_ptr) is
      use Uint8_PtrOps;
      use Uint8_Ptrs;
      use Uint16_PtrOps;
      use Uint16_Ptrs;
      use Uint32_PtrOps;
      use Uint32_Ptrs;
      use SDL.Byteorder;
      use SDL.Byteorder.Extra;
      package It  renames Interfaces;
      dst  : System.Address := screen.pixels;
      bpp  : C.int := C.int (screen.format.BytesPerPixel);
      type col_Array is array (It.Unsigned_32 range 0 .. 1) of It.Unsigned_32;
      col : col_Array;
      IS_LIL_ENDIAN : boolean := BYTE_ORDER = LIL_ENDIAN;
   begin
      col (0) := It.Unsigned_32 (V.MapRGB (screen.format, 16#66#, 16#66#, 16#66#));
      col (1) := It.Unsigned_32 (V.MapRGB (screen.format, 16#99#, 16#99#, 16#99#));
      for y in It.Unsigned_32 range 0 .. It.Unsigned_32 (screen.h) - 1 loop
         for x in It.Unsigned_32 range 0 .. It.Unsigned_32 (screen.w) loop
            --  use an 8x8 checkboard pattern
            declare
               cl : It.Unsigned_32 := col (It.Shift_Right (x xor y, 3) and 1);
            begin
               case bpp is --  The following code is not very nice. Suggestions?
                  when 1 =>
                     Uint8_PtrOps.Pointer (
                        Uint8_PtrOps.Pointer (Uint8_Ptrs.To_Pointer (dst))
                        + C.ptrdiff_t (x)
                     ).all := Uint8 (cl);
                  when 2 =>
                     Uint16_PtrOps.Pointer (
                        Uint16_PtrOps.Pointer (Uint16_Ptrs.To_Pointer (dst))
                        + C.ptrdiff_t (x)
                     ).all := Uint16 (cl);
                  when 3 =>
                     if IS_LIL_ENDIAN then
                        Uint8_PtrOps.Pointer (
                           Uint8_PtrOps.Pointer (Uint8_Ptrs.To_Pointer (dst))
                           + C.ptrdiff_t (x * 3)
                        ).all := Uint8 (cl);
                        Uint8_PtrOps.Pointer (
                           Uint8_PtrOps.Pointer (Uint8_Ptrs.To_Pointer (dst))
                           + C.ptrdiff_t (x * 3 + 1)
                        ).all := Uint8 (It.Shift_Right (cl, 8));
                        Uint8_PtrOps.Pointer (
                           Uint8_PtrOps.Pointer (Uint8_Ptrs.To_Pointer (dst))
                           + C.ptrdiff_t (x * 3 + 2)
                        ).all := Uint8 (It.Shift_Right (cl, 16));
                     else
                        Uint8_PtrOps.Pointer (
                           Uint8_PtrOps.Pointer (Uint8_Ptrs.To_Pointer (dst))
                           + C.ptrdiff_t (x * 3)
                        ).all := Uint8 (It.Shift_Right (cl, 16));
                        Uint8_PtrOps.Pointer (
                           Uint8_PtrOps.Pointer (Uint8_Ptrs.To_Pointer (dst))
                           + C.ptrdiff_t (x * 3 + 1)
                        ).all := Uint8 (It.Shift_Right (cl, 8));
                        Uint8_PtrOps.Pointer (
                           Uint8_PtrOps.Pointer (Uint8_Ptrs.To_Pointer (dst))
                           + C.ptrdiff_t (x * 3 + 2)
                        ).all := Uint8 (cl);
                     end if;
                  when 4 =>
                     Uint32_PtrOps.Pointer (
                        Uint32_PtrOps.Pointer (Uint32_Ptrs.To_Pointer (dst))
                        + C.ptrdiff_t (x)
                     ).all := Uint32 (cl);
                  when others => null;
               end case;
            end;
            dst := Uint8_Ptrs.To_Address (Uint8_Ptrs.Object_Pointer (
               Uint8_PtrOps.Pointer (Uint8_Ptrs.To_Pointer (dst))
               + C.ptrdiff_t (screen.pitch)));
         end loop;
      end loop;
   end draw_background;

   --  ======================================
   screen, image : V.Surface_ptr;
   depth : C.int;

begin

   --  Check command line usage
   if CL.Argument_Count = 0 then
      Put_Line ("Usage: " & CL.Command_Name & " <image_file>");
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   --  Initialize the SDL library
   if SDL.Init (SDL.INIT_VIDEO) < 0 then
      Put_Line ("Couldn't initialize SDL: " & IMG.Get_Error);
      GNAT.OS_Lib.OS_Exit (255);
   end if;

   --  Open the image file
   image := IMG.Load (CL.Argument (1));
   if image = null then
      Put_Line ("Couldn't load " & CL.Argument (1)& ": " & IMG.Get_Error);
      SDL.SDL_Quit;
      GNAT.OS_Lib.OS_Exit (2);
   end if;

   V.WM_Set_Caption (CL.Argument (1), "showimage");

   --  Create a display for the image
   depth := V.VideoModeOK (image.w, image.h, 32, V.SWSURFACE);

   --  Use the deepest native mode, except that we emulate 32bpp for
   --  viewing non-indexed images on 8bpp screens
   if image.format.BytesPerPixel > 1 and depth = 8 then
      depth := 32;
   end if;

   screen := V.SetVideoMode (image.w, image.h, depth, V.SWSURFACE);
   if screen = null then
      Put_Line ("Couldn't set "
                & C.int'Image (image.w) & "x"
                & C.int'Image (image.h) & "x"
                & C.int'Image (depth)
                & " video mode: "
                & IMG.Get_Error);
      SDL.SDL_Quit;
      GNAT.OS_Lib.OS_Exit (3);
   end if;

   --  set the palette, if one exists
   if image.format.palette /= null then
      V.SetColors (screen, image.format.palette.colors,
                   0, image.format.palette.ncolors);
   end if;

   --  Draw a background pattern if the surface has transparency
   if (image.flags and (V.SRCALPHA or V.SRCCOLORKEY)) /= 0 then
      null;
   end if;

   --  Display the image
   V.BlitSurface (image, null, screen, null);
   V.UpdateRect (screen, 0, 0, 0, 0);

   --  Wait for any keyboard or mouse input
   for i in Ev.NOEVENT .. Ev.NUMEVENTS - 1 loop
      case i is
         when Ev.KEYDOWN | Ev.MOUSEBUTTONDOWN | Ev.QUIT =>
            --  Valid event, keep it
            null;
         when others =>
            --  We don't want this event
            Ev.EventState (Ev.Event_Type (i), Ev.IGNORE);
      end case;
   end loop;

   Ev.WaitEvent (null);

   --  We're done!
   V.FreeSurface (image);
   SDL.SDL_Quit;

   GNAT.OS_Lib.OS_Exit (0);
end ShowImage;
