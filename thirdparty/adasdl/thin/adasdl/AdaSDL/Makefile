
help:
	@echo "***********************************************************************"
	@echo "* make [conf2w32] [conf2x11] [all] [bind] [clean] [cleanexamples]     *"
	@echo "*      [cleandist] [tbz2 [VERSION=version] [tgz [VERSION=version]]    *"
	@echo "*      [gnathatml]                                                    *"
	@echo "* conf2w32:       Prepare the system for compilation on windows       *" 
	@echo "* conf2x11:       Prepare the system for compilation on X11           *"
	@echo "* all:            Compilation of the:  binding, GL, examples and test *"
	@echo "* bind:           Compilation of the bind and GL files                *"
	@echo "* cleanexamples:  Clean examples and tests                            *"
	@echo "* tbz2 [VERSION=version]: makes an AdaSDl<version>.tar.bz2            *"
	@echo "* tgz  [VERSION=version]: makes an AdaSDl<version>.tgz                *"
	@echo "* clean:          Clean bins, not configuration files                 *"
	@echo "* cleandist:      Clean bins and configuration  files                 *"
	@echo "* gnathtml :      Makes an HTML representation of the files           *"
	@echo "* alternatively you can cd to a directory and do a make there         *"
	@echo "***********************************************************************"

lib: bind

bind:
	make -C binding

all: bind
	make -C stdtest all
	make -C demos/simple all

tbz2:
	tar -Icvf ../AdaSDL_$(VERSION).tar.bz2 ../AdaSDL

tgz:
	tar -zcvf ../AdaSDL_$(VERSION).tgz ../AdaSDL

cleanexamples:
	make -C stdtest cleandist
	make -C demos/simple cleandist
	
clean: cleanexamples
	make -C binding clean

cleandist: cleanexamples
	make -C binding clean

conf2w32:
	rm -f make.conf
	cp make.conf_w32 make.conf

conf2x11:
	rm -f make.conf
	cp make.conf_x11 make.conf

gnathtml:
	make -C stdtest gnathtml
	rm -f -R  ../AdaSDLhtml
	mv stdtest/html ../AdaSDLhtml
