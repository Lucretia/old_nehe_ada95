
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

with System;
with Interfaces.C.Strings;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Conversion;
with GNAT.OS_Lib;
with SDL.Types; use SDL.Types;
with SDL.Thread;
with SDL.Error;
with SDL.Quit;
with SDL.Timer;
with TestError_TFunc;
use  TestError_TFunc;
procedure TestError is
   package C  renames Interfaces.C;
   use type C.int;
   package CS renames Interfaces.C.Strings;
   package T  renames SDL.Thread;
   use type T.SDL_Thread_ptr;
   package Er renames SDL.Error;
   package Tm renames SDL.Timer;
   function To_Address  is
      new Ada.Unchecked_Conversion (CS.chars_ptr, System.Address);

   --  ======================================
   thread : T.SDL_Thread_ptr;
begin
   --  Load the SDL library
   if SDL.Init(0) < 0 then
      Put_Line ("Couldn't initialize SDL: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   SDL.Quit.atexit (SDL.SDL_Quit'Access);

   --  Set the error value for the main thread
   Er.Set_Error ("No worries");

   alive := 1;

   thread := T.CreateThread (ThreadFunc'Access,
                             To_Address (CS.New_String ("#1")));
   if thread = T.null_SDL_Thread_ptr then
      Put_Line ("Couldn't create thread: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   Tm.SDL_Delay (5 * 1000);

   Put_Line ("Waiting for thread #1");

   alive := 0;

   T.WaitThread (thread, null);

   Put_Line ("Main thread error string: " & Er.Get_Error);

   GNAT.OS_Lib.OS_Exit (0);
end TestError;
