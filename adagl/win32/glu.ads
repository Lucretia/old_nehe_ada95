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
--     notice, this list of conditions and the following disclaimer in the
--     documentation and/or other materials provided with the distribution.
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


with System;
with GL;

package GLU is

  pragma Link_With("-lglu32");
  
  GLU_EXT_OBJECT_SPACE_TESS       : constant := 1;
  GLU_EXT_NURBS_TESSELLATOR       : constant := 1;
  GLU_FALSE                       : constant := 8#0000#;
  GLU_TRUE                        : constant := 1;
  GLU_VERSION_1_1                 : constant := 1;
  GLU_VERSION_1_2                 : constant := 1;
  GLU_VERSION_1_3                 : constant := 1;
  GLU_VERSION                     : constant := 100800;
  GLU_EXTENSIONS                  : constant := 100801;
  GLU_INVALID_ENUM                : constant := 100900;
  GLU_INVALID_VALUE               : constant := 100901;
  GLU_OUT_OF_MEMORY               : constant := 100902;
  GLU_INVALID_OPERATION           : constant := 100904;
  GLU_OUTLINE_POLYGON             : constant := 100240;
  GLU_OUTLINE_PATCH               : constant := 100241;
  GLU_NURBS_ERROR                 : constant := 100103;
  GLU_ERROR                       : constant := 100103;
  GLU_NURBS_BEGIN                 : constant := 100164;
  GLU_NURBS_BEGIN_EXT             : constant := 100164;
  GLU_NURBS_VERTEX                : constant := 100165;
  GLU_NURBS_VERTEX_EXT            : constant := 100165;
  GLU_NURBS_NORMAL                : constant := 100166;
  GLU_NURBS_NORMAL_EXT            : constant := 100166;
  GLU_NURBS_COLOR                 : constant := 100167;
  GLU_NURBS_COLOR_EXT             : constant := 100167;
  GLU_NURBS_TEXTURE_COORD         : constant := 100168;
  GLU_NURBS_TEX_COORD_EXT         : constant := 100168;
  GLU_NURBS_END                   : constant := 100169;
  GLU_NURBS_END_EXT               : constant := 100169;
  GLU_NURBS_BEGIN_DATA            : constant := 100170;
  GLU_NURBS_BEGIN_DATA_EXT        : constant := 100170;
  GLU_NURBS_VERTEX_DATA           : constant := 100171;
  GLU_NURBS_VERTEX_DATA_EXT       : constant := 100171;
  GLU_NURBS_NORMAL_DATA           : constant := 100172;
  GLU_NURBS_NORMAL_DATA_EXT       : constant := 100172;
  GLU_NURBS_COLOR_DATA            : constant := 100173;
  GLU_NURBS_COLOR_DATA_EXT        : constant := 100173;
  GLU_NURBS_TEXTURE_COORD_DATA    : constant := 100174;
  GLU_NURBS_TEX_COORD_DATA_EXT    : constant := 100174;
  GLU_NURBS_END_DATA              : constant := 100175;
  GLU_NURBS_END_DATA_EXT          : constant := 100175;
  GLU_NURBS_ERROR1                : constant := 100251;
  GLU_NURBS_ERROR2                : constant := 100252;
  GLU_NURBS_ERROR3                : constant := 100253;
  GLU_NURBS_ERROR4                : constant := 100254;
  GLU_NURBS_ERROR5                : constant := 100255;
  GLU_NURBS_ERROR6                : constant := 100256;
  GLU_NURBS_ERROR7                : constant := 100257;
  GLU_NURBS_ERROR8                : constant := 100258;
  GLU_NURBS_ERROR9                : constant := 100259;
  GLU_NURBS_ERROR10               : constant := 100260;
  GLU_NURBS_ERROR11               : constant := 100261;
  GLU_NURBS_ERROR12               : constant := 100262;
  GLU_NURBS_ERROR13               : constant := 100263;
  GLU_NURBS_ERROR14               : constant := 100264;
  GLU_NURBS_ERROR15               : constant := 100265;
  GLU_NURBS_ERROR16               : constant := 100266;
  GLU_NURBS_ERROR17               : constant := 100267;
  GLU_NURBS_ERROR18               : constant := 100268;
  GLU_NURBS_ERROR19               : constant := 100269;
  GLU_NURBS_ERROR20               : constant := 100270;
  GLU_NURBS_ERROR21               : constant := 100271;
  GLU_NURBS_ERROR22               : constant := 100272;
  GLU_NURBS_ERROR23               : constant := 100273;
  GLU_NURBS_ERROR24               : constant := 100274;
  GLU_NURBS_ERROR25               : constant := 100275;
  GLU_NURBS_ERROR26               : constant := 100276;
  GLU_NURBS_ERROR27               : constant := 100277;
  GLU_NURBS_ERROR28               : constant := 100278;
  GLU_NURBS_ERROR29               : constant := 100279;
  GLU_NURBS_ERROR30               : constant := 100280;
  GLU_NURBS_ERROR31               : constant := 100281;
  GLU_NURBS_ERROR32               : constant := 100282;
  GLU_NURBS_ERROR33               : constant := 100283;
  GLU_NURBS_ERROR34               : constant := 100284;
  GLU_NURBS_ERROR35               : constant := 100285;
  GLU_NURBS_ERROR36               : constant := 100286;
  GLU_NURBS_ERROR37               : constant := 100287;
  GLU_AUTO_LOAD_MATRIX            : constant := 100200;
  GLU_CULLING                     : constant := 100201;
  GLU_SAMPLING_TOLERANCE          : constant := 100203;
  GLU_DISPLAY_MODE                : constant := 100204;
  GLU_PARAMETRIC_TOLERANCE        : constant := 100202;
  GLU_SAMPLING_METHOD             : constant := 100205;
  GLU_U_STEP                      : constant := 100206;
  GLU_V_STEP                      : constant := 100207;
  GLU_NURBS_MODE                  : constant := 100160;
  GLU_NURBS_MODE_EXT              : constant := 100160;
  GLU_NURBS_TESSELLATOR           : constant := 100161;
  GLU_NURBS_TESSELLATOR_EXT       : constant := 100161;
  GLU_NURBS_RENDERER              : constant := 100162;
  GLU_NURBS_RENDERER_EXT          : constant := 100162;
  GLU_OBJECT_PARAMETRIC_ERROR     : constant := 100208;
  GLU_OBJECT_PARAMETRIC_ERROR_EXT : constant := 100208;
  GLU_OBJECT_PATH_LENGTH          : constant := 100209;
  GLU_OBJECT_PATH_LENGTH_EXT      : constant := 100209;
  GLU_PATH_LENGTH                 : constant := 100215;
  GLU_PARAMETRIC_ERROR            : constant := 100216;
  GLU_DOMAIN_DISTANCE             : constant := 100217;
  GLU_MAP1_TRIM_2                 : constant := 100210;
  GLU_MAP1_TRIM_3                 : constant := 100211;
  GLU_POINT                       : constant := 100010;
  GLU_LINE                        : constant := 100011;
  GLU_FILL                        : constant := 100012;
  GLU_SILHOUETTE                  : constant := 100013;
  GLU_SMOOTH                      : constant := 100000;
  GLU_FLAT                        : constant := 100001;
  GLU_NONE                        : constant := 100002;
  GLU_OUTSIDE                     : constant := 100020;
  GLU_INSIDE                      : constant := 100021;
  GLU_TESS_BEGIN                  : constant := 100100;
  GLU_BEGIN                       : constant := 100100;
  GLU_TESS_VERTEX                 : constant := 100101;
  GLU_VERTEX                      : constant := 100101;
  GLU_TESS_END                    : constant := 100102;
  GLU_END                         : constant := 100102;
  GLU_TESS_ERROR                  : constant := 100103;
  GLU_TESS_EDGE_FLAG              : constant := 100104;
  GLU_EDGE_FLAG                   : constant := 100104;
  GLU_TESS_COMBINE                : constant := 100105;
  GLU_TESS_BEGIN_DATA             : constant := 100106;
  GLU_TESS_VERTEX_DATA            : constant := 100107;
  GLU_TESS_END_DATA               : constant := 100108;
  GLU_TESS_ERROR_DATA             : constant := 100109;
  GLU_TESS_EDGE_FLAG_DATA         : constant := 100110;
  GLU_TESS_COMBINE_DATA           : constant := 100111;
  GLU_CW                          : constant := 100120;
  GLU_CCW                         : constant := 100121;
  GLU_INTERIOR                    : constant := 100122;
  GLU_EXTERIOR                    : constant := 100123;
  GLU_UNKNOWN                     : constant := 100124;
  GLU_TESS_WINDING_RULE           : constant := 100140;
  GLU_TESS_BOUNDARY_ONLY          : constant := 100141;
  GLU_TESS_TOLERANCE              : constant := 100142;
  GLU_TESS_ERROR1                 : constant := 100151;
  GLU_TESS_ERROR2                 : constant := 100152;
  GLU_TESS_ERROR3                 : constant := 100153;
  GLU_TESS_ERROR4                 : constant := 100154;
  GLU_TESS_ERROR5                 : constant := 100155;
  GLU_TESS_ERROR6                 : constant := 100156;
  GLU_TESS_ERROR7                 : constant := 100157;
  GLU_TESS_ERROR8                 : constant := 100158;
  GLU_TESS_MISSING_BEGIN_POLYGON  : constant := 100151;
  GLU_TESS_MISSING_BEGIN_CONTOUR  : constant := 100152;
  GLU_TESS_MISSING_END_POLYGON    : constant := 100153;
  GLU_TESS_MISSING_END_CONTOUR    : constant := 100154;
  GLU_TESS_COORD_TOO_LARGE        : constant := 100155;
  GLU_TESS_NEED_COMBINE_CALLBACK  : constant := 100156;
  GLU_TESS_WINDING_ODD            : constant := 100130;
  GLU_TESS_WINDING_NONZERO        : constant := 100131;
  GLU_TESS_WINDING_POSITIVE       : constant := 100132;
  GLU_TESS_WINDING_NEGATIVE       : constant := 100133;
  GLU_TESS_WINDING_ABS_GEQ_TWO    : constant := 100134;
  GLU_TESS_MAX_COORD              : constant := 1.00000000000000052596e+150;

  type A_GLUNURBS_T is new GL.GLpointer;
  type A_GLUTESSELATOR_T is new GL.GLpointer;
  type A_GLUQUADRIC_T is new GL.GLpointer;

  type GLUFUNCPTR is access procedure;

  procedure gluBeginCurve(Nurb : A_GLUNURBS_T);
  procedure gluBeginPolygon(Tess : A_GLUTESSELATOR_T);
  procedure gluBeginSurface(Nurb : A_GLUNURBS_T);

  procedure gluBeginTrim(Nurb : A_GLUNURBS_T);

  function gluBuild1DMipmapLevels(Target : in GL.GLenum; InternalFormat : in GL.GLint; Width : in GL.GLsizei; Format : in GL.GLenum; C_Type : in GL.GLenum; Level, Base, Max : in GL.GLint; Data : in System.Address) return GL.GLint;
  function gluBuild1DMipmaps(Target : in GL.GLenum; InternalFormat : in GL.GLint; Width : in GL.GLsizei; Format : in GL.GLenum; C_Type : in GL.GLenum; Data : in System.Address) return GL.GLint;
  function gluBuild2DMipmapLevels(Target : in GL.GLenum; InternalFormat : GL.GLint; Width, Height : in GL.GLsizei; Format : in GL.GLenum; C_Type : in GL.GLenum; Level, Base, Max : in GL.GLint; Data : in System.Address) return GL.GLint;
  function gluBuild2DMipmaps(Target : in GL.GLenum; InternalFormat : in GL.GLint; Width, Height : in GL.GLsizei; Format : in GL.GLenum; C_Type : in GL.GLenum; Data : in System.Address) return GL.GLint;
  function gluBuild3DMipmapLevels(Target : in GL.GLenum; InternalFormat : in GL.GLint; Width, Height, Depth : in GL.GLsizei; Format : in GL.GLenum; C_type : in GL.GLenum; Level, Base, Max : in GL.GLint; Data : in System.Address) return GL.GLint;
  function gluBuild3DMipmaps(Target : in GL.GLenum; InternalFormat : in GL.GLint; Width, Height, Depth : in GL.GLsizei; Format : in GL.GLenum; C_Type : in GL.GLenum; Data : in System.Address) return GL.GLint;

  function gluCheckExtension(ExtName, ExtString : in GL.GLubytePtr) return GL.GLboolean;

  procedure gluCylinder(Quad : in A_GLUQUADRIC_T; Base, Top, Height : in GL.GLdouble; Slices, Stacks : in GL.GLint);

  procedure gluDeleteNurbsRenderer(Nurb : in A_GLUNURBS_T);
  procedure gluDeleteQuadric(Quad : in A_GLUQUADRIC_T);
  procedure gluDeleteTess(Tess : in A_GLUTESSELATOR_T);

  procedure gluDisk(Quad : in A_GLUQUADRIC_T; Inner, Outer : in GL.GLdouble; Slices, Loops : in GL.GLint);
  procedure gluEndCurve(Nurb : in A_GLUNURBS_T);
  procedure gluEndPolygon(Tess : in A_GLUTESSELATOR_T);
  procedure gluEndSurface(Nurb : in A_GLUNURBS_T);
  procedure gluEndTrim(Nurb : in A_GLUNURBS_T);
  function gluErrorString(Error : in GL.GLenum) return GL.GLubytePtr;

  procedure gluGetNurbsProperty(Nurb : in A_GLUNURBS_T; Property : in GL.GLenum; Data : in GL.GLfloatPtr);

  function gluGetString(Name : in GL.GLenum) return GL.GLubytePtr;

  procedure gluGetTessProperty(Tess : in A_GLUTESSELATOR_T; Which : in GL.GLenum; Data : in GL.GLdoublePtr);

  procedure gluLoadSamplingMatrices(Nurb : in A_GLUNURBS_T; Model, Perspective : in GL.GLfloatPtr; View : in GL.GLintPtr);

  procedure gluLookAt(EyeX, EyeY, EyeZ, CenterX, CenterY, CenterZ, UpX, UpY, UpZ : in GL.GLdouble);

  function gluNewNurbsRenderer return A_GLUNURBS_T;
  function gluNewQuadric return A_GLUQUADRIC_T;
  function gluNewTess return A_GLUTESSELATOR_T;

  procedure gluNextContour(Tess : in A_GLUTESSELATOR_T; C_Type : in GL.GLenum);

  procedure gluNurbsCallback(Nurb : in A_GLUNURBS_T; Which : in GL.GLenum; CallBackFunc : in GLUFUNCPTR);
  procedure gluNurbsCallbackData(Nurb : in A_GLUNURBS_T; UserData : in GL.GLpointer);
  procedure gluNurbsCallbackDataEXT(Nurb : in A_GLUNURBS_T; UserData : in GL.GLpointer);

  procedure gluNurbsCurve(Nurb : in A_GLUNURBS_T; KnotCount : in GL.GLint; Knots : in GL.GLfloatPtr; Stride : in GL.GLint; Control : in GL.GLfloatPtr; Order : in GL.GLint; C_Type : in GL.GLenum);

  procedure gluNurbsProperty(Nurb : in A_GLUNURBS_T; Property : in GL.GLenum; Value : in GL.GLfloat);
  procedure gluNurbsSurface(Nurb : in A_GLUNURBS_T; SKnotCount : in GL.GLint; SKnots : in GL.GLfloatPtr;
                            TKnotCount : in GL.GLint; TKnots : in GL.GLfloatPtr; SStride, TStride : in GL.GLint; Control : in GL.GLfloatPtr; SOrder, TOrder : in GL.GLint; C_Type : in GL.GLenum);

  procedure gluOrtho2D(Left, Right, Bottom, Top : in GL.GLdouble);

  procedure gluPartialDisk(Quad : in A_GLUQUADRIC_T; Inner, Outer : in GL.GLdouble; Slices, Loops : in GL.GLint; Start, Sweep : in GL.GLdouble);

  procedure gluPerspective(FOVY, Aspect, ZNear, ZFar : in GL.GLdouble);

  procedure gluPickMatrix(X, Y, DelX, DelY : in GL.GLdouble; Viewport : in GL.GLintPtr);

  function gluProject(ObjX, ObjY, ObjZ : in GL.GLdouble; Model, Proj : in GL.GLdoublePtr; View : in GL.GLintPtr; WinX, WinY, WinZ : in GL.GLdoublePtr) return GL.GLint;

  procedure gluPwlCurve(Nurb : in A_GLUNURBS_T; Count : in GL.GLint; Data : in GL.GLfloatPtr; Stride : in GL.GLint; C_Type : in GL.GLenum);

  procedure gluQuadricCallback(Quad : in A_GLUQUADRIC_T; Which : in GL.GLenum; CallBackFunc : in GLUFUNCPTR);
  procedure gluQuadricDrawStyle(Quad : in A_GLUQUADRIC_T; Draw : in GL.GLenum);
  procedure gluQuadricNormals(Quad : in A_GLUQUADRIC_T; Normal : in GL.GLenum);
  procedure gluQuadricOrientation(Quad : in A_GLUQUADRIC_T; Orientation : in GL.GLenum);
  procedure gluQuadricTexture(Quad : in A_GLUQUADRIC_T; Texture : in GL.GLboolean);

  function gluScaleImage(Format : in GL.GLenum; WIn, HIn : in GL.GLsizei; TypeIn : in GL.GLenum; DataIn : in GL.GLpointer; WOut, HOut : in GL.GLsizei; TypeOut : in GL.GLenum; DataOut : in GL.GLpointer) return GL.GLint;

  procedure gluSphere(Quad : in A_GLUQUADRIC_T; Radius : in GL.GLdouble; Slices, stacks : in GL.GLint);

  procedure gluTessBeginContour(Tess : in A_GLUTESSELATOR_T);

  procedure gluTessBeginPolygon(Tess : in A_GLUTESSELATOR_T; Data : in GL.GLpointer);

  procedure gluTessCallback(Tess : in A_GLUTESSELATOR_T; Which : in GL.GLenum; CallBackFunc : in GLUFUNCPTR);
  procedure gluTessEndContour(Tess : in A_GLUTESSELATOR_T);
  procedure gluTessEndPolygon(Tess : in A_GLUTESSELATOR_T);
  procedure gluTessNormal(Tess : in A_GLUTESSELATOR_T; ValueX, ValueY, ValueZ : in GL.GLdouble);
  procedure gluTessProperty(Tess : in A_GLUTESSELATOR_T; Which : in GL.GLenum; Data : in GL.GLdouble);
  procedure gluTessVertex(Tess : in A_GLUTESSELATOR_T; Location : in GL.GLdoublePtr; Data : in GL.GLpointer);

  function gluUnProject(WinX, WinY, WinZ : in GL.GLdouble; Model, Proj : in GL.GLdoublePtr; View : in GL.GLintPtr; ObjX, ObjY, ObjZ : in GL.GLdoublePtr) return GL.GLint;
  function gluUnProject4(WinX, WinY, WinZ, ClipW : in GL.GLdouble; Model, Proj : in GL.GLdoublePtr; View : in GL.GLintPtr; NearVal, FarVal : in GL.GLdouble; ObjX, ObjY, ObjZ, ObjW : in GL.GLdoublePtr) return GL.GLint;

