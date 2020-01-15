
include ../make.conf

binding:
	rm -f compile
	gnatmake -O3 -gnaty3abcefhiklmprstM90 -gnatnfvU -gnatwl\
		$(INC) compile -largs $(LIBS)
	gnatxref -v *.ads > tags
		
clean:
	rm -f compile$(EXE)  b~*.ad[bs] *.o *.ali tags
