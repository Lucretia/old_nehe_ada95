
with Interfaces.C.Strings;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Characters.Handling;
with Ada.Command_Line;
with GNAT.OS_Lib;
with SDL.Video;
with SDL.Events;
with SDL.Error;
with SDL.Joystick;
with SDL.Types; use SDL.Types;
with SDL.Keysym;

procedure TestJoystick is
   package C  renames Interfaces.C;
   use type C.int;
   use type C.unsigned;
   package CS renames Interfaces.C.Strings;
   use type CS.chars_ptr;
   package CH renames Ada.Characters.Handling;
   package CL renames Ada.Command_Line;
   use type SDL.Init_Flags;
   package V  renames SDL.Video;
   use type V.Surface_ptr;
   package Ev renames SDL.Events;
   package Er renames SDL.Error;
   package Jy renames SDL.Joystick;
   use type Jy.HAT_State;
   use type Jy.Joy_Button_State;
   use type Jy.Joystick_ptr;
   package Ks renames SDL.Keysym;
   use type Ks.Key;

   SCREEN_WIDTH  : constant := 640;
   SCREEN_HEIGHT : constant := 480;

   --  ======================================
   procedure WatchJoystick (joystick : Jy.Joystick_ptr) is
      screen : V.Surface_ptr;
      name   : CS.chars_ptr;
      done   : Boolean;
      event  : Ev.Event;
      x, y   : C.int;
      draw   : C.unsigned range 0 .. 1;
      axis_area : V.Rects_Array (0 .. 1);
      PollEvent_Result : C.int;
   begin
      --  Set a video mode to display joystick axis position
      screen := V.SetVideoMode (SCREEN_WIDTH, SCREEN_HEIGHT, 16, 0);
      if screen = null then
         Put_Line ("couldn't set video mode: " & Er.Get_Error);
         return;
      end if;

      --  Print info about the joystick we are watching
      name := Jy.JoystickName (Jy.JoystickIndex (joystick));
      Put ("Watching joystick " & C.int'Image (Jy.JoystickIndex (joystick)) & ": (");
      if name /= CS.Null_Ptr then
         Put_Line (CS.Value (name) & ")");
      else
         Put_Line ("Unknown Joystick)");
      end if;
      Put_Line ("Joystick has " &
                C.int'Image (Jy.JoystickNumAxes (joystick))    & " axes, "      &
                C.int'Image (Jy.JoystickNumHats (joystick))    & " hats"        &
                C.int'Image (Jy.JoystickNumBalls (joystick))   & " balls, and " &
                C.int'Image (Jy.JoystickNumButtons (joystick)) & " buttons");

      --  Initialize drawing rectangles
      axis_area := (others => (0,0,0,0));
      draw := 0;

      --  Loop, getting joystick events
      done := False;
      while not done loop
         loop
            Ev.PollEventVP (PollEvent_Result, event);
            exit when PollEvent_Result =0;
            Put_Line ("DEBUG2");
            case event.the_type is
               when Ev.JOYAXISMOTION =>
                  Put_Line ("Joystick " &
                            Uint8'Image (event.jaxis.which) &
                            Uint8'Image (event.jaxis.axis)  &
                            Sint16'Image (event.jaxis.value));
               when Ev.JOYHATMOTION =>
                  Put_Line ("Joystick " &
                            Uint8'Image (event.jhat.which) &
                            Uint8'Image (event.jhat.hat));
                  if event.jhat.value = Jy.HAT_CENTERED then
                     Put (" centered");
                  end if;
                  if (event.jhat.value and Jy.HAT_UP)    /= 0  then
                     Put (" up");
                  end if;
                  if (event.jhat.value and Jy.HAT_RIGHT) /= 0  then
                     Put (" right");
                  end if;
                  if (event.jhat.value and Jy.HAT_DOWN)  /= 0  then
                     Put (" down");
                  end if;
                  if (event.jhat.value and Jy.HAT_LEFT)  /= 0  then
                     Put (" left");
                  end if;
                  New_Line;
               when Ev.JOYBALLMOTION =>
                  Put_Line ("Joystick " &
                            Uint8'Image (event.jball.which) & " ball " &
                            Uint8'Image (event.jball.ball)  & " delta: (" &
                            Sint16'Image (event.jball.xrel) & "," &
                            Sint16'Image (event.jball.yrel) & ")");
               when Ev.JOYBUTTONDOWN =>
                  Put_Line ("Joystick " &
                            Uint8'Image (event.jbutton.which)  & " button " &
                            Uint8'Image (event.jbutton.button) & " down");
               when Ev.JOYBUTTONUP =>
                  Put_Line ("Joystick " &
                            Uint8'Image (event.jbutton.which)  & " button " &
                            Uint8'Image (event.jbutton.button) & " up");
               when Ev.KEYDOWN =>
                  if event.key.keysym.sym = Ks.K_ESCAPE then
                     done := True;
                  end if;
               when Ev.QUIT =>
                  done := True;
               when others => null;
            end case;
         end loop;
         --  Update visual joystick state
         for i in C.int range  0 .. Jy.JoystickNumButtons (joystick) - 1 loop
            declare
               area : V.Rects_Array (0..0);
            begin
               area (0) := (Sint16 (i * 34), SCREEN_HEIGHT - 34, 32, 32);
               if Jy.JoystickGetButton (joystick, i) = Jy.PRESSED then
                  V.FillRect (screen, area (0), 16#FFFF#);
               else
                  V.FillRect (screen, area (0), 16#0000#);
               end if;
               V.UpdateRects (screen, area'Length, area);
            end;
         end loop;

         --  Erase previous axes
         V.FillRect (screen, axis_area (draw), 16#0000#);

         --  Draw the X/Y axis
         draw := 1 - draw;
         x := C.int (Jy.JoystickGetAxis (joystick, 0)) + 32768;
         x := x * SCREEN_WIDTH;
         x := x / 65535;
         if x < 0 then
            x := 0;
         elsif x > SCREEN_WIDTH - 16 then
            x := SCREEN_WIDTH - 16;
         end if;
         y := C.int (Jy.JoystickGetAxis (joystick, 1)) + 32768;
         y := y / 65535;
         if y < 0 then
            y := 0;
         elsif y > SCREEN_HEIGHT - 16 then
            y := SCREEN_HEIGHT - 16;
         end if;
         axis_area (draw).x := Sint16 (x);
         axis_area (draw).y := Sint16 (y);
         axis_area (draw).w := 16;
         axis_area (draw).h := 16;
         V.FillRect (screen, axis_area (draw), 16#FFFF#);
         V.UpdateRects (screen, axis_area'Length, axis_area);
      end loop;
   end WatchJoystick;
   --  ======================================
   name : CS.chars_ptr;
   joystick : Jy.Joystick_ptr;
   argv_1 : C.int;

begin
   --  Initialize SDL (Note: video is required to start event loop)
   if SDL.Init (SDL.INIT_VIDEO or SDL.INIT_JOYSTICK) < 0 then
      Put_Line ("Could't initialize SDL: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (1);
   end if;


   --  Print information about the joysticks
   Put_Line ("There are " & C.int'Image (Jy.NumJoysticks) & " joysticks attached");
   for i in C.int range 0 .. Jy.NumJoysticks - 1 loop
      name := Jy.JoystickName (i);
      Put ("Joystick " & C.int'Image (i) & ": ");
      if name /= CS.Null_Ptr then
         Put_Line (CS.Value (name));
      else
         Put_Line ("Unknown Joystick");
      end if;
   end loop;

   if CL.Argument_Count > 0 and then
         CH.Is_Digit (CL.Argument (1) (1)) then
      declare
         package int_IO is new Ada.Text_IO.Integer_IO (C.int);
         use int_IO;
         last : Positive;
      begin
         Get (CL.Argument (1), argv_1, last);
      end;

      joystick := Jy.JoystickOpen (argv_1);
      if joystick = Jy.Null_Joystick_ptr then
         Put_Line ("Couldn't open joystick " & C.int'Image (argv_1) &
                   ": " & Er.Get_Error);
      else
         WatchJoystick (joystick);
         Jy.JoystickClose (joystick);
      end if;
   end if;

   SDL.QuitSubSystem (SDL.INIT_VIDEO or SDL.INIT_JOYSTICK);

   GNAT.OS_Lib.OS_Exit (0);

end TestJoystick;
