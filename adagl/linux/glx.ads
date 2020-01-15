--
--  Copyright  (c) 2002-2003, David Holm
--  All rights reserved.
--
--  Redistribution and use in source and binary forms, with or without
--  modification, are permitted provided that the following conditions are
--  met:
--
--   * Redistributions of source code must retain the above copyright notice,
--     this list of conditions and the following disclaimer.
--   * Redistributions in binary form must reproduce the above copyright
--     notice,
--     this list of conditions and the following disclaimer in the
--     documentation
--     and/or other materials provided with the distribution.
--   * The names of its contributors may not be used to endorse or promote
--     products derived from this software without specific prior written
--     permission.
--
--  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
--  "AS IS"
--  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
--  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
--  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
--  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
--  CONSEQUENTIAL DAMAGES  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
--  SUBSTITUTE GOODS OR SERVICES;
--  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
--  CONTRACT, STRICT LIABILITY, OR TORT  (INCLUDING NEGLIGENCE OR OTHERWISE)
--  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
--  POSSIBILITY OF SUCH DAMAGE.
--


with Interfaces.C;
with Interfaces.C.Extensions;
with System;
with GL;

with X_Lib;

package GLX is

  package IC renames Interfaces.C;
  package ICE renames Interfaces.C.Extensions;
  
  GLX_VERSION_1_1             : constant := 1;
  GLX_VERSION_1_2             : constant := 1;
  GLX_VERSION_1_3             : constant := 1;
  GLX_VERSION_1_4             : constant := 1;
  GLX_EXTENSION_NAME          : constant String := "GLX";
  GLX_USE_GL                  : constant := 1;
  GLX_BUFFER_SIZE             : constant := 2;
  GLX_LEVEL                   : constant := 3;
  GLX_RGBA                    : constant := 4;
  GLX_DOUBLEBUFFER            : constant := 5;
  GLX_STEREO                  : constant := 6;
  GLX_AUX_BUFFERS             : constant := 7;
  GLX_RED_SIZE                : constant := 8;
  GLX_GREEN_SIZE              : constant := 9;
  GLX_BLUE_SIZE               : constant := 10;
  GLX_ALPHA_SIZE              : constant := 11;
  GLX_DEPTH_SIZE              : constant := 12;
  GLX_STENCIL_SIZE            : constant := 13;
  GLX_ACCUM_RED_SIZE          : constant := 14;
  GLX_ACCUM_GREEN_SIZE        : constant := 15;
  GLX_ACCUM_BLUE_SIZE         : constant := 16#0010#;
  GLX_ACCUM_ALPHA_SIZE        : constant := 17;
  GLX_BAD_SCREEN              : constant := 1;
  GLX_BAD_ATTRIBUTE           : constant := 2;
  GLX_NO_EXTENSION            : constant := 3;
  GLX_BAD_VISUAL              : constant := 4;
  GLX_BAD_CONTEXT             : constant := 5;
  GLX_BAD_VALUE               : constant := 6;
  GLX_BAD_ENUM                : constant := 7;
  GLX_VENDOR                  : constant := 1;
  GLX_VERSION                 : constant := 2;
  GLX_EXTENSIONS              : constant := 3;
  GLX_CONFIG_CAVEAT           : constant := 16#0020#;
  GLX_DONT_CARE               : constant := 16#FFFF_FFFF#;
  GLX_SLOW_CONFIG             : constant := 16#0000_8001#;
  GLX_NON_CONFORMANT_CONFIG   : constant := 16#0000_800D#;
  GLX_X_VISUAL_TYPE           : constant := 16#0022#;
  GLX_TRANSPARENT_TYPE        : constant := 16#0023#;
  GLX_TRANSPARENT_INDEX_VALUE : constant := 16#0024#;
  GLX_TRANSPARENT_RED_VALUE   : constant := 16#0025#;
  GLX_TRANSPARENT_GREEN_VALUE : constant := 16#0026#;
  GLX_TRANSPARENT_BLUE_VALUE  : constant := 16#0027#;
  GLX_TRANSPARENT_ALPHA_VALUE : constant := 16#0028#;
  GLX_MAX_PBUFFER_WIDTH       : constant := 16#0000_8016#;
  GLX_MAX_PBUFFER_HEIGHT      : constant := 16#0000_8017#;
  GLX_MAX_PBUFFER_PIXELS      : constant := 16#0000_8018#;
  GLX_PRESERVED_CONTENTS      : constant := 16#0000_801B#;
  GLX_LARGEST_PBUFFER         : constant := 16#0000_801C#;
  GLX_WIDTH                   : constant := 16#0000_801D#;
  GLX_HEIGHT                  : constant := 16#0000_801E#;
  GLX_EVENT_MASK              : constant := 16#0000_801F#;
  GLX_DRAWABLE_TYPE           : constant := 16#0000_8010#;
  GLX_FBCONFIG_ID             : constant := 16#0000_8013#;
  GLX_VISUAL_ID               : constant := 16#0000_800B#;
  GLX_WINDOW_BIT              : constant := 16#0001#;
  GLX_PIXMAP_BIT              : constant := 16#0002#;
  GLX_PBUFFER_BIT             : constant := 16#0004#;
  GLX_AUX_BUFFERS_BIT         : constant := 16#0010#;
  GLX_FRONT_LEFT_BUFFER_BIT   : constant := 16#0001#;
  GLX_FRONT_RIGHT_BUFFER_BIT  : constant := 16#0002#;
  GLX_BACK_LEFT_BUFFER_BIT    : constant := 16#0004#;
  GLX_BACK_RIGHT_BUFFER_BIT   : constant := 16#0008#;
  GLX_DEPTH_BUFFER_BIT        : constant := 16#0020#;
  GLX_STENCIL_BUFFER_BIT      : constant := 16#0040#;
  GLX_ACCUM_BUFFER_BIT        : constant := 16#0080#;
  GLX_RENDER_TYPE             : constant := 16#0000_8011#;
  GLX_X_RENDERABLE            : constant := 16#0000_8012#;
  GLX_NONE                    : constant := 16#8000#;
  GLX_TRUE_COLOR              : constant := 16#0000_8002#;
  GLX_DIRECT_COLOR            : constant := 16#0000_8003#;
  GLX_PSEUDO_COLOR            : constant := 16#0000_8004#;
  GLX_STATIC_COLOR            : constant := 16#0000_8005#;
  GLX_GRAY_SCALE              : constant := 16#0000_8006#;
  GLX_STATIC_GRAY             : constant := 16#0000_8007#;
  GLX_TRANSPARENT_RGB         : constant := 16#0000_8008#;
  GLX_TRANSPARENT_INDEX       : constant := 16#0000_8009#;
  GLX_RGBA_TYPE               : constant := 16#0000_8014#;
  GLX_COLOR_INDEX_TYPE        : constant := 16#0000_8015#;
  GLX_COLOR_INDEX_BIT         : constant := 16#0002#;
  GLX_RGBA_BIT                : constant := 16#0001#;
  GLX_SCREEN                  : constant := 16#0000_800C#;
  GLX_PBUFFER_CLOBBER_MASK    : constant := 16#0800_0000#;
  GLX_DAMAGED                 : constant := 16#0000_8020#;
  GLX_SAVED                   : constant := 16#0000_8021#;
  GLX_WINDOW                  : constant := 16#0000_8022#;
  GLX_PBUFFER                 : constant := 16#0000_8023#;
  GLX_PBUFFER_HEIGHT          : constant := 16#0000_8040#;
  GLX_PBUFFER_WIDTH           : constant := 16#0000_8041#;
  GLX_SAMPLE_BUFFERS          : constant := 16#0001_86A0#;
  GLX_SAMPLES                 : constant := 16#0001_86A1#;
  GLX_MESA_AGP_OFFSET         : constant := 1;

  type GLXContextID is new X_Lib.XID;
  type GLXPixmap is new X_Lib.XID;
  type GLXDrawable is new X_Lib.XID;
  type GLXPbuffer is new X_Lib.XID;
  type GLXWindow is new X_Lib.XID;
  type GLXFBConfigID is new X_Lib.XID;

  type GLXcontextRec is
    record
      null;
    end record;

  type GLXContext is access all GLXcontextRec;

  type GLXFBConfigRec is
    record
      null;
    end record;

  type GLXFBConfig is access all GLXFBConfigRec;
  type GLXFBConfig_Ptr is access all GLXFBConfig;

  function glXChooseVisual(dpy : in X_Lib.Display_Pointer; screen : in X_Lib.Screen_Number; attribList : in GL.GLintPtr) return X_Lib.X_Visual_Info_Ptr;
  function glXCreateContext(dpy : in X_Lib.Display_Pointer; vis : in X_Lib.X_Visual_Info_Ptr; shareList : in GLXContext; direct : in Integer) return GLXContext;
  procedure glXDestroyContext(dpy : in X_Lib.Display_Pointer; ctx : in GLXContext);
  function glXMakeCurrent(dpy : in X_Lib.Display_Pointer; drawable : in GLXDrawable; ctx : in GLXContext) return Integer;
  procedure glXCopyContext(dpy : in X_Lib.Display_Pointer; src : in GLXContext; dst : in GLXContext; mask : in IC.unsigned);
  procedure glXSwapBuffers(dpy : in X_Lib.Display_Pointer; drawable : in GLXDrawable);
  function glXCreateGLXPixmap(dpy : in X_Lib.Display_Pointer; visual : in X_Lib.X_Visual_Info_Ptr; pixmap : in X_Lib.Pixmap_ID) return GLXPixmap;
  procedure glXDestroyGLXPixmap(dpy : in X_Lib.Display_Pointer; pixmap : in GLXPixmap);
  function glXQueryExtension(dpy : in X_Lib.Display_Pointer; errorb : in GL.GLintPtr; event : in GL.GLintPtr) return Boolean;
  function glXQueryVersion(dpy : in X_Lib.Display_Pointer; maj : in GL.GLintPtr; min : in GL.GLintPtr) return Boolean;
  function glXIsDirect(dpy : in X_Lib.Display_Pointer; ctx : in GLXContext) return Integer;
  function glXGetConfig(dpy : in X_Lib.Display_Pointer; visual : in X_Lib.X_Visual_Info_Ptr; attrib : in Integer; value : in GL.GLintPtr) return Integer;
  function glXGetCurrentContext return GLXContext;
  function glXGetCurrentDrawable return GLXDrawable;
  procedure glXWaitGL;
  procedure glXWaitX;
  procedure glXUseXFont(font : in X_Lib.Font_ID; first : in Integer; cnt : in Integer; list : in Integer);
  function glXQueryExtensionsString(dpy : in X_Lib.Display_Pointer; screen : in Integer) return GL.GLubytePtr;
  function glXQueryServerString(dpy : in X_Lib.Display_Pointer; screen : in Integer; name : in Integer) return GL.GLubytePtr;
  function glXGetClientString(dpy : in X_Lib.Display_Pointer; name : in Integer) return GL.GLubytePtr;
  function glXGetCurrentDisplay return X_Lib.Display_Pointer;

  function glXChooseFBConfig(dpy        : in X_Lib.Display_Pointer;
                             screen     : in Integer;
                             attribList : in GL.GLintPtr;
                             nitems     : in GL.GLintPtr) return GLXFBConfig_Ptr;

  function glXGetFBConfigAttrib(dpy       : in X_Lib.Display_Pointer;
                                config    : in GLXFBConfig;
                                attribute : in Integer;
                                value     : in GL.GLintPtr) return Integer;

  function glXGetFBConfigs(dpy       : in X_Lib.Display_Pointer;
                           screen    : in Integer;
                           nelements : in GL.GLintPtr) return GLXFBConfig_Ptr;

  function glXGetVisualFromFBConfig(dpy : in X_Lib.Display_Pointer; config : in GLXFBConfig) return X_Lib.X_Visual_Info_Ptr;

  function glXCreateWindow(dpy        : in X_Lib.Display_Pointer;
                           config     : in GLXFBConfig;
                           win        : in X_Lib.Window_ID;
                           attribList : in GL.GLintPtr) return GLXWindow;

  procedure glXDestroyWindow(dpy : in X_Lib.Display_Pointer; window : in GLXWindow);

  function glXCreatePixmap(dpy        : in X_Lib.Display_Pointer;
                           config     : in GLXFBConfig;
                           pixmap     : in X_Lib.Pixmap_ID;
                           attribList : in GL.GLintPtr) return GLXPixmap;

  procedure glXDestroyPixmap(dpy : in X_Lib.Display_Pointer; pixmap : in GLXPixmap);
  function glXCreatePbuffer(dpy : in X_Lib.Display_Pointer; config : in GLXFBConfig; attribList : in GL.GLintPtr) return GLXPbuffer;
  procedure glXDestroyPbuffer(dpy : in X_Lib.Display_Pointer; pbuf : in GLXPbuffer);
  procedure glXQueryDrawable(dpy : in X_Lib.Display_Pointer; draw : in GLXDrawable; attribute : in Integer; value : in GL.GLuintPtr);

  function glXCreateNewContext(dpy        : in X_Lib.Display_Pointer;
                               config     : in GLXFBConfig;
                               renderType : in Integer;
                               shareList  : in GLXContext;
                               direct     : in Integer) return GLXContext;

  function glXMakeContextCurrent(dpy  : in X_Lib.Display_Pointer;
                                 draw : in GLXDrawable;
                                 read : in GLXDrawable;
                                 ctx  : in GLXContext) return Integer;

  function glXGetCurrentReadDrawable return GLXDrawable;

  function glXQueryContext(dpy       : in X_Lib.Display_Pointer;
                           ctx       : in GLXContext;
                           attribute : in Integer;
                           value     : in GL.GLintPtr) return Integer;

  procedure glXSelectEvent(dpy : in X_Lib.Display_Pointer; drawable : in GLXDrawable; mask : in IC.unsigned);
  procedure glXGetSelectedEvent(dpy : in X_Lib.Display_Pointer; drawable : in GLXDrawable; mask : in GL.GLuintPtr);
  function glXBindTexImageARB(dpy : in X_Lib.Display_Pointer; pbuffer : in GLXPbuffer; buffer : in Integer) return Boolean;
  function glXReleaseTexImageARB(dpy : in X_Lib.Display_Pointer; pbuffer : in GLXPbuffer; buffer : in Integer) return Boolean;
  function glXDrawableAttribARB(dpy : in X_Lib.Display_Pointer; draw : in GLXDrawable; attribList : in GL.GLintPtr) return Boolean;

