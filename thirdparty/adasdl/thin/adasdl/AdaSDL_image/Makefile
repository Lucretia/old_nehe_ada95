INC+=-I../AdaSDL/binding
include make.conf

default: binding  showimage

lib: binding

binding:
	rm -f compile
	gnatmake -O3 -gnaty3abcefhiklmprstM90 -gnatnfvU -gnatwl\
		$(INC) compile -largs $(LIBS)
.PHONY: showimage
showimage:
	gnatmake -O3 -gnaty3abcefhiklmprtM90 -gnatnfvU -gnatwl\
		$(INC) $@ -largs $(LIBS)

clean:
	rm -f compile$(EXE)  b~*.ad[bs]

cleandist: clean cleanshowimage
	rm -f *.o *.ali

cleanshowimage:
	rm -f showimage$(EXE)

conf2x11:
	cp make.conf_x11 make.conf

conf2w32:
	cp make.conf_w32 make.conf
