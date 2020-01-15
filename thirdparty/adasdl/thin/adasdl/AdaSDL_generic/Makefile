
default:
	@echo "make {conf2x11 | conf2w32 | all | cleandist}"

conf2x11:
	make -C genericGL conf2x11
	make -C genericGLS conf2x11

conf2w32:
	make -C genericGL conf2w32
	make -C genericGLS conf2w32


all:
	make -C genericGL
	make -C genericGLS

cleandist: distclean
distclean:
	make -C genericGL clean
	make -C genericGLS clean
