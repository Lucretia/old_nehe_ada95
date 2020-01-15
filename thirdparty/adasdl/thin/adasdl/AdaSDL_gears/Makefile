INC+=-I../AdaSDL/binding -I../AdaGL/GL -I../AdaSDL_mixer
include make.conf

default: gears

.PHONY: gears
gears:
	gnatmake -O3 -gnaty3abcefhiklmprtM90 -gnatnfvU -gnatwl\
		$(INC) $@ -largs $(LIBS)

cleandist: clean cleangears

clean:
	rm -f *.o  b~*.ad[bs] *.ali

cleangears:
	rm -f gears$(EXE)

conf2x11:
	cp make.conf_x11 make.conf

conf2w32:
	cp make.conf_w32 make.conf
