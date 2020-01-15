
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
with Ada.Unchecked_Conversion;
with Ada.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Characters.Handling;
with GNAT.OS_Lib;
with SDL.Thread;
with SDL.Quit;
with SDL.Error;
with SDL.Types; use SDL.Types;
with SDL.Timer;
with TestSem_Sprogs;
use  TestSem_Sprogs;

procedure TestSem is

   package C renames Interfaces.C;
   use type C.int;
   package CS renames Interfaces.C.Strings;
   package CL renames Ada.Command_Line;
   package CH renames Ada.Characters.Handling;
   package T  renames SDL.Thread;
   package Tm renames SDL.Timer;
   package Er renames SDL.Error;
   package Int_IO is new Integer_IO (C.int);

   function To_Address is new Ada.Unchecked_Conversion (C.int, System.Address);

   NUM_THREADS : constant := 10;
   type Threads_Array is
      array (C.int range 0 .. NUM_THREADS - 1) of aliased T.SDL_Thread_ptr;
   threads : Threads_Array;
   init_sem : C.int;

begin
   if CL.Argument_Count < 1
       or (CL.Argument_Count >= 1
            and then  not CH.Is_Digit (CL.Argument (1) (1))) then
      Put_Line ("Usage: " & CL.Command_Name & " init_value");
      GNAT.OS_Lib.OS_Exit (0);
   end if;

   --  Load the SDL library
   if SDL.Init (0) < 0 then
      Put_Line ("Couldn't initialize SDL: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;
   SDL.Quit.atexit (SDL.SDL_Quit'Access);
   Lib_C.Set_Signal (System.OS_Interface.SIGTERM, killed'Access);
   Lib_C.Set_Signal (System.OS_Interface.SIGINT,  killed'Access);

   declare
      use  Int_IO;
      last : Positive;
   begin
      Get (CL.Argument (1), init_sem, last);
   end;

   sem := M.CreateSemaphore (Uint32 (init_sem));

   Put_Line ("Running " & Integer'Image (NUM_THREADS) & " threads, " &
             "semaphore value = " & C.int'Image (init_sem));

   --  Create all threads
   for i in C.int range 0 .. NUM_THREADS - 1 loop
      threads (i) := T.CreateThread (ThreadFunc'Access, To_Address (i));
   end loop;

   --  Wait 10 seconds
   Tm.SDL_Delay (10 * 1000);

   --  Wait for all threads to finish
   Put_Line ("Wait for threads to finish");

   alive := False;

   for i in C.int range 0 .. NUM_THREADS - 1 loop
      T.WaitThread (threads (i), null);
   end loop;

   Put_Line ("Finish waiting for threads");

   M.DestroySemaphore (sem);

   GNAT.OS_Lib.OS_Exit (0);
end TestSem;
