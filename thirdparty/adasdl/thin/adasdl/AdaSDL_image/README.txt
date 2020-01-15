
SDL_image binding

File loading library with other formats besides
the default *.bmp format in the SDL Multimedia Library.

This software depends on AdaSDL binding.
Get it from http://www.adapower.net/~avargas.

In windows do:
   make conf2w32
   make

In linux do:
   make conf2x11
   make

"showimage" is a sample image viewer.
it reads *.gif, *.png, *.tif, *.ppm, *.pcx, *.tga and *.bmp
NOTE: some rare variants of this formats may not work.

The AdaSDL binding is supposed to be at "../AdaSDL/binding" 
