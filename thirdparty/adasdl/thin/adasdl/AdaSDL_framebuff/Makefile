INC+=-I../AdaSDL/binding
include make.conf

default: all

all:framebuff sdltests tutorial

lib: framebuff

framebuff:
	rm -f compile
	gnatmake -O3 -gnaty3abcefhiklmprstM90 -gnatnfvU -gnatwl\
		$(INC) compile -largs $(LIBS)

.PHONY:  sdltests
sdltests:
	make -C sdltests all

.PHONY:  tutorial
tutorial:
	make -C tutorial all

clean:
	make -C tutorial clean cleanexecs
	make -C sdltests clean cleanexecs
	rm -f compile$(EXE)  b~*.ad[bs]

cleandist: clean
	make -C tutorial cleandist
	make -C sdltests cleandist
	rm -f *.o *.ali

conf2x11:
	cp make.conf_x11 make.conf

conf2w32:
	cp make.conf_w32 make.conf
