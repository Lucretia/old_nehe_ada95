
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

with Interfaces.C.Pointers;
with Interfaces.C.Strings;
with SDL.Types; use SDL.Types;
with SDL.Video;
with SDL.Events;
with SDL.Error;

package Testwm_Sprogs is

   package  C  renames Interfaces.C;
   package  CS renames Interfaces.C.Strings;

   package  V  renames SDL.Video;
   package  Er renames SDL.Error;
   package  Ev renames SDL.Events;

   type Icon_Mask_Array_Access is access V.Icon_Mask_Array;

   use Uint8_Ptrs;

   use Uint8_PtrOps;

   procedure LoadIconSurface (
      file   : in string;
      maskp  : in out Icon_Mask_Array_Access;
      icon   : out V.Surface_ptr);
   procedure HotKey_ToggleFullScreen;
   procedure HotKey_ToggleGrab;
   procedure HotKey_Iconify;
   procedure HotKey_Quit;
   function  FilterEvents (event : Ev.Event_ptr) return C.int;
   pragma Convention (C, FilterEvents);

end Testwm_Sprogs;
