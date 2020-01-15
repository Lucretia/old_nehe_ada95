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
--     notice this list of conditions and the following disclaimer in the
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


with Interfaces.C;

package GL is

  pragma Link_With("-lopengl32");
  
  package C renames Interfaces.C;

  GL_VERSION_1_1  : constant := 1;
  GL_VERSION_1_2  : constant := 1;
  GL_VERSION_1_3  : constant := 1;

  GL_ARB_IMAGING  : constant := 1;
   
  ------------------------------------------------------------------------------
  -- Base types
  ------------------------------------------------------------------------------
  type GLbitfield   is new C.unsigned;        -- 4-byte unsigned 
  type GLbyte       is new C.char;            -- 1-byte signed 
  type GLshort      is new C.short;           -- 2-byte signed 
  type GLint        is new C.int;             -- 4-byte signed 
  type GLubyte      is new C.unsigned_char;   -- 1-byte unsigned 
  type GLushort     is new C.unsigned_short;  -- 2-byte unsigned 
  type GLuint       is new C.unsigned;        -- 4-byte unsigned 
  type GLsizei      is new C.int;             -- 4-byte signed 
  type GLfloat      is new C.C_float;         -- single precision float 
  type GLclampf     is new C.C_float;         -- single precision float in [0,1] 
  type GLdouble     is new C.double;          -- double precision float 
  type GLclampd     is new C.double;          -- double precision float in [0,1] 

  ------------------------------------------------------------------------------
  -- Pointer types
  ------------------------------------------------------------------------------
  type GLbytePtr    is access all GLbyte;
  type GLshortPtr   is access all GLshort;
  type GLintPtr     is access all GLint;
  type GLubytePtr   is access all GLubyte;
  type GLushortPtr  is access all GLushort;
  type GLuintPtr    is access all GLuint;
  type GLfloatPtr   is access all GLfloat;
  type GLclampfPtr  is access all GLclampf;
  type GLdoublePtr  is access all GLdouble;

  type GLpointer    is access all GLubyte;  -- our substitute for "void *"

  ------------------------------------------------------------------------------
  -- GLenum is used only for sizing of the real enumeration types
  ------------------------------------------------------------------------------
  type GLenum is new C.unsigned;

  ------------------------------------------------------------------------------
  --  Boolean values
  ------------------------------------------------------------------------------
  type GLboolean is (
    GL_FALSE,
    GL_TRUE);
  for GLboolean use (
    GL_FALSE => 0,
    GL_TRUE  => 1);
  for GLboolean'Size use C.unsigned_char'Size;
  
  type GLbooleanPtr is access all GLboolean;
  
  ------------------------------------------------------------------------------
  --  Data types
  ------------------------------------------------------------------------------
  GL_BYTE                                       : constant := 16#1400#;
  GL_UNSIGNED_BYTE                              : constant := 16#1401#;
  GL_SHORT                                      : constant := 16#1402#;
  GL_UNSIGNED_SHORT                             : constant := 16#1403#;
  GL_INT                                        : constant := 16#1404#;
  GL_UNSIGNED_INT                               : constant := 16#1405#;
  GL_FLOAT                                      : constant := 16#1406#;
  GL_DOUBLE                                     : constant := 16#140A#;
  GL_2_BYTES                                    : constant := 16#1407#;
  GL_3_BYTES                                    : constant := 16#1408#;
  GL_4_BYTES                                    : constant := 16#1409#;

  ------------------------------------------------------------------------------
  --  Primitives
  ------------------------------------------------------------------------------
  type PrimitiveType is (
    GL_POINTS,
    GL_LINES,
    GL_LINE_LOOP,
    GL_LINE_STRIP,
    GL_TRIANGLES,
    GL_TRIANGLE_STRIP,
    GL_TRIANGLE_FAN,
    GL_QUADS,
    GL_QUAD_STRIP,
    GL_POLYGON);
  for PrimitiveType use (
    GL_POINTS         => 16#0000#,
    GL_LINES          => 16#0001#,
    GL_LINE_LOOP      => 16#0002#,
    GL_LINE_STRIP     => 16#0003#,
    GL_TRIANGLES      => 16#0004#,
    GL_TRIANGLE_STRIP => 16#0005#,
    GL_TRIANGLE_FAN   => 16#0006#,
    GL_QUADS          => 16#0007#,
    GL_QUAD_STRIP     => 16#0008#,
    GL_POLYGON        => 16#0009#);
  for PrimitiveType'Size use GLenum'Size;
  
  ------------------------------------------------------------------------------
  --  Vertex Arrays
  ------------------------------------------------------------------------------
  GL_VERTEX_ARRAY                               : constant := 16#0000_8074#;
  GL_NORMAL_ARRAY                               : constant := 16#0000_8075#;
  GL_COLOR_ARRAY                                : constant := 16#0000_8076#;
  GL_INDEX_ARRAY                                : constant := 16#0000_8077#;
  GL_TEXTURE_COORD_ARRAY                        : constant := 16#0000_8078#;
  GL_EDGE_FLAG_ARRAY                            : constant := 16#0000_8079#;
  GL_VERTEX_ARRAY_SIZE                          : constant := 16#0000_807A#;
  GL_VERTEX_ARRAY_TYPE                          : constant := 16#0000_807B#;
  GL_VERTEX_ARRAY_STRIDE                        : constant := 16#0000_807C#;
  GL_NORMAL_ARRAY_TYPE                          : constant := 16#0000_807E#;
  GL_NORMAL_ARRAY_STRIDE                        : constant := 16#0000_807F#;
  GL_COLOR_ARRAY_SIZE                           : constant := 16#0000_8081#;
  GL_COLOR_ARRAY_TYPE                           : constant := 16#0000_8082#;
  GL_COLOR_ARRAY_STRIDE                         : constant := 16#0000_8083#;
  GL_INDEX_ARRAY_TYPE                           : constant := 16#0000_8085#;
  GL_INDEX_ARRAY_STRIDE                         : constant := 16#0000_8086#;
  GL_TEXTURE_COORD_ARRAY_SIZE                   : constant := 16#0000_8088#;
  GL_TEXTURE_COORD_ARRAY_TYPE                   : constant := 16#0000_8089#;
  GL_TEXTURE_COORD_ARRAY_STRIDE                 : constant := 16#0000_808A#;
  GL_EDGE_FLAG_ARRAY_STRIDE                     : constant := 16#0000_808C#;
  GL_VERTEX_ARRAY_POINTER                       : constant := 16#0000_808E#;
  GL_NORMAL_ARRAY_POINTER                       : constant := 16#0000_808F#;
  GL_COLOR_ARRAY_POINTER                        : constant := 16#0000_8090#;
  GL_INDEX_ARRAY_POINTER                        : constant := 16#0000_8091#;
  GL_TEXTURE_COORD_ARRAY_POINTER                : constant := 16#0000_8092#;
  GL_EDGE_FLAG_ARRAY_POINTER                    : constant := 16#0000_8093#;
  GL_V2F                                        : constant := 16#2A20#;
  GL_V3F                                        : constant := 16#2A21#;
  GL_C4UB_V2F                                   : constant := 16#2A22#;
  GL_C4UB_V3F                                   : constant := 16#2A23#;
  GL_C3F_V3F                                    : constant := 16#2A24#;
  GL_N3F_V3F                                    : constant := 16#2A25#;
  GL_C4F_N3F_V3F                                : constant := 16#2A26#;
  GL_T2F_V3F                                    : constant := 16#2A27#;
  GL_T4F_V4F                                    : constant := 16#2A28#;
  GL_T2F_C4UB_V3F                               : constant := 16#2A29#;
  GL_T2F_C3F_V3F                                : constant := 16#2A2A#;
  GL_T2F_N3F_V3F                                : constant := 16#2A2B#;
  GL_T2F_C4F_N3F_V3F                            : constant := 16#2A2C#;
  GL_T4F_C4F_N3F_V4F                            : constant := 16#2A2D#;

  ------------------------------------------------------------------------------
  --  Matrix Mode
  ------------------------------------------------------------------------------
  GL_MATRIX_MODE : constant := 16#0BA0#;
  
  type MatrixType is (
    GL_MODELVIEW,
    GL_PROJECTION,
    GL_TEXTURE);
  for MatrixType use (
    GL_MODELVIEW   => 16#1700#,
    GL_PROJECTION  => 16#1701#,
    GL_TEXTURE     => 16#1702#);
  for MatrixType'Size use GLenum'Size;

  ------------------------------------------------------------------------------
  --  Points
  ------------------------------------------------------------------------------
  GL_POINT_SMOOTH                               : constant := 16#0B10#;
  GL_POINT_SIZE                                 : constant := 16#0B11#;
  GL_POINT_SIZE_GRANULARITY                     : constant := 16#0B13#;
  GL_POINT_SIZE_RANGE                           : constant := 16#0B12#;

  ------------------------------------------------------------------------------
  --  Lines
  ------------------------------------------------------------------------------
  GL_LINE_SMOOTH                                : constant := 16#0B20#;
  GL_LINE_STIPPLE                               : constant := 16#0B24#;
  GL_LINE_STIPPLE_PATTERN                       : constant := 16#0B25#;
  GL_LINE_STIPPLE_REPEAT                        : constant := 16#0B26#;
  GL_LINE_WIDTH                                 : constant := 16#0B21#;
  GL_LINE_WIDTH_GRANULARITY                     : constant := 16#0B23#;
  GL_LINE_WIDTH_RANGE                           : constant := 16#0B22#;

  ------------------------------------------------------------------------------
  --  Polygons
  ------------------------------------------------------------------------------
  GL_POINT                                      : constant := 16#1B00#;
  GL_LINE                                       : constant := 16#1B01#;
  GL_FILL                                       : constant := 16#1B02#;
  GL_CW                                         : constant := 16#0900#;
  GL_CCW                                        : constant := 16#0901#;
  GL_FRONT                                      : constant := 16#0404#;
  GL_BACK                                       : constant := 16#0405#;
  GL_POLYGON_MODE                               : constant := 16#0B40#;
  GL_POLYGON_SMOOTH                             : constant := 16#0B41#;
  GL_POLYGON_STIPPLE                            : constant := 16#0B42#;
  GL_EDGE_FLAG                                  : constant := 16#0B43#;
  GL_CULL_FACE                                  : constant := 16#0B44#;
  GL_CULL_FACE_MODE                             : constant := 16#0B45#;
  GL_FRONT_FACE                                 : constant := 16#0B46#;
  GL_POLYGON_OFFSET_FACTOR                      : constant := 16#0000_8038#;
  GL_POLYGON_OFFSET_UNITS                       : constant := 16#2A00#;
  GL_POLYGON_OFFSET_POINT                       : constant := 16#2A01#;
  GL_POLYGON_OFFSET_LINE                        : constant := 16#2A02#;
  GL_POLYGON_OFFSET_FILL                        : constant := 16#0000_8037#;

  ------------------------------------------------------------------------------
  --  Display lists
  ------------------------------------------------------------------------------
  GL_COMPILE                                    : constant := 16#1300#;
  GL_COMPILE_AND_EXECUTE                        : constant := 16#1301#;
  GL_LIST_BASE                                  : constant := 16#0B32#;
  GL_LIST_INDEX                                 : constant := 16#0B33#;
  GL_LIST_MODE                                  : constant := 16#0B30#;

  ------------------------------------------------------------------------------
  --  Depth buffer
  ------------------------------------------------------------------------------
  GL_NEVER                                      : constant := 16#0200#;
  GL_LESS                                       : constant := 16#0201#;
  GL_EQUAL                                      : constant := 16#0202#;
  GL_LEQUAL                                     : constant := 16#0203#;
  GL_GREATER                                    : constant := 16#0204#;
  GL_NOTEQUAL                                   : constant := 16#0205#;
  GL_GEQUAL                                     : constant := 16#0206#;
  GL_ALWAYS                                     : constant := 16#0207#;
  GL_DEPTH_TEST                                 : constant := 16#0B71#;
  GL_DEPTH_BITS                                 : constant := 16#0D56#;
  GL_DEPTH_CLEAR_VALUE                          : constant := 16#0B73#;
  GL_DEPTH_FUNC                                 : constant := 16#0B74#;
  GL_DEPTH_RANGE                                : constant := 16#0B70#;
  GL_DEPTH_WRITEMASK                            : constant := 16#0B72#;
  GL_DEPTH_COMPONENT                            : constant := 16#1902#;

  ------------------------------------------------------------------------------
  --  Lighting
  ------------------------------------------------------------------------------
  GL_LIGHTING                                   : constant := 16#0B50#;
  GL_LIGHT0                                     : constant := 16#4000#;
  GL_LIGHT1                                     : constant := 16#4001#;
  GL_LIGHT2                                     : constant := 16#4002#;
  GL_LIGHT3                                     : constant := 16#4003#;
  GL_LIGHT4                                     : constant := 16#4004#;
  GL_LIGHT5                                     : constant := 16#4005#;
  GL_LIGHT6                                     : constant := 16#4006#;
  GL_LIGHT7                                     : constant := 16#4007#;
  GL_SPOT_EXPONENT                              : constant := 16#1205#;
  GL_SPOT_CUTOFF                                : constant := 16#1206#;
  GL_CONSTANT_ATTENUATION                       : constant := 16#1207#;
  GL_LINEAR_ATTENUATION                         : constant := 16#1208#;
  GL_QUADRATIC_ATTENUATION                      : constant := 16#1209#;
  GL_AMBIENT                                    : constant := 16#1200#;
  GL_DIFFUSE                                    : constant := 16#1201#;
  GL_SPECULAR                                   : constant := 16#1202#;
  GL_SHININESS                                  : constant := 16#1601#;
  GL_EMISSION                                   : constant := 16#1600#;
  GL_POSITION                                   : constant := 16#1203#;
  GL_SPOT_DIRECTION                             : constant := 16#1204#;
  GL_AMBIENT_AND_DIFFUSE                        : constant := 16#1602#;
  GL_COLOR_INDEXES                              : constant := 16#1603#;
  GL_LIGHT_MODEL_TWO_SIDE                       : constant := 16#0B52#;
  GL_LIGHT_MODEL_LOCAL_VIEWER                   : constant := 16#0B51#;
  GL_LIGHT_MODEL_AMBIENT                        : constant := 16#0B53#;
  GL_FRONT_AND_BACK                             : constant := 16#0408#;
  GL_SHADE_MODEL                                : constant := 16#0B54#;
  GL_FLAT                                       : constant := 16#1D00#;
  GL_SMOOTH                                     : constant := 16#1D01#;
  GL_COLOR_MATERIAL                             : constant := 16#0B57#;
  GL_COLOR_MATERIAL_FACE                        : constant := 16#0B55#;
  GL_COLOR_MATERIAL_PARAMETER                   : constant := 16#0B56#;
  GL_NORMALIZE                                  : constant := 16#0BA1#;

  ------------------------------------------------------------------------------
  --  User clipping planes
  ------------------------------------------------------------------------------
  GL_CLIP_PLANE0                                : constant := 16#3000#;
  GL_CLIP_PLANE1                                : constant := 16#3001#;
  GL_CLIP_PLANE2                                : constant := 16#3002#;
  GL_CLIP_PLANE3                                : constant := 16#3003#;
  GL_CLIP_PLANE4                                : constant := 16#3004#;
  GL_CLIP_PLANE5                                : constant := 16#3005#;

  ------------------------------------------------------------------------------
  --  Accumulation buffer
  ------------------------------------------------------------------------------
  GL_ACCUM_RED_BITS                             : constant := 16#0D58#;
  GL_ACCUM_GREEN_BITS                           : constant := 16#0D59#;
  GL_ACCUM_BLUE_BITS                            : constant := 16#0D5A#;
  GL_ACCUM_ALPHA_BITS                           : constant := 16#0D5B#;
  GL_ACCUM_CLEAR_VALUE                          : constant := 16#0B80#;
  GL_ACCUM                                      : constant := 16#0100#;
  GL_ADD                                        : constant := 16#0104#;
  GL_LOAD                                       : constant := 16#0101#;
  GL_MULT                                       : constant := 16#0103#;
  GL_RETURN                                     : constant := 16#0102#;

  ------------------------------------------------------------------------------
  --  Alpha testing
  ------------------------------------------------------------------------------
  GL_ALPHA_TEST                                 : constant := 16#0BC0#;
  GL_ALPHA_TEST_REF                             : constant := 16#0BC2#;
  GL_ALPHA_TEST_FUNC                            : constant := 16#0BC1#;

  ------------------------------------------------------------------------------
  --  Blending
  ------------------------------------------------------------------------------
  GL_BLEND                                      : constant := 16#0BE2#;
  GL_BLEND_SRC                                  : constant := 16#0BE1#;
  GL_BLEND_DST                                  : constant := 16#0BE0#;
  GL_ZERO                                       : constant := 16#0000#;
  GL_ONE                                        : constant := 16#0001#;
  GL_SRC_COLOR                                  : constant := 16#0300#;
  GL_ONE_MINUS_SRC_COLOR                        : constant := 16#0301#;
  GL_SRC_ALPHA                                  : constant := 16#0302#;
  GL_ONE_MINUS_SRC_ALPHA                        : constant := 16#0303#;
  GL_DST_ALPHA                                  : constant := 16#0304#;
  GL_ONE_MINUS_DST_ALPHA                        : constant := 16#0305#;
  GL_DST_COLOR                                  : constant := 16#0306#;
  GL_ONE_MINUS_DST_COLOR                        : constant := 16#0307#;
  GL_SRC_ALPHA_SATURATE                         : constant := 16#0308#;

  ------------------------------------------------------------------------------
  --  Render mode
  ------------------------------------------------------------------------------
  GL_FEEDBACK                                   : constant := 16#1C01#;
  GL_RENDER                                     : constant := 16#1C00#;
  GL_SELECT                                     : constant := 16#1C02#;

  ------------------------------------------------------------------------------
  --  Feedback
  ------------------------------------------------------------------------------
  GL_2D                                         : constant := 16#0600#;
  GL_3D                                         : constant := 16#0601#;
  GL_3D_COLOR                                   : constant := 16#0602#;
  GL_3D_COLOR_TEXTURE                           : constant := 16#0603#;
  GL_4D_COLOR_TEXTURE                           : constant := 16#0604#;
  GL_POINT_TOKEN                                : constant := 16#0701#;
  GL_LINE_TOKEN                                 : constant := 16#0702#;
  GL_LINE_RESET_TOKEN                           : constant := 16#0707#;
  GL_POLYGON_TOKEN                              : constant := 16#0703#;
  GL_BITMAP_TOKEN                               : constant := 16#0704#;
  GL_DRAW_PIXEL_TOKEN                           : constant := 16#0705#;
  GL_COPY_PIXEL_TOKEN                           : constant := 16#0706#;
  GL_PASS_THROUGH_TOKEN                         : constant := 16#0700#;
  GL_FEEDBACK_BUFFER_POINTER                    : constant := 16#0DF0#;
  GL_FEEDBACK_BUFFER_SIZE                       : constant := 16#0DF1#;
  GL_FEEDBACK_BUFFER_TYPE                       : constant := 16#0DF2#;

  ------------------------------------------------------------------------------
  --  Selection
  ------------------------------------------------------------------------------
  GL_SELECTION_BUFFER_POINTER                   : constant := 16#0DF3#;
  GL_SELECTION_BUFFER_SIZE                      : constant := 16#0DF4#;

  ------------------------------------------------------------------------------
  --  Fog
  ------------------------------------------------------------------------------
  GL_FOG                                        : constant := 16#0B60#;
  GL_FOG_MODE                                   : constant := 16#0B65#;
  GL_FOG_DENSITY                                : constant := 16#0B62#;
  GL_FOG_COLOR                                  : constant := 16#0B66#;
  GL_FOG_INDEX                                  : constant := 16#0B61#;
  GL_FOG_START                                  : constant := 16#0B63#;
  GL_FOG_END                                    : constant := 16#0B64#;
  GL_LINEAR                                     : constant := 16#2601#;
  GL_EXP                                        : constant := 16#0800#;
  GL_EXP2                                       : constant := 16#0801#;

  ------------------------------------------------------------------------------
  --  Logic ops
  ------------------------------------------------------------------------------
  GL_LOGIC_OP                                   : constant := 16#0BF1#;
  GL_INDEX_LOGIC_OP                             : constant := 16#0BF1#;
  GL_COLOR_LOGIC_OP                             : constant := 16#0BF2#;
  GL_LOGIC_OP_MODE                              : constant := 16#0BF0#;
  GL_CLEAR                                      : constant := 16#1500#;
  GL_SET                                        : constant := 16#150F#;
  GL_COPY                                       : constant := 16#1503#;
  GL_COPY_INVERTED                              : constant := 16#150C#;
  GL_NOOP                                       : constant := 16#1505#;
  GL_INVERT                                     : constant := 16#150A#;
  GL_AND                                        : constant := 16#1501#;
  GL_NAND                                       : constant := 16#150E#;
  GL_OR                                         : constant := 16#1507#;
  GL_NOR                                        : constant := 16#1508#;
  GL_XOR                                        : constant := 16#1506#;
  GL_EQUIV                                      : constant := 16#1509#;
  GL_AND_REVERSE                                : constant := 16#1502#;
  GL_AND_INVERTED                               : constant := 16#1504#;
  GL_OR_REVERSE                                 : constant := 16#150B#;
  GL_OR_INVERTED                                : constant := 16#150D#;

  ------------------------------------------------------------------------------
  --  Stencil
  ------------------------------------------------------------------------------
  GL_STENCIL_TEST                               : constant := 16#0B90#;
  GL_STENCIL_WRITEMASK                          : constant := 16#0B98#;
  GL_STENCIL_BITS                               : constant := 16#0D57#;
  GL_STENCIL_FUNC                               : constant := 16#0B92#;
  GL_STENCIL_VALUE_MASK                         : constant := 16#0B93#;
  GL_STENCIL_REF                                : constant := 16#0B97#;
  GL_STENCIL_FAIL                               : constant := 16#0B94#;
  GL_STENCIL_PASS_DEPTH_PASS                    : constant := 16#0B96#;
  GL_STENCIL_PASS_DEPTH_FAIL                    : constant := 16#0B95#;
  GL_STENCIL_CLEAR_VALUE                        : constant := 16#0B91#;
  GL_STENCIL_INDEX                              : constant := 16#1901#;
  GL_KEEP                                       : constant := 16#1E00#;
  GL_REPLACE                                    : constant := 16#1E01#;
  GL_INCR                                       : constant := 16#1E02#;
  GL_DECR                                       : constant := 16#1E03#;

  ------------------------------------------------------------------------------
  --  Buffers, Pixel Drawing/Reading
  ------------------------------------------------------------------------------
  GL_NONE                                       : constant := 16#0000#;
  GL_LEFT                                       : constant := 16#0406#;
  GL_RIGHT                                      : constant := 16#0407#;
  --  GL_FRONT                                     ;
  --  GL_BACK                                      ;
  --  GL_FRONT_AND_BACK                            ;
  GL_FRONT_LEFT                                 : constant := 16#0400#;
  GL_FRONT_RIGHT                                : constant := 16#0401#;
  GL_BACK_LEFT                                  : constant := 16#0402#;
  GL_BACK_RIGHT                                 : constant := 16#0403#;
  GL_AUX0                                       : constant := 16#0409#;
  GL_AUX1                                       : constant := 16#040A#;
  GL_AUX2                                       : constant := 16#040B#;
  GL_AUX3                                       : constant := 16#040C#;
  GL_COLOR_INDEX                                : constant := 16#1900#;
  GL_RED                                        : constant := 16#1903#;
  GL_GREEN                                      : constant := 16#1904#;
  GL_BLUE                                       : constant := 16#1905#;
  GL_ALPHA                                      : constant := 16#1906#;
  GL_LUMINANCE                                  : constant := 16#1909#;
  GL_LUMINANCE_ALPHA                            : constant := 16#190A#;
  GL_ALPHA_BITS                                 : constant := 16#0D55#;
  GL_RED_BITS                                   : constant := 16#0D52#;
  GL_GREEN_BITS                                 : constant := 16#0D53#;
  GL_BLUE_BITS                                  : constant := 16#0D54#;
  GL_INDEX_BITS                                 : constant := 16#0D51#;
  GL_SUBPIXEL_BITS                              : constant := 16#0D50#;
  GL_AUX_BUFFERS                                : constant := 16#0C00#;
  GL_READ_BUFFER                                : constant := 16#0C02#;
  GL_DRAW_BUFFER                                : constant := 16#0C01#;
  GL_DOUBLEBUFFER                               : constant := 16#0C32#;
  GL_STEREO                                     : constant := 16#0C33#;
  GL_BITMAP                                     : constant := 16#1A00#;
  GL_COLOR                                      : constant := 16#1800#;
  GL_DEPTH                                      : constant := 16#1801#;
  GL_STENCIL                                    : constant := 16#1802#;
  GL_DITHER                                     : constant := 16#0BD0#;
  GL_RGB                                        : constant := 16#1907#;
  GL_RGBA                                       : constant := 16#1908#;

  ------------------------------------------------------------------------------
  --  Implementation limits
  ------------------------------------------------------------------------------
  GL_MAX_LIST_NESTING                           : constant := 16#0B31#;
  GL_MAX_ATTRIB_STACK_DEPTH                     : constant := 16#0D35#;
  GL_MAX_MODELVIEW_STACK_DEPTH                  : constant := 16#0D36#;
  GL_MAX_NAME_STACK_DEPTH                       : constant := 16#0D37#;
  GL_MAX_PROJECTION_STACK_DEPTH                 : constant := 16#0D38#;
  GL_MAX_TEXTURE_STACK_DEPTH                    : constant := 16#0D39#;
  GL_MAX_EVAL_ORDER                             : constant := 16#0D30#;
  GL_MAX_LIGHTS                                 : constant := 16#0D31#;
  GL_MAX_CLIP_PLANES                            : constant := 16#0D32#;
  GL_MAX_TEXTURE_SIZE                           : constant := 16#0D33#;
  GL_MAX_PIXEL_MAP_TABLE                        : constant := 16#0D34#;
  GL_MAX_VIEWPORT_DIMS                          : constant := 16#0D3A#;
  GL_MAX_CLIENT_ATTRIB_STACK_DEPTH              : constant := 16#0D3B#;

  ------------------------------------------------------------------------------
  --  Gets
  ------------------------------------------------------------------------------
  GL_ATTRIB_STACK_DEPTH                         : constant := 16#0BB0#;
  GL_CLIENT_ATTRIB_STACK_DEPTH                  : constant := 16#0BB1#;
  GL_COLOR_CLEAR_VALUE                          : constant := 16#0C22#;
  GL_COLOR_WRITEMASK                            : constant := 16#0C23#;
  GL_CURRENT_INDEX                              : constant := 16#0B01#;
  GL_CURRENT_COLOR                              : constant := 16#0B00#;
  GL_CURRENT_NORMAL                             : constant := 16#0B02#;
  GL_CURRENT_RASTER_COLOR                       : constant := 16#0B04#;
  GL_CURRENT_RASTER_DISTANCE                    : constant := 16#0B09#;
  GL_CURRENT_RASTER_INDEX                       : constant := 16#0B05#;
  GL_CURRENT_RASTER_POSITION                    : constant := 16#0B07#;
  GL_CURRENT_RASTER_TEXTURE_COORDS              : constant := 16#0B06#;
  GL_CURRENT_RASTER_POSITION_VALID              : constant := 16#0B08#;
  GL_CURRENT_TEXTURE_COORDS                     : constant := 16#0B03#;
  GL_INDEX_CLEAR_VALUE                          : constant := 16#0C20#;
  GL_INDEX_MODE                                 : constant := 16#0C30#;
  GL_INDEX_WRITEMASK                            : constant := 16#0C21#;
  GL_MODELVIEW_MATRIX                           : constant := 16#0BA6#;
  GL_MODELVIEW_STACK_DEPTH                      : constant := 16#0BA3#;
  GL_NAME_STACK_DEPTH                           : constant := 16#0D70#;
  GL_PROJECTION_MATRIX                          : constant := 16#0BA7#;
  GL_PROJECTION_STACK_DEPTH                     : constant := 16#0BA4#;
  GL_RENDER_MODE                                : constant := 16#0C40#;
  GL_RGBA_MODE                                  : constant := 16#0C31#;
  GL_TEXTURE_MATRIX                             : constant := 16#0BA8#;
  GL_TEXTURE_STACK_DEPTH                        : constant := 16#0BA5#;
  GL_VIEWPORT                                   : constant := 16#0BA2#;

  ------------------------------------------------------------------------------
  --  Evaluators
  ------------------------------------------------------------------------------
  GL_AUTO_NORMAL                                : constant := 16#0D80#;
  GL_MAP1_COLOR_4                               : constant := 16#0D90#;
  GL_MAP1_INDEX                                 : constant := 16#0D91#;
  GL_MAP1_NORMAL                                : constant := 16#0D92#;
  GL_MAP1_TEXTURE_COORD_1                       : constant := 16#0D93#;
  GL_MAP1_TEXTURE_COORD_2                       : constant := 16#0D94#;
  GL_MAP1_TEXTURE_COORD_3                       : constant := 16#0D95#;
  GL_MAP1_TEXTURE_COORD_4                       : constant := 16#0D96#;
  GL_MAP1_VERTEX_3                              : constant := 16#0D97#;
  GL_MAP1_VERTEX_4                              : constant := 16#0D98#;
  GL_MAP2_COLOR_4                               : constant := 16#0DB0#;
  GL_MAP2_INDEX                                 : constant := 16#0DB1#;
  GL_MAP2_NORMAL                                : constant := 16#0DB2#;
  GL_MAP2_TEXTURE_COORD_1                       : constant := 16#0DB3#;
  GL_MAP2_TEXTURE_COORD_2                       : constant := 16#0DB4#;
  GL_MAP2_TEXTURE_COORD_3                       : constant := 16#0DB5#;
  GL_MAP2_TEXTURE_COORD_4                       : constant := 16#0DB6#;
  GL_MAP2_VERTEX_3                              : constant := 16#0DB7#;
  GL_MAP2_VERTEX_4                              : constant := 16#0DB8#;
  GL_MAP1_GRID_DOMAIN                           : constant := 16#0DD0#;
  GL_MAP1_GRID_SEGMENTS                         : constant := 16#0DD1#;
  GL_MAP2_GRID_DOMAIN                           : constant := 16#0DD2#;
  GL_MAP2_GRID_SEGMENTS                         : constant := 16#0DD3#;
  GL_COEFF                                      : constant := 16#0A00#;
  GL_DOMAIN                                     : constant := 16#0A02#;
  GL_ORDER                                      : constant := 16#0A01#;

  ------------------------------------------------------------------------------
  --  Hints
  ------------------------------------------------------------------------------
  GL_FOG_HINT                                   : constant := 16#0C54#;
  GL_LINE_SMOOTH_HINT                           : constant := 16#0C52#;
  GL_PERSPECTIVE_CORRECTION_HINT                : constant := 16#0C50#;
  GL_POINT_SMOOTH_HINT                          : constant := 16#0C51#;
  GL_POLYGON_SMOOTH_HINT                        : constant := 16#0C53#;
  GL_DONT_CARE                                  : constant := 16#1100#;
  GL_FASTEST                                    : constant := 16#1101#;
  GL_NICEST                                     : constant := 16#1102#;

  ------------------------------------------------------------------------------
  --  Scissor box
  ------------------------------------------------------------------------------
  GL_SCISSOR_TEST                               : constant := 16#0C11#;
  GL_SCISSOR_BOX                                : constant := 16#0C10#;

  ------------------------------------------------------------------------------
  --  Pixel Mode / Transfer
  ------------------------------------------------------------------------------
  GL_MAP_COLOR                                  : constant := 16#0D10#;
  GL_MAP_STENCIL                                : constant := 16#0D11#;
  GL_INDEX_SHIFT                                : constant := 16#0D12#;
  GL_INDEX_OFFSET                               : constant := 16#0D13#;
  GL_RED_SCALE                                  : constant := 16#0D14#;
  GL_RED_BIAS                                   : constant := 16#0D15#;
  GL_GREEN_SCALE                                : constant := 16#0D18#;
  GL_GREEN_BIAS                                 : constant := 16#0D19#;
  GL_BLUE_SCALE                                 : constant := 16#0D1A#;
  GL_BLUE_BIAS                                  : constant := 16#0D1B#;
  GL_ALPHA_SCALE                                : constant := 16#0D1C#;
  GL_ALPHA_BIAS                                 : constant := 16#0D1D#;
  GL_DEPTH_SCALE                                : constant := 16#0D1E#;
  GL_DEPTH_BIAS                                 : constant := 16#0D1F#;
  GL_PIXEL_MAP_S_TO_S_SIZE                      : constant := 16#0CB1#;
  GL_PIXEL_MAP_I_TO_I_SIZE                      : constant := 16#0CB0#;
  GL_PIXEL_MAP_I_TO_R_SIZE                      : constant := 16#0CB2#;
  GL_PIXEL_MAP_I_TO_G_SIZE                      : constant := 16#0CB3#;
  GL_PIXEL_MAP_I_TO_B_SIZE                      : constant := 16#0CB4#;
  GL_PIXEL_MAP_I_TO_A_SIZE                      : constant := 16#0CB5#;
  GL_PIXEL_MAP_R_TO_R_SIZE                      : constant := 16#0CB6#;
  GL_PIXEL_MAP_G_TO_G_SIZE                      : constant := 16#0CB7#;
  GL_PIXEL_MAP_B_TO_B_SIZE                      : constant := 16#0CB8#;
  GL_PIXEL_MAP_A_TO_A_SIZE                      : constant := 16#0CB9#;
  GL_PIXEL_MAP_S_TO_S                           : constant := 16#0C71#;
  GL_PIXEL_MAP_I_TO_I                           : constant := 16#0C70#;
  GL_PIXEL_MAP_I_TO_R                           : constant := 16#0C72#;
  GL_PIXEL_MAP_I_TO_G                           : constant := 16#0C73#;
  GL_PIXEL_MAP_I_TO_B                           : constant := 16#0C74#;
  GL_PIXEL_MAP_I_TO_A                           : constant := 16#0C75#;
  GL_PIXEL_MAP_R_TO_R                           : constant := 16#0C76#;
  GL_PIXEL_MAP_G_TO_G                           : constant := 16#0C77#;
  GL_PIXEL_MAP_B_TO_B                           : constant := 16#0C78#;
  GL_PIXEL_MAP_A_TO_A                           : constant := 16#0C79#;
  GL_PACK_ALIGNMENT                             : constant := 16#0D05#;
  GL_PACK_LSB_FIRST                             : constant := 16#0D01#;
  GL_PACK_ROW_LENGTH                            : constant := 16#0D02#;
  GL_PACK_SKIP_PIXELS                           : constant := 16#0D04#;
  GL_PACK_SKIP_ROWS                             : constant := 16#0D03#;
  GL_PACK_SWAP_BYTES                            : constant := 16#0D00#;
  GL_UNPACK_ALIGNMENT                           : constant := 16#0CF5#;
  GL_UNPACK_LSB_FIRST                           : constant := 16#0CF1#;
  GL_UNPACK_ROW_LENGTH                          : constant := 16#0CF2#;
  GL_UNPACK_SKIP_PIXELS                         : constant := 16#0CF4#;
  GL_UNPACK_SKIP_ROWS                           : constant := 16#0CF3#;
  GL_UNPACK_SWAP_BYTES                          : constant := 16#0CF0#;
  GL_ZOOM_X                                     : constant := 16#0D16#;
  GL_ZOOM_Y                                     : constant := 16#0D17#;

  ------------------------------------------------------------------------------
  --  Texture mapping
  ------------------------------------------------------------------------------
  GL_TEXTURE_ENV                                : constant := 16#2300#;
  GL_TEXTURE_ENV_MODE                           : constant := 16#2200#;
  GL_TEXTURE_1D                                 : constant := 16#0DE0#;
  GL_TEXTURE_2D                                 : constant := 16#0DE1#;
  GL_TEXTURE_WRAP_S                             : constant := 16#2802#;
  GL_TEXTURE_WRAP_T                             : constant := 16#2803#;
  GL_TEXTURE_MAG_FILTER                         : constant := 16#2800#;
  GL_TEXTURE_MIN_FILTER                         : constant := 16#2801#;
  GL_TEXTURE_ENV_COLOR                          : constant := 16#2201#;
  GL_TEXTURE_GEN_S                              : constant := 16#0C60#;
  GL_TEXTURE_GEN_T                              : constant := 16#0C61#;
  GL_TEXTURE_GEN_MODE                           : constant := 16#2500#;
  GL_TEXTURE_BORDER_COLOR                       : constant := 16#1004#;
  GL_TEXTURE_WIDTH                              : constant := 16#1000#;
  GL_TEXTURE_HEIGHT                             : constant := 16#1001#;
  GL_TEXTURE_BORDER                             : constant := 16#1005#;
  GL_TEXTURE_COMPONENTS                         : constant := 16#1003#;
  GL_TEXTURE_RED_SIZE                           : constant := 16#0000_805C#;
  GL_TEXTURE_GREEN_SIZE                         : constant := 16#0000_805D#;
  GL_TEXTURE_BLUE_SIZE                          : constant := 16#0000_805E#;
  GL_TEXTURE_ALPHA_SIZE                         : constant := 16#0000_805F#;
  GL_TEXTURE_LUMINANCE_SIZE                     : constant := 16#0000_8060#;
  GL_TEXTURE_INTENSITY_SIZE                     : constant := 16#0000_8061#;
  GL_NEAREST_MIPMAP_NEAREST                     : constant := 16#2700#;
  GL_NEAREST_MIPMAP_LINEAR                      : constant := 16#2702#;
  GL_LINEAR_MIPMAP_NEAREST                      : constant := 16#2701#;
  GL_LINEAR_MIPMAP_LINEAR                       : constant := 16#2703#;
  GL_OBJECT_LINEAR                              : constant := 16#2401#;
  GL_OBJECT_PLANE                               : constant := 16#2501#;
  GL_EYE_LINEAR                                 : constant := 16#2400#;
  GL_EYE_PLANE                                  : constant := 16#2502#;
  GL_SPHERE_MAP                                 : constant := 16#2402#;
  GL_DECAL                                      : constant := 16#2101#;
  GL_MODULATE                                   : constant := 16#2100#;
  GL_NEAREST                                    : constant := 16#2600#;
  GL_REPEAT                                     : constant := 16#2901#;
  GL_CLAMP                                      : constant := 16#2900#;
  GL_S                                          : constant := 16#2000#;
  GL_T                                          : constant := 16#2001#;
  GL_R                                          : constant := 16#2002#;
  GL_Q                                          : constant := 16#2003#;
  GL_TEXTURE_GEN_R                              : constant := 16#0C62#;
  GL_TEXTURE_GEN_Q                              : constant := 16#0C63#;

  ------------------------------------------------------------------------------
  --  Utility
  ------------------------------------------------------------------------------
  GL_VENDOR                                     : constant := 16#1F00#;
  GL_RENDERER                                   : constant := 16#1F01#;
  GL_VERSION                                    : constant := 16#1F02#;
  GL_EXTENSIONS                                 : constant := 16#1F03#;

  ------------------------------------------------------------------------------
  --  Errors
  ------------------------------------------------------------------------------
  GL_NO_ERROR                                   : constant := 16#0000#;
  GL_INVALID_VALUE                              : constant := 16#0501#;
  GL_INVALID_ENUM                               : constant := 16#0500#;
  GL_INVALID_OPERATION                          : constant := 16#0502#;
  GL_STACK_OVERFLOW                             : constant := 16#0503#;
  GL_STACK_UNDERFLOW                            : constant := 16#0504#;
  GL_OUT_OF_MEMORY                              : constant := 16#0505#;

  ------------------------------------------------------------------------------
   --  glPushAttrib/glPopAttrib bits
  ------------------------------------------------------------------------------
  GL_CURRENT_BIT                                : constant := 16#0001#;
  GL_POINT_BIT                                  : constant := 16#0002#;
  GL_LINE_BIT                                   : constant := 16#0004#;
  GL_POLYGON_BIT                                : constant := 16#0008#;
  GL_POLYGON_STIPPLE_BIT                        : constant := 16#0010#;
  GL_PIXEL_MODE_BIT                             : constant := 16#0020#;
  GL_LIGHTING_BIT                               : constant := 16#0040#;
  GL_FOG_BIT                                    : constant := 16#0080#;
  GL_DEPTH_BUFFER_BIT                           : constant := 16#0100#;
  GL_ACCUM_BUFFER_BIT                           : constant := 16#0200#;
  GL_STENCIL_BUFFER_BIT                         : constant := 16#0400#;
  GL_VIEWPORT_BIT                               : constant := 16#0800#;
  GL_TRANSFORM_BIT                              : constant := 16#1000#;
  GL_ENABLE_BIT                                 : constant := 16#2000#;
  GL_COLOR_BUFFER_BIT                           : constant := 16#4000#;
  GL_HINT_BIT                                   : constant := 16#8000#;
  GL_EVAL_BIT                                   : constant := 16#0001_0000#;
  GL_LIST_BIT                                   : constant := 16#0002_0000#;
  GL_TEXTURE_BIT                                : constant := 16#0004_0000#;
  GL_SCISSOR_BIT                                : constant := 16#0008_0000#;
  GL_ALL_ATTRIB_BITS                            : constant := 16#000F_FFFF#;

  ------------------------------------------------------------------------------
  --  OpenGL 1.1
  ------------------------------------------------------------------------------
  GL_PROXY_TEXTURE_1D                           : constant := 16#0000_8063#;
  GL_PROXY_TEXTURE_2D                           : constant := 16#0000_8064#;
  GL_TEXTURE_PRIORITY                           : constant := 16#0000_8066#;
  GL_TEXTURE_RESIDENT                           : constant := 16#0000_8067#;
  GL_TEXTURE_BINDING_1D                         : constant := 16#0000_8068#;
  GL_TEXTURE_BINDING_2D                         : constant := 16#0000_8069#;
  GL_TEXTURE_INTERNAL_FORMAT                    : constant := 16#1003#;
  GL_ALPHA4                                     : constant := 16#0000_803B#;
  GL_ALPHA8                                     : constant := 16#0000_803C#;
  GL_ALPHA12                                    : constant := 16#0000_803D#;
  GL_ALPHA16                                    : constant := 16#0000_803E#;
  GL_LUMINANCE4                                 : constant := 16#0000_803F#;
  GL_LUMINANCE8                                 : constant := 16#0000_8040#;
  GL_LUMINANCE12                                : constant := 16#0000_8041#;
  GL_LUMINANCE16                                : constant := 16#0000_8042#;
  GL_LUMINANCE4_ALPHA4                          : constant := 16#0000_8043#;
  GL_LUMINANCE6_ALPHA2                          : constant := 16#0000_8044#;
  GL_LUMINANCE8_ALPHA8                          : constant := 16#0000_8045#;
  GL_LUMINANCE12_ALPHA4                         : constant := 16#0000_8046#;
  GL_LUMINANCE12_ALPHA12                        : constant := 16#0000_8047#;
  GL_LUMINANCE16_ALPHA16                        : constant := 16#0000_8048#;
  GL_INTENSITY                                  : constant := 16#0000_8049#;
  GL_INTENSITY4                                 : constant := 16#0000_804A#;
  GL_INTENSITY8                                 : constant := 16#0000_804B#;
  GL_INTENSITY12                                : constant := 16#0000_804C#;
  GL_INTENSITY16                                : constant := 16#0000_804D#;
  GL_R3_G3_B2                                   : constant := 16#2A10#;
  GL_RGB4                                       : constant := 16#0000_804F#;
  GL_RGB5                                       : constant := 16#0000_8050#;
  GL_RGB8                                       : constant := 16#0000_8051#;
  GL_RGB10                                      : constant := 16#0000_8052#;
  GL_RGB12                                      : constant := 16#0000_8053#;
  GL_RGB16                                      : constant := 16#0000_8054#;
  GL_RGBA2                                      : constant := 16#0000_8055#;
  GL_RGBA4                                      : constant := 16#0000_8056#;
  GL_RGB5_A1                                    : constant := 16#0000_8057#;
  GL_RGBA8                                      : constant := 16#0000_8058#;
  GL_RGB10_A2                                   : constant := 16#0000_8059#;
  GL_RGBA12                                     : constant := 16#0000_805A#;
  GL_RGBA16                                     : constant := 16#0000_805B#;
  GL_CLIENT_PIXEL_STORE_BIT                     : constant := 16#0001#;
  GL_CLIENT_VERTEX_ARRAY_BIT                    : constant := 16#0002#;
  GL_ALL_CLIENT_ATTRIB_BITS                     : constant := 16#FFFF_FFFF#;
  GL_CLIENT_ALL_ATTRIB_BITS                     : constant := 16#FFFF_FFFF#;

  ------------------------------------------------------------------------------
  --  OpenGL 1.2
  ------------------------------------------------------------------------------
  GL_RESCALE_NORMAL                             : constant := 16#0000_803A#;
  GL_CLAMP_TO_EDGE                              : constant := 16#0000_812F#;
  GL_MAX_ELEMENTS_VERTICES                      : constant := 16#0000_80E8#;
  GL_MAX_ELEMENTS_INDICES                       : constant := 16#0000_80E9#;
  GL_BGR                                        : constant := 16#0000_80E0#;
  GL_BGRA                                       : constant := 16#0000_80E1#;
  GL_UNSIGNED_BYTE_3_3_2                        : constant := 16#0000_8032#;
  GL_UNSIGNED_BYTE_2_3_3_REV                    : constant := 16#0000_8362#;
  GL_UNSIGNED_SHORT_5_6_5                       : constant := 16#0000_8363#;
  GL_UNSIGNED_SHORT_5_6_5_REV                   : constant := 16#0000_8364#;
  GL_UNSIGNED_SHORT_4_4_4_4                     : constant := 16#0000_8033#;
  GL_UNSIGNED_SHORT_4_4_4_4_REV                 : constant := 16#0000_8365#;
  GL_UNSIGNED_SHORT_5_5_5_1                     : constant := 16#0000_8034#;
  GL_UNSIGNED_SHORT_1_5_5_5_REV                 : constant := 16#0000_8366#;
  GL_UNSIGNED_INT_8_8_8_8                       : constant := 16#0000_8035#;
  GL_UNSIGNED_INT_8_8_8_8_REV                   : constant := 16#0000_8367#;
  GL_UNSIGNED_INT_10_10_10_2                    : constant := 16#0000_8036#;
  GL_UNSIGNED_INT_2_10_10_10_REV                : constant := 16#0000_8368#;
  GL_LIGHT_MODEL_COLOR_CONTROL                  : constant := 16#0000_81F8#;
  GL_SINGLE_COLOR                               : constant := 16#0000_81F9#;
  GL_SEPARATE_SPECULAR_COLOR                    : constant := 16#0000_81FA#;
  GL_TEXTURE_MIN_LOD                            : constant := 16#0000_813A#;
  GL_TEXTURE_MAX_LOD                            : constant := 16#0000_813B#;
  GL_TEXTURE_BASE_LEVEL                         : constant := 16#0000_813C#;
  GL_TEXTURE_MAX_LEVEL                          : constant := 16#0000_813D#;
  GL_SMOOTH_POINT_SIZE_RANGE                    : constant := 16#0B12#;
  GL_SMOOTH_POINT_SIZE_GRANULARITY              : constant := 16#0B13#;
  GL_SMOOTH_LINE_WIDTH_RANGE                    : constant := 16#0B22#;
  GL_SMOOTH_LINE_WIDTH_GRANULARITY              : constant := 16#0B23#;
  GL_ALIASED_POINT_SIZE_RANGE                   : constant := 16#0000_846D#;
  GL_ALIASED_LINE_WIDTH_RANGE                   : constant := 16#0000_846E#;
  GL_PACK_SKIP_IMAGES                           : constant := 16#0000_806B#;
  GL_PACK_IMAGE_HEIGHT                          : constant := 16#0000_806C#;
  GL_UNPACK_SKIP_IMAGES                         : constant := 16#0000_806D#;
  GL_UNPACK_IMAGE_HEIGHT                        : constant := 16#0000_806E#;
  GL_TEXTURE_3D                                 : constant := 16#0000_806F#;
  GL_PROXY_TEXTURE_3D                           : constant := 16#0000_8070#;
  GL_TEXTURE_DEPTH                              : constant := 16#0000_8071#;
  GL_TEXTURE_WRAP_R                             : constant := 16#0000_8072#;
  GL_MAX_3D_TEXTURE_SIZE                        : constant := 16#0000_8073#;
  GL_TEXTURE_BINDING_3D                         : constant := 16#0000_806A#;

  ------------------------------------------------------------------------------
  --  GL_ARB_imaging
  ------------------------------------------------------------------------------
  GL_CONSTANT_COLOR                             : constant := 16#0000_8001#;
  GL_ONE_MINUS_CONSTANT_COLOR                   : constant := 16#0000_8002#;
  GL_CONSTANT_ALPHA                             : constant := 16#0000_8003#;
  GL_ONE_MINUS_CONSTANT_ALPHA                   : constant := 16#0000_8004#;
  GL_COLOR_TABLE                                : constant := 16#0000_80D0#;
  GL_POST_CONVOLUTION_COLOR_TABLE               : constant := 16#0000_80D1#;
  GL_POST_COLOR_MATRIX_COLOR_TABLE              : constant := 16#0000_80D2#;
  GL_PROXY_COLOR_TABLE                          : constant := 16#0000_80D3#;
  GL_PROXY_POST_CONVOLUTION_COLOR_TABLE         : constant := 16#0000_80D4#;
  GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE        : constant := 16#0000_80D5#;
  GL_COLOR_TABLE_SCALE                          : constant := 16#0000_80D6#;
  GL_COLOR_TABLE_BIAS                           : constant := 16#0000_80D7#;
  GL_COLOR_TABLE_FORMAT                         : constant := 16#0000_80D8#;
  GL_COLOR_TABLE_WIDTH                          : constant := 16#0000_80D9#;
  GL_COLOR_TABLE_RED_SIZE                       : constant := 16#0000_80DA#;
  GL_COLOR_TABLE_GREEN_SIZE                     : constant := 16#0000_80DB#;
  GL_COLOR_TABLE_BLUE_SIZE                      : constant := 16#0000_80DC#;
  GL_COLOR_TABLE_ALPHA_SIZE                     : constant := 16#0000_80DD#;
  GL_COLOR_TABLE_LUMINANCE_SIZE                 : constant := 16#0000_80DE#;
  GL_COLOR_TABLE_INTENSITY_SIZE                 : constant := 16#0000_80DF#;
  GL_CONVOLUTION_1D                             : constant := 16#0000_8010#;
  GL_CONVOLUTION_2D                             : constant := 16#0000_8011#;
  GL_SEPARABLE_2D                               : constant := 16#0000_8012#;
  GL_CONVOLUTION_BORDER_MODE                    : constant := 16#0000_8013#;
  GL_CONVOLUTION_FILTER_SCALE                   : constant := 16#0000_8014#;
  GL_CONVOLUTION_FILTER_BIAS                    : constant := 16#0000_8015#;
  GL_REDUCE                                     : constant := 16#0000_8016#;
  GL_CONVOLUTION_FORMAT                         : constant := 16#0000_8017#;
  GL_CONVOLUTION_WIDTH                          : constant := 16#0000_8018#;
  GL_CONVOLUTION_HEIGHT                         : constant := 16#0000_8019#;
  GL_MAX_CONVOLUTION_WIDTH                      : constant := 16#0000_801A#;
  GL_MAX_CONVOLUTION_HEIGHT                     : constant := 16#0000_801B#;
  GL_POST_CONVOLUTION_RED_SCALE                 : constant := 16#0000_801C#;
  GL_POST_CONVOLUTION_GREEN_SCALE               : constant := 16#0000_801D#;
  GL_POST_CONVOLUTION_BLUE_SCALE                : constant := 16#0000_801E#;
  GL_POST_CONVOLUTION_ALPHA_SCALE               : constant := 16#0000_801F#;
  GL_POST_CONVOLUTION_RED_BIAS                  : constant := 16#0000_8020#;
  GL_POST_CONVOLUTION_GREEN_BIAS                : constant := 16#0000_8021#;
  GL_POST_CONVOLUTION_BLUE_BIAS                 : constant := 16#0000_8022#;
  GL_POST_CONVOLUTION_ALPHA_BIAS                : constant := 16#0000_8023#;
  GL_CONSTANT_BORDER                            : constant := 16#0000_8151#;
  GL_REPLICATE_BORDER                           : constant := 16#0000_8153#;
  GL_CONVOLUTION_BORDER_COLOR                   : constant := 16#0000_8154#;
  GL_COLOR_MATRIX                               : constant := 16#0000_80B1#;
  GL_COLOR_MATRIX_STACK_DEPTH                   : constant := 16#0000_80B2#;
  GL_MAX_COLOR_MATRIX_STACK_DEPTH               : constant := 16#0000_80B3#;
  GL_POST_COLOR_MATRIX_RED_SCALE                : constant := 16#0000_80B4#;
  GL_POST_COLOR_MATRIX_GREEN_SCALE              : constant := 16#0000_80B5#;
  GL_POST_COLOR_MATRIX_BLUE_SCALE               : constant := 16#0000_80B6#;
  GL_POST_COLOR_MATRIX_ALPHA_SCALE              : constant := 16#0000_80B7#;
  GL_POST_COLOR_MATRIX_RED_BIAS                 : constant := 16#0000_80B8#;
  GL_POST_COLOR_MATRIX_GREEN_BIAS               : constant := 16#0000_80B9#;
  GL_POST_COLOR_MATRIX_BLUE_BIAS                : constant := 16#0000_80BA#;
  GL_POST_COLOR_MATRIX_ALPHA_BIAS               : constant := 16#0000_80BB#;
  GL_HISTOGRAM                                  : constant := 16#0000_8024#;
  GL_PROXY_HISTOGRAM                            : constant := 16#0000_8025#;
  GL_HISTOGRAM_WIDTH                            : constant := 16#0000_8026#;
  GL_HISTOGRAM_FORMAT                           : constant := 16#0000_8027#;
  GL_HISTOGRAM_RED_SIZE                         : constant := 16#0000_8028#;
  GL_HISTOGRAM_GREEN_SIZE                       : constant := 16#0000_8029#;
  GL_HISTOGRAM_BLUE_SIZE                        : constant := 16#0000_802A#;
  GL_HISTOGRAM_ALPHA_SIZE                       : constant := 16#0000_802B#;
  GL_HISTOGRAM_LUMINANCE_SIZE                   : constant := 16#0000_802C#;
  GL_HISTOGRAM_SINK                             : constant := 16#0000_802D#;
  GL_MINMAX                                     : constant := 16#0000_802E#;
  GL_MINMAX_FORMAT                              : constant := 16#0000_802F#;
  GL_MINMAX_SINK                                : constant := 16#0000_8030#;
  GL_TABLE_TOO_LARGE                            : constant := 16#0000_8031#;
  GL_BLEND_EQUATION                             : constant := 16#0000_8009#;
  GL_MIN                                        : constant := 16#0000_8007#;
  GL_MAX                                        : constant := 16#0000_8008#;
  GL_FUNC_ADD                                   : constant := 16#0000_8006#;
  GL_FUNC_SUBTRACT                              : constant := 16#0000_800A#;
  GL_FUNC_REVERSE_SUBTRACT                      : constant := 16#0000_800B#;
  GL_BLEND_COLOR                                : constant := 16#0000_8005#;

  ------------------------------------------------------------------------------
  --  OpenGL 1.3
  ------------------------------------------------------------------------------
  --  multitexture
  ------------------------------------------------------------------------------
  GL_TEXTURE0                                   : constant := 16#0000_84C0#;
  GL_TEXTURE1                                   : constant := 16#0000_84C1#;
  GL_TEXTURE2                                   : constant := 16#0000_84C2#;
  GL_TEXTURE3                                   : constant := 16#0000_84C3#;
  GL_TEXTURE4                                   : constant := 16#0000_84C4#;
  GL_TEXTURE5                                   : constant := 16#0000_84C5#;
  GL_TEXTURE6                                   : constant := 16#0000_84C6#;
  GL_TEXTURE7                                   : constant := 16#0000_84C7#;
  GL_TEXTURE8                                   : constant := 16#0000_84C8#;
  GL_TEXTURE9                                   : constant := 16#0000_84C9#;
  GL_TEXTURE10                                  : constant := 16#0000_84CA#;
  GL_TEXTURE11                                  : constant := 16#0000_84CB#;
  GL_TEXTURE12                                  : constant := 16#0000_84CC#;
  GL_TEXTURE13                                  : constant := 16#0000_84CD#;
  GL_TEXTURE14                                  : constant := 16#0000_84CE#;
  GL_TEXTURE15                                  : constant := 16#0000_84CF#;
  GL_TEXTURE16                                  : constant := 16#0000_84D0#;
  GL_TEXTURE17                                  : constant := 16#0000_84D1#;
  GL_TEXTURE18                                  : constant := 16#0000_84D2#;
  GL_TEXTURE19                                  : constant := 16#0000_84D3#;
  GL_TEXTURE20                                  : constant := 16#0000_84D4#;
  GL_TEXTURE21                                  : constant := 16#0000_84D5#;
  GL_TEXTURE22                                  : constant := 16#0000_84D6#;
  GL_TEXTURE23                                  : constant := 16#0000_84D7#;
  GL_TEXTURE24                                  : constant := 16#0000_84D8#;
  GL_TEXTURE25                                  : constant := 16#0000_84D9#;
  GL_TEXTURE26                                  : constant := 16#0000_84DA#;
  GL_TEXTURE27                                  : constant := 16#0000_84DB#;
  GL_TEXTURE28                                  : constant := 16#0000_84DC#;
  GL_TEXTURE29                                  : constant := 16#0000_84DD#;
  GL_TEXTURE30                                  : constant := 16#0000_84DE#;
  GL_TEXTURE31                                  : constant := 16#0000_84DF#;
  GL_ACTIVE_TEXTURE                             : constant := 16#0000_84E0#;
  GL_CLIENT_ACTIVE_TEXTURE                      : constant := 16#0000_84E1#;
  GL_MAX_TEXTURE_UNITS                          : constant := 16#0000_84E2#;

  ------------------------------------------------------------------------------
  --  texture_cube_map
  ------------------------------------------------------------------------------
  GL_NORMAL_MAP                                 : constant := 16#0000_8511#;
  GL_REFLECTION_MAP                             : constant := 16#0000_8512#;
  GL_TEXTURE_CUBE_MAP                           : constant := 16#0000_8513#;
  GL_TEXTURE_BINDING_CUBE_MAP                   : constant := 16#0000_8514#;
  GL_TEXTURE_CUBE_MAP_POSITIVE_X                : constant := 16#0000_8515#;
  GL_TEXTURE_CUBE_MAP_NEGATIVE_X                : constant := 16#0000_8516#;
  GL_TEXTURE_CUBE_MAP_POSITIVE_Y                : constant := 16#0000_8517#;
  GL_TEXTURE_CUBE_MAP_NEGATIVE_Y                : constant := 16#0000_8518#;
  GL_TEXTURE_CUBE_MAP_POSITIVE_Z                : constant := 16#0000_8519#;
  GL_TEXTURE_CUBE_MAP_NEGATIVE_Z                : constant := 16#0000_851A#;
  GL_PROXY_TEXTURE_CUBE_MAP                     : constant := 16#0000_851B#;
  GL_MAX_CUBE_MAP_TEXTURE_SIZE                  : constant := 16#0000_851C#;

  ------------------------------------------------------------------------------
  --  texture_compression
  ------------------------------------------------------------------------------
  GL_COMPRESSED_ALPHA                           : constant := 16#0000_84E9#;
  GL_COMPRESSED_LUMINANCE                       : constant := 16#0000_84EA#;
  GL_COMPRESSED_LUMINANCE_ALPHA                 : constant := 16#0000_84EB#;
  GL_COMPRESSED_INTENSITY                       : constant := 16#0000_84EC#;
  GL_COMPRESSED_RGB                             : constant := 16#0000_84ED#;
  GL_COMPRESSED_RGBA                            : constant := 16#0000_84EE#;
  GL_TEXTURE_COMPRESSION_HINT                   : constant := 16#0000_84EF#;
  GL_TEXTURE_COMPRESSED_IMAGE_SIZE              : constant := 16#0000_86A0#;
  GL_TEXTURE_COMPRESSED                         : constant := 16#0000_86A1#;
  GL_NUM_COMPRESSED_TEXTURE_FORMATS             : constant := 16#0000_86A2#;
  GL_COMPRESSED_TEXTURE_FORMATS                 : constant := 16#0000_86A3#;

  ------------------------------------------------------------------------------
  --  multisample
  ------------------------------------------------------------------------------
  GL_MULTISAMPLE                                : constant := 16#0000_809D#;
  GL_SAMPLE_ALPHA_TO_COVERAGE                   : constant := 16#0000_809E#;
  GL_SAMPLE_ALPHA_TO_ONE                        : constant := 16#0000_809F#;
  GL_SAMPLE_COVERAGE                            : constant := 16#0000_80A0#;
  GL_SAMPLE_BUFFERS                             : constant := 16#0000_80A8#;
  GL_SAMPLES                                    : constant := 16#0000_80A9#;
  GL_SAMPLE_COVERAGE_VALUE                      : constant := 16#0000_80AA#;
  GL_SAMPLE_COVERAGE_INVERT                     : constant := 16#0000_80AB#;
  GL_MULTISAMPLE_BIT                            : constant := 16#2000_0000#;

  ------------------------------------------------------------------------------
  --  transpose_matrix
  ------------------------------------------------------------------------------
  GL_TRANSPOSE_MODELVIEW_MATRIX                 : constant := 16#0000_84E3#;
  GL_TRANSPOSE_PROJECTION_MATRIX                : constant := 16#0000_84E4#;
  GL_TRANSPOSE_TEXTURE_MATRIX                   : constant := 16#0000_84E5#;
  GL_TRANSPOSE_COLOR_MATRIX                     : constant := 16#0000_84E6#;

  ------------------------------------------------------------------------------
  --  texture_env_combine
  ------------------------------------------------------------------------------
  GL_COMBINE                                    : constant := 16#0000_8570#;
  GL_COMBINE_RGB                                : constant := 16#0000_8571#;
  GL_COMBINE_ALPHA                              : constant := 16#0000_8572#;
  GL_SOURCE0_RGB                                : constant := 16#0000_8580#;
  GL_SOURCE1_RGB                                : constant := 16#0000_8581#;
  GL_SOURCE2_RGB                                : constant := 16#0000_8582#;
  GL_SOURCE0_ALPHA                              : constant := 16#0000_8588#;
  GL_SOURCE1_ALPHA                              : constant := 16#0000_8589#;
  GL_SOURCE2_ALPHA                              : constant := 16#0000_858A#;
  GL_OPERAND0_RGB                               : constant := 16#0000_8590#;
  GL_OPERAND1_RGB                               : constant := 16#0000_8591#;
  GL_OPERAND2_RGB                               : constant := 16#0000_8592#;
  GL_OPERAND0_ALPHA                             : constant := 16#0000_8598#;
  GL_OPERAND1_ALPHA                             : constant := 16#0000_8599#;
  GL_OPERAND2_ALPHA                             : constant := 16#0000_859A#;
  GL_RGB_SCALE                                  : constant := 16#0000_8573#;
  GL_ADD_SIGNED                                 : constant := 16#0000_8574#;
  GL_INTERPOLATE                                : constant := 16#0000_8575#;
  GL_SUBTRACT                                   : constant := 16#0000_84E7#;
  GL_CONSTANT                                   : constant := 16#0000_8576#;
  GL_PRIMARY_COLOR                              : constant := 16#0000_8577#;
  GL_PREVIOUS                                   : constant := 16#0000_8578#;

  ------------------------------------------------------------------------------
  --  texture_env_dot3
  ------------------------------------------------------------------------------
  GL_DOT3_RGB                                   : constant := 16#0000_86AE#;
  GL_DOT3_RGBA                                  : constant := 16#0000_86AF#;

  ------------------------------------------------------------------------------
  --  texture_border_clamp
  ------------------------------------------------------------------------------
  GL_CLAMP_TO_BORDER                            : constant := 16#0000_812D#;

  ------------------------------------------------------------------------------
  --  GL_ARB_multitexture  (ARB extension 1 and OpenGL 1.2.1)
  ------------------------------------------------------------------------------
  GL_ARB_MULTITEXTURE                           : constant := 1;
  GL_TEXTURE0_ARB                               : constant := 16#0000_84C0#;
  GL_TEXTURE1_ARB                               : constant := 16#0000_84C1#;
  GL_TEXTURE2_ARB                               : constant := 16#0000_84C2#;
  GL_TEXTURE3_ARB                               : constant := 16#0000_84C3#;
  GL_TEXTURE4_ARB                               : constant := 16#0000_84C4#;
  GL_TEXTURE5_ARB                               : constant := 16#0000_84C5#;
  GL_TEXTURE6_ARB                               : constant := 16#0000_84C6#;
  GL_TEXTURE7_ARB                               : constant := 16#0000_84C7#;
  GL_TEXTURE8_ARB                               : constant := 16#0000_84C8#;
  GL_TEXTURE9_ARB                               : constant := 16#0000_84C9#;
  GL_TEXTURE10_ARB                              : constant := 16#0000_84CA#;
  GL_TEXTURE11_ARB                              : constant := 16#0000_84CB#;
  GL_TEXTURE12_ARB                              : constant := 16#0000_84CC#;
  GL_TEXTURE13_ARB                              : constant := 16#0000_84CD#;
  GL_TEXTURE14_ARB                              : constant := 16#0000_84CE#;
  GL_TEXTURE15_ARB                              : constant := 16#0000_84CF#;
  GL_TEXTURE16_ARB                              : constant := 16#0000_84D0#;
  GL_TEXTURE17_ARB                              : constant := 16#0000_84D1#;
  GL_TEXTURE18_ARB                              : constant := 16#0000_84D2#;
  GL_TEXTURE19_ARB                              : constant := 16#0000_84D3#;
  GL_TEXTURE20_ARB                              : constant := 16#0000_84D4#;
  GL_TEXTURE21_ARB                              : constant := 16#0000_84D5#;
  GL_TEXTURE22_ARB                              : constant := 16#0000_84D6#;
  GL_TEXTURE23_ARB                              : constant := 16#0000_84D7#;
  GL_TEXTURE24_ARB                              : constant := 16#0000_84D8#;
  GL_TEXTURE25_ARB                              : constant := 16#0000_84D9#;
  GL_TEXTURE26_ARB                              : constant := 16#0000_84DA#;
  GL_TEXTURE27_ARB                              : constant := 16#0000_84DB#;
  GL_TEXTURE28_ARB                              : constant := 16#0000_84DC#;
  GL_TEXTURE29_ARB                              : constant := 16#0000_84DD#;
  GL_TEXTURE30_ARB                              : constant := 16#0000_84DE#;
  GL_TEXTURE31_ARB                              : constant := 16#0000_84DF#;
  GL_ACTIVE_TEXTURE_ARB                         : constant := 16#0000_84E0#;
  GL_CLIENT_ACTIVE_TEXTURE_ARB                  : constant := 16#0000_84E1#;
  GL_MAX_TEXTURE_UNITS_ARB                      : constant := 16#0000_84E2#;

  ------------------------------------------------------------------------------
  --  GL_MESA_trace
  ------------------------------------------------------------------------------
  GL_MESA_TRACE                                 : constant := 1;
  GL_TRACE_ALL_BITS_MESA                        : constant := 16#0000_FFFF#;
  GL_TRACE_OPERATIONS_BIT_MESA                  : constant := 16#0001#;
  GL_TRACE_PRIMITIVES_BIT_MESA                  : constant := 16#0002#;
  GL_TRACE_ARRAYS_BIT_MESA                      : constant := 16#0004#;
  GL_TRACE_TEXTURES_BIT_MESA                    : constant := 16#0008#;
  GL_TRACE_PIXELS_BIT_MESA                      : constant := 16#0010#;
  GL_TRACE_ERRORS_BIT_MESA                      : constant := 16#0020#;
  GL_TRACE_MASK_MESA                            : constant := 16#0000_8755#;
  GL_TRACE_NAME_MESA                            : constant := 16#0000_8756#;

  ------------------------------------------------------------------------------
  --  GL_MESA_packed_depth_stencil
  ------------------------------------------------------------------------------
  GL_MESA_PACKED_DEPTH_STENCIL                  : constant := 1;
  GL_DEPTH_STENCIL_MESA                         : constant := 16#0000_8750#;
  GL_UNSIGNED_INT_24_8_MESA                     : constant := 16#0000_8751#;
  GL_UNSIGNED_INT_8_24_REV_MESA                 : constant := 16#0000_8752#;
  GL_UNSIGNED_SHORT_15_1_MESA                   : constant := 16#0000_8753#;
  GL_UNSIGNED_SHORT_1_15_REV_MESA               : constant := 16#0000_8754#;

  ------------------------------------------------------------------------------
  --  GL_MESA_texture_ycbcr
  ------------------------------------------------------------------------------
  GL_MESA_YCBCR_TEXTURE                         : constant := 1;
  GL_YCBCR_MESA                                 : constant := 16#0000_8757#;
  GL_UNSIGNED_SHORT_8_8_MESA                    : constant := 16#0000_85BA#;
  GL_UNSIGNED_SHORT_8_8_REV_MESA                : constant := 16#0000_85BB#;

  ------------------------------------------------------------------------------
  --  GL_MESA_pack_invert
  ------------------------------------------------------------------------------
  GL_MESA_PACK_INVERT                           : constant := 1;
  GL_PACK_INVERT_MESA                           : constant := 16#0000_8758#;

  ------------------------------------------------------------------------------
  --  GL_DEPTH_BOUNDS
  ------------------------------------------------------------------------------
  GL_DEPTH_BOUNDS_TEST_EXT                      : constant := 16#0000_8890#;
  GL_DEPTH_BOUNDS_EXT                           : constant := 16#0000_8891#;

  ------------------------------------------------------------------------------
  --  GL_ARB_occlusion_query
  ------------------------------------------------------------------------------
  GL_ARB_OCCLUSION_QUERY                        : constant := 1;

  ------------------------------------------------------------------------------
  --  GL_ARB
  ------------------------------------------------------------------------------
  GL_SAMPLES_PASSED_ARB                         : constant := 16#0000_8914#;
  GL_QUERY_COUNTER_BITS_ARB                     : constant := 16#0000_8864#;
  GL_CURRENT_QUERY_ARB                          : constant := 16#0000_8865#;
  GL_QUERY_RESULT_ARB                           : constant := 16#0000_8866#;
  GL_QUERY_RESULT_AVAILABLE_ARB                 : constant := 16#0000_8867#;

  ------------------------------------------------------------------------------
  
  procedure glClearIndex(c : in GLfloat);
  procedure glClearColor(Red, Green, Blue, Alpha : in GLclampf);
  procedure glClear(Mask : in GLbitfield);
  procedure glIndexMask(Mask : in GLuint);
  procedure glColorMask(Red, Green, Blue, Alpha : in GLboolean);
  procedure glAlphaFunc(Func : in GLenum; Ref : in GLclampf);
  procedure glBlendFunc(SFactor : in GLenum; DFactor : in GLenum);
  procedure glLogicOp(OpCode : in GLenum);
  procedure glCullFace(Mode : in GLenum);
  procedure glFrontFace(Mode : in GLenum);
  procedure glPointSize(Size : in GLfloat);
  procedure glLineWidth(Width : in GLfloat);
  procedure glLineStipple(Factor : in GLint; Pattern : in GLushort);
  procedure glPolygonMode(Face : in GLenum; Mode : in GLenum);
  procedure glPolygonOffset(Factor : in GLfloat; Units : in GLfloat);
  procedure glPolygonStipple(Mask : in GLubytePtr);
  procedure glGetPolygonStipple(Mask : in GLubytePtr);
  procedure glEdgeFlag(Flag : in GLboolean);
  procedure glEdgeFlagv(Flag : in GLbooleanPtr);
  procedure glScissor(X : in GLint; Y : in GLint; Width : in GLsizei; Height : in GLsizei);
  procedure glClipPlane(Plane : in GLenum; Equation : in GLdoublePtr);
  procedure glGetClipPlane(Plane : in GLenum; Equation : in GLdoublePtr);
  procedure glDrawBuffer(Mode : in GLenum);
  procedure glReadBuffer(Mode : in GLenum);
  procedure glEnable(Cap : in GLenum);
  procedure glDisable(Cap : in GLenum);
  function glIsEnabled(Cap : in GLenum) return GLboolean;
  procedure glEnableClientState(Cap : in GLenum);
  procedure glDisableClientState(Cap : in GLenum);
  procedure glGetBooleanv(PName : in GLenum; Params : in GLbooleanPtr);
  procedure glGetDoublev(PName : in GLenum; Params : in GLdoublePtr);
  procedure glGetFloatv(PName : in GLenum; Params : in GLfloatPtr);
  procedure glGetIntegerv(PName : in GLenum; Params : in GLintPtr);
  procedure glPushAttrib(Mask : in GLbitfield);
  procedure glPopAttrib;
  procedure glPushClientAttrib(Mask : in GLbitfield);
  procedure glPopClientAttrib;
  function glRenderMode(Mode : in GLenum) return GLint;
  function glGetError return GLenum;
  function glGetString(Name : in GLenum) return GLubytePtr;
  procedure glFinish;
  procedure glFlush;
  procedure glHint(Target : in GLenum; Mode : in GLenum);
  procedure glClearDepth(Depth : in GLclampd);
  procedure glDepthFunc(Func : in GLenum);
  procedure glDepthMask(Flag : in GLboolean);
  procedure glDepthRange(Near_Val : in GLclampd; Far_Val : in GLclampd);
  procedure glDepthBoundsEXT(ZMin : in GLclampd; ZMax : in GLclampd);
  procedure glClearAccum(Red, Green, Blue, Alpha : in GLfloat);
  procedure glAccum(Op : in GLenum; Value : in GLfloat);

  procedure glMatrixMode(Mode : in MatrixType);
  procedure glOrtho(Left, Right, Bottom, Top, Near_Val, Far_Val : in GLdouble);
  procedure glFrustum(Left, Right, Bottom, Top, Near_Val, Far_Val : in GLdouble);
  procedure glViewport(X, Y : in GLint; Width, Height : in GLsizei);
  procedure glPushMatrix;
  procedure glPopMatrix;
  procedure glLoadIdentity;
  procedure glLoadMatrixd(M : in GLdoublePtr);
  procedure glLoadMatrixf(M : in GLfloatPtr);
  procedure glMultMatrixd(M : in GLdoublePtr);
  procedure glMultMatrixf(M : in GLfloatPtr);
  procedure glRotated(Angle, X, Y, Z : in GLdouble);
  procedure glRotatef(Angle, X, Y, Z : in GLfloat);
  procedure glScaled(X, Y, Z : in GLdouble);
  procedure glScalef(X, Y, Z : in GLfloat);
  procedure glTranslated(X, Y, Z : in GLdouble);
  procedure glTranslatef(X, Y, Z : in GLfloat);

  function glIsList(list : in GLuint) return GLboolean;
  procedure glDeleteLists(List : in GLuint; C_Range : in GLsizei);
  function glGenLists(C_Range : in GLsizei) return GLuint;
  procedure glNewList(List : in GLuint; Mode : in GLenum);
  procedure glEndList;
  procedure glCallList(List : in GLuint);
  procedure glCallLists(N : in GLsizei; C_Type : in GLenum; Lists : in GLpointer);
  procedure glListBase(Base : in GLuint);

  procedure glBegin(Mode : in PrimitiveType);
  procedure glEnd;

  procedure glVertex2d(X, Y : in GLdouble);
  procedure glVertex2f(X, Y : in GLfloat);
  procedure glVertex2i(X, Y : in GLint);
  procedure glVertex2s(X, Y : in GLshort);
  procedure glVertex3d(X, Y, Z : in GLdouble);
  procedure glVertex3f(X, Y, Z : in GLfloat);
  procedure glVertex3i(X, Y, Z : in GLint);
  procedure glVertex3s(X, Y, Z : in GLshort);
  procedure glVertex4d(X, Y, Z, W : in GLdouble);
  procedure glVertex4f(X, Y, Z, W : in GLfloat);
  procedure glVertex4i(X, Y, Z, W : in GLint);
  procedure glVertex4s(X, Y, Z, W : in GLshort);
  procedure glVertex2dv(V : in GLdoublePtr);
  procedure glVertex2fv(V : in GLfloatPtr);
  procedure glVertex2iv(V : in GLintPtr);
  procedure glVertex2sv(V : in GLshortPtr);
  procedure glVertex3dv(V : in GLdoublePtr);
  procedure glVertex3fv(V : in GLfloatPtr);
  procedure glVertex3iv(V : in GLintPtr);
  procedure glVertex3sv(V : in GLshortPtr);
  procedure glVertex4dv(V : in GLdoublePtr);
  procedure glVertex4fv(V : in GLfloatPtr);
  procedure glVertex4iv(V : in GLintPtr);
  procedure glVertex4sv(V : in GLshortPtr);

  procedure glNormal3b(NX, NY, NZ : in GLbyte);
  procedure glNormal3d(NX, NY, NZ : in GLdouble);
  procedure glNormal3f(NX, NY, NZ : in GLfloat);
  procedure glNormal3i(NX, NY, NZ : in GLint);
  procedure glNormal3s(NX, NY, NZ : in GLshort);
  procedure glNormal3bv(V : in GLbytePtr);
  procedure glNormal3dv(V : in GLdoublePtr);
  procedure glNormal3fv(V : in GLfloatPtr);
  procedure glNormal3iv(V : in GLintPtr);
  procedure glNormal3sv(V : in GLshortPtr);

  procedure glIndexd(C : in GLdouble);
  procedure glIndexf(C : in GLfloat);
  procedure glIndexi(C : in GLint);
  procedure glIndexs(C : in GLshort);
  procedure glIndexub(C : in GLubyte);
  procedure glIndexdv(C : in GLdoublePtr);
  procedure glIndexfv(C : in GLfloatPtr);
  procedure glIndexiv(C : in GLintPtr);
  procedure glIndexsv(C : in GLshortPtr);
  procedure glIndexubv(C : in GLubytePtr);

  procedure glColor3b(Red, Green, Blue : in GLbyte);
  procedure glColor3d(Red, Green, Blue : in GLdouble);
  procedure glColor3f(Red, Green, Blue : in GLfloat);
  procedure glColor3i(Red, Green, Blue : in GLint);
  procedure glColor3s(Red, Green, Blue : in GLshort);
  procedure glColor3ub(Red, Green, Blue : in GLubyte);
  procedure glColor3ui(Red, Green, Blue : in GLuint);
  procedure glColor3us(Red, Green, Blue : in GLushort);
  procedure glColor4b(Red, Green, Blue, Alpha : in GLbyte);
  procedure glColor4d(Red, Green, Blue, Alpha : in GLdouble);
  procedure glColor4f(Red, Green, Blue, Alpha : in GLfloat);
  procedure glColor4i(Red, Green, Blue, Alpha : in GLint);
  procedure glColor4s(Red, Green, Blue, Alpha : in GLshort);
  procedure glColor4ub(Red, Green, Blue, Alpha : in GLubyte);
  procedure glColor4ui(Red, Green, Blue, Alpha : in GLuint);
  procedure glColor4us(Red, Green, Blue, Alpha : in GLushort);
  procedure glColor3bv(V : in GLbytePtr);
  procedure glColor3dv(V : in GLdoublePtr);
  procedure glColor3fv(V : in GLfloatPtr);
  procedure glColor3iv(V : in GLintPtr);
  procedure glColor3sv(V : in GLshortPtr);
  procedure glColor3ubv(V : in GLubytePtr);
  procedure glColor3uiv(V : in GLuintPtr);
  procedure glColor3usv(V : in GLushortPtr);
  procedure glColor4bv(V : in GLbytePtr);
  procedure glColor4dv(V : in GLdoublePtr);
  procedure glColor4fv(V : in GLfloatPtr);
  procedure glColor4iv(V : in GLintPtr);
  procedure glColor4sv(V : in GLshortPtr);
  procedure glColor4ubv(V : in GLubytePtr);
  procedure glColor4uiv(V : in GLuintPtr);
  procedure glColor4usv(V : in GLushortPtr);

  procedure glTexCoord1d(S : in GLdouble);
  procedure glTexCoord1f(S : in GLfloat);
  procedure glTexCoord1i(S : in GLint);
  procedure glTexCoord1s(S : in GLshort);
  procedure glTexCoord2d(S, T : in GLdouble);
  procedure glTexCoord2f(S, T : in GLfloat);
  procedure glTexCoord2i(S, T : in GLint);
  procedure glTexCoord2s(S, T : in GLshort);
  procedure glTexCoord3d(S, T, R : in GLdouble);
  procedure glTexCoord3f(S, T, R : in GLfloat);
  procedure glTexCoord3i(S, T, R : in GLint);
  procedure glTexCoord3s(S, T, R : in GLshort);
  procedure glTexCoord4d(S, T, R, Q : in GLdouble);
  procedure glTexCoord4f(S, T, R, Q : in GLfloat);
  procedure glTexCoord4i(S, T, R, Q : in GLint);
  procedure glTexCoord4s(S, T, R, Q : in GLshort);

  procedure glTexCoord1dv(V : in GLdoublePtr);
  procedure glTexCoord1fv(V : in GLfloatPtr);
  procedure glTexCoord1iv(V : in GLintPtr);
  procedure glTexCoord1sv(V : in GLshortPtr);
  procedure glTexCoord2dv(V : in GLdoublePtr);
  procedure glTexCoord2fv(V : in GLfloatPtr);
  procedure glTexCoord2iv(V : in GLintPtr);
  procedure glTexCoord2sv(V : in GLshortPtr);
  procedure glTexCoord3dv(V : in GLdoublePtr);
  procedure glTexCoord3fv(V : in GLfloatPtr);
  procedure glTexCoord3iv(V : in GLintPtr);
  procedure glTexCoord3sv(V : in GLshortPtr);
  procedure glTexCoord4dv(V : in GLdoublePtr);
  procedure glTexCoord4fv(V : in GLfloatPtr);
  procedure glTexCoord4iv(V : in GLintPtr);
  procedure glTexCoord4sv(V : in GLshortPtr);

  procedure glRasterPos2d(X, Y : in GLdouble);
  procedure glRasterPos2f(X, Y : in GLfloat);
  procedure glRasterPos2i(X, Y : in GLint);
  procedure glRasterPos2s(X, Y : in GLshort);
  procedure glRasterPos3d(X, Y, Z : in GLdouble);
  procedure glRasterPos3f(X, Y, Z : in GLfloat);
  procedure glRasterPos3i(X, Y, Z : in GLint);
  procedure glRasterPos3s(X, Y, Z : in GLshort);
  procedure glRasterPos4d(X, Y, Z, W : in GLdouble);
  procedure glRasterPos4f(X, Y, Z, W : in GLfloat);
  procedure glRasterPos4i(X, Y, Z, W : in GLint);
  procedure glRasterPos4s(X, Y, Z, W : in GLshort);
  procedure glRasterPos2dv(V : in GLdoublePtr);
  procedure glRasterPos2fv(V : in GLfloatPtr);
  procedure glRasterPos2iv(V : in GLintPtr);
  procedure glRasterPos2sv(V : in GLshortPtr);
  procedure glRasterPos3dv(V : in GLdoublePtr);
  procedure glRasterPos3fv(V : in GLfloatPtr);
  procedure glRasterPos3iv(V : in GLintPtr);
  procedure glRasterPos3sv(V : in GLshortPtr);
  procedure glRasterPos4dv(V : in GLdoublePtr);
  procedure glRasterPos4fv(V : in GLfloatPtr);
  procedure glRasterPos4iv(V : in GLintPtr);
  procedure glRasterPos4sv(V : in GLshortPtr);

  procedure glRectd(X1, Y1, X2, Y2 : in GLdouble);
  procedure glRectf(X1, Y1, X2, Y2 : in GLfloat);
  procedure glRecti(X1, Y1, X2, Y2 : in GLint);
  procedure glRects(X1, Y1, X2, Y2 : in GLshort);
  procedure glRectdv(V1, V2 : in GLdoublePtr);
  procedure glRectfv(V1, V2 : in GLfloatPtr);
  procedure glRectiv(V1, V2 : in GLintPtr);
  procedure glRectsv(V1, V2 : in GLshortPtr);

  procedure glVertexPointer(Size : in GLint; C_Type : in GLenum; Stride : in GLsizei; Ptr : in GLpointer);
  procedure glNormalPointer(C_Type : in GLenum; Stride : in GLsizei; Ptr : in GLpointer);
  procedure glColorPointer(Size : in GLint; C_Type : in GLenum; Stride : in GLsizei; Ptr : in GLpointer);
  procedure glIndexPointer(C_Type : in GLenum; Stride : in GLsizei; Ptr : in GLpointer);
  procedure glTexCoordPointer(Size : in GLint; C_Type : in GLenum; Stride : in GLsizei; Ptr : in GLpointer);
  procedure glEdgeFlagPointer(Stride : in GLsizei; Ptr : in GLpointer);
  procedure glGetPointerv(PName : in GLenum; Params : in GLpointer); -- Don't know about this parameter!

  procedure glArrayElement(I : in GLint);
  procedure glDrawArrays(Mode : in PrimitiveType; First : in GLint; Count : in GLsizei);
  procedure glDrawElements(Mode : in PrimitiveType; Count : in GLsizei; C_Type : in GLenum; Indices : in GLpointer);
  procedure glInterleavedArrays(Format : in GLenum; Stride : in GLsizei; Pointer : in GLpointer);

  procedure glShadeModel(Mode : in GLenum);

  procedure glLightf(Light : in GLenum; PName : in GLenum; Param : in GLfloat);
  procedure glLighti(Light : in GLenum; PName : in GLenum; Param : in GLint);
  procedure glLightfv(Light : in GLenum; PName : in GLenum; Params : in GLfloatPtr);
  procedure glLightiv(Light : in GLenum; PName : in GLenum; Params : in GLintPtr);
  procedure glGetLightfv(Light : in GLenum; PName : in GLenum; Params : in GLfloatPtr);
  procedure glGetLightiv(Light : in GLenum; PName : in GLenum; Params : in GLintPtr);
  procedure glLightModelf(PName : in GLenum; Param : in GLfloat);
  procedure glLightModeli(PName : in GLenum; Param : in GLint);
  procedure glLightModelfv(PName : in GLenum; Params : in GLfloatPtr);
  procedure glLightModeliv(PName : in GLenum; Params : in GLintPtr);

  procedure glMaterialf(Face : in GLenum; PName : in GLenum; Param : in GLfloat);
  procedure glMateriali(Face : in GLenum; PName : in GLenum; Param : in GLint);
  procedure glMaterialfv(Face : in GLenum; PName : in GLenum; Params : in GLfloatPtr);
  procedure glMaterialiv(Face : in GLenum; PName : in GLenum; Params : in GLintPtr);
  procedure glGetMaterialfv(Face : in GLenum; PName : in GLenum; Params : in GLfloatPtr);
  procedure glGetMaterialiv(Face : in GLenum; PName : in GLenum; Params : in GLintPtr);
  procedure glColorMaterial(Face : in GLenum; Mode : in GLenum);

  procedure glPixelZoom(XFactor : in GLfloat; YFactor : in GLfloat);
  procedure glPixelStoref(PName : in GLenum; Param : in GLfloat);
  procedure glPixelStorei(PName : in GLenum; Param : in GLint);
  procedure glPixelTransferf(PName : in GLenum; Param : in GLfloat);
  procedure glPixelTransferi(PName : in GLenum; Param : in GLint);
  procedure glPixelMapfv(Map : in GLenum; MapSize : in GLint; Values : in GLfloatPtr);
  procedure glPixelMapuiv(Map : in GLenum; MapSize : in GLint; Values : in GLuintPtr);
  procedure glPixelMapusv(Map : in GLenum; MapSize : in GLint; Values : in GLushortPtr);
  procedure glGetPixelMapfv(Map : in GLenum; Values : in GLfloatPtr);
  procedure glGetPixelMapuiv(Map : in GLenum; Values : in GLuintPtr);
  procedure glGetPixelMapusv(Map : in GLenum; Values : in GLushortPtr);

  procedure glBitmap(Width, Height : in GLsizei; XOrig, YOrig, XMove, YMove : in GLfloat; Bitmap : in GLubytePtr);

  procedure glReadPixels(X, Y : in GLint; Width, Height : in GLsizei; Format :in GLenum; C_Type : in GLenum; Pixels : in GLpointer);
  procedure glDrawPixels(Width, Height : in GLsizei; Format : GLenum; C_Type : GLenum; Pixels : in GLpointer);
  procedure glCopyPixels(X, Y : in GLint; Width, Height : in GLsizei; C_Type : in GLenum);

  procedure glStencilFunc(Func : in GLenum; Ref : in GLint; Mask : in GLuint);
  procedure glStencilMask(Mask : in GLuint);
  procedure glStencilOp(Fail : in GLenum; ZFail : in GLenum; ZPass : in GLenum);
  procedure glClearStencil(S : in GLint);

  procedure glTexGend(Coord : in GLenum; PName : in GLenum; Param : in GLdouble);
  procedure glTexGenf(Coord : in GLenum; PName : in GLenum; Param : in GLfloat);
  procedure glTexGeni(Coord : in GLenum; PName : in GLenum; Param : in GLint);
  procedure glTexGendv(Coord : in GLenum; PName : in GLenum; Params : in GLdoublePtr);
  procedure glTexGenfv(Coord : in GLenum; PName : in GLenum; Params : in GLfloatPtr);
  procedure glTexGeniv(Coord : in GLenum; PName : in GLenum; Params : in GLintPtr);
  procedure glGetTexGendv(Coord : in GLenum; PName : in GLenum; Params : in GLdoublePtr);
  procedure glGetTexGenfv(Coord : in GLenum; PName : in GLenum; Params : in GLfloatPtr);
  procedure glGetTexGeniv(Coord : in GLenum; PName : in GLenum; Params : in GLintPtr);
  procedure glTexEnvf(Target : in GLenum; PName : in GLenum; Param : in GLfloat);
  procedure glTexEnvi(Target : in GLenum; PName : in GLenum; Param : in GLint);
  procedure glTexEnvfv(Target : in GLenum; PName : in GLenum; Params : in GLfloatPtr);
  procedure glTexEnviv(Target : in GLenum; PName : in GLenum; Params : in GLintPtr);
  procedure glGetTexEnvfv(Target : in GLenum; PName : in GLenum; Params : in GLfloatPtr);
  procedure glGetTexEnviv(Target : in GLenum; PName : in GLenum; Params : in GLintPtr);
  procedure glTexParameterf(Target : in GLenum; PName : in GLenum; Param : in GLfloat);
  procedure glTexParameteri(Target : in GLenum; PName : in GLenum; Param : in GLint);
  procedure glTexParameterfv(Target : in GLenum; PName : in GLenum; Params : in GLfloatPtr);
  procedure glTexParameteriv(Target : in GLenum; PName : in GLenum; Params : in GLintPtr);
  procedure glGetTexParameterfv(Target : in GLenum; PName : in GLenum; Params : in GLfloatPtr);
  procedure glGetTexParameteriv(Target : in GLenum; PName : in GLenum; Params : in GLintPtr);
  procedure glGetTexLevelParameterfv(Target : in GLenum; Level : in GLint; PName : in GLenum; Params : in GLfloatPtr);
  procedure glGetTexLevelParameteriv(Target : in GLenum; Level : in GLint; PName : in GLenum; Params : in GLintPtr);
  procedure glTexImage1D(Target : in GLenum; Level, InternalFormat : in GLint; Width : in GLsizei; Border : in GLint; Format : in GLenum; C_Type : in GLenum; Pixels : in GLpointer);
  procedure glTexImage2D(Target : in GLenum; Level, InternalFormat : in GLint; Width, Height : in GLsizei; Border : in GLint; Format : in GLenum; C_Type : in GLenum; Pixels : in GLpointer);
  procedure glGetTexImage(Target : in GLenum; Level : in GLint; Format : in GLenum; C_Type : in GLenum; Pixels : in GLpointer);
  procedure glGenTextures(N : in GLsizei; Textures : in GLuintPtr);
  procedure glDeleteTextures(N : in GLsizei; Textures : in GLuintPtr);
  procedure glBindTexture(Target : in GLenum; Texture : in GLuint);
  procedure glPrioritizeTextures(N : in GLsizei; Textures : in GLuintPtr; Priorities : in GLclampfPtr);
  function glAreTexturesResident(N : in GLsizei; Textures : in GLuintPtr; Residences : in GLbooleanPtr) return GLboolean;
  function glIsTexture(Texture : in GLuint) return GLboolean;
  procedure glTexSubImage1D(Target : in GLenum; Level, XOffset : in GLint; Width : in GLsizei; Format : in GLenum; C_Type : in GLenum; Pixels : in GLpointer);
  procedure glTexSubImage2D(Target : in GLenum; Level, XOffset, YOffset : in GLint; Width, Height : in GLsizei; Format : in GLenum; C_Type : in GLenum; Pixels : in GLpointer);
  procedure glCopyTexImage1D(Target : in GLenum; Level : in GLint; Internalformat : in GLenum; X, Y : in GLint; Width : in GLsizei; Border : in GLint);
  procedure glCopyTexImage2D(Target : in GLenum; Level : in GLint; Internalformat : in GLenum; X, Y : in GLint; Width : in GLsizei; Height : in GLsizei; Border : in GLint);
  procedure glCopyTexSubImage1D(Target : in GLenum; Level, XOffset, X, Y : in GLint; Width : in GLsizei);
  procedure glCopyTexSubImage2D(Target : in GLenum; Level, XOffset, YOffset, X, Y : in GLint; Width, Height : in GLsizei);

  procedure glMap1d(Target : in GLenum; U1, U2 : in GLdouble; Stride, Order : in GLint; Points : in GLdoublePtr);
  procedure glMap1f(Target : in GLenum; U1, U2 : in GLfloat; Stride, Order : in GLint; Points : in GLfloatPtr);
  procedure glMap2d(Target : in GLenum; U1, U2 : in GLdouble; UStride, UOrder : in GLint; V1, V2 : in GLdouble; VStride, VOrder : in GLint; Points : in GLdoublePtr);
  procedure glMap2f(Target : in GLenum; U1, U2 : in GLfloat; UStride, UOrder : in GLint; V1, V2 : in GLfloat; VStride, VOrder : in GLint; Points : in GLfloatPtr);
  procedure glGetMapdv(Target : in GLenum; Query : in GLenum; V : in GLdoublePtr);
  procedure glGetMapfv(Target : in GLenum; Query : in GLenum; V : in GLfloatPtr);
  procedure glGetMapiv(Target : in GLenum; Query : in GLenum; V : in GLintPtr);

  procedure glEvalCoord1d(U : in GLdouble);
  procedure glEvalCoord1f(U : in GLfloat);
  procedure glEvalCoord1dv(U : in GLdoublePtr);
  procedure glEvalCoord1fv(U : in GLfloatPtr);
  procedure glEvalCoord2d(U, V : in GLdouble);
  procedure glEvalCoord2f(U, V : in GLfloat);
  procedure glEvalCoord2dv(U : in GLdoublePtr);
  procedure glEvalCoord2fv(U : in GLfloatPtr);

  procedure glMapGrid1d(UN : in GLint; U1, U2 : in GLdouble);
  procedure glMapGrid1f(UN : in GLint; U1, U2 : in GLfloat);
  procedure glMapGrid2d(UN : in GLint; U1, U2 : in GLdouble; VN : in GLint; V1, V2 : in GLdouble);
  procedure glMapGrid2f(UN : in GLint; U1, U2 : in GLfloat; VN : in GLint; V1, V2 : in GLfloat);

  procedure glEvalPoint1(I : in GLint);
  procedure glEvalPoint2(I, J : in GLint);
  procedure glEvalMesh1(Mode : in GLenum; I1, i2 : in GLint);
  procedure glEvalMesh2(Mode : in GLenum; I1, I2, J1, J2 : in GLint);
  procedure glFogf(PName : in GLenum; Param : in GLfloat);
  procedure glFogi(PName : in GLenum; Param : in GLint);
  procedure glFogfv(PName : in GLenum; Params : in GLfloatPtr);
  procedure glFogiv(PName : in GLenum; Params : in GLintPtr);

  procedure glFeedbackBuffer(Size : in GLsizei; C_Type : in GLenum; Buffer : in GLfloatPtr);

  procedure glPassThrough(Token : in GLfloat);

  procedure glSelectBuffer(Size : in GLsizei; Buffer : in GLuintPtr);

  procedure glInitNames;
  procedure glLoadName(Name : in GLuint);
  procedure glPushName(Name : in GLuint);
  procedure glPopName;

  procedure glDrawRangeElements(Mode : in PrimitiveType; Start, C_End : in GLuint; Count : in GLsizei; C_Type : in GLenum; Indices : in GLpointer);

  procedure glTexImage3D(Target : in GLenum; Level, InternalFormat : in GLint; Width, Height, Depth : in GLsizei; Border : in GLint; Format, C_Type : in GLenum; Pixels : in GLpointer);
  procedure glTexSubImage3D(Target : in GLenum; Level, XOffset, YOffset, ZOffset : in GLint; Width : in GLsizei; Height, Depth : in GLsizei; Format, C_Type : in GLenum; Pixels : in GLpointer);
  procedure glCopyTexSubImage3D(Target : in GLenum; Level, XOffset, YOffset, ZOffset, X, Y : in GLint; Width, Height : in GLsizei);

  procedure glColorTable(Target : in GLenum; Internalformat : in GLenum; Width : in GLsizei; Format : in GLenum; C_Type : in GLenum; Table : in GLpointer);
  procedure glColorSubTable(Target : in GLenum; Start, Count : in GLsizei; Format : in GLenum; C_Type : in GLenum; Data : in GLpointer);
  procedure glColorTableParameteriv(Target : in GLenum; PName : in GLenum; Params : in GLintPtr);
  procedure glColorTableParameterfv(Target : in GLenum; PName : in GLenum; Params : in GLfloatPtr);
  procedure glCopyColorSubTable(Target : in GLenum; Start : in GLsizei; X, Y : in GLint; Width : GLsizei);
  procedure glCopyColorTable(Target : in GLenum; Internalformat : GLenum; X, Y : in GLint; width : in GLsizei);
  procedure glGetColorTable(Target : in GLenum; Format : in GLenum; C_Type : in GLenum; Table : in GLpointer);
  procedure glGetColorTableParameterfv(Target : in GLenum; PName : in GLenum; Params : in GLfloatPtr);
  procedure glGetColorTableParameteriv(Target : in GLenum; PName : in GLenum; Params : in GLintPtr);

  procedure glBlendEquation(Mode : in GLenum);
  procedure glBlendColor(Red, Green, Blue, Alpha : in GLclampf);

  procedure glHistogram(Target : in GLenum; Width : in GLsizei; Internalformat : in GLenum; Sink : in GLboolean);
  procedure glResetHistogram(Target : in GLenum);
  procedure glGetHistogram(Target : in GLenum; Reset : in GLboolean; Format : in GLenum; C_Type : in GLenum; Values : in GLpointer);
  procedure glGetHistogramParameterfv(Target : in GLenum; PName : in GLenum; Params : in GLfloatPtr);
  procedure glGetHistogramParameteriv(Target : in GLenum; PName : in GLenum; Params : in GLintPtr);

  procedure glMinmax(Target : in GLenum; Internalformat : in GLenum; Sink : in GLboolean);
  procedure glResetMinmax(Target : in GLenum);
  procedure glGetMinmax(Target : in GLenum; Reset : in GLboolean; Format : in GLenum; Types : in GLenum; Values : in GLpointer);
  procedure glGetMinmaxParameterfv(Target : in GLenum; PName : in GLenum; Params : in GLfloatPtr);
  procedure glGetMinmaxParameteriv(Target : in GLenum; PName : in GLenum; Params : in GLintPtr);

  procedure glConvolutionFilter1D(Target : in GLenum; Internalformat : in GLenum; Width : in GLsizei; Format : in GLenum; C_Type : in GLenum; Image : in GLpointer);
  procedure glConvolutionFilter2D(Target : in GLenum; Internalformat : in GLenum; Width, Height : in GLsizei; Format : in GLenum; C_Type : in GLenum; Image : in GLpointer);
  procedure glConvolutionParameterf(Target : in GLenum; PName : in GLenum; Params : in GLfloat);
  procedure glConvolutionParameterfv(Target : in GLenum; PName : in GLenum; Params : in GLfloatPtr);
  procedure glConvolutionParameteri(Target : in GLenum; PName : in GLenum; Params : in GLint);
  procedure glConvolutionParameteriv(Target : in GLenum; PName : in GLenum; Params : in GLintPtr);
  procedure glCopyConvolutionFilter1D(Target : in GLenum; Internalformat : in GLenum; X, Y : in GLint; Width : in GLsizei);
  procedure glCopyConvolutionFilter2D(Target : in GLenum; Internalformat : in GLenum; X, Y : in GLint; Width, Height : in GLsizei);
  procedure glGetConvolutionFilter(Target : in GLenum; Format : in GLenum; C_Type : in GLenum; Image : in GLpointer);
  procedure glGetConvolutionParameterfv(Target : in GLenum; PName : in GLenum; Params : in GLfloatPtr);
  procedure glGetConvolutionParameteriv(Target : in GLenum; PName : in GLenum; Params : in GLintPtr);

  procedure glSeparableFilter2D(Target : in GLenum; Internalformat : in GLenum; Width, Height : in GLsizei; Format : in GLenum; C_Type : in GLenum; Row, Column : in GLpointer);
  procedure glGetSeparableFilter(Target : in GLenum; Format : in GLenum; C_type : in GLenum; Row, Column, Span : in GLpointer);

  procedure glActiveTexture(Texture : in GLenum);
  procedure glClientActiveTexture(Texture : in GLenum);

  procedure glCompressedTexImage1D(Target : in GLenum; Level : in GLint; Internalformat : in GLenum; Width : in GLsizei; Border : in GLint; ImageSize : in GLsizei; Data : in GLpointer);
  procedure glCompressedTexImage2D(Target : in GLenum; Level : in GLint; Internalformat : in GLenum; Width, Height : in GLsizei; Border : in GLint; ImageSize : in GLsizei; Data : in GLpointer);
  procedure glCompressedTexImage3D(Target : in GLenum; Level : in GLint; Internalformat : in GLenum; Width, Height, Depth : in GLsizei; Border : in GLint; ImageSize : in GLsizei; Data : in GLpointer);
  procedure glCompressedTexSubImage1D(Target : in GLenum; Level, XOffset : in GLint; Width : in GLsizei; Format : in GLenum; ImageSize : in GLsizei; Data : in GLpointer);
  procedure glCompressedTexSubImage2D(Target : in GLenum; Level, XOffset, YOffset : in GLint; Width, Height : in GLsizei; Format : in GLenum; ImageSize : in GLsizei; Data : in GLpointer);
  procedure glCompressedTexSubImage3D(Target : in GLenum; Level, XOffset, YOffset, ZOffset : in GLint; Width, Height, Depth : in GLsizei; Format : in GLenum; ImageSize : in GLsizei; Data : in GLpointer);
  procedure glGetCompressedTexImage(Target : in GLenum; LOD : in GLint; Img : in GLpointer);

  procedure glMultiTexCoord1d(Target : in GLenum; S : in GLdouble);
  procedure glMultiTexCoord1dv(Target : in GLenum; V : in GLdoublePtr);
  procedure glMultiTexCoord1f(Target : in GLenum; S : in GLfloat);
  procedure glMultiTexCoord1fv(Target : in GLenum; V : in GLfloatPtr);
  procedure glMultiTexCoord1i(Target : in GLenum; S : in GLint);
  procedure glMultiTexCoord1iv(Target : in GLenum; V : in GLintPtr);
  procedure glMultiTexCoord1s(Target : in GLenum; S : in GLshort);
  procedure glMultiTexCoord1sv(Target : in GLenum; V : in GLshortPtr);
  procedure glMultiTexCoord2d(Target : in GLenum; S, T : in GLdouble);
  procedure glMultiTexCoord2dv(Target : in GLenum; V : in GLdoublePtr);
  procedure glMultiTexCoord2f(Target : in GLenum; S, T : in GLfloat);
  procedure glMultiTexCoord2fv(Target : in GLenum; V : in GLfloatPtr);
  procedure glMultiTexCoord2i(Target : in GLenum; S, T : in GLint);
  procedure glMultiTexCoord2iv(Target : in GLenum; V : in GLintPtr);
  procedure glMultiTexCoord2s(Target : in GLenum; S, T : in GLshort);
  procedure glMultiTexCoord2sv(Target : in GLenum; V : in GLshortPtr);
  procedure glMultiTexCoord3d(Target : in GLenum; S, T, R : in GLdouble);
  procedure glMultiTexCoord3dv(Target : in GLenum; V : in GLdoublePtr);
  procedure glMultiTexCoord3f(Target : in GLenum; S, T, R : in GLfloat);
  procedure glMultiTexCoord3fv(Target : in GLenum; V : in GLfloatPtr);
  procedure glMultiTexCoord3i(Target : in GLenum; S, T, R : in GLint);
  procedure glMultiTexCoord3iv(Target : in GLenum; V : in GLintPtr);
  procedure glMultiTexCoord3s(Target : in GLenum; S, T, R : in GLshort);
  procedure glMultiTexCoord3sv(Target : in GLenum; V : in GLshortPtr);
  procedure glMultiTexCoord4d(Target : in GLenum; S, T, R, Q : in GLdouble);
  procedure glMultiTexCoord4dv(target : GLenum; V : in GLdoublePtr);
  procedure glMultiTexCoord4f(Target : in GLenum; S, T, R, Q : in GLfloat);
  procedure glMultiTexCoord4fv(Target : in GLenum; V : in GLfloatPtr);
  procedure glMultiTexCoord4i(target : in GLenum; S, T, R, Q : in GLint);
  procedure glMultiTexCoord4iv(Target : in GLenum; V : in GLintPtr);
  procedure glMultiTexCoord4s(Target : in GLenum; S, T, R, Q : in GLshort);
  procedure glMultiTexCoord4sv(Target : in GLenum; V : in GLshortPtr);

  procedure glLoadTransposeMatrixd(M : in GLdoublePtr);
  procedure glLoadTransposeMatrixf(M : in GLfloatPtr);
  procedure glMultTransposeMatrixd(M : in GLdoublePtr);
  procedure glMultTransposeMatrixf(M : in GLfloatPtr);

  procedure glSampleCoverage(Value : in GLclampf; Invert : in GLboolean);

  procedure glActiveTextureARB(Texture : in GLenum);
  procedure glClientActiveTextureARB(Texture : in GLenum);
  procedure glMultiTexCoord1dARB(Target : in GLenum; S : in GLdouble);
  procedure glMultiTexCoord1dvARB(Target : in GLenum; V : in GLdoublePtr);
  procedure glMultiTexCoord1fARB(Target : in GLenum; S : in GLfloat);
  procedure glMultiTexCoord1fvARB(Target : in GLenum; V : in GLfloatPtr);
  procedure glMultiTexCoord1iARB(Target : in GLenum; S : in GLint);
  procedure glMultiTexCoord1ivARB(Target : in GLenum; V : in GLintPtr);
  procedure glMultiTexCoord1sARB(Target : in GLenum; S : in GLshort);
  procedure glMultiTexCoord1svARB(Target : in GLenum; V : in GLshortPtr);
  procedure glMultiTexCoord2dARB(Target : in GLenum; S, T : in GLdouble);
  procedure glMultiTexCoord2dvARB(Target : in GLenum; V : in GLdoublePtr);
  procedure glMultiTexCoord2fARB(Target : in GLenum; S, T : in GLfloat);
  procedure glMultiTexCoord2fvARB(Target : in GLenum; V : in GLfloatPtr);
  procedure glMultiTexCoord2iARB(Target : in GLenum; S, T : in GLint);
  procedure glMultiTexCoord2ivARB(Target : in GLenum; V : in GLintPtr);
  procedure glMultiTexCoord2sARB(Target : in GLenum; S, T : in GLshort);
  procedure glMultiTexCoord2svARB(Target : in GLenum; V : in GLshortPtr);
  procedure glMultiTexCoord3dARB(Target : in GLenum; S, T, R : in GLdouble);
  procedure glMultiTexCoord3dvARB(Target : in GLenum; V : in GLdoublePtr);
  procedure glMultiTexCoord3fARB(Target : in GLenum; S, T, R : in GLfloat);
  procedure glMultiTexCoord3fvARB(Target : in GLenum; V : in GLfloatPtr);
  procedure glMultiTexCoord3iARB(Target : in GLenum; S, T, R : in GLint);
  procedure glMultiTexCoord3ivARB(Target : in GLenum; V : in GLintPtr);
  procedure glMultiTexCoord3sARB(Target : in GLenum; S, T, R : in GLshort);
  procedure glMultiTexCoord3svARB(Target : in GLenum; V : in GLshortPtr);
  procedure glMultiTexCoord4dARB(Target : in GLenum; S, T, R, Q : in GLdouble);
  procedure glMultiTexCoord4dvARB(Target : in GLenum; V : in GLdoublePtr);
  procedure glMultiTexCoord4fARB(Target : in GLenum; S, T, R, Q : in GLfloat);
  procedure glMultiTexCoord4fvARB(Target : in GLenum; V : in GLfloatPtr);
  procedure glMultiTexCoord4iARB(Target : in GLenum; S, T, R, Q : in GLint);
  procedure glMultiTexCoord4ivARB(Target : in GLenum; V : in GLintPtr);
  procedure glMultiTexCoord4sARB(Target : in GLenum; S, T, R, Q : in GLshort);
  procedure glMultiTexCoord4svARB(Target : in GLenum; V : in GLshortPtr);

  procedure glGenQueriesARB(N : in GLsizei; Ids : in GLuintPtr);
  procedure glDeleteQueriesARB(N : in GLsizei; Ids : in GLuintPtr);
  function glIsQueryARB(Id : in GLuint) return GLboolean;
  procedure glBeginQueryARB(Target : in GLenum; Id : in GLuint);
  procedure glEndQueryARB(Target : in GLenum);
  procedure glGetQueryivARB(Target : in GLenum; PName : in GLenum; Params : in GLintPtr);
  procedure glGetQueryObjectivARB(Id : in GLuint; PName : in GLenum; Params : in GLintPtr);
  procedure glGetQueryObjectuivARB(Id : in GLuint; PName : in GLenum; Params : in GLuintPtr);

  procedure glEnableTraceMESA(Mask : in GLbitfield);
  procedure glDisableTraceMESA(Mask : in GLbitfield);
  procedure glNewTraceMESA(Mask : in GLbitfield; TraceName : in GLubytePtr);
  procedure glEndTraceMESA;
  procedure glTraceAssertAttribMESA(AttribMask : in GLbitfield);
  procedure glTraceCommentMESA(Comment : in GLubytePtr);
  procedure glTraceTextureMESA(Name : in GLuint; Comment : in GLubytePtr);
  procedure glTraceListMESA(Name : in GLuint; Comment : in GLubytePtr);
  procedure glTracePointerMESA(Pointer : in GLpointer; Comment : in GLubytePtr);
  procedure glTracePointerRangeMESA(First, Last : in GLpointer; Comment : in GLubytePtr);

private

  pragma Import(DLL, glClearIndex, "glClearIndex");
  pragma Import(DLL, glClearColor, "glClearColor");
  pragma Import(DLL, glClear, "glClear");
  pragma Import(DLL, glIndexMask, "glIndexMask");
  pragma Import(DLL, glColorMask, "glColorMask");
  pragma Import(DLL, glAlphaFunc, "glAlphaFunc");
  pragma Import(DLL, glBlendFunc, "glBlendFunc");
  pragma Import(DLL, glLogicOp, "glLogicOp");
  pragma Import(DLL, glCullFace, "glCullFace");
  pragma Import(DLL, glFrontFace, "glFrontFace");
  pragma Import(DLL, glPointSize, "glPointSize");
  pragma Import(DLL, glLineWidth, "glLineWidth");
  pragma Import(DLL, glLineStipple, "glLineStipple");
  pragma Import(DLL, glPolygonMode, "glPolygonMode");
  pragma Import(DLL, glPolygonOffset, "glPolygonOffset");
  pragma Import(DLL, glPolygonStipple, "glPolygonStipple");
  pragma Import(DLL, glGetPolygonStipple, "glGetPolygonStipple");
  pragma Import(DLL, glEdgeFlag, "glEdgeFlag");
  pragma Import(DLL, glEdgeFlagv, "glEdgeFlagv");
  pragma Import(DLL, glScissor, "glScissor");
  pragma Import(DLL, glClipPlane, "glClipPlane");
  pragma Import(DLL, glGetClipPlane, "glGetClipPlane");
  pragma Import(DLL, glDrawBuffer, "glDrawBuffer");
  pragma Import(DLL, glReadBuffer, "glReadBuffer");
  pragma Import(DLL, glEnable, "glEnable");
  pragma Import(DLL, glDisable, "glDisable");
  pragma Import(DLL, glIsEnabled, "glIsEnabled");
  pragma Import(DLL, glEnableClientState, "glEnableClientState");
  pragma Import(DLL, glDisableClientState, "glDisableClientState");
  pragma Import(DLL, glGetBooleanv, "glGetBooleanv");
  pragma Import(DLL, glGetDoublev, "glGetDoublev");
  pragma Import(DLL, glGetFloatv, "glGetFloatv");
  pragma Import(DLL, glGetIntegerv, "glGetIntegerv");
  pragma Import(DLL, glPushAttrib, "glPushAttrib");
  pragma Import(DLL, glPopAttrib, "glPopAttrib");
  pragma Import(DLL, glPushClientAttrib, "glPushClientAttrib");
  pragma Import(DLL, glPopClientAttrib, "glPopClientAttrib");
  pragma Import(DLL, glRenderMode, "glRenderMode");
  pragma Import(DLL, glGetError, "glGetError");
  pragma Import(DLL, glGetString, "glGetString");
  pragma Import(DLL, glFinish, "glFinish");
  pragma Import(DLL, glFlush, "glFlush");
  pragma Import(DLL, glHint, "glHint");
  pragma Import(DLL, glClearDepth, "glClearDepth");
  pragma Import(DLL, glDepthFunc, "glDepthFunc");
  pragma Import(DLL, glDepthMask, "glDepthMask");
  pragma Import(DLL, glDepthRange, "glDepthRange");
  pragma Import(DLL, glDepthBoundsEXT, "glDepthBoundsEXT");
  pragma Import(DLL, glClearAccum, "glClearAccum");
  pragma Import(DLL, glAccum, "glAccum");
  pragma Import(DLL, glMatrixMode, "glMatrixMode");
  pragma Import(DLL, glOrtho, "glOrtho");
  pragma Import(DLL, glFrustum, "glFrustum");
  pragma Import(DLL, glViewport, "glViewport");
  pragma Import(DLL, glPushMatrix, "glPushMatrix");
  pragma Import(DLL, glPopMatrix, "glPopMatrix");
  pragma Import(DLL, glLoadIdentity, "glLoadIdentity");
  pragma Import(DLL, glLoadMatrixd, "glLoadMatrixd");
  pragma Import(DLL, glLoadMatrixf, "glLoadMatrixf");
  pragma Import(DLL, glMultMatrixd, "glMultMatrixd");
  pragma Import(DLL, glMultMatrixf, "glMultMatrixf");
  pragma Import(DLL, glRotated, "glRotated");
  pragma Import(DLL, glRotatef, "glRotatef");
  pragma Import(DLL, glScaled, "glScaled");
  pragma Import(DLL, glScalef, "glScalef");
  pragma Import(DLL, glTranslated, "glTranslated");
  pragma Import(DLL, glTranslatef, "glTranslatef");
  pragma Import(DLL, glIsList, "glIsList");
  pragma Import(DLL, glDeleteLists, "glDeleteLists");
  pragma Import(DLL, glGenLists, "glGenLists");
  pragma Import(DLL, glNewList, "glNewList");
  pragma Import(DLL, glEndList, "glEndList");
  pragma Import(DLL, glCallList, "glCallList");
  pragma Import(DLL, glCallLists, "glCallLists");
  pragma Import(DLL, glListBase, "glListBase");
  pragma Import(DLL, glBegin, "glBegin");
  pragma Import(DLL, glEnd, "glEnd");
  pragma Import(DLL, glVertex2d, "glVertex2d");
  pragma Import(DLL, glVertex2f, "glVertex2f");
  pragma Import(DLL, glVertex2i, "glVertex2i");
  pragma Import(DLL, glVertex2s, "glVertex2s");
  pragma Import(DLL, glVertex3d, "glVertex3d");
  pragma Import(DLL, glVertex3f, "glVertex3f");
  pragma Import(DLL, glVertex3i, "glVertex3i");
  pragma Import(DLL, glVertex3s, "glVertex3s");
  pragma Import(DLL, glVertex4d, "glVertex4d");
  pragma Import(DLL, glVertex4f, "glVertex4f");
  pragma Import(DLL, glVertex4i, "glVertex4i");
  pragma Import(DLL, glVertex4s, "glVertex4s");
  pragma Import(DLL, glVertex2dv, "glVertex2dv");
  pragma Import(DLL, glVertex2fv, "glVertex2fv");
  pragma Import(DLL, glVertex2iv, "glVertex2iv");
  pragma Import(DLL, glVertex2sv, "glVertex2sv");
  pragma Import(DLL, glVertex3dv, "glVertex3dv");
  pragma Import(DLL, glVertex3fv, "glVertex3fv");
  pragma Import(DLL, glVertex3iv, "glVertex3iv");
  pragma Import(DLL, glVertex3sv, "glVertex3sv");
  pragma Import(DLL, glVertex4dv, "glVertex4dv");
  pragma Import(DLL, glVertex4fv, "glVertex4fv");
  pragma Import(DLL, glVertex4iv, "glVertex4iv");
  pragma Import(DLL, glVertex4sv, "glVertex4sv");
  pragma Import(DLL, glNormal3b, "glNormal3b");
  pragma Import(DLL, glNormal3d, "glNormal3d");
  pragma Import(DLL, glNormal3f, "glNormal3f");
  pragma Import(DLL, glNormal3i, "glNormal3i");
  pragma Import(DLL, glNormal3s, "glNormal3s");
  pragma Import(DLL, glNormal3bv, "glNormal3bv");
  pragma Import(DLL, glNormal3dv, "glNormal3dv");
  pragma Import(DLL, glNormal3fv, "glNormal3fv");
  pragma Import(DLL, glNormal3iv, "glNormal3iv");
  pragma Import(DLL, glNormal3sv, "glNormal3sv");
  pragma Import(DLL, glIndexd, "glIndexd");
  pragma Import(DLL, glIndexf, "glIndexf");
  pragma Import(DLL, glIndexi, "glIndexi");
  pragma Import(DLL, glIndexs, "glIndexs");
  pragma Import(DLL, glIndexub, "glIndexub");
  pragma Import(DLL, glIndexdv, "glIndexdv");
  pragma Import(DLL, glIndexfv, "glIndexfv");
  pragma Import(DLL, glIndexiv, "glIndexiv");
  pragma Import(DLL, glIndexsv, "glIndexsv");
  pragma Import(DLL, glIndexubv, "glIndexubv");
  pragma Import(DLL, glColor3b, "glColor3b");
  pragma Import(DLL, glColor3d, "glColor3d");
  pragma Import(DLL, glColor3f, "glColor3f");
  pragma Import(DLL, glColor3i, "glColor3i");
  pragma Import(DLL, glColor3s, "glColor3s");
  pragma Import(DLL, glColor3ub, "glColor3ub");
  pragma Import(DLL, glColor3ui, "glColor3ui");
  pragma Import(DLL, glColor3us, "glColor3us");
  pragma Import(DLL, glColor4b, "glColor4b");
  pragma Import(DLL, glColor4d, "glColor4d");
  pragma Import(DLL, glColor4f, "glColor4f");
  pragma Import(DLL, glColor4i, "glColor4i");
  pragma Import(DLL, glColor4s, "glColor4s");
  pragma Import(DLL, glColor4ub, "glColor4ub");
  pragma Import(DLL, glColor4ui, "glColor4ui");
  pragma Import(DLL, glColor4us, "glColor4us");
  pragma Import(DLL, glColor3bv, "glColor3bv");
  pragma Import(DLL, glColor3dv, "glColor3dv");
  pragma Import(DLL, glColor3fv, "glColor3fv");
  pragma Import(DLL, glColor3iv, "glColor3iv");
  pragma Import(DLL, glColor3sv, "glColor3sv");
  pragma Import(DLL, glColor3ubv, "glColor3ubv");
  pragma Import(DLL, glColor3uiv, "glColor3uiv");
  pragma Import(DLL, glColor3usv, "glColor3usv");
  pragma Import(DLL, glColor4bv, "glColor4bv");
  pragma Import(DLL, glColor4dv, "glColor4dv");
  pragma Import(DLL, glColor4fv, "glColor4fv");
  pragma Import(DLL, glColor4iv, "glColor4iv");
  pragma Import(DLL, glColor4sv, "glColor4sv");
  pragma Import(DLL, glColor4ubv, "glColor4ubv");
  pragma Import(DLL, glColor4uiv, "glColor4uiv");
  pragma Import(DLL, glColor4usv, "glColor4usv");
  pragma Import(DLL, glTexCoord1d, "glTexCoord1d");
  pragma Import(DLL, glTexCoord1f, "glTexCoord1f");
  pragma Import(DLL, glTexCoord1i, "glTexCoord1i");
  pragma Import(DLL, glTexCoord1s, "glTexCoord1s");
  pragma Import(DLL, glTexCoord2d, "glTexCoord2d");
  pragma Import(DLL, glTexCoord2f, "glTexCoord2f");
  pragma Import(DLL, glTexCoord2i, "glTexCoord2i");
  pragma Import(DLL, glTexCoord2s, "glTexCoord2s");
  pragma Import(DLL, glTexCoord3d, "glTexCoord3d");
  pragma Import(DLL, glTexCoord3f, "glTexCoord3f");
  pragma Import(DLL, glTexCoord3i, "glTexCoord3i");
  pragma Import(DLL, glTexCoord3s, "glTexCoord3s");
  pragma Import(DLL, glTexCoord4d, "glTexCoord4d");
  pragma Import(DLL, glTexCoord4f, "glTexCoord4f");
  pragma Import(DLL, glTexCoord4i, "glTexCoord4i");
  pragma Import(DLL, glTexCoord4s, "glTexCoord4s");
  pragma Import(DLL, glTexCoord1dv, "glTexCoord1dv");
  pragma Import(DLL, glTexCoord1fv, "glTexCoord1fv");
  pragma Import(DLL, glTexCoord1iv, "glTexCoord1iv");
  pragma Import(DLL, glTexCoord1sv, "glTexCoord1sv");
  pragma Import(DLL, glTexCoord2dv, "glTexCoord2dv");
  pragma Import(DLL, glTexCoord2fv, "glTexCoord2fv");
  pragma Import(DLL, glTexCoord2iv, "glTexCoord2iv");
  pragma Import(DLL, glTexCoord2sv, "glTexCoord2sv");
  pragma Import(DLL, glTexCoord3dv, "glTexCoord3dv");
  pragma Import(DLL, glTexCoord3fv, "glTexCoord3fv");
  pragma Import(DLL, glTexCoord3iv, "glTexCoord3iv");
  pragma Import(DLL, glTexCoord3sv, "glTexCoord3sv");
  pragma Import(DLL, glTexCoord4dv, "glTexCoord4dv");
  pragma Import(DLL, glTexCoord4fv, "glTexCoord4fv");
  pragma Import(DLL, glTexCoord4iv, "glTexCoord4iv");
  pragma Import(DLL, glTexCoord4sv, "glTexCoord4sv");
  pragma Import(DLL, glRasterPos2d, "glRasterPos2d");
  pragma Import(DLL, glRasterPos2f, "glRasterPos2f");
  pragma Import(DLL, glRasterPos2i, "glRasterPos2i");
  pragma Import(DLL, glRasterPos2s, "glRasterPos2s");
  pragma Import(DLL, glRasterPos3d, "glRasterPos3d");
  pragma Import(DLL, glRasterPos3f, "glRasterPos3f");
  pragma Import(DLL, glRasterPos3i, "glRasterPos3i");
  pragma Import(DLL, glRasterPos3s, "glRasterPos3s");
  pragma Import(DLL, glRasterPos4d, "glRasterPos4d");
  pragma Import(DLL, glRasterPos4f, "glRasterPos4f");
  pragma Import(DLL, glRasterPos4i, "glRasterPos4i");
  pragma Import(DLL, glRasterPos4s, "glRasterPos4s");
  pragma Import(DLL, glRasterPos2dv, "glRasterPos2dv");
  pragma Import(DLL, glRasterPos2fv, "glRasterPos2fv");
  pragma Import(DLL, glRasterPos2iv, "glRasterPos2iv");
  pragma Import(DLL, glRasterPos2sv, "glRasterPos2sv");
  pragma Import(DLL, glRasterPos3dv, "glRasterPos3dv");
  pragma Import(DLL, glRasterPos3fv, "glRasterPos3fv");
  pragma Import(DLL, glRasterPos3iv, "glRasterPos3iv");
  pragma Import(DLL, glRasterPos3sv, "glRasterPos3sv");
  pragma Import(DLL, glRasterPos4dv, "glRasterPos4dv");
  pragma Import(DLL, glRasterPos4fv, "glRasterPos4fv");
  pragma Import(DLL, glRasterPos4iv, "glRasterPos4iv");
  pragma Import(DLL, glRasterPos4sv, "glRasterPos4sv");
  pragma Import(DLL, glRectd, "glRectd");
  pragma Import(DLL, glRectf, "glRectf");
  pragma Import(DLL, glRecti, "glRecti");
  pragma Import(DLL, glRects, "glRects");
  pragma Import(DLL, glRectdv, "glRectdv");
  pragma Import(DLL, glRectfv, "glRectfv");
  pragma Import(DLL, glRectiv, "glRectiv");
  pragma Import(DLL, glRectsv, "glRectsv");
  pragma Import(DLL, glVertexPointer, "glVertexPointer");
  pragma Import(DLL, glNormalPointer, "glNormalPointer");
  pragma Import(DLL, glColorPointer, "glColorPointer");
  pragma Import(DLL, glIndexPointer, "glIndexPointer");
  pragma Import(DLL, glTexCoordPointer, "glTexCoordPointer");
  pragma Import(DLL, glEdgeFlagPointer, "glEdgeFlagPointer");
  pragma Import(DLL, glGetPointerv, "glGetPointerv");
  pragma Import(DLL, glArrayElement, "glArrayElement");
  pragma Import(DLL, glDrawArrays, "glDrawArrays");
  pragma Import(DLL, glDrawElements, "glDrawElements");
  pragma Import(DLL, glInterleavedArrays, "glInterleavedArrays");
  pragma Import(DLL, glShadeModel, "glShadeModel");
  pragma Import(DLL, glLightf, "glLightf");
  pragma Import(DLL, glLighti, "glLighti");
  pragma Import(DLL, glLightfv, "glLightfv");
  pragma Import(DLL, glLightiv, "glLightiv");
  pragma Import(DLL, glGetLightfv, "glGetLightfv");
  pragma Import(DLL, glGetLightiv, "glGetLightiv");
  pragma Import(DLL, glLightModelf, "glLightModelf");
  pragma Import(DLL, glLightModeli, "glLightModeli");
  pragma Import(DLL, glLightModelfv, "glLightModelfv");
  pragma Import(DLL, glLightModeliv, "glLightModeliv");
  pragma Import(DLL, glMaterialf, "glMaterialf");
  pragma Import(DLL, glMateriali, "glMateriali");
  pragma Import(DLL, glMaterialfv, "glMaterialfv");
  pragma Import(DLL, glMaterialiv, "glMaterialiv");
  pragma Import(DLL, glGetMaterialfv, "glGetMaterialfv");
  pragma Import(DLL, glGetMaterialiv, "glGetMaterialiv");
  pragma Import(DLL, glColorMaterial, "glColorMaterial");
  pragma Import(DLL, glPixelZoom, "glPixelZoom");
  pragma Import(DLL, glPixelStoref, "glPixelStoref");
  pragma Import(DLL, glPixelStorei, "glPixelStorei");
  pragma Import(DLL, glPixelTransferf, "glPixelTransferf");
  pragma Import(DLL, glPixelTransferi, "glPixelTransferi");
  pragma Import(DLL, glPixelMapfv, "glPixelMapfv");
  pragma Import(DLL, glPixelMapuiv, "glPixelMapuiv");
  pragma Import(DLL, glPixelMapusv, "glPixelMapusv");
  pragma Import(DLL, glGetPixelMapfv, "glGetPixelMapfv");
  pragma Import(DLL, glGetPixelMapuiv, "glGetPixelMapuiv");
  pragma Import(DLL, glGetPixelMapusv, "glGetPixelMapusv");
  pragma Import(DLL, glBitmap, "glBitmap");
  pragma Import(DLL, glReadPixels, "glReadPixels");
  pragma Import(DLL, glDrawPixels, "glDrawPixels");
  pragma Import(DLL, glCopyPixels, "glCopyPixels");
  pragma Import(DLL, glStencilFunc, "glStencilFunc");
  pragma Import(DLL, glStencilMask, "glStencilMask");
  pragma Import(DLL, glStencilOp, "glStencilOp");
  pragma Import(DLL, glClearStencil, "glClearStencil");
  pragma Import(DLL, glTexGend, "glTexGend");
  pragma Import(DLL, glTexGenf, "glTexGenf");
  pragma Import(DLL, glTexGeni, "glTexGeni");
  pragma Import(DLL, glTexGendv, "glTexGendv");
  pragma Import(DLL, glTexGenfv, "glTexGenfv");
  pragma Import(DLL, glTexGeniv, "glTexGeniv");
  pragma Import(DLL, glGetTexGendv, "glGetTexGendv");
  pragma Import(DLL, glGetTexGenfv, "glGetTexGenfv");
  pragma Import(DLL, glGetTexGeniv, "glGetTexGeniv");
  pragma Import(DLL, glTexEnvf, "glTexEnvf");
  pragma Import(DLL, glTexEnvi, "glTexEnvi");
  pragma Import(DLL, glTexEnvfv, "glTexEnvfv");
  pragma Import(DLL, glTexEnviv, "glTexEnviv");
  pragma Import(DLL, glGetTexEnvfv, "glGetTexEnvfv");
  pragma Import(DLL, glGetTexEnviv, "glGetTexEnviv");
  pragma Import(DLL, glTexParameterf, "glTexParameterf");
  pragma Import(DLL, glTexParameteri, "glTexParameteri");
  pragma Import(DLL, glTexParameterfv, "glTexParameterfv");
  pragma Import(DLL, glTexParameteriv, "glTexParameteriv");
  pragma Import(DLL, glGetTexParameterfv, "glGetTexParameterfv");
  pragma Import(DLL, glGetTexParameteriv, "glGetTexParameteriv");
  pragma Import(DLL, glGetTexLevelParameterfv, "glGetTexLevelParameterfv");
  pragma Import(DLL, glGetTexLevelParameteriv, "glGetTexLevelParameteriv");
  pragma Import(DLL, glTexImage1D, "glTexImage1D");
  pragma Import(DLL, glTexImage2D, "glTexImage2D");
  pragma Import(DLL, glGetTexImage, "glGetTexImage");
  pragma Import(DLL, glGenTextures, "glGenTextures");
  pragma Import(DLL, glDeleteTextures, "glDeleteTextures");
  pragma Import(DLL, glBindTexture, "glBindTexture");
  pragma Import(DLL, glPrioritizeTextures, "glPrioritizeTextures");
  pragma Import(DLL, glAreTexturesResident, "glAreTexturesResident");
  pragma Import(DLL, glIsTexture, "glIsTexture");
  pragma Import(DLL, glTexSubImage1D, "glTexSubImage1D");
  pragma Import(DLL, glTexSubImage2D, "glTexSubImage2D");
  pragma Import(DLL, glCopyTexImage1D, "glCopyTexImage1D");
  pragma Import(DLL, glCopyTexImage2D, "glCopyTexImage2D");
  pragma Import(DLL, glCopyTexSubImage1D, "glCopyTexSubImage1D");
  pragma Import(DLL, glCopyTexSubImage2D, "glCopyTexSubImage2D");
  pragma Import(DLL, glMap1d, "glMap1d");
  pragma Import(DLL, glMap1f, "glMap1f");
  pragma Import(DLL, glMap2d, "glMap2d");
  pragma Import(DLL, glMap2f, "glMap2f");
  pragma Import(DLL, glGetMapdv, "glGetMapdv");
  pragma Import(DLL, glGetMapfv, "glGetMapfv");
  pragma Import(DLL, glGetMapiv, "glGetMapiv");
  pragma Import(DLL, glEvalCoord1d, "glEvalCoord1d");
  pragma Import(DLL, glEvalCoord1f, "glEvalCoord1f");
  pragma Import(DLL, glEvalCoord1dv, "glEvalCoord1dv");
  pragma Import(DLL, glEvalCoord1fv, "glEvalCoord1fv");
  pragma Import(DLL, glEvalCoord2d, "glEvalCoord2d");
  pragma Import(DLL, glEvalCoord2f, "glEvalCoord2f");
  pragma Import(DLL, glEvalCoord2dv, "glEvalCoord2dv");
  pragma Import(DLL, glEvalCoord2fv, "glEvalCoord2fv");
  pragma Import(DLL, glMapGrid1d, "glMapGrid1d");
  pragma Import(DLL, glMapGrid1f, "glMapGrid1f");
  pragma Import(DLL, glMapGrid2d, "glMapGrid2d");
  pragma Import(DLL, glMapGrid2f, "glMapGrid2f");
  pragma Import(DLL, glEvalPoint1, "glEvalPoint1");
  pragma Import(DLL, glEvalPoint2, "glEvalPoint2");
  pragma Import(DLL, glEvalMesh1, "glEvalMesh1");
  pragma Import(DLL, glEvalMesh2, "glEvalMesh2");
  pragma Import(DLL, glFogf, "glFogf");
  pragma Import(DLL, glFogi, "glFogi");
  pragma Import(DLL, glFogfv, "glFogfv");
  pragma Import(DLL, glFogiv, "glFogiv");
  pragma Import(DLL, glFeedbackBuffer, "glFeedbackBuffer");
  pragma Import(DLL, glPassThrough, "glPassThrough");
  pragma Import(DLL, glSelectBuffer, "glSelectBuffer");
  pragma Import(DLL, glInitNames, "glInitNames");
  pragma Import(DLL, glLoadName, "glLoadName");
  pragma Import(DLL, glPushName, "glPushName");
  pragma Import(DLL, glPopName, "glPopName");
  pragma Import(DLL, glDrawRangeElements, "glDrawRangeElements");
  pragma Import(DLL, glTexImage3D, "glTexImage3D");
  pragma Import(DLL, glTexSubImage3D, "glTexSubImage3D");
  pragma Import(DLL, glCopyTexSubImage3D, "glCopyTexSubImage3D");
  pragma Import(DLL, glColorTable, "glColorTable");
  pragma Import(DLL, glColorSubTable, "glColorSubTable");
  pragma Import(DLL, glColorTableParameteriv, "glColorTableParameteriv");
  pragma Import(DLL, glColorTableParameterfv, "glColorTableParameterfv");
  pragma Import(DLL, glCopyColorSubTable, "glCopyColorSubTable");
  pragma Import(DLL, glCopyColorTable, "glCopyColorTable");
  pragma Import(DLL, glGetColorTable, "glGetColorTable");
  pragma Import(DLL, glGetColorTableParameterfv, "glGetColorTableParameterfv");
  pragma Import(DLL, glGetColorTableParameteriv, "glGetColorTableParameteriv");
  pragma Import(DLL, glBlendEquation, "glBlendEquation");
  pragma Import(DLL, glBlendColor, "glBlendColor");
  pragma Import(DLL, glHistogram, "glHistogram");
  pragma Import(DLL, glResetHistogram, "glResetHistogram");
  pragma Import(DLL, glGetHistogram, "glGetHistogram");
  pragma Import(DLL, glGetHistogramParameterfv, "glGetHistogramParameterfv");
  pragma Import(DLL, glGetHistogramParameteriv, "glGetHistogramParameteriv");
  pragma Import(DLL, glMinmax, "glMinmax");
  pragma Import(DLL, glResetMinmax, "glResetMinmax");
  pragma Import(DLL, glGetMinmax, "glGetMinmax");
  pragma Import(DLL, glGetMinmaxParameterfv, "glGetMinmaxParameterfv");
  pragma Import(DLL, glGetMinmaxParameteriv, "glGetMinmaxParameteriv");
  pragma Import(DLL, glConvolutionFilter1D, "glConvolutionFilter1D");
  pragma Import(DLL, glConvolutionFilter2D, "glConvolutionFilter2D");
  pragma Import(DLL, glConvolutionParameterf, "glConvolutionParameterf");
  pragma Import(DLL, glConvolutionParameterfv, "glConvolutionParameterfv");
  pragma Import(DLL, glConvolutionParameteri, "glConvolutionParameteri");
  pragma Import(DLL, glConvolutionParameteriv, "glConvolutionParameteriv");
  pragma Import(DLL, glCopyConvolutionFilter1D, "glCopyConvolutionFilter1D");
  pragma Import(DLL, glCopyConvolutionFilter2D, "glCopyConvolutionFilter2D");
  pragma Import(DLL, glGetConvolutionFilter, "glGetConvolutionFilter");
  pragma Import(DLL, glGetConvolutionParameterfv, "glGetConvolutionParameterfv");
  pragma Import(DLL, glGetConvolutionParameteriv, "glGetConvolutionParameteriv");
  pragma Import(DLL, glSeparableFilter2D, "glSeparableFilter2D");
  pragma Import(DLL, glGetSeparableFilter, "glGetSeparableFilter");
  pragma Import(DLL, glActiveTexture, "glActiveTexture");
  pragma Import(DLL, glClientActiveTexture, "glClientActiveTexture");
  pragma Import(DLL, glCompressedTexImage1D, "glCompressedTexImage1D");
  pragma Import(DLL, glCompressedTexImage2D, "glCompressedTexImage2D");
  pragma Import(DLL, glCompressedTexImage3D, "glCompressedTexImage3D");
  pragma Import(DLL, glCompressedTexSubImage1D, "glCompressedTexSubImage1D");
  pragma Import(DLL, glCompressedTexSubImage2D, "glCompressedTexSubImage2D");
  pragma Import(DLL, glCompressedTexSubImage3D, "glCompressedTexSubImage3D");
  pragma Import(DLL, glGetCompressedTexImage, "glGetCompressedTexImage");
  pragma Import(DLL, glMultiTexCoord1d, "glMultiTexCoord1d");
  pragma Import(DLL, glMultiTexCoord1dv, "glMultiTexCoord1dv");
  pragma Import(DLL, glMultiTexCoord1f, "glMultiTexCoord1f");
  pragma Import(DLL, glMultiTexCoord1fv, "glMultiTexCoord1fv");
  pragma Import(DLL, glMultiTexCoord1i, "glMultiTexCoord1i");
  pragma Import(DLL, glMultiTexCoord1iv, "glMultiTexCoord1iv");
  pragma Import(DLL, glMultiTexCoord1s, "glMultiTexCoord1s");
  pragma Import(DLL, glMultiTexCoord1sv, "glMultiTexCoord1sv");
  pragma Import(DLL, glMultiTexCoord2d, "glMultiTexCoord2d");
  pragma Import(DLL, glMultiTexCoord2dv, "glMultiTexCoord2dv");
  pragma Import(DLL, glMultiTexCoord2f, "glMultiTexCoord2f");
  pragma Import(DLL, glMultiTexCoord2fv, "glMultiTexCoord2fv");
  pragma Import(DLL, glMultiTexCoord2i, "glMultiTexCoord2i");
  pragma Import(DLL, glMultiTexCoord2iv, "glMultiTexCoord2iv");
  pragma Import(DLL, glMultiTexCoord2s, "glMultiTexCoord2s");
  pragma Import(DLL, glMultiTexCoord2sv, "glMultiTexCoord2sv");
  pragma Import(DLL, glMultiTexCoord3d, "glMultiTexCoord3d");
  pragma Import(DLL, glMultiTexCoord3dv, "glMultiTexCoord3dv");
  pragma Import(DLL, glMultiTexCoord3f, "glMultiTexCoord3f");
  pragma Import(DLL, glMultiTexCoord3fv, "glMultiTexCoord3fv");
  pragma Import(DLL, glMultiTexCoord3i, "glMultiTexCoord3i");
  pragma Import(DLL, glMultiTexCoord3iv, "glMultiTexCoord3iv");
  pragma Import(DLL, glMultiTexCoord3s, "glMultiTexCoord3s");
  pragma Import(DLL, glMultiTexCoord3sv, "glMultiTexCoord3sv");
  pragma Import(DLL, glMultiTexCoord4d, "glMultiTexCoord4d");
  pragma Import(DLL, glMultiTexCoord4dv, "glMultiTexCoord4dv");
  pragma Import(DLL, glMultiTexCoord4f, "glMultiTexCoord4f");
  pragma Import(DLL, glMultiTexCoord4fv, "glMultiTexCoord4fv");
  pragma Import(DLL, glMultiTexCoord4i, "glMultiTexCoord4i");
  pragma Import(DLL, glMultiTexCoord4iv, "glMultiTexCoord4iv");
  pragma Import(DLL, glMultiTexCoord4s, "glMultiTexCoord4s");
  pragma Import(DLL, glMultiTexCoord4sv, "glMultiTexCoord4sv");
  pragma Import(DLL, glLoadTransposeMatrixd, "glLoadTransposeMatrixd");
  pragma Import(DLL, glLoadTransposeMatrixf, "glLoadTransposeMatrixf");
  pragma Import(DLL, glMultTransposeMatrixd, "glMultTransposeMatrixd");
  pragma Import(DLL, glMultTransposeMatrixf, "glMultTransposeMatrixf");
  pragma Import(DLL, glSampleCoverage, "glSampleCoverage");
  pragma Import(DLL, glActiveTextureARB, "glActiveTextureARB");
  pragma Import(DLL, glClientActiveTextureARB, "glClientActiveTextureARB");
  pragma Import(DLL, glMultiTexCoord1dARB, "glMultiTexCoord1dARB");
  pragma Import(DLL, glMultiTexCoord1dvARB, "glMultiTexCoord1dvARB");
  pragma Import(DLL, glMultiTexCoord1fARB, "glMultiTexCoord1fARB");
  pragma Import(DLL, glMultiTexCoord1fvARB, "glMultiTexCoord1fvARB");
  pragma Import(DLL, glMultiTexCoord1iARB, "glMultiTexCoord1iARB");
  pragma Import(DLL, glMultiTexCoord1ivARB, "glMultiTexCoord1ivARB");
  pragma Import(DLL, glMultiTexCoord1sARB, "glMultiTexCoord1sARB");
  pragma Import(DLL, glMultiTexCoord1svARB, "glMultiTexCoord1svARB");
  pragma Import(DLL, glMultiTexCoord2dARB, "glMultiTexCoord2dARB");
  pragma Import(DLL, glMultiTexCoord2dvARB, "glMultiTexCoord2dvARB");
  pragma Import(DLL, glMultiTexCoord2fARB, "glMultiTexCoord2fARB");
  pragma Import(DLL, glMultiTexCoord2fvARB, "glMultiTexCoord2fvARB");
  pragma Import(DLL, glMultiTexCoord2iARB, "glMultiTexCoord2iARB");
  pragma Import(DLL, glMultiTexCoord2ivARB, "glMultiTexCoord2ivARB");
  pragma Import(DLL, glMultiTexCoord2sARB, "glMultiTexCoord2sARB");
  pragma Import(DLL, glMultiTexCoord2svARB, "glMultiTexCoord2svARB");
  pragma Import(DLL, glMultiTexCoord3dARB, "glMultiTexCoord3dARB");
  pragma Import(DLL, glMultiTexCoord3dvARB, "glMultiTexCoord3dvARB");
  pragma Import(DLL, glMultiTexCoord3fARB, "glMultiTexCoord3fARB");
  pragma Import(DLL, glMultiTexCoord3fvARB, "glMultiTexCoord3fvARB");
  pragma Import(DLL, glMultiTexCoord3iARB, "glMultiTexCoord3iARB");
  pragma Import(DLL, glMultiTexCoord3ivARB, "glMultiTexCoord3ivARB");
  pragma Import(DLL, glMultiTexCoord3sARB, "glMultiTexCoord3sARB");
  pragma Import(DLL, glMultiTexCoord3svARB, "glMultiTexCoord3svARB");
  pragma Import(DLL, glMultiTexCoord4dARB, "glMultiTexCoord4dARB");
  pragma Import(DLL, glMultiTexCoord4dvARB, "glMultiTexCoord4dvARB");
  pragma Import(DLL, glMultiTexCoord4fARB, "glMultiTexCoord4fARB");
  pragma Import(DLL, glMultiTexCoord4fvARB, "glMultiTexCoord4fvARB");
  pragma Import(DLL, glMultiTexCoord4iARB, "glMultiTexCoord4iARB");
  pragma Import(DLL, glMultiTexCoord4ivARB, "glMultiTexCoord4ivARB");
  pragma Import(DLL, glMultiTexCoord4sARB, "glMultiTexCoord4sARB");
  pragma Import(DLL, glMultiTexCoord4svARB, "glMultiTexCoord4svARB");
  pragma Import(DLL, glGenQueriesARB, "glGenQueriesARB");
  pragma Import(DLL, glDeleteQueriesARB, "glDeleteQueriesARB");
  pragma Import(DLL, glIsQueryARB, "glIsQueryARB");
  pragma Import(DLL, glBeginQueryARB, "glBeginQueryARB");
  pragma Import(DLL, glEndQueryARB, "glEndQueryARB");
  pragma Import(DLL, glGetQueryivARB, "glGetQueryivARB");
  pragma Import(DLL, glGetQueryObjectivARB, "glGetQueryObjectivARB");
  pragma Import(DLL, glGetQueryObjectuivARB, "glGetQueryObjectuivARB");
  pragma Import(DLL, glEnableTraceMESA, "glEnableTraceMESA");
  pragma Import(DLL, glDisableTraceMESA, "glDisableTraceMESA");
  pragma Import(DLL, glNewTraceMESA, "glNewTraceMESA");
  pragma Import(DLL, glEndTraceMESA, "glEndTraceMESA");
  pragma Import(DLL, glTraceAssertAttribMESA, "glTraceAssertAttribMESA");
  pragma Import(DLL, glTraceCommentMESA, "glTraceCommentMESA");
  pragma Import(DLL, glTraceTextureMESA, "glTraceTextureMESA");
  pragma Import(DLL, glTraceListMESA, "glTraceListMESA");
  pragma Import(DLL, glTracePointerMESA, "glTracePointerMESA");
  pragma Import(DLL, glTracePointerRangeMESA, "glTracePointerRangeMESA");

end GL;