--  This one is tricky ;
--    function glXGetProcAddress (procname: GL.GLubytePtr)
--       return Interfaces.C.function_pointer;

  function glXAllocateMemoryNV(size      : in GL.GLsizei;
                               readfreq  : in GL.GLfloat;
                               writefreq : in GL.GLfloat;
                               pri       : in GL.GLfloat) return System.Address;

   procedure glXFreeMemoryNV(pointer : access ICE.void_ptr);
   function glXGetAGPOffsetMESA(pointer : access ICE.void_ptr) return GL.GLuint;

private

  pragma Import (C, glXChooseVisual, "glXChooseVisual");
  pragma Import (C, glXCreateContext, "glXCreateContext");
  pragma Import (C, glXDestroyContext, "glXDestroyContext");
  pragma Import (C, glXMakeCurrent, "glXMakeCurrent");
  pragma Import (C, glXCopyContext, "glXCopyContext");
  pragma Import (C, glXSwapBuffers, "glXSwapBuffers");
  pragma Import (C, glXCreateGLXPixmap, "glXCreateGLXPixmap");
  pragma Import (C, glXDestroyGLXPixmap, "glXDestroyGLXPixmap");
  pragma Import (C, glXQueryExtension, "glXQueryExtension");
  pragma Import (C, glXQueryVersion, "glXQueryVersion");
  pragma Import (C, glXIsDirect, "glXIsDirect");
  pragma Import (C, glXGetConfig, "glXGetConfig");
  pragma Import (C, glXGetCurrentContext, "glXGetCurrentContext");
  pragma Import (C, glXGetCurrentDrawable, "glXGetCurrentDrawable");
  pragma Import (C, glXWaitGL, "glXWaitGL");
  pragma Import (C, glXWaitX, "glXWaitX");
  pragma Import (C, glXUseXFont, "glXUseXFont");
  pragma Import (C, glXQueryExtensionsString, "glXQueryExtensionsString");
  pragma Import (C, glXQueryServerString, "glXQueryServerString");
  pragma Import (C, glXGetClientString, "glXGetClientString");
  pragma Import (C, glXGetCurrentDisplay, "glXGetCurrentDisplay");
  pragma Import (C, glXChooseFBConfig, "glXChooseFBConfig");
  pragma Import (C, glXGetFBConfigAttrib, "glXGetFBConfigAttrib");
  pragma Import (C, glXGetFBConfigs, "glXGetFBConfigs");
  pragma Import (C, glXGetVisualFromFBConfig, "glXGetVisualFromFBConfig");
  pragma Import (C, glXCreateWindow, "glXCreateWindow");
  pragma Import (C, glXDestroyWindow, "glXDestroyWindow");
  pragma Import (C, glXCreatePixmap, "glXCreatePixmap");
  pragma Import (C, glXDestroyPixmap, "glXDestroyPixmap");
  pragma Import (C, glXCreatePbuffer, "glXCreatePbuffer");
  pragma Import (C, glXDestroyPbuffer, "glXDestroyPbuffer");
  pragma Import (C, glXQueryDrawable, "glXQueryDrawable");
  pragma Import (C, glXCreateNewContext, "glXCreateNewContext");
  pragma Import (C, glXMakeContextCurrent, "glXMakeContextCurrent");
  pragma Import (C, glXGetCurrentReadDrawable, "glXGetCurrentReadDrawable");
  pragma Import (C, glXQueryContext, "glXQueryContext");
  pragma Import (C, glXSelectEvent, "glXSelectEvent");
  pragma Import (C, glXGetSelectedEvent, "glXGetSelectedEvent");
  pragma Import (C, glXBindTexImageARB, "glXBindTexImageARB");
  pragma Import (C, glXReleaseTexImageARB, "glXReleaseTexImageARB");
  pragma Import (C, glXDrawableAttribARB, "glXDrawableAttribARB");
  pragma Import (C, glXGetProcAddress, "glXGetProcAddress");
  pragma Import (C, glXAllocateMemoryNV, "glXAllocateMemoryNV");
  pragma Import (C, glXFreeMemoryNV, "glXFreeMemoryNV");
  pragma Import (C, glXGetAGPOffsetMESA, "glXGetAGPOffsetMESA");

end GLX;
