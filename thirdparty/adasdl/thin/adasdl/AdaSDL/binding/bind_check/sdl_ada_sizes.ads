with Interfaces.C;

package SDL_Ada_Sizes is
   package C renames Interfaces.C;

   
   --  SDL_Types.h
   function Uint8_Size return C.int;
   pragma Import (C, Uint8_Size, "Uint8_Size");

   function Uint16_Size return C.int;
   pragma Import (C, Uint16_Size, "Uint16_Size");


   --  SDL_Events.h

   function SDL_ActiveEvent_Size return C.int;
   pragma Import (C, SDL_ActiveEvent_Size, "SDL_ActiveEvent_Size");

   function SDL_KeyboardEvent_Size return C.int;
   pragma Import (C, SDL_KeyboardEvent_Size, "SDL_KeyboardEvent_Size");

   function SDL_keysym_Size return C.int;
   pragma Import (C, SDL_keysym_Size, "SDL_keysym_Size");

   function SDLKey_Size return C.int;
   pragma Import (C, SDLKey_Size, "SDLKey_Size");

   function SDLMode_Size return C.int;
   pragma Import (C, SDLMode_Size, "SDLMode_Size");

   function SDL_MouseMotionEvent_Size return C.int;
   pragma Import (C, SDL_MouseMotionEvent_Size, "SDL_MouseMotionEvent_Size");

   function SDL_MouseButtonEvent_Size return C.int;
   pragma Import (C, SDL_MouseButtonEvent_Size, "SDL_MouseButtonEvent_Size");

   function SDL_JoyAxisEvent_Size return C.int;
   pragma Import (C, SDL_JoyAxisEvent_Size, "SDL_JoyAxisEvent_Size");

   function SDL_JoyBallEvent_Size return C.int;
   pragma Import (C, SDL_JoyBallEvent_Size, "SDL_JoyBallEvent_Size");

   function SDL_JoyHatEvent_Size return C.int;
   pragma Import (C, SDL_JoyHatEvent_Size, "SDL_JoyHatEvent_Size");

   function SDL_JoyButtonEvent_Size return C.int;
   pragma Import (C, SDL_JoyButtonEvent_Size, "SDL_JoyButtonEvent_Size");

   function SDL_ResizeEvent_Size return C.int;
   pragma Import (C, SDL_ResizeEvent_Size, "SDL_ResizeEvent_Size");

   function SDL_QuitEvent_Size return C.int;
   pragma Import (C, SDL_QuitEvent_Size, "SDL_QuitEvent_Size");

   function SDL_UserEvent_Size return C.int;
   pragma Import (C, SDL_UserEvent_Size, "SDL_UserEvent_Size");

   function SDL_SysWMEvent_Size return C.int;
   pragma Import (C, SDL_SysWMEvent_Size, "SDL_SysWMEvent_Size");

   function SDL_Event_Size return C.int;
   pragma Import (C, SDL_Event_Size, "SDL_Event_Size");
   
   --  SDL_cdrom.h
   
   function SDL_CDtrack_Size return C.int;
   pragma Import (C, SDL_CDtrack_Size, "SDL_CDtrack_Size");

   function SDL_CD_Size return C.int;
   pragma Import (C, SDL_CD_Size, "SDL_CD_Size");

end SDL_Ada_Sizes;
