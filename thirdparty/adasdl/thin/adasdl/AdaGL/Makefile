
all : bind

help:
	@echo "***********************************************************************"
	@echo "* make [conf2w32] [conf2x11] [all] [bind] [clean]                     *"
	@echo "*      [cleandist] [tbz2 [VERSION=version] [tgz [VERSION=version]]    *"
	@echo "* bind            Makes de AdaOpenGL binding                          *"
	@echo "* conf2w32:       Prepare the system for compilation on windows       *" 
	@echo "* conf2x11:       Prepare the system for compilation on X11           *"
	@echo "* tbz2 [VERSION=version]: makes an AdaOpenGL<version>.tar.bz2         *"
	@echo "* tgz  [VERSION=version]: makes an AdaOpenGL<version>.tgz             *"
	@echo "* clean:          Clean bins, not configuration files                 *"
	@echo "* cleandist:      Clean bins and configuration  files                 *"
	@echo "* alternatively you can cd to a directory and do a make there         *"
	@echo "***********************************************************************"

lib: bind

bind:
	make -C GL

tbz2:
	tar -Icvf ../AdaOpenGL_$(VERSION).tar.bz2 ../AdaOpenGL

tgz:
	tar -zcvf ../AdaOpenGL_$(VERSION).tgz ../AdaOpenGL

clean:
	make -C GL clean

cleandist: clean

#cleandist:
#	rm -f -R GL
#	rm -f make.conf

conf2w32:
	rm -f make.conf
	rm -f -R GL
	cp -R GL_w32 GL
	cp make.conf_w32 make.conf

conf2x11:
	rm -f make.conf
	rm -f -R GL
	cp -R GL_x11 GL
	cp make.conf_x11 make.conf

