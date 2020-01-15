
include ../make.conf
INC+=-I../binding -I../../AdaGL/GL

%:%.adb
	gnatmake -O3 -gnaty3abcefhiklmprM90 -gnatnfvU $<\
		$(INC) -largs $(LIBS)
	gnatxref -v *.ads *.adb > tags

#gnatmake  -mcpu=i686 -ffast-math -fomit-frame-pointer -O3 -gnaty3abcefhiklmprM90 -gnatnfvURp $<\

EXECS = loopwave testver testvidinfo testkeys testsprite\
	testalpha testgl testwm testpalette checkkeys graywin \
	testbitmap testcdrom testerror testhread testlock\
	testsem testtimer testtypes testwin threadwin torturethread\
	testjoystick

default: cleanexecs testbitmap

all: $(EXECS)

#default: 
#	echo "make <name_of_the_file>

clean:
	rm -f *.o *.ali *.adt b~*ad[bs]
	
cleanexecs:
	rm -f $(EXECS:=$(EXE))

stripexecs:
	strip $(EXECS)
	
cleandist: clean cleanexecs

cleantags:
	rm -f tags

shorter:
	gnatmake -c $(INC) $(EXECNAME)
	gnatbind $(INC) $(EXECNAME)
	gnatmake $(INC) -f -c -gnatc -gnatt $(EXECNAME)
	gnatelim $(EXECNAME) > gnat.adc

gnathtml:
	$(PERL) $(GNATHTML) -d -l 1 -I../binding -I../GL *.ad[bs]
