INC+=-I../../AdaSDL/binding -I../../AdaGL/GL -I../../AdaSDL_mixer
include make.conf

default: cleangenericgl genericgl

%:%.adb
	gnatmake -O3 -gnaty3abcefhiklmprtM90 -gnatnfvU -gnatwl\
		$(INC) $@ -largs $(LIBS)

cleandist: clean cleangenericgl

clean:
	rm -f *.o  b~*.ad[bs] *.ali

cleangenericgl:
	rm -f genericgl$(EXE)

conf2x11:
	cp make.conf_x11 make.conf

conf2w32:
	cp make.conf_w32 make.conf
