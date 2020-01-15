
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
with SDL.Types; use SDL.Types;
with SDL.Mutex;
with SDL.Thread;

package TestLock_Sprogs is
   package T  renames SDL.Thread;
   package M  renames SDL.Mutex;
   mutex : M.mutex_ptr;
   mainthread : Uint32;
   type Threads_Array is array (0 .. 5) of T.SDL_Thread_ptr;
   threads : Threads_Array;

   procedure printid;
   pragma Convention (C, printid);

   procedure terminating (sig : C.int);
   pragma Convention (C, terminating);

   procedure closemutex (sig : C.int);
   pragma Convention (C, closemutex);

   function Run (data : System.Address) return C.int;
   pragma Convention (C, Run);

end TestLock_Sprogs;
