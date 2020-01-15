

XLIBS = -L/usr/X11R6/lib  -lX11 -lXm -lXt
XINCS = -I/usr/include/X11 -I/usr/local/include/SDL

eventrecsize: eventrecsize.c
	gcc $(XINCS) -o $@  $< $(XLIBS)
	
grabmode: grabmode.c
	gcc -o $@ $<  -I/usr/local/include/SDL -L/usr/local/lib -lSDL -lpthread
	
xwinidsize: xwinidsize.c
	gcc $(XINCS) -o @$ $< $(XLIBS)

clean:
	rm -f *.o

cleandist: clean
	rm -f grabmode eventrecsize xwinidsize

distclean: cleandist   

