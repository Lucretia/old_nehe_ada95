
default:
	@echo "make {conf2x11 | conf2w32 | all | libs | cleandist}"

conf2x11:
	make -C AdaGL conf2x11
	make -C AdaSDL conf2x11
	make -C AdaSDL-from-glut conf2x11
	make -C AdaSDL_framebuff conf2x11
	make -C AdaSDL_gears conf2x11
	make -C AdaSDL_generic conf2x11
	make -C AdaSDL_image conf2x11
	make -C AdaSDL_mixer conf2x11
	make -C AdaSDL_ttf conf2x11


conf2w32:
	make -C AdaGL conf2w32
	make -C AdaSDL conf2w32
	make -C AdaSDL-from-glut conf2w32
	make -C AdaSDL_framebuff conf2w32
	make -C AdaSDL_gears conf2w32
	make -C AdaSDL_generic conf2w32
	make -C AdaSDL_image conf2w32
	make -C AdaSDL_mixer conf2w32
	make -C AdaSDL_ttf conf2w32

all:
	make -C AdaGL
	make -C AdaSDL all
	make -C AdaSDL-from-glut
	make -C AdaSDL_framebuff
	make -C AdaSDL_gears
	make -C AdaSDL_generic
	make -C AdaSDL_image
	make -C AdaSDL_mixer
	make -C AdaSDL_ttf

libs:
	make -C AdaGL lib
	make -C AdaSDL lib
	make -C AdaSDL_framebuff lib
	make -C AdaSDL_image lib
	make -C AdaSDL_mixer lib
	make -C AdaSDL_ttf lib

cleandist: distclean
distclean:
	make -C AdaGL cleandist
	make -C AdaSDL cleandist
	make -C AdaSDL-from-glut cleandist
	make -C AdaSDL_framebuff cleandist
	make -C AdaSDL_gears cleandist
	make -C AdaSDL_generic cleandist
	make -C AdaSDL_image cleandist
	make -C AdaSDL_mixer cleandist
	make -C AdaSDL_ttf cleandist

