
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
with Ada.Text_IO; use Ada.Text_IO;
with GNAT.OS_Lib;
with SDL.Thread;
with SDL.Error;
with SDL.Quit;
with Lib_C;

with TortureThread_Sprogs;
use  TortureThread_Sprogs;

procedure TortureThread is

   package C  renames Interfaces.C;
   use type C.int;
   package CS  renames Interfaces.C.Strings;
   package Tr  renames SDL.Thread;
   use type Tr.SDL_Thread_ptr;
   package Er  renames SDL.Error;

   type threads_Array is
      array (C.int range 0 .. NUMTHREADS - 1) of Tr.SDL_Thread_ptr;
   pragma Convention (C, threads_Array);
   threads : threads_Array;

begin

   --  Load the SDL library
   if SDL.Init(0) < 0 then
      Put_Line ("Couldn't initialize SDL: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;
   SDL.Quit.atexit (SDL.SDL_Quit'Access);

   Lib_C.Set_Signal (System.OS_Interface.SIGSEGV, null);
   for i in threads'Range loop
      time_for_threads_to_die (i) := 0;
      threads (i) := Tr.CreateThread (ThreadFunc'Access, To_Address (i));
      if threads (i) = Tr.null_SDL_Thread_ptr then
         Put_Line ("Couldn't create thread: " & Er.Get_Error);
         GNAT.OS_Lib.OS_Exit (1);
      end if;
   end loop;

   for i in time_for_threads_to_die'Range loop
      time_for_threads_to_die (i) := 1;
   end loop;

   for i in reverse threads'Range loop
      Tr.WaitThread (threads (i), null);
   end loop;

   GNAT.OS_Lib.OS_Exit (0); -- Never reached

end TortureThread;
