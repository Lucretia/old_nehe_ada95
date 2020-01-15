
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

--  Simple program:  Loop, watching keystrokes
--  Note that you need to call SDL.Events.PollEvent
--  or SDL.Events.WaitEvent to pump the event loop
--  and catch keystrokes.

with Interfaces.C.Strings;
with Ada.Text_IO; use Ada.Text_IO;
with GNAT.OS_Lib;
with SDL.Types; use SDL.Types;
with SDL.Keysym;
with SDL.Keyboard;
with SDL.Error;
with SDL.Quit;
with SDL.Events;
with SDL.Video;

procedure CheckKeys is
   package C  renames Interfaces.C;
   use type C.int;
   use type C.wchar_t;
   package CS renames Interfaces.C.Strings;
   package Ks renames SDL.Keysym;
   use type Ks.Key;
   package Kb renames SDL.Keyboard;
   package Er renames SDL.Error;
   package Ev renames SDL.Events;
   package V  renames SDL.Video;

   Screen_Width : constant  := 640;
   Screen_Height : constant := 480;

   --  ===============================================
   procedure PrintKey (sym : in Kb.keysym; pressed : Boolean) is
   begin
      --  Print the keycode, name and state
      if sym.sym /= 0 then
         Put ("Key ");
         if pressed then
            Put ("pressed:   ");
         else
            Put ("released:  ");
         end if;
         Put (Ks.Key'Image (sym.sym) & "-" &
              CS.Value (Kb.GetKeyName (sym.sym)) &
              " ");
      else
         Put ("Unknown Key (scancode = " &
         Uint8'Image (sym.scancode) & ") ");
         if pressed then
            Put_Line ("pressed:   ");
         else
            Put_Line ("released:  ");
         end if;
      end if;

      --  Print the translated character, if one exists
      if sym.unicode /= 0 then
         --  Is it a control-character?
         if C.wchar_t'Val (sym.unicode) < C.wchar_t'(' ') then
            Put_Line (" (^"
                      & C.wchar_t'Image (C.wchar_t'Val
                           (sym.unicode)) & "@)");
            --          & Uint16'Image (sym.unicode) & "@)");
         else
            --  #ifdef UNICODE
            --  Put_Line (" (" & Uint16'Image (sym.unicode) & ")");
            Put_Line (" (" & C.wchar_t'Image (C.wchar_t'Val
                                (sym.unicode)) & ")");
            --  #else
            --  This is a Latin-1 program, so only show 8-bits */
            --  if (sym.unicode and 16#FF00#) = 0 then
            --     Put_Line (" (" & Uint16'Image (sym.unicode) & ")");
            --  end if;
            --  #endif
         end if;
      end if;
      New_Line;
   end PrintKey;
   --  ===============================================

   event : Ev.Event;
   done  : C.int; -- Boolean should be better.
begin

   --  Initialize SDL
   if SDL.Init (SDL.INIT_VIDEO) < 0 then
      Put_Line ("Couldn't initialize SDl: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;
   SDL.Quit.atexit (SDL.SDL_Quit'Access);

   declare
      screen : V.Surface_ptr;
      use type V.Surface_ptr;
   begin
      --  Set video mode
      screen := V.SetVideoMode (Screen_Width, Screen_Height,
                                0, V.SWSURFACE);
      if screen = null then
         Put_Line ("Couldn't set " & Integer'Image (Screen_Width) &
                   "x" & Integer'Image (Screen_Height) &
                   " video mode: " & Er.Get_Error);
         GNAT.OS_Lib.OS_Exit (2);
      end if;
   end;

   --  Enable UNICODE translation for keyboard input
   Kb.EnableUNICODE (1);

   Kb.EnableKeyRepeat (
      Kb.DEFAULT_REPEAT_DELAY,
      Kb.DEFAULT_REPEAT_INTERVAL);

   --  Watch keystrokes
   done := 0;
   while done = 0 loop
      --  Check for events
      --  Read the note in the "event" declaration point.
      Ev.WaitEvent (event);
      case event.the_type is
         when Ev.KEYDOWN =>
            --  Read the note in the "event" declaration point.
            PrintKey (event.key.keysym, True);
         when Ev.KEYUP =>
            --  Read the note in the "event" declaration point.
            PrintKey (event.key.keysym, False);
         when Ev.MOUSEBUTTONDOWN | Ev.QUIT =>
            --  Any button press quits the app...
            done := 1;
         when others => null;
      end case;
   end loop;
end CheckKeys;
