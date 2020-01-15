
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

with System.OS_Interface;
with Interfaces.C.Strings;
with Lib_C;
with Ada.Text_IO; use Ada.Text_IO;
with GNAT.OS_Lib;
with SDL.Error;
with SDL.Quit;
with SDL.Mutex;
with SDL.Types; use SDL.Types;
with SDL.Thread;

with TestLock_Sprogs;
use  TestLock_Sprogs;

procedure TestLock is
   package C  renames Interfaces.C;
   use type C.int;
   package CS renames Interfaces.C.Strings;
   package Er renames SDL.Error;
   package M  renames SDL.Mutex;
   use type M.mutex_ptr;
   package T  renames SDL.Thread;
   use type T.SDL_Thread_ptr;

   maxproc : Integer := 6;
   Dummy_int : C.int;
begin
   --  Load the SDL library
   if SDL.Init (0) < 0 then
      Put_Line (Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;
   SDL.Quit.atexit (SDL.SDL_Quit'Access);

   mutex := M.CreateMutex;
   if mutex = M.null_mutex_ptr then
      Put_Line ("Couldn't create mutex: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   mainthread := T.ThreadID;
   Put_Line ("Main thread: " & Uint32'Image (mainthread));

   SDL.Quit.atexit (printid'Access);

   for i in 0 .. maxproc - 1 loop
      threads (i) := T.CreateThread (Run'Access, System.Null_Address);
      if threads (i) = T.null_SDL_Thread_ptr then
         Put_Line ("Couldn't create thread!");
      end if;
   end loop;
   Lib_C.Set_Signal (System.OS_Interface.SIGINT, terminating'Access);
   Dummy_int := Run (System.Null_Address);

   GNAT.OS_Lib.OS_Exit (0); --  Never reached
end TestLock;
