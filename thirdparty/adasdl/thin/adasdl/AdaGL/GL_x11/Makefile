
INC+=-I../binding -I../GL
include ../make.conf

default:
	gnatmake -O3 $(INC)  compile -largs $(LIBS)

clean:
	rm -f *.o *.ali compile$(EXE) b~*.ad[bs]
