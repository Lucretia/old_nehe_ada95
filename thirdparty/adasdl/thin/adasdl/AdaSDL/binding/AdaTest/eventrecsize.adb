
with Text_IO; use Text_IO;
with Interfaces.C;
with SDL.Events;
with SDL.Types;
with SDL.Keysym;
with SDL.Keyboard;

procedure eventrecsize is
   package C renames Interfaces.C;
begin
   Put (" The size of SDL.Events.ActiveEvent:       ");
   Put_Line (Integer'Image (SDL.Events.ActiveEvent'Size / C.CHAR_BIT));
   
   Put (" The size of SDL.Events.KeyboardEvent:  ");
   Put_Line (Integer'Image (SDL.Events.KeyboardEvent'Size / C.CHAR_BIT));
   Put (" ---------------------  Event_Type:          ");
   Put_Line (Integer'Image (SDL.Events.Event_Type'Size / C.CHAR_BIT));
   Put (" ---------------------  Uint8:               ");
   Put_Line (Integer'Image (SDL.Types.Uint8'Size / C.CHAR_BIT));
   Put (" ---------------------  Uint8:               ");
   Put_Line (Integer'Image (SDL.Types.Uint8'Size / C.CHAR_BIT));
   Put (" ---------------------  SDL.Keyboard.keysym: ");
   Put_Line (Integer'Image (SDL.Keyboard.keysym'Size / C.CHAR_BIT));
   Put (" ============================ Uint8:             ");
   Put_Line (Integer'Image (SDL.Types.Uint8'Size / C.CHAR_BIT));
   Put (" ============================ SDL.Keysym.Key:    ");
   Put_Line (Integer'Image (SDL.Keysym.Key'Size / C.CHAR_BIT));
   Put (" ============================ SDL.Keysym.SDLMod: ");
   Put_Line (Integer'Image (SDL.Keysym.SDLMod'Size / C.CHAR_BIT));
   Put (" ============================ Uint16:            ");
   Put_Line (Integer'Image (SDL.Types.Uint16'Size / C.CHAR_BIT));
   
   Put (" The size of SDL.Events.MouseMotionEvent:  ");
   Put_Line (Integer'Image (SDL.Events.MouseMotionEvent'Size / C.CHAR_BIT));
   Put (" The size of SDL.Events.MouseButtonEvent:  ");
   Put_Line (Integer'Image (SDL.Events.MouseButtonEvent'Size / C.CHAR_BIT));
   Put (" The size of SDL.Events.JoyAxisEvent:      ");
   Put_Line (Integer'Image (SDL.Events.JoyAxisEvent'Size / C.CHAR_BIT));
   Put (" The size of SDL.Events.JoyBallEvent:      ");
   Put_Line (Integer'Image (SDL.Events.JoyBallEvent'Size / C.CHAR_BIT));
   Put (" The size of SDL.Events.JoyHatEvent:       ");
   Put_Line (Integer'Image (SDL.Events.JoyHatEvent'Size / C.CHAR_BIT));
   Put (" The size of SDL.Events.JoyButtonEvent:    ");
   Put_Line (Integer'Image (SDL.Events.JoyButtonEvent'Size / C.CHAR_BIT));
   Put (" The size of SDL.Events.ResizeEvent:       ");
   Put_Line (Integer'Image (SDL.Events.ResizeEvent'Size / C.CHAR_BIT));
   Put (" The size of SDL.Events.QuitEvent:         ");
   Put_Line (Integer'Image (SDL.Events.QuitEvent'Size / C.CHAR_BIT));
   Put (" The size of SDL.Events.QuitEvent:         ");
   Put_Line (Integer'Image (SDL.Events.UserEvent'Size / C.CHAR_BIT));
   Put (" The size of SDL.Events.SysWMEvent:        ");
   Put_Line (Integer'Image (SDL.Events.SysWMEvent'Size / C.CHAR_BIT));
   Put (" The size of SDL.Events.Event:             ");
   Put_Line (Integer'Image (SDL.Events.Event'Size / C.CHAR_BIT));

end eventrecsize;
