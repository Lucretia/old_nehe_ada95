

XLIBS = -L/usr/X11/lib  -lX11 -lXm -lXt
XINCS = -I/usr/include/X11 -I/usr/local/include/SDL
SDLLIBS = -L/usr/local/lib -lSDL -lpthread
	
%: %.o
	gcc -o $@ $^ $(SDLLIBS) 
	
%.o: %.c
	gcc -c -o $@ $<  -I/usr/local/include/SDL


default: verify_ada_sizes show_c_sizes

verify_ada_sizes: verify_ada_sizes.adb sdl_c_sizes.o
	gnatmake $@ -I.. -largs sdl_c_sizes.o $(SDLLIBS)  
	
show_c_sizes: show_c_sizes.o sdl_c_sizes.o
show_c_sizes.o: show_c_sizes.c sdl_c_sizes.h
sdl_c_sizes.o: sdl_c_sizes.c

test_mask: test_mask.o
test_mask.o: test_mask.c

clean:
	rm -f *.o

cleandist: clean
	rm -f  show_c_sizes verify_ada_sizes
   
distclean: cleandist
