
-- ----------------------------------------------------------------- --
--                Copyright (C) 2001 A.M.F.Vargas                    --
--                Antonio M. F. Vargas                               --
--                Ponta Delgada - Azores - Portugal                  --
--                E-mail: avargas@adapower.net                       --
--                http://www.adapower.net/~avargas/                  --
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

with Ada.Text_IO; use Ada.Text_IO;
with Interfaces.C.Strings;
with GNAT.OS_Lib;
with SDL.Types; use SDL.Types;
with SDL.Video;
with SDL.Error;
with SDL.Events;
with SDL.Keyboard;
with SDL.Quit;
with SDL.Keysym;
with SDL_Framebuffer;

--  =====================================
procedure Simple03 is
   package C  renames Interfaces.C;
   use type C.int;
   use type SDL.Init_Flags;
   package V  renames SDL.Video;
   use type V.Surface_ptr;
   use type V.Surface_Flags;
   package Er renames SDL.Error;
   package S  renames C.Strings;
   package Ev renames SDL.Events;
   package Kb renames SDL.Keyboard; 
   package Ks renames SDL.Keysym;
   package Fb renames SDL_Framebuffer;
   
   Main_Surface : SDL.Video.Surface_ptr;
   
   --  ---------------------------------
   Procedure Draw_Pixels is
   begin
      
      if V.LockSurface (Main_Surface) < 0 then
         Put_Line ("Couldn't lock the display surface: " & Er.Get_Error);
         GNAT.OS_Lib.OS_Exit (2);
      end if;
     
      --  Draw pixels one by one.
      for x in Natural range 50 .. 200 loop
         Fb.Go_XY_Unchecked (Main_Surface, x,  200).all := Uint16'(Fb.MapRGB (Main_Surface.format, 16#FF#, 16#FF#, 16#FF#));
      end loop;
      
      for y in Natural range 150 .. 200 loop
         for x in Natural range 250 .. 300 loop
            Fb.Go_XY_Unchecked (Main_Surface, x,  y).all := Uint16'(Fb.MapRGB (Main_Surface.format, 16#FF#, 16#00#, 16#00#));
	 end loop;
      end loop;
      
      V.UnlockSurface (Main_Surface);
      V.UpdateRect (Main_Surface, 0, 0, 0, 0);

   end Draw_Pixels;
   
   --  ---------------------------------
   procedure Start_Event_Management
   is
      Quit  : Boolean := False;
      Event : aliased Ev.Event;
      PollEvent_Result : C.int;
   begin
      loop
         Ev.PollEventVP (PollEvent_Result, Event);
         if PollEvent_Result = 1 then
            case Event.the_type is
               when Ev.KEYDOWN =>
                  case event.key.keysym.sym is
                     when Ks.K_ESCAPE =>
                        Quit := True;
                     when others => null;
                  end case;
                when  Ev.QUIT => Quit := True;
                when others => null;
            end case;
         end if;
         exit when Quit;
      end loop;

   end Start_Event_Management;

   --  ---------------------------------
begin

   if SDL.Init (SDL.INIT_TIMER or SDL.INIT_VIDEO) < 0 then
      Put_Line ("Couldn't load SDL: " &
                C.Strings.Value (Er.GetError));
      GNAT.OS_Lib.OS_Exit (1);
   end if;

   SDL.Quit.atexit (SDL.SDL_Quit'Access);

   SDL.Video.WM_SetCaption (S.New_String (" Olá mundo "),
                            S.Null_Ptr);

   Main_Surface := V.SetVideoMode (1024, 768, 16,
                                   V.SWSURFACE or V.FULLSCREEN);
   if Main_Surface = null then
      Put_Line ("Couldn't set video mode" &
                S.Value (Er.GetError));
      GNAT.OS_Lib.OS_Exit (1);
   end if;
   
   Draw_Pixels;
    
   Start_Event_Management;
  
   V.FreeSurface (Main_Surface);

end Simple03;
