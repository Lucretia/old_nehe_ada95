# NeHe Ada95 ports

I originally set out to port the entire NeHe OpenGL tutorials to Ada95 a long time ago. This is a snapshot of the source that I still have on my drive, I no longer have the Subversion repository or it's history. I'm placing it here as an archive.

This repository includes the SDL and OpenGL bindings I used at the time, these are long dead now.

This repository also includes a few demos which aren't NeHe, but use the same base code. These are the projects with "collision" in the name and the bounding volume demo.

This source is no longer on the NeHe website; TBH, that website has been pretty dead for years.

I have modern [SDL bindings](https://github.com/Lucretia/sdlada), use those instead.

Disclaimer: Do not try to build this, it will most likely fail.

## This is the original README from here on

Ada/SDL/OpenGL base layout, copyright © 2007, Luke A. Guest.

To install, create a new directory:

1) mkdir ada_gl_tutorials
2) cd ada_gl_tutorials
3) tar -xzvpf base.tgz
4) ./download_thirdparty.sh
5) tar -xzvpf nehe_base_ada.tgz
6) pushd build/nehe_base_ada
7) gnatmake -Pnehe_base_ada.gpr
8) ./linux/debug/nehe_base_ada

