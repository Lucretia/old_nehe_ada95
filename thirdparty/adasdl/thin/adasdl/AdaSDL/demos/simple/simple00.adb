
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

with SDL.Video;
with SDL.Error;
with SDL.Quit;
with GNAT.OS_Lib;
with Interfaces.C.Strings;
with Ada.Text_IO; use Ada.Text_IO;


procedure Simple00 is
   package C renames Interfaces.C;
   package V renames SDL.Video;
   package E renames SDL.Error;
   package S renames C.Strings;
   use type SDL.Init_Flags;
   use type C.int;
   use type V.Surface_ptr;
   
   Main_Surface : SDL.Video.Surface_ptr;
   
   ch : Character;
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

   Get_Immediate (ch);
   
   V.FreeSurface (Main_Surface);

end Simple00;
