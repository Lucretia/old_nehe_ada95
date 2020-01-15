#include <SDL.h>



/* SDL_Types.h */
int Uint8_Size ()                  {return sizeof(Uint8);}
int Uint16_Size ()                 {return sizeof(Uint16);}

/* SDL_Events.h */
int SDL_ActiveEvent_Size ()        {return sizeof(SDL_ActiveEvent);}
int SDL_KeyboardEvent_Size ()      {return sizeof(SDL_KeyboardEvent);}
int SDL_keysym_Size ()             {return sizeof(SDL_keysym);}
int SDLKey_Size ()                 {return sizeof(SDLKey);}
int SDLMod_Size ()                 {return sizeof(SDLMod);}
int SDL_MouseMotionEvent_Size ()   {return sizeof(SDL_MouseMotionEvent);}
int SDL_MouseButtonEvent_Size ()   {return sizeof(SDL_MouseButtonEvent);}
int SDL_JoyAxisEvent_Size ()       {return sizeof(SDL_JoyAxisEvent);}
int SDL_JoyBallEvent_Size ()       {return sizeof(SDL_JoyBallEvent);}
int SDL_JoyHatEvent_Size ()        {return sizeof(SDL_JoyHatEvent);}
int SDL_JoyButtonEvent_Size ()     {return sizeof(SDL_JoyButtonEvent);}
int SDL_ResizeEvent_Size ()        {return sizeof(SDL_ResizeEvent);}
int SDL_QuitEvent_Size ()          {return sizeof(SDL_QuitEvent);}
int SDL_UserEvent_Size ()          {return sizeof(SDL_UserEvent);}
int SDL_SysWMEvent_Size ()         {return sizeof(SDL_SysWMEvent);}
int SDL_Event_Size ()              {return sizeof(SDL_Event);}
int SDL_CDtrack_Size ()            {return sizeof(SDL_CDtrack);}
int SDL_CD_Size ()                 {return sizeof(SDL_CD);}

