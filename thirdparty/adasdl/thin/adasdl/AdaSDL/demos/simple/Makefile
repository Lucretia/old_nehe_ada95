
INC+=-I../../binding -I../../GL
include ../../make.conf

%:%.adb
	gnatmake -gnatnfvU $< $(INC) -largs $(LIBS)
	
default: 
	@echo "make <name_of_the_file>"
	@echo "or make all"

EXECS=simple00 simple01 simple02

all: $(EXECS)

clean:
	rm -f *.o *.ali 
cleandist: clean
	rm -f $(EXECS:=$(EXE))

