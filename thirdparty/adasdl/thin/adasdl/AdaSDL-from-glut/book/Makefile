INC+=-I../../../AdaSDL/binding -I../../../AdaGL/GL -I../../../AdaSDL_mixer
include make.conf

default: cleanexecs rectangle

%:%.adb
	gnatmake -O3 -gnaty3abcefhiklmprtM90 -gnatnfvU -gnatwl\
		$(INC) $@ -largs $(LIBS)

cleandist: clean cleanexecs

clean:
	rm -f *.o  b~*.ad[bs] *.ali

cleanexecs:
	rm -f genericgl$(EXE) rectangle$(EXE) double$(EXE)

conf2x11:
	cp make.conf_x11 make.conf

conf2w32:
	cp make.conf_w32 make.conf
