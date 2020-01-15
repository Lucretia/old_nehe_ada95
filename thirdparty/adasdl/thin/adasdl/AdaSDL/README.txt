Step 0 ------------------------------
You must have the GNAT Ada compiler available in your platform.
Porting to other compilers might be easy. You can get the public
version of GNAT at: ftp://cs.nyu.edu/pub/gnat

I use  the following GNU tools (no available in the
GNAT environment in Windows ) :
  rm
  cp
  tar
  bzip2
  for windows you can get them at http:/cygwin.com
  
-- ---------------------------
AdaGL directory must be at the same level of AdaSDL directory.
-- ---------------------------

Step 1  -----------------------------
Go to  http://www.libsdl.org/download-1.2.html
For Linux:
	get the proper SDL-devel-1.?.?.rpm
	or
	SDL-1.?.?.tar.gz and compile
	or 
	get an available SDL package from your favorite distribution.
        (like libsdl1.?.deb + libsdl1.?-dev.deb for instance)

For windows:
	get the file SDL-devel-1.?.?-mingw32.tar.gz

Step 2 ------------------------------

On Linux do:  "make conf2x11"

	
On windows do: "make conf2w32"
	You will need to edit make.conf
	in order to change the c:/devel/i386-mingw32/lib
	to another location where libSDL.a is located.

Step 3 -----------------------------

Then: "make all"
    NOTE: If your "make" doesn't support the -C option
    "make all" will fail. In that case you mast do
    * cd binding; make
    * cd ../stdtest; make all

Or just: "make" to see the available options.


Step 4 ------------------------------
To run the samples you need to install the SDL .dll or .so files
from www.libsdl.org.
     SDL.dll goes to c:/windows/system
     SDL.*.so goes to /usr/lib or /usr/local/lib

NOTES -- ----------------------------

If you have installation/compilation problems send-me an Email to
avargas@adapower.net

If you need more information about SDL in general go to:
    * www.libsdl.org
    Here you must speak in the C/C++ language to be understanded:
        * irc.openprojects.net  channel #SDL
        * Subscribe the SDL Mailing list 


