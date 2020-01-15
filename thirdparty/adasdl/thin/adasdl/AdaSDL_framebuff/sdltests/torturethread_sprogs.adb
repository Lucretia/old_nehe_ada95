
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

with System.Address_To_Access_Conversions;
with Ada.Text_IO; use Ada.Text_IO;
with SDL.Thread;

package body TortureThread_Sprogs is

   package Tr renames SDL.Thread;
   function To_int is new Ada.Unchecked_Conversion (System.Address, C.int);

   type Volatile_int is new C.int;
   pragma Volatile (Volatile_int);

   package int_Ptrs is
      new System.Address_To_Access_Conversions (Volatile_int);
   use int_Ptrs;

   --  ======================================
   function SubThreadFunc (data : System.Address) return C.int is
   begin
      while To_Pointer (data).all = 0 loop
         null; --  SDL.Timer.SDL_Delay (10); --  do nothing
      end loop;
      return 0;
   end SubThreadFunc;

   --  ======================================
   type flags_Array is
      array (C.int range 0 .. NUMTHREADS - 1) of aliased Volatile_int;
   pragma Convention (C, flags_Array);
   flags : flags_Array;
   --  ======================================

   function ThreadFunc (data : System.Address) return C.int is

      type sub_threads_Array is
         array (C.int range 0 .. NUMTHREADS - 1) of Tr.SDL_Thread_ptr;
      pragma Convention (C, sub_threads_Array);
      sub_threads : sub_threads_Array;

      tid : C.int := To_int (data);

   begin

      Put_Line ("Creating Thread " & C.int'Image (tid));
      for i in flags'Range loop
         flags (i) := 0;
         sub_threads (i) :=
            Tr.CreateThread (SubThreadFunc'Access,
                             To_Address (Object_Pointer'(flags (i)'Access)));
      end loop;

      Put_Line ("Thread '" & C.int'Image (tid) & "' waiting for signals");
      while time_for_threads_to_die (tid) /= 1 loop
         null; -- do nothing
      end loop;

      Put_Line ("Thread '" & C.int'Image (tid) & "' sending signals to subthreads");
      for i in flags'Range loop
         flags (i) := 1;
         Tr.WaitThread (sub_threads (i), null);
      end loop;

      Put_Line ("Thread '" & C.int'Image (tid) & "' exiting");

      return 0;
   end ThreadFunc;

   --  ======================================

end TortureThread_Sprogs;
