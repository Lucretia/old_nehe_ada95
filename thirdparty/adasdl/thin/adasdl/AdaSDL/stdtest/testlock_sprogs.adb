
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
with Lib_C;
with SDL.Timer;
with SDL.Error;
package body TestLock_Sprogs is
   use type C.int;
   package Tm  renames SDL.Timer;
   package Er  renames SDL.Error;
   package CS  renames Interfaces.C.Strings;

   --  ======================================
   procedure printid is
   begin
      Put_Line ("Process " & Uint32'Image (T.ThreadID) &
                ":  exiting");
   end printid;

   --  ======================================
   procedure terminating (sig : C.int) is
   begin
      Put_Line ("Process " & Uint32'Image (T.ThreadID) &
                ":  raising SIGTERM");
      Lib_C.Raise_The_Signal (System.OS_Interface.SIGTERM);
   end terminating;

   --  ======================================
   procedure closemutex (sig : C.int) is
      id : Uint32 := T.ThreadID;
   begin
      Put ("Process ");
      if id = mainthread then
         Put ("0");
      else
         Put (Uint32'Image (id));
      end if;
      Put_Line (":  Cleaning up...");

      for i in 0 .. 5 loop
         T.KillThread (threads (i));
      end loop;

      M.DestroyMutex (mutex);
      GNAT.OS_Lib.OS_Exit (Integer (sig));

   end closemutex;

   --  ======================================
   function Run (data : System.Address) return C.int is
   begin
      if T.ThreadID = mainthread then
         Lib_C.Set_Signal (System.OS_Interface.SIGTERM, closemutex'Access);
      end if;

      while true loop
         Put_Line ("Process " & Uint32'Image (T.ThreadID) &
                   " ready to work");
         if M.mutexP (mutex) < 0 then
            Put_Line ("Couldn't lock mutex: " & Er.Get_Error);
            GNAT.OS_Lib.OS_Exit (1);
         end if;
         Put_Line ("Process " & Uint32'Image (T.ThreadID) &
                   ", working!");
         Tm.SDL_Delay (1 * 1000);
         Put_Line ("Process " & Uint32'Image (T.ThreadID) &
                   ", done!");
         if M.mutexV (mutex) < 0 then
            Put_Line ("Couldn't unlock mutex: " & Er.Get_Error);
            GNAT.OS_Lib.OS_Exit (1);
         end if;

         --  If this sleep isn't done, then threads may starve
         Tm.SDL_Delay (10);
      end loop;
      return 0;
   end Run;

   --  ======================================

end TestLock_Sprogs;
