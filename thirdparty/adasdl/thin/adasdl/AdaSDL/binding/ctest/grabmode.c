#include <stdio.h>
#include <SDL.h>


int main(void)
{
   printf (" SDL_GRAB_QUERY      = %d\n"
           " SDL_GRAB_OFF        = %d\n"
	   " SDL_GRAB_ON         = %d\n"
	   " SDL_GRAB_FULLSCREEN = %d\n",
	   (int)SDL_GRAB_QUERY,
	   (int)SDL_GRAB_OFF,
	   (int)SDL_GRAB_ON,
	   (int)SDL_GRAB_FULLSCREEN);
   return 0;
}
