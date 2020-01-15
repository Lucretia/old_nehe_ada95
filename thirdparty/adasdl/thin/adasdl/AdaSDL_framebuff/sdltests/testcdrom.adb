
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

with Interfaces.C.Strings;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Characters.Latin_1;
with Ada.Characters.Handling;
with Ada.Command_Line;
with GNAT.OS_Lib;
with SDL.Cdrom;
with SDL.Types; use SDL.Types;
with SDL.Error;
with SDL.Quit;
with SDL.Timer;

procedure TestCdrom is

   package C  renames Interfaces.C;
   use type C.int;
   package CS renames Interfaces.C.Strings;
   package int_IO is new Integer_IO (C.int);
   package CL renames Ada.Command_Line;
   package Latin_1 renames Ada.Characters.Latin_1;
   package CH renames Ada.Characters.Handling;
   package CD renames SDL.Cdrom;
   use type CD.CDstatus;
   use type CD.CD_ptr;
   package Er renames SDL.Error;
   package T  renames SDL.Timer;

   --  ======================================
   procedure PrintStatus (driveindex : C.int; cdrom : CD.CD_ptr)
   is
      status : CD.CDstatus;
      --  status_str : CS.chars_ptr;
      type String_Access is access String;
      status_str : String_Access;
   begin
      status := CD.SDL_CDStatus (cdrom);
      case status is
         when CD.TRAYEMPTY => status_str := new String'("tray empty");
         when CD.STOPPED   => status_str := new String'("stopped");
         when CD.PLAYING   => status_str := new String'("playing");
         when CD.PAUSED    => status_str := new String'("paused");
         when CD.ERROR     => status_str := new String'("error state");
         when others       => null;
      end case;
      Put_Line ("Drive " & C.int'Image (driveindex) & " " & status_str.all);
      if status >= CD.PLAYING then
         declare
            --  m, s, f : aliased C.int;
            m, s, f : C.int;
         begin
            --  CD.FRAMES_TO_MSF (cdrom.cur_frame, m'Access, s'Access, f'Access);
            CD.FRAMES_TO_MSF (cdrom.cur_frame, m, s, f);
            Put_Line ("Currently playing track " &
                      Uint8'Image (cdrom.track (cdrom.cur_track).id) &
                      C.int'Image (m) & " " & C.int'Image (s));
         end;
      end if;
   end PrintStatus;

   --  ======================================
   procedure ListTracks (cdrom : CD.CD_ptr)
   is
      m, s, f : aliased C.int;
      Dummy_CDstatus : CD.CDstatus;
   begin
      Dummy_CDstatus := CD.SDL_CDStatus (cdrom);
      Put_Line ("Drive tracks: " & C.int'Image (cdrom.numtracks));
      for i in C.int range 0 .. cdrom.numtracks - 1 loop
         --  CD.FRAMES_TO_MSF (C.int (cdrom.track (i).lenght),
         --                    m'Access, s'Access, f'Access);
         CD.FRAMES_TO_MSF (C.int (cdrom.track (i).lenght),
                           m, s, f);
         if f > 0 then
            s := s + 1;
         end if;
         Put_Line (Latin_1.HT & "Track (index " & C.int'Image (i) &
                   ")" & Uint8'Image (cdrom.track (i).id) & " " &
                   C.int'Image (m) & " " & C.int'Image (s));
      end loop;
   end ListTracks;

   --  ======================================
   procedure PrintUsage (Prog_Name : String) is
   begin
      Put_Line ("Usage: " & Prog_Name &
                " [drive#] [command] [command] ...");
      Put_Line ("Where 'command' is one of: ");
      Put_Line ("        -status");
      Put_Line ("        -list");
      Put_Line ("        -play [first_track] [first_frame] [num_tracks] [num_frames]");
      Put_Line ("        -pause");
      Put_Line ("        -resume");
      Put_Line ("        -stop");
      Put_Line ("        -eject");
      Put_Line ("        -sleep <miliseconds>");
   end PrintUsage;

   --  ======================================
   i : Integer;
   drive : C.int;
   cdrom : CD.CD_ptr;
begin
   --  Initialize SDL first
   if SDL.Init (SDL.INIT_CDROM) < 0 then
      Put_Line ("Couldn't initialize SDL: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   SDL.Quit.atexit (SDL.SDL_Quit'Access);

   --  Find out how many CD-ROM drives are connected to the system
   if CD.CDNumDrives = 0 then
      Put_Line ("No CD-ROM devices detected");
      GNAT.OS_Lib.OS_Exit (0);
   end if;

   Put_Line ("Drives available: " & C.int'Image (CD.CDNumDrives));
   for i in C.int range 0 .. CD.CDNumDrives - 1 loop
      Put_Line ("Drive " & C.int'Image (i) & CS.Value (CD.CDName (i)));
   end loop;

   --  Open the CD-ROM
   drive := 0;
   i := 1;
   if (CL.Argument_Count > 0) and then (CH.Is_Digit (CL.Argument (i)(1))) then
         declare
            use int_IO;
            last : Positive;
         begin
            Get (CL.Argument (i), drive, last);
            i := i + 1;
         end;
   end if;
   cdrom := CD.CDOpen (drive);

   if cdrom = null then
      Put_Line ("Couldn't open drive " & C.int'Image (drive) & ":" & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (2);
   end if;
   --  #ifdef TEST_NULLCD
   --  cdrom := null;
   --  #endif

   --  Find out which function to perform
   while i <= CL.Argument_Count loop
      if CL.Argument (i)    = "-status" then
         PrintStatus (drive, cdrom);
      elsif CL.Argument (i) = "-list" then
         ListTracks (cdrom);
      elsif CL.Argument (i) = "-play" then
         declare
            strack, sframe : C.int;
            ntrack, nframe : C.int;
         begin
            strack := 0;
            if (i + 1 <= CL.Argument_Count)
                  and then (CH.Is_Digit (CL.Argument (i + 1)(1))) then
               declare
                  use int_IO;
                  last : Positive;
               begin
                  i := i + 1;
                  Get (CL.Argument (i), strack, last);
               end;
            end if;
            sframe := 0;
            if (i + 1 <= CL.Argument_Count)
                  and then (CH.Is_Digit (CL.Argument (i + 1)(1))) then
               declare
                  use int_IO;
                  last : Positive;
               begin
                  i := i + 1;
                  Get (CL.Argument (i), sframe, last);
               end;
            end if;
            ntrack := 0;
            if (i + 1 <= CL.Argument_Count)
                  and then (CH.Is_Digit (CL.Argument (i + 1)(1))) then
               declare
                  use int_IO;
                  last : Positive;
               begin
                  i := i + 1;
                  Get (CL.Argument (i), ntrack, last);
               end;
            end if;
            nframe := 0;
            if (i + 1 <= CL.Argument_Count)
                  and then (CH.Is_Digit (CL.Argument (i + 1)(1))) then
               declare
                  use int_IO;
                  last : Positive;
               begin
                  i := i + 1;
                  Get (CL.Argument (i), nframe, last);
               end;
            end if;

            if CD.INDRIVE (CD.SDL_CDStatus (cdrom)) then
               if CD.CDPlayTracks (cdrom, strack, sframe, ntrack, nframe) < 0 then
                  Put_Line ("Couldn't play tracks " &
                            C.int'Image (strack) & " " & C.int'Image (sframe) & " " &
                            C.int'Image (ntrack) & " " & C.int'Image (nframe) & " " &
                            Er.Get_Error);
               end if;
            else
               Put_Line ("No CD in drive!");
            end if;
         end; --  declare
      elsif CL.Argument (i) = "-pause" then
         if CD.CDPause (cdrom) < 0 then
            Put_Line ("Couldn't pause CD: " & Er.Get_Error);
         end if;
      elsif CL.Argument (i) = "-resume" then
         if CD.CDResume (cdrom) < 0 then
            Put_Line ("Couldn't resume CD: " & Er.Get_Error);
         end if;
      elsif CL.Argument (i) = "-stop" then
         if CD.CDStop (cdrom) < 0 then
            Put_Line ("Couldn't eject CD: " & Er.Get_Error);
         end if;
      elsif CL.Argument (i) = "-eject" then
         if CD.CDEject (cdrom) < 0 then
            Put_Line ("Couldn't eject CD: " & Er.Get_Error);
         end if;
      elsif (CL.Argument (i) = "-sleep")
            and ((i + 1 <= CL.Argument_Count)
                  and then CH.Is_Digit (CL.Argument (i + 1)(1))) then
         declare
            use int_IO;
            last : Positive;
            the_delay : C.int;
         begin
            i := i + 1;
            Get (CL.Argument (i), the_delay, last);
            T.SDL_Delay (Uint32 (the_delay));
            Put_Line ("Delayed " & C.int'Image (the_delay) & " milliseconds");
         end;
      else
         PrintUsage (CL.Command_Name);
         CD.CDClose (cdrom);
         GNAT.OS_Lib.OS_Exit (1);
      end if;
      i := i + 1;
   end loop;
   PrintStatus (drive, cdrom);
   CD.CDClose (cdrom);
   GNAT.OS_Lib.OS_Exit (0);
end TestCdrom;
