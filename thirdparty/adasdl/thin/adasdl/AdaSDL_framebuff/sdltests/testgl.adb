
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

with Interfaces.C;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Characters.Handling;
with GNAT.OS_Lib;
with SDL.Types; use SDL.Types;
with TestGL_Sprogs; use TestGL_Sprogs;
procedure TestGL is
   package C  renames Interfaces.C;
   package CH renames Ada.Characters.Handling;
   use type Interfaces.C.int;
   use type V.Surface_Flags;
   package Int_IO is new Integer_IO (C.int);
   package CFloat_IO is new Float_IO (C.C_float);
   logo     : Boolean := False;
   numtests : C.int := 1;
   bpp      : C.int := 0;
   slowly   : Boolean := False;
   gamma    : C.C_float := 0.0;
   argc     : Integer := CL.Argument_Count;
   video_flags : V.Surface_Flags := 0;
begin
   while argc > 0 loop
      if (argc >= 2) and then
            (CL.Argument (argc - 1) = "-bpp") and then
            CH.Is_Digit (CL.Argument (argc) (1)) then
         declare
            last : Positive;
         begin
            Int_IO.Get (CL.Argument (argc), bpp, last);
         end;
         argc := argc - 2;
      elsif (argc >= 2) and then
            (CL.Argument (argc - 1) = "-gamma") and then
            CH.Is_Digit (CL.Argument (argc) (1)) then
         declare
            last : Positive;
         begin
            CFloat_IO.Get (CL.Argument (argc), gamma, last);
         end;
         argc := argc - 2;
      elsif CL.Argument (argc) = "-twice" then
         numtests := numtests + 1;
         argc := argc - 1;
      elsif CL.Argument (argc) = "-logo" then
         logo := True;
         argc := argc -1;
      elsif CL.Argument (argc) = "-slow" then
         slowly := True;
         argc := argc - 1;
      elsif CL.Argument (argc) = "-fullscreen" then
         video_flags := video_flags or V.FULLSCREEN;
         argc := argc - 1;
      elsif CL.Argument (argc) = "-h" then
         Put_Line ("Usage: " & CL.Command_Name & " " &
                   "[-bpp N] [-gamma] [-twice] " &
                   "[-logo] [-slow] [-fullscreen]");
         argc := argc - 1;
         GNAT.OS_Lib.OS_Exit (0);
      else
         Put_Line ("Usage: " & CL.Command_Name & " " &
                   "[-bpp N] [-gamma] [-twice] " &
                   "[-logo] [-slow] [-fullscreen] [-h]");
         argc := argc - 1;
         GNAT.OS_Lib.OS_Exit (0);
      end if;
   end loop;
   for i in 0 .. numtests - 1 loop
      RunGLTest (video_flags, logo, slowly, bpp, gamma);
   end loop;
   GNAT.OS_Lib.OS_Exit (0);
end TestGL;