private

  pragma Import(DLL, gluBeginCurve, "gluBeginCurve");
  pragma Import(DLL, gluBeginPolygon, "gluBeginPolygon");
  pragma Import(DLL, gluBeginSurface, "gluBeginSurface");
  pragma Import(DLL, gluBeginTrim, "gluBeginTrim");
  pragma Import(DLL, gluBuild1DMipmapLevels, "gluBuild1DMipmapLevels");
  pragma Import(DLL, gluBuild1DMipmaps, "gluBuild1DMipmaps");
  pragma Import(DLL, gluBuild2DMipmapLevels, "gluBuild2DMipmapLevels");
  pragma Import(DLL, gluBuild2DMipmaps, "gluBuild2DMipmaps");
  pragma Import(DLL, gluBuild3DMipmapLevels, "gluBuild3DMipmapLevels");
  pragma Import(DLL, gluBuild3DMipmaps, "gluBuild3DMipmaps");
  pragma Import(DLL, gluCheckExtension, "gluCheckExtension");
  pragma Import(DLL, gluCylinder, "gluCylinder");
  pragma Import(DLL, gluDeleteNurbsRenderer, "gluDeleteNurbsRenderer");
  pragma Import(DLL, gluDeleteQuadric, "gluDeleteQuadric");
  pragma Import(DLL, gluDeleteTess, "gluDeleteTess");
  pragma Import(DLL, gluDisk, "gluDisk");
  pragma Import(DLL, gluEndCurve, "gluEndCurve");
  pragma Import(DLL, gluEndPolygon, "gluEndPolygon");
  pragma Import(DLL, gluEndSurface, "gluEndSurface");
  pragma Import(DLL, gluEndTrim, "gluEndTrim");
  pragma Import(DLL, gluErrorString, "gluErrorString");
  pragma Import(DLL, gluGetNurbsProperty, "gluGetNurbsProperty");
  pragma Import(DLL, gluGetString, "gluGetString");
  pragma Import(DLL, gluGetTessProperty, "gluGetTessProperty");
  pragma Import(DLL, gluLoadSamplingMatrices, "gluLoadSamplingMatrices");
  pragma Import(DLL, gluLookAt, "gluLookAt");
  pragma Import(DLL, gluNewNurbsRenderer, "gluNewNurbsRenderer");
  pragma Import(DLL, gluNewQuadric, "gluNewQuadric");
  pragma Import(DLL, gluNewTess, "gluNewTess");
  pragma Import(DLL, gluNextContour, "gluNextContour");
  pragma Import(DLL, gluNurbsCallback, "gluNurbsCallback");
  pragma Import(DLL, gluNurbsCallbackData, "gluNurbsCallbackData");
  pragma Import(DLL, gluNurbsCallbackDataEXT, "gluNurbsCallbackDataEXT");
  pragma Import(DLL, gluNurbsCurve, "gluNurbsCurve");
  pragma Import(DLL, gluNurbsProperty, "gluNurbsProperty");
  pragma Import(DLL, gluNurbsSurface, "gluNurbsSurface");
  pragma Import(DLL, gluOrtho2D, "gluOrtho2D");
  pragma Import(DLL, gluPartialDisk, "gluPartialDisk");
  pragma Import(DLL, gluPerspective, "gluPerspective");
  pragma Import(DLL, gluPickMatrix, "gluPickMatrix");
  pragma Import(DLL, gluProject, "gluProject");
  pragma Import(DLL, gluPwlCurve, "gluPwlCurve");
  pragma Import(DLL, gluQuadricCallback, "gluQuadricCallback");
  pragma Import(DLL, gluQuadricDrawStyle, "gluQuadricDrawStyle");
  pragma Import(DLL, gluQuadricNormals, "gluQuadricNormals");
  pragma Import(DLL, gluQuadricOrientation, "gluQuadricOrientation");
  pragma Import(DLL, gluQuadricTexture, "gluQuadricTexture");
  pragma Import(DLL, gluScaleImage, "gluScaleImage");
  pragma Import(DLL, gluSphere, "gluSphere");
  pragma Import(DLL, gluTessBeginContour, "gluTessBeginContour");
  pragma Import(DLL, gluTessBeginPolygon, "gluTessBeginPolygon");
  pragma Import(DLL, gluTessCallback, "gluTessCallback");
  pragma Import(DLL, gluTessEndContour, "gluTessEndContour");
  pragma Import(DLL, gluTessEndPolygon, "gluTessEndPolygon");
  pragma Import(DLL, gluTessNormal, "gluTessNormal");
  pragma Import(DLL, gluTessProperty, "gluTessProperty");
  pragma Import(DLL, gluTessVertex, "gluTessVertex");
  pragma Import(DLL, gluUnProject, "gluUnProject");
  pragma Import(DLL, gluUnProject4, "gluUnProject4");

end GLU;
