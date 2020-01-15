INC+=-I../AdaSDL/binding
include make.conf

default: binding cleanplaywave cleanplaymus playmus playwave

lib: binding

binding:
	rm -f compile
	gnatmake -O3 -gnaty3abcefhiklmprstM90 -gnatnfvU -gnatwl\
		$(INC) compile -largs $(LIBS)
.PHONY: playmus
playmus:
	gnatmake -O3 -gnaty3abcefhiklmprtM90 -gnatnfvU -gnatwl\
		$(INC) $@ -largs $(LIBS)
.PHONY: playwave
playwave:
	gnatmake -O3 -gnaty3abcefhiklmprtM90 -gnatnfvU -gnatwl\
		$(INC) $@ -largs $(LIBS)
clean:
	rm -f compile$(EXE)  b~*.ad[bs]

cleandist: clean cleanplaymus cleanplaywave
	rm -f *.o *.ali playmus

cleanplaymus:
	rm -f playmus$(EXE)

cleanplaywave:
	rm -f playwave$(EXE)

cleanexecs: cleanplaymus cleanplaywave

conf2x11:
	cp make.conf_x11 make.conf

conf2w32:
	cp make.conf_w32 make.conf
