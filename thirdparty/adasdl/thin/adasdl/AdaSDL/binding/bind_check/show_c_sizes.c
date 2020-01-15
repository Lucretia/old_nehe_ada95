
#include <stdio.h>
#include "sdl_c_sizes.h"

int main()
{
   puts   (" ************* The sizes of SDL types ***************");
   puts   (" ************* SDL_Types.h ***************");
   printf ("Uint8:                     %d\n", Uint8_Size());
   printf ("Uint16:                    %d\n", Uint16_Size());
   printf ("SDL_ActiveEvent:           %d\n", SDL_ActiveEvent_Size());
   printf ("SDL_KeyboardEvent:         %d\n", SDL_KeyboardEvent_Size());
   printf ("SDL_keysym_Size:           %d\n", SDL_keysym_Size());
   printf ("SDLKey:                    %d\n", SDLKey_Size());
   printf ("SDLMod:                    %d\n", SDLMod_Size());
   printf ("SDL_MouseMotionEvent:      %d\n", SDL_MouseMotionEvent_Size());
   printf ("SDL_MouseButtonEvent:      %d\n", SDL_MouseButtonEvent_Size());
   printf ("SDL_JoyBallEvent:          %d\n", SDL_JoyBallEvent_Size());
   printf ("SDL_JoyHatEvent:           %d\n", SDL_JoyHatEvent_Size());
   printf ("SDL_JoyButtonEvent:        %d\n", SDL_JoyButtonEvent_Size());
   printf ("SDL_ResizeEvent:           %d\n", SDL_ResizeEvent_Size());
   printf ("SDL_UserEvent:             %d\n", SDL_UserEvent_Size());
   printf ("SDL_SysWMEvent:            %d\n", SDL_SysWMEvent_Size());
   printf ("SDL_Event:                 %d\n", SDL_Event_Size());
   return 0;
}
