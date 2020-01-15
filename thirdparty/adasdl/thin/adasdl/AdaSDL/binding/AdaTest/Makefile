
include ../../make.conf

eventrecsize: eventrecsize.adb
	gnatmake -O3 -gnaty -gnatnfvU $@  -I.. -largs $(LIBS)

test_enumerations: test_enumerations.adb
	gnatmake -O3 -gnaty -gnatnfvU $@  -I.. -largs $(LIBS)

test_endianess: test_endianess.adb
	gnatmake -O3 -gnaty -gnatnfvU $@  -I.. -largs $(LIBS)

clean:
	rm -f *.o *.ali

cleandist: clean
	rm -f test_enumerations test_endianess eventrecsize 
