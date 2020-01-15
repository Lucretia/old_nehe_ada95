#include <SDL.h>


int main (void)
{
  printf (" The SDL_ActiveEvent size is:      %d\n", sizeof(SDL_ActiveEvent));
  printf (" The SDL_KeyboardEvent size is:    %d\n", sizeof(SDL_KeyboardEvent));
  printf (" ----------------- Uint8:          %d\n", sizeof(Uint8));
  printf (" ----------------- Uint8:          %d\n", sizeof(Uint8));
  printf (" ----------------- Uint8:          %d\n", sizeof(Uint8));
  printf (" ----------------- SDL_keysym:     %d\n", sizeof(SDL_keysym));
  printf (" ===================== Uint8:      %d\n", sizeof(Uint8));
  printf (" ===================== SDLKey:     %d\n", sizeof(SDLKey));
  printf (" ===================== SDLMod:     %d\n", sizeof(SDLMod));
  printf (" ===================== Uint16:     %d\n", sizeof(Uint16));
  printf (" The SDL_MouseMotionEvent size is: %d\n", sizeof(SDL_MouseMotionEvent));
  printf (" The SDL_MouseButtonEvent size is: %d\n", sizeof(SDL_MouseButtonEvent));
  printf (" The SDL_JoyAxisEvent size is:     %d\n", sizeof(SDL_JoyAxisEvent));
  printf (" The SDL_JoyBallEvent size is:     %d\n", sizeof(SDL_JoyBallEvent));
  printf (" The SDL_JoyHatEvent size is:      %d\n", sizeof(SDL_JoyHatEvent));
  printf (" The SDL_JoyButtonEvent size is:   %d\n", sizeof(SDL_JoyButtonEvent));
  printf (" The SDL_ResizeEvent size is:      %d\n", sizeof(SDL_ResizeEvent));
  printf (" The SDL_QuitEvent size is:        %d\n", sizeof(SDL_QuitEvent));
  printf (" The SDL_UserEvent size is:        %d\n", sizeof(SDL_UserEvent));
  printf (" The SDL_SysWMEvent size is:       %d\n", sizeof(SDL_SysWMEvent));
  printf (" The SDL_Event size is:            %d\n", sizeof(SDL_Event));
   return 0;
}
