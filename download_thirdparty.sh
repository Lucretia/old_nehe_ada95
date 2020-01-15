#!/bin/sh

echo "Installing AdaSDL..."
TOP=`pwd`
cd thirdparty
cvs -d:pserver:anonymous@adasdl.cvs.sourceforge.net:/cvsroot/adasdl login
cvs -z3 -d:pserver:anonymous@adasdl.cvs.sourceforge.net:/cvsroot/adasdl co -P adasdl/thin
cvs -d:pserver:anonymous@adasdl.cvs.sourceforge.net:/cvsroot/adasdl logout
cd adasdl/thin/adasdl/AdaSDL/binding/
patch -p0 < $TOP/patches/sdl-video.ads.patch
cd $TOP

