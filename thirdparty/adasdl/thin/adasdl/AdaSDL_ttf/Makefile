INC+=-I../AdaSDL/binding -I../AdaGL/GL
include make.conf

default: showfont

lib: binding

binding:
	rm -f compile
	gnatmake -O3 -gnaty3abcefhiklmprstM90 -gnatnfvU -gnatwl\
		$(INC) compile -largs $(LIBS)
.PHONY: showfont
showfont:
	gnatmake -O3 -gnaty3abcefhiklmprtM90 -gnatnfvU -gnatwl\
		$(INC) $@ -largs $(LIBS)
.PHONY: glfont
glfont:
	gnatmake -O3 -gnaty3abcefhiklmprtM90 -gnatnfvU -gnatwl\
		$(INC) $@ -largs $(LIBS)
clean:
	rm -f compile$(EXE)  b~*.ad[bs]

cleanshowfont:
	rm -f showfont$(EXE) showfont.ali showfont.o

cleanglfont:
	rm -f glfont$(EXE) glfont.ali glfont.o

cleanexecs: cleanglfont cleanshowfont
	rm -f compile$(EXE) compile.o

cleandist: clean cleanexecs
	rm -f *.o *.ali 

conf2x11:
	cp make.conf_x11 make.conf

conf2w32:
	cp make.conf_w32 make.conf
