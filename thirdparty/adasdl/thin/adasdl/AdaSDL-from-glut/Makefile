
default:
	@echo "make {conf2x11 | conf2w32 | all | cleandist}"


conf2x11:
	make -C book conf2x11
	make -C examples conf2x11

conf2w32:
	make -C book conf2w32
	make -C examples conf2w32


all:
	make -C book
	make -C examples

cleandist: distclean
distclean:
	make -C book clean
	make -C examples clean
