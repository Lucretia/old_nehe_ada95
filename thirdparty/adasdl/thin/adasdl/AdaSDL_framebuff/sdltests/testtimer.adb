
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
with Ada.Command_Line;
with Ada.Characters.Handling;
with Ada.Unchecked_Conversion;
with GNAT.OS_Lib;
with SDL.Timer;
with SDL.Error;
with SDL.Quit;
with SDL.Types; use SDL.Types;
with TestTimer_Sprogs;
use  TestTimer_Sprogs;
procedure TestTimer is

   DEFAULT_RESOLUTION : constant := 1;

   package C  renames Interfaces.C;
   use type C.int;
   package CS renames Interfaces.C.Strings;
   package CL renames Ada.Command_Line;
   package CH renames Ada.Characters.Handling;
   package T  renames SDL.Timer;
   use type T.TimerID;
   package Er renames SDL.Error;
   package Int_IO is new Integer_IO (C.int);

   function To_Address is new
      Ada.Unchecked_Conversion (C.int, System.Address);

   desired : C.int;
   t1, t2, t3 : T.TimerID;

   Dummy_bool : SDL_bool;

begin
   desired := 0;

   if(CL.Argument_Count >= 1) then
      if not CH.Is_Digit (CL.Argument (1) (1)) then
         Put_Line ("Usage: " & CL.Command_Name & " init_value");
         GNAT.OS_Lib.OS_Exit (0);
      else
         declare
            use  Int_IO;
            last : Positive;
         begin
            Get (CL.Argument (1), desired, last);
         end;
      end if;
   end if;

   --  Load the SDL library
   if SDL.Init (SDL.INIT_TIMER) < 0 then
      Put_Line ("Couldn't load SDL: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;
   SDL.Quit.atexit (SDL.SDL_Quit'Access);

   --  Start the timer
   if desired = 0 then
      desired := DEFAULT_RESOLUTION;
   end if;
   T.SetTimer (Uint32 (desired), ticktock'Access);

   --  Wait 10 seconds
   Put_Line ("Wait 10 seconds");
   T.SDL_Delay (10*1000);

   --  Stop the timer
   T.SetTimer (0, null);

   --  Print the results
   if ticks /= 0 then
      Put_Line ("Testing resolution: desired = " & C.int'Image (desired) &
                " ms, actual = " & Float'Image (Float(10 * 1000) / Float (ticks)) &
                " ms");
   end if;

   --  Test multiple timers
   Put_Line ("Testing multiple timers...");

   t1 := T.AddTimer (100, callback'Access, To_Address (1));
   if t1 = T.Null_TimerID then
      Put_Line ("Could not create timer 1");
   end if;

   t2 := T.AddTimer (50, callback'Access, To_Address (2));
   if t2 = T.Null_TimerID then
      Put_Line ("Could not create timer 2");
   end if;

   t3 := T.AddTimer (233, callback'Access, To_Address (3));
   if t3 = T.Null_TimerID then
      Put_Line ("Could not create timer 3");
   end if;

   --  Wait 10 seconds
   Put_Line ("Waiting 10 seconds");
   T.SDL_Delay (10 * 1000);

   Put_Line ("Removing timer 1 and waiting 5 more seconds");
   Dummy_bool := T.RemoveTimer (t1);

   T.SDL_Delay (5 * 1000);

   Dummy_bool := T.RemoveTimer (t2);
   Dummy_bool := T.RemoveTimer (t3);

   GNAT.OS_Lib.OS_Exit (0);
end TestTimer;
