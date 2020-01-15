-- License Applicability. Except to the extent portions of this file are
-- made subject to an alternative license as permitted in the SGI Free
-- Software License B, Version 1.1 (the "License"), the contents of this
-- file are subject only to the provisions of the License. You may not use
-- this file except in compliance with the License. You may obtain a copy
-- of the License at Silicon Graphics, Inc., attn: Legal Services, 1600
-- Amphitheatre Parkway, Mountain View, CA 94043-1351, or at:
-- 
-- http://oss.sgi.com/projects/FreeB
-- 
-- Note that, as provided in the License, the Software is distributed on an
-- "AS IS" basis, with ALL EXPRESS AND IMPLIED WARRANTIES AND CONDITIONS
-- DISCLAIMED, INCLUDING, WITHOUT LIMITATION, ANY IMPLIED WARRANTIES AND
-- CONDITIONS OF MERCHANTABILITY, SATISFACTORY QUALITY, FITNESS FOR A
-- PARTICULAR PURPOSE, AND NON-INFRINGEMENT.
-- 
-- Original Code. The Original Code is: OpenGL Sample Implementation,
-- Version 1.2.1, released January 26, 2000, developed by Silicon Graphics,
-- Inc. The Original Code is Copyright (c) 1991-2002 Silicon Graphics, Inc.
-- Copyright in any portions created by third parties is as indicated
-- elsewhere herein. All Rights Reserved.
-- 
-- Additional Notice Provisions: This software was created using the
-- OpenGL(R) version 1.2.1 Sample Implementation published by SGI, but has
-- not been independently verified as being compliant with the OpenGL(R)
-- version 1.2.1 Specification.

-- Header file version number, required by OpenGL ABI for Linux
-- glext.h last updated 2004/6/22
-- Current version at http://oss.sgi.com/projects/ogl-sample/registry/

package GL.EXT is

  GL_GLEXT_VERSION                  : constant := 23;

  --#ifndef GL_VERSION_1_2
  GL_UNSIGNED_BYTE_3_3_2            : constant := 16#8032#;
  GL_UNSIGNED_SHORT_4_4_4_4         : constant := 16#8033#;
  GL_UNSIGNED_SHORT_5_5_5_1         : constant := 16#8034#;
  GL_UNSIGNED_INT_8_8_8_8           : constant := 16#8035#;
  GL_UNSIGNED_INT_10_10_10_2        : constant := 16#8036#;
  GL_RESCALE_NORMAL                 : constant := 16#803A#;
  GL_TEXTURE_BINDING_3D             : constant := 16#806A#;
  GL_PACK_SKIP_IMAGES               : constant := 16#806B#;
  GL_PACK_IMAGE_HEIGHT              : constant := 16#806C#;
  GL_UNPACK_SKIP_IMAGES             : constant := 16#806D#;
  GL_UNPACK_IMAGE_HEIGHT            : constant := 16#806E#;
  GL_TEXTURE_3D                     : constant := 16#806F#;
  GL_PROXY_TEXTURE_3D               : constant := 16#8070#;
  GL_TEXTURE_DEPTH                  : constant := 16#8071#;
  GL_TEXTURE_WRAP_R                 : constant := 16#8072#;
  GL_MAX_3D_TEXTURE_SIZE            : constant := 16#8073#;
  GL_UNSIGNED_BYTE_2_3_3_REV        : constant := 16#8362#;
  GL_UNSIGNED_SHORT_5_6_5           : constant := 16#8363#;
  GL_UNSIGNED_SHORT_5_6_5_REV       : constant := 16#8364#;
  GL_UNSIGNED_SHORT_4_4_4_4_REV     : constant := 16#8365#;
  GL_UNSIGNED_SHORT_1_5_5_5_REV     : constant := 16#8366#;
  GL_UNSIGNED_INT_8_8_8_8_REV       : constant := 16#8367#;
  GL_UNSIGNED_INT_2_10_10_10_REV    : constant := 16#8368#;
  GL_BGR                            : constant := 16#80E0#;
  GL_BGRA                           : constant := 16#80E1#;
  GL_MAX_ELEMENTS_VERTICES          : constant := 16#80E8#;
  GL_MAX_ELEMENTS_INDICES           : constant := 16#80E9#;
  GL_CLAMP_TO_EDGE                  : constant := 16#812F#;
  GL_TEXTURE_MIN_LOD                : constant := 16#813A#;
  GL_TEXTURE_MAX_LOD                : constant := 16#813B#;
  GL_TEXTURE_BASE_LEVEL             : constant := 16#813C#;
  GL_TEXTURE_MAX_LEVEL              : constant := 16#813D#;
  GL_LIGHT_MODEL_COLOR_CONTROL      : constant := 16#81F8#;
  GL_SINGLE_COLOR                   : constant := 16#81F9#;
  GL_SEPARATE_SPECULAR_COLOR        : constant := 16#81FA#;
  GL_SMOOTH_POINT_SIZE_RANGE        : constant := 16#0B12#;
  GL_SMOOTH_POINT_SIZE_GRANULARITY  : constant := 16#0B13#;
  GL_SMOOTH_LINE_WIDTH_RANGE        : constant := 16#0B22#;
  GL_SMOOTH_LINE_WIDTH_GRANULARITY  : constant := 16#0B23#;
  GL_ALIASED_POINT_SIZE_RANGE       : constant := 16#846D#;
  GL_ALIASED_LINE_WIDTH_RANGE       : constant := 16#846E#;
  --#endif

  --#ifndef GL_ARB_imaging
  GL_CONSTANT_COLOR                      : constant := 16#8001#;
  GL_ONE_MINUS_CONSTANT_COLOR            : constant := 16#8002#;
  GL_CONSTANT_ALPHA                      : constant := 16#8003#;
  GL_ONE_MINUS_CONSTANT_ALPHA            : constant := 16#8004#;
  GL_BLEND_COLOR                         : constant := 16#8005#;
  GL_FUNC_ADD                            : constant := 16#8006#;
  GL_MIN                                 : constant := 16#8007#;
  GL_MAX                                 : constant := 16#8008#;
  GL_BLEND_EQUATION                      : constant := 16#8009#;
  GL_FUNC_SUBTRACT                       : constant := 16#800A#;
  GL_FUNC_REVERSE_SUBTRACT               : constant := 16#800B#;
  GL_CONVOLUTION_1D                      : constant := 16#8010#;
  GL_CONVOLUTION_2D                      : constant := 16#8011#;
  GL_SEPARABLE_2D                        : constant := 16#8012#;
  GL_CONVOLUTION_BORDER_MODE             : constant := 16#8013#;
  GL_CONVOLUTION_FILTER_SCALE            : constant := 16#8014#;
  GL_CONVOLUTION_FILTER_BIAS             : constant := 16#8015#;
  GL_REDUCE                              : constant := 16#8016#;
  GL_CONVOLUTION_FORMAT                  : constant := 16#8017#;
  GL_CONVOLUTION_WIDTH                   : constant := 16#8018#;
  GL_CONVOLUTION_HEIGHT                  : constant := 16#8019#;
  GL_MAX_CONVOLUTION_WIDTH               : constant := 16#801A#;
  GL_MAX_CONVOLUTION_HEIGHT              : constant := 16#801B#;
  GL_POST_CONVOLUTION_RED_SCALE          : constant := 16#801C#;
  GL_POST_CONVOLUTION_GREEN_SCALE        : constant := 16#801D#;
  GL_POST_CONVOLUTION_BLUE_SCALE         : constant := 16#801E#;
  GL_POST_CONVOLUTION_ALPHA_SCALE        : constant := 16#801F#;
  GL_POST_CONVOLUTION_RED_BIAS           : constant := 16#8020#;
  GL_POST_CONVOLUTION_GREEN_BIAS         : constant := 16#8021#;
  GL_POST_CONVOLUTION_BLUE_BIAS          : constant := 16#8022#;
  GL_POST_CONVOLUTION_ALPHA_BIAS         : constant := 16#8023#;
  GL_HISTOGRAM                           : constant := 16#8024#;
  GL_PROXY_HISTOGRAM                     : constant := 16#8025#;
  GL_HISTOGRAM_WIDTH                     : constant := 16#8026#;
  GL_HISTOGRAM_FORMAT                    : constant := 16#8027#;
  GL_HISTOGRAM_RED_SIZE                  : constant := 16#8028#;
  GL_HISTOGRAM_GREEN_SIZE                : constant := 16#8029#;
  GL_HISTOGRAM_BLUE_SIZE                 : constant := 16#802A#;
  GL_HISTOGRAM_ALPHA_SIZE                : constant := 16#802B#;
  GL_HISTOGRAM_LUMINANCE_SIZE            : constant := 16#802C#;
  GL_HISTOGRAM_SINK                      : constant := 16#802D#;
  GL_MINMAX                              : constant := 16#802E#;
  GL_MINMAX_FORMAT                       : constant := 16#802F#;
  GL_MINMAX_SINK                         : constant := 16#8030#;
  GL_TABLE_TOO_LARGE                     : constant := 16#8031#;
  GL_COLOR_MATRIX                        : constant := 16#80B1#;
  GL_COLOR_MATRIX_STACK_DEPTH            : constant := 16#80B2#;
  GL_MAX_COLOR_MATRIX_STACK_DEPTH        : constant := 16#80B3#;
  GL_POST_COLOR_MATRIX_RED_SCALE         : constant := 16#80B4#;
  GL_POST_COLOR_MATRIX_GREEN_SCALE       : constant := 16#80B5#;
  GL_POST_COLOR_MATRIX_BLUE_SCALE        : constant := 16#80B6#;
  GL_POST_COLOR_MATRIX_ALPHA_SCALE       : constant := 16#80B7#;
  GL_POST_COLOR_MATRIX_RED_BIAS          : constant := 16#80B8#;
  GL_POST_COLOR_MATRIX_GREEN_BIAS        : constant := 16#80B9#;
  GL_POST_COLOR_MATRIX_BLUE_BIAS         : constant := 16#80BA#;
  GL_POST_COLOR_MATRIX_ALPHA_BIAS        : constant := 16#80BB#;
  GL_COLOR_TABLE                         : constant := 16#80D0#;
  GL_POST_CONVOLUTION_COLOR_TABLE        : constant := 16#80D1#;
  GL_POST_COLOR_MATRIX_COLOR_TABLE       : constant := 16#80D2#;
  GL_PROXY_COLOR_TABLE                   : constant := 16#80D3#;
  GL_PROXY_POST_CONVOLUTION_COLOR_TABLE  : constant := 16#80D4#;
  GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE : constant := 16#80D5#;
  GL_COLOR_TABLE_SCALE                   : constant := 16#80D6#;
  GL_COLOR_TABLE_BIAS                    : constant := 16#80D7#;
  GL_COLOR_TABLE_FORMAT                  : constant := 16#80D8#;
  GL_COLOR_TABLE_WIDTH                   : constant := 16#80D9#;
  GL_COLOR_TABLE_RED_SIZE                : constant := 16#80DA#;
  GL_COLOR_TABLE_GREEN_SIZE              : constant := 16#80DB#;
  GL_COLOR_TABLE_BLUE_SIZE               : constant := 16#80DC#;
  GL_COLOR_TABLE_ALPHA_SIZE              : constant := 16#80DD#;
  GL_COLOR_TABLE_LUMINANCE_SIZE          : constant := 16#80DE#;
  GL_COLOR_TABLE_INTENSITY_SIZE          : constant := 16#80DF#;
  GL_CONSTANT_BORDER                     : constant := 16#8151#;
  GL_REPLICATE_BORDER                    : constant := 16#8153#;
  GL_CONVOLUTION_BORDER_COLOR            : constant := 16#8154#;
  --#endif

  --#ifndef GL_VERSION_1_3
  GL_TEXTURE0                       : constant := 16#84C0#;
  GL_TEXTURE1                       : constant := 16#84C1#;
  GL_TEXTURE2                       : constant := 16#84C2#;
  GL_TEXTURE3                       : constant := 16#84C3#;
  GL_TEXTURE4                       : constant := 16#84C4#;
  GL_TEXTURE5                       : constant := 16#84C5#;
  GL_TEXTURE6                       : constant := 16#84C6#;
  GL_TEXTURE7                       : constant := 16#84C7#;
  GL_TEXTURE8                       : constant := 16#84C8#;
  GL_TEXTURE9                       : constant := 16#84C9#;
  GL_TEXTURE10                      : constant := 16#84CA#;
  GL_TEXTURE11                      : constant := 16#84CB#;
  GL_TEXTURE12                      : constant := 16#84CC#;
  GL_TEXTURE13                      : constant := 16#84CD#;
  GL_TEXTURE14                      : constant := 16#84CE#;
  GL_TEXTURE15                      : constant := 16#84CF#;
  GL_TEXTURE16                      : constant := 16#84D0#;
  GL_TEXTURE17                      : constant := 16#84D1#;
  GL_TEXTURE18                      : constant := 16#84D2#;
  GL_TEXTURE19                      : constant := 16#84D3#;
  GL_TEXTURE20                      : constant := 16#84D4#;
  GL_TEXTURE21                      : constant := 16#84D5#;
  GL_TEXTURE22                      : constant := 16#84D6#;
  GL_TEXTURE23                      : constant := 16#84D7#;
  GL_TEXTURE24                      : constant := 16#84D8#;
  GL_TEXTURE25                      : constant := 16#84D9#;
  GL_TEXTURE26                      : constant := 16#84DA#;
  GL_TEXTURE27                      : constant := 16#84DB#;
  GL_TEXTURE28                      : constant := 16#84DC#;
  GL_TEXTURE29                      : constant := 16#84DD#;
  GL_TEXTURE30                      : constant := 16#84DE#;
  GL_TEXTURE31                      : constant := 16#84DF#;
  GL_ACTIVE_TEXTURE                 : constant := 16#84E0#;
  GL_CLIENT_ACTIVE_TEXTURE          : constant := 16#84E1#;
  GL_MAX_TEXTURE_UNITS              : constant := 16#84E2#;
  GL_TRANSPOSE_MODELVIEW_MATRIX     : constant := 16#84E3#;
  GL_TRANSPOSE_PROJECTION_MATRIX    : constant := 16#84E4#;
  GL_TRANSPOSE_TEXTURE_MATRIX       : constant := 16#84E5#;
  GL_TRANSPOSE_COLOR_MATRIX         : constant := 16#84E6#;
  GL_MULTISAMPLE                    : constant := 16#809D#;
  GL_SAMPLE_ALPHA_TO_COVERAGE       : constant := 16#809E#;
  GL_SAMPLE_ALPHA_TO_ONE            : constant := 16#809F#;
  GL_SAMPLE_COVERAGE                : constant := 16#80A0#;
  GL_SAMPLE_BUFFERS                 : constant := 16#80A8#;
  GL_SAMPLES                        : constant := 16#80A9#;
  GL_SAMPLE_COVERAGE_VALUE          : constant := 16#80AA#;
  GL_SAMPLE_COVERAGE_INVERT         : constant := 16#80AB#;
  GL_MULTISAMPLE_BIT                : constant := 16#2000_0000#;
  GL_NORMAL_MAP                     : constant := 16#8511#;
  GL_REFLECTION_MAP                 : constant := 16#8512#;
  GL_TEXTURE_CUBE_MAP               : constant := 16#8513#;
  GL_TEXTURE_BINDING_CUBE_MAP       : constant := 16#8514#;
  GL_TEXTURE_CUBE_MAP_POSITIVE_X    : constant := 16#8515#;
  GL_TEXTURE_CUBE_MAP_NEGATIVE_X    : constant := 16#8516#;
  GL_TEXTURE_CUBE_MAP_POSITIVE_Y    : constant := 16#8517#;
  GL_TEXTURE_CUBE_MAP_NEGATIVE_Y    : constant := 16#8518#;
  GL_TEXTURE_CUBE_MAP_POSITIVE_Z    : constant := 16#8519#;
  GL_TEXTURE_CUBE_MAP_NEGATIVE_Z    : constant := 16#851A#;
  GL_PROXY_TEXTURE_CUBE_MAP         : constant := 16#851B#;
  GL_MAX_CUBE_MAP_TEXTURE_SIZE      : constant := 16#851C#;
  GL_COMPRESSED_ALPHA               : constant := 16#84E9#;
  GL_COMPRESSED_LUMINANCE           : constant := 16#84EA#;
  GL_COMPRESSED_LUMINANCE_ALPHA     : constant := 16#84EB#;
  GL_COMPRESSED_INTENSITY           : constant := 16#84EC#;
  GL_COMPRESSED_RGB                 : constant := 16#84ED#;
  GL_COMPRESSED_RGBA                : constant := 16#84EE#;
  GL_TEXTURE_COMPRESSION_HINT       : constant := 16#84EF#;
  GL_TEXTURE_COMPRESSED_IMAGE_SIZE  : constant := 16#86A0#;
  GL_TEXTURE_COMPRESSED             : constant := 16#86A1#;
  GL_NUM_COMPRESSED_TEXTURE_FORMATS : constant := 16#86A2#;
  GL_COMPRESSED_TEXTURE_FORMATS     : constant := 16#86A3#;
  GL_CLAMP_TO_BORDER                : constant := 16#812D#;
  GL_COMBINE                        : constant := 16#8570#;
  GL_COMBINE_RGB                    : constant := 16#8571#;
  GL_COMBINE_ALPHA                  : constant := 16#8572#;
  GL_SOURCE0_RGB                    : constant := 16#8580#;
  GL_SOURCE1_RGB                    : constant := 16#8581#;
  GL_SOURCE2_RGB                    : constant := 16#8582#;
  GL_SOURCE0_ALPHA                  : constant := 16#8588#;
  GL_SOURCE1_ALPHA                  : constant := 16#8589#;
  GL_SOURCE2_ALPHA                  : constant := 16#858A#;
  GL_OPERAND0_RGB                   : constant := 16#8590#;
  GL_OPERAND1_RGB                   : constant := 16#8591#;
  GL_OPERAND2_RGB                   : constant := 16#8592#;
  GL_OPERAND0_ALPHA                 : constant := 16#8598#;
  GL_OPERAND1_ALPHA                 : constant := 16#8599#;
  GL_OPERAND2_ALPHA                 : constant := 16#859A#;
  GL_RGB_SCALE                      : constant := 16#8573#;
  GL_ADD_SIGNED                     : constant := 16#8574#;
  GL_INTERPOLATE                    : constant := 16#8575#;
  GL_SUBTRACT                       : constant := 16#84E7#;
  GL_CONSTANT                       : constant := 16#8576#;
  GL_PRIMARY_COLOR                  : constant := 16#8577#;
  GL_PREVIOUS                       : constant := 16#8578#;
  GL_DOT3_RGB                       : constant := 16#86AE#;
  GL_DOT3_RGBA                      : constant := 16#86AF#;
  --#endif

  --#ifndef GL_VERSION_1_4
  GL_BLEND_DST_RGB                  : constant := 16#80C8#;
  GL_BLEND_SRC_RGB                  : constant := 16#80C9#;
  GL_BLEND_DST_ALPHA                : constant := 16#80CA#;
  GL_BLEND_SRC_ALPHA                : constant := 16#80CB#;
  GL_POINT_SIZE_MIN                 : constant := 16#8126#;
  GL_POINT_SIZE_MAX                 : constant := 16#8127#;
  GL_POINT_FADE_THRESHOLD_SIZE      : constant := 16#8128#;
  GL_POINT_DISTANCE_ATTENUATION     : constant := 16#8129#;
  GL_GENERATE_MIPMAP                : constant := 16#8191#;
  GL_GENERATE_MIPMAP_HINT           : constant := 16#8192#;
  GL_DEPTH_COMPONENT16              : constant := 16#81A5#;
  GL_DEPTH_COMPONENT24              : constant := 16#81A6#;
  GL_DEPTH_COMPONENT32              : constant := 16#81A7#;
  GL_MIRRORED_REPEAT                : constant := 16#8370#;
  GL_FOG_COORDINATE_SOURCE          : constant := 16#8450#;
  GL_FOG_COORDINATE                 : constant := 16#8451#;
  GL_FRAGMENT_DEPTH                 : constant := 16#8452#;
  GL_CURRENT_FOG_COORDINATE         : constant := 16#8453#;
  GL_FOG_COORDINATE_ARRAY_TYPE      : constant := 16#8454#;
  GL_FOG_COORDINATE_ARRAY_STRIDE    : constant := 16#8455#;
  GL_FOG_COORDINATE_ARRAY_POINTER   : constant := 16#8456#;
  GL_FOG_COORDINATE_ARRAY           : constant := 16#8457#;
  GL_COLOR_SUM                      : constant := 16#8458#;
  GL_CURRENT_SECONDARY_COLOR        : constant := 16#8459#;
  GL_SECONDARY_COLOR_ARRAY_SIZE     : constant := 16#845A#;
  GL_SECONDARY_COLOR_ARRAY_TYPE     : constant := 16#845B#;
  GL_SECONDARY_COLOR_ARRAY_STRIDE   : constant := 16#845C#;
  GL_SECONDARY_COLOR_ARRAY_POINTER  : constant := 16#845D#;
  GL_SECONDARY_COLOR_ARRAY          : constant := 16#845E#;
  GL_MAX_TEXTURE_LOD_BIAS           : constant := 16#84FD#;
  GL_TEXTURE_FILTER_CONTROL         : constant := 16#8500#;
  GL_TEXTURE_LOD_BIAS               : constant := 16#8501#;
  GL_INCR_WRAP                      : constant := 16#8507#;
  GL_DECR_WRAP                      : constant := 16#8508#;
  GL_TEXTURE_DEPTH_SIZE             : constant := 16#884A#;
  GL_DEPTH_TEXTURE_MODE             : constant := 16#884B#;
  GL_TEXTURE_COMPARE_MODE           : constant := 16#884C#;
  GL_TEXTURE_COMPARE_FUNC           : constant := 16#884D#;
  GL_COMPARE_R_TO_TEXTURE           : constant := 16#884E#;
  --#endif

  --#ifndef GL_VERSION_1_5
  GL_BUFFER_SIZE                          : constant := 16#8764#;
  GL_BUFFER_USAGE                         : constant := 16#8765#;
  GL_QUERY_COUNTER_BITS                   : constant := 16#8864#;
  GL_CURRENT_QUERY                        : constant := 16#8865#;
  GL_QUERY_RESULT                         : constant := 16#8866#;
  GL_QUERY_RESULT_AVAILABLE               : constant := 16#8867#;
  GL_ARRAY_BUFFER                         : constant := 16#8892#;
  GL_ELEMENT_ARRAY_BUFFER                 : constant := 16#8893#;
  GL_ARRAY_BUFFER_BINDING                 : constant := 16#8894#;
  GL_ELEMENT_ARRAY_BUFFER_BINDING         : constant := 16#8895#;
  GL_VERTEX_ARRAY_BUFFER_BINDING          : constant := 16#8896#;
  GL_NORMAL_ARRAY_BUFFER_BINDING          : constant := 16#8897#;
  GL_COLOR_ARRAY_BUFFER_BINDING           : constant := 16#8898#;
  GL_INDEX_ARRAY_BUFFER_BINDING           : constant := 16#8899#;
  GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING   : constant := 16#889A#;
  GL_EDGE_FLAG_ARRAY_BUFFER_BINDING       : constant := 16#889B#;
  GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING : constant := 16#889C#;
  GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING  : constant := 16#889D#;
  GL_WEIGHT_ARRAY_BUFFER_BINDING          : constant := 16#889E#;
  GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING   : constant := 16#889F#;
  GL_READ_ONLY                            : constant := 16#88B8#;
  GL_WRITE_ONLY                           : constant := 16#88B9#;
  GL_READ_WRITE                           : constant := 16#88BA#;
  GL_BUFFER_ACCESS                        : constant := 16#88BB#;
  GL_BUFFER_MAPPED                        : constant := 16#88BC#;
  GL_BUFFER_MAP_POINTER                   : constant := 16#88BD#;
  GL_STREAM_DRAW                          : constant := 16#88E0#;
  GL_STREAM_READ                          : constant := 16#88E1#;
  GL_STREAM_COPY                          : constant := 16#88E2#;
  GL_STATIC_DRAW                          : constant := 16#88E4#;
  GL_STATIC_READ                          : constant := 16#88E5#;
  GL_STATIC_COPY                          : constant := 16#88E6#;
  GL_DYNAMIC_DRAW                         : constant := 16#88E8#;
  GL_DYNAMIC_READ                         : constant := 16#88E9#;
  GL_DYNAMIC_COPY                         : constant := 16#88EA#;
  GL_SAMPLES_PASSED                       : constant := 16#8914#;
  GL_FOG_COORD_SOURCE                     : constant := GL_FOG_COORDINATE_SOURCE;
  GL_FOG_COORD                            : constant := GL_FOG_COORDINATE;
  GL_CURRENT_FOG_COORD                    : constant := GL_CURRENT_FOG_COORDINATE;
  GL_FOG_COORD_ARRAY_TYPE                 : constant := GL_FOG_COORDINATE_ARRAY_TYPE;
  GL_FOG_COORD_ARRAY_STRIDE               : constant := GL_FOG_COORDINATE_ARRAY_STRIDE;
  GL_FOG_COORD_ARRAY_POINTER              : constant := GL_FOG_COORDINATE_ARRAY_POINTER;
  GL_FOG_COORD_ARRAY                      : constant := GL_FOG_COORDINATE_ARRAY;
  GL_FOG_COORD_ARRAY_BUFFER_BINDING       : constant := GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING;
  GL_SRC0_RGB                             : constant := GL_SOURCE0_RGB;
  GL_SRC1_RGB                             : constant := GL_SOURCE1_RGB;
  GL_SRC2_RGB                             : constant := GL_SOURCE2_RGB;
  GL_SRC0_ALPHA                           : constant := GL_SOURCE0_ALPHA;
  GL_SRC1_ALPHA                           : constant := GL_SOURCE1_ALPHA;
  GL_SRC2_ALPHA                           : constant := GL_SOURCE2_ALPHA;
  --#endif

  --#ifndef GL_ARB_multitexture
  GL_TEXTURE0_ARB                   : constant := 16#84C0#;
  GL_TEXTURE1_ARB                   : constant := 16#84C1#;
  GL_TEXTURE2_ARB                   : constant := 16#84C2#;
  GL_TEXTURE3_ARB                   : constant := 16#84C3#;
  GL_TEXTURE4_ARB                   : constant := 16#84C4#;
  GL_TEXTURE5_ARB                   : constant := 16#84C5#;
  GL_TEXTURE6_ARB                   : constant := 16#84C6#;
  GL_TEXTURE7_ARB                   : constant := 16#84C7#;
  GL_TEXTURE8_ARB                   : constant := 16#84C8#;
  GL_TEXTURE9_ARB                   : constant := 16#84C9#;
  GL_TEXTURE10_ARB                  : constant := 16#84CA#;
  GL_TEXTURE11_ARB                  : constant := 16#84CB#;
  GL_TEXTURE12_ARB                  : constant := 16#84CC#;
  GL_TEXTURE13_ARB                  : constant := 16#84CD#;
  GL_TEXTURE14_ARB                  : constant := 16#84CE#;
  GL_TEXTURE15_ARB                  : constant := 16#84CF#;
  GL_TEXTURE16_ARB                  : constant := 16#84D0#;
  GL_TEXTURE17_ARB                  : constant := 16#84D1#;
  GL_TEXTURE18_ARB                  : constant := 16#84D2#;
  GL_TEXTURE19_ARB                  : constant := 16#84D3#;
  GL_TEXTURE20_ARB                  : constant := 16#84D4#;
  GL_TEXTURE21_ARB                  : constant := 16#84D5#;
  GL_TEXTURE22_ARB                  : constant := 16#84D6#;
  GL_TEXTURE23_ARB                  : constant := 16#84D7#;
  GL_TEXTURE24_ARB                  : constant := 16#84D8#;
  GL_TEXTURE25_ARB                  : constant := 16#84D9#;
  GL_TEXTURE26_ARB                  : constant := 16#84DA#;
  GL_TEXTURE27_ARB                  : constant := 16#84DB#;
  GL_TEXTURE28_ARB                  : constant := 16#84DC#;
  GL_TEXTURE29_ARB                  : constant := 16#84DD#;
  GL_TEXTURE30_ARB                  : constant := 16#84DE#;
  GL_TEXTURE31_ARB                  : constant := 16#84DF#;
  GL_ACTIVE_TEXTURE_ARB             : constant := 16#84E0#;
  GL_CLIENT_ACTIVE_TEXTURE_ARB      : constant := 16#84E1#;
  GL_MAX_TEXTURE_UNITS_ARB          : constant := 16#84E2#;
  --#endif

  --#ifndef GL_ARB_transpose_matrix
  GL_TRANSPOSE_MODELVIEW_MATRIX_ARB  : constant := 16#84E3#;
  GL_TRANSPOSE_PROJECTION_MATRIX_ARB : constant := 16#84E4#;
  GL_TRANSPOSE_TEXTURE_MATRIX_ARB    : constant := 16#84E5#;
  GL_TRANSPOSE_COLOR_MATRIX_ARB      : constant := 16#84E6#;
  --#endif

  --#ifndef GL_ARB_multisample
  GL_MULTISAMPLE_ARB                : constant := 16#809D#;
  GL_SAMPLE_ALPHA_TO_COVERAGE_ARB   : constant := 16#809E#;
  GL_SAMPLE_ALPHA_TO_ONE_ARB        : constant := 16#809F#;
  GL_SAMPLE_COVERAGE_ARB            : constant := 16#80A0#;
  GL_SAMPLE_BUFFERS_ARB             : constant := 16#80A8#;
  GL_SAMPLES_ARB                    : constant := 16#80A9#;
  GL_SAMPLE_COVERAGE_VALUE_ARB      : constant := 16#80AA#;
  GL_SAMPLE_COVERAGE_INVERT_ARB     : constant := 16#80AB#;
  GL_MULTISAMPLE_BIT_ARB            : constant := 16#2000_0000#;
  --#endif

  --#ifndef GL_ARB_texture_env_add
  --#endif

  --#ifndef GL_ARB_texture_cube_map
  GL_NORMAL_MAP_ARB                  : constant := 16#8511#;
  GL_REFLECTION_MAP_ARB              : constant := 16#8512#;
  GL_TEXTURE_CUBE_MAP_ARB            : constant := 16#8513#;
  GL_TEXTURE_BINDING_CUBE_MAP_ARB    : constant := 16#8514#;
  GL_TEXTURE_CUBE_MAP_POSITIVE_X_ARB : constant := 16#8515#;
  GL_TEXTURE_CUBE_MAP_NEGATIVE_X_ARB : constant := 16#8516#;
  GL_TEXTURE_CUBE_MAP_POSITIVE_Y_ARB : constant := 16#8517#;
  GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_ARB : constant := 16#8518#;
  GL_TEXTURE_CUBE_MAP_POSITIVE_Z_ARB : constant := 16#8519#;
  GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_ARB : constant := 16#851A#;
  GL_PROXY_TEXTURE_CUBE_MAP_ARB      : constant := 16#851B#;
  GL_MAX_CUBE_MAP_TEXTURE_SIZE_ARB   : constant := 16#851C#;
  --#endif

  --#ifndef GL_ARB_texture_compression
  GL_COMPRESSED_ALPHA_ARB               : constant := 16#84E9#;
  GL_COMPRESSED_LUMINANCE_ARB           : constant := 16#84EA#;
  GL_COMPRESSED_LUMINANCE_ALPHA_ARB     : constant := 16#84EB#;
  GL_COMPRESSED_INTENSITY_ARB           : constant := 16#84EC#;
  GL_COMPRESSED_RGB_ARB                 : constant := 16#84ED#;
  GL_COMPRESSED_RGBA_ARB                : constant := 16#84EE#;
  GL_TEXTURE_COMPRESSION_HINT_ARB       : constant := 16#84EF#;
  GL_TEXTURE_COMPRESSED_IMAGE_SIZE_ARB  : constant := 16#86A0#;
  GL_TEXTURE_COMPRESSED_ARB             : constant := 16#86A1#;
  GL_NUM_COMPRESSED_TEXTURE_FORMATS_ARB : constant := 16#86A2#;
  GL_COMPRESSED_TEXTURE_FORMATS_ARB     : constant := 16#86A3#;
  --#endif

  --#ifndef GL_ARB_texture_border_clamp
  GL_CLAMP_TO_BORDER_ARB            : constant := 16#812D#;
  --#endif

  --#ifndef GL_ARB_point_parameters
  GL_POINT_SIZE_MIN_ARB             : constant := 16#8126#;
  GL_POINT_SIZE_MAX_ARB             : constant := 16#8127#;
  GL_POINT_FADE_THRESHOLD_SIZE_ARB  : constant := 16#8128#;
  GL_POINT_DISTANCE_ATTENUATION_ARB : constant := 16#8129#;
  --#endif

  --#ifndef GL_ARB_vertex_blend
  GL_MAX_VERTEX_UNITS_ARB           : constant := 16#86A4#;
  GL_ACTIVE_VERTEX_UNITS_ARB        : constant := 16#86A5#;
  GL_WEIGHT_SUM_UNITY_ARB           : constant := 16#86A6#;
  GL_VERTEX_BLEND_ARB               : constant := 16#86A7#;
  GL_CURRENT_WEIGHT_ARB             : constant := 16#86A8#;
  GL_WEIGHT_ARRAY_TYPE_ARB          : constant := 16#86A9#;
  GL_WEIGHT_ARRAY_STRIDE_ARB        : constant := 16#86AA#;
  GL_WEIGHT_ARRAY_SIZE_ARB          : constant := 16#86AB#;
  GL_WEIGHT_ARRAY_POINTER_ARB       : constant := 16#86AC#;
  GL_WEIGHT_ARRAY_ARB               : constant := 16#86AD#;
  GL_MODELVIEW0_ARB                 : constant := 16#1700#;
  GL_MODELVIEW1_ARB                 : constant := 16#850A#;
  GL_MODELVIEW2_ARB                 : constant := 16#8722#;
  GL_MODELVIEW3_ARB                 : constant := 16#8723#;
  GL_MODELVIEW4_ARB                 : constant := 16#8724#;
  GL_MODELVIEW5_ARB                 : constant := 16#8725#;
  GL_MODELVIEW6_ARB                 : constant := 16#8726#;
  GL_MODELVIEW7_ARB                 : constant := 16#8727#;
  GL_MODELVIEW8_ARB                 : constant := 16#8728#;
  GL_MODELVIEW9_ARB                 : constant := 16#8729#;
  GL_MODELVIEW10_ARB                : constant := 16#872A#;
  GL_MODELVIEW11_ARB                : constant := 16#872B#;
  GL_MODELVIEW12_ARB                : constant := 16#872C#;
  GL_MODELVIEW13_ARB                : constant := 16#872D#;
  GL_MODELVIEW14_ARB                : constant := 16#872E#;
  GL_MODELVIEW15_ARB                : constant := 16#872F#;
  GL_MODELVIEW16_ARB                : constant := 16#8730#;
  GL_MODELVIEW17_ARB                : constant := 16#8731#;
  GL_MODELVIEW18_ARB                : constant := 16#8732#;
  GL_MODELVIEW19_ARB                : constant := 16#8733#;
  GL_MODELVIEW20_ARB                : constant := 16#8734#;
  GL_MODELVIEW21_ARB                : constant := 16#8735#;
  GL_MODELVIEW22_ARB                : constant := 16#8736#;
  GL_MODELVIEW23_ARB                : constant := 16#8737#;
  GL_MODELVIEW24_ARB                : constant := 16#8738#;
  GL_MODELVIEW25_ARB                : constant := 16#8739#;
  GL_MODELVIEW26_ARB                : constant := 16#873A#;
  GL_MODELVIEW27_ARB                : constant := 16#873B#;
  GL_MODELVIEW28_ARB                : constant := 16#873C#;
  GL_MODELVIEW29_ARB                : constant := 16#873D#;
  GL_MODELVIEW30_ARB                : constant := 16#873E#;
  GL_MODELVIEW31_ARB                : constant := 16#873F#;
  --#endif

  --#ifndef GL_ARB_matrix_palette
  GL_MATRIX_PALETTE_ARB                 : constant := 16#8840#;
  GL_MAX_MATRIX_PALETTE_STACK_DEPTH_ARB : constant := 16#8841#;
  GL_MAX_PALETTE_MATRICES_ARB           : constant := 16#8842#;
  GL_CURRENT_PALETTE_MATRIX_ARB         : constant := 16#8843#;
  GL_MATRIX_INDEX_ARRAY_ARB             : constant := 16#8844#;
  GL_CURRENT_MATRIX_INDEX_ARB           : constant := 16#8845#;
  GL_MATRIX_INDEX_ARRAY_SIZE_ARB        : constant := 16#8846#;
  GL_MATRIX_INDEX_ARRAY_TYPE_ARB        : constant := 16#8847#;
  GL_MATRIX_INDEX_ARRAY_STRIDE_ARB      : constant := 16#8848#;
  GL_MATRIX_INDEX_ARRAY_POINTER_ARB     : constant := 16#8849#;
  --#endif

  --#ifndef GL_ARB_texture_env_combine
  GL_COMBINE_ARB                    : constant := 16#8570#;
  GL_COMBINE_RGB_ARB                : constant := 16#8571#;
  GL_COMBINE_ALPHA_ARB              : constant := 16#8572#;
  GL_SOURCE0_RGB_ARB                : constant := 16#8580#;
  GL_SOURCE1_RGB_ARB                : constant := 16#8581#;
  GL_SOURCE2_RGB_ARB                : constant := 16#8582#;
  GL_SOURCE0_ALPHA_ARB              : constant := 16#8588#;
  GL_SOURCE1_ALPHA_ARB              : constant := 16#8589#;
  GL_SOURCE2_ALPHA_ARB              : constant := 16#858A#;
  GL_OPERAND0_RGB_ARB               : constant := 16#8590#;
  GL_OPERAND1_RGB_ARB               : constant := 16#8591#;
  GL_OPERAND2_RGB_ARB               : constant := 16#8592#;
  GL_OPERAND0_ALPHA_ARB             : constant := 16#8598#;
  GL_OPERAND1_ALPHA_ARB             : constant := 16#8599#;
  GL_OPERAND2_ALPHA_ARB             : constant := 16#859A#;
  GL_RGB_SCALE_ARB                  : constant := 16#8573#;
  GL_ADD_SIGNED_ARB                 : constant := 16#8574#;
  GL_INTERPOLATE_ARB                : constant := 16#8575#;
  GL_SUBTRACT_ARB                   : constant := 16#84E7#;
  GL_CONSTANT_ARB                   : constant := 16#8576#;
  GL_PRIMARY_COLOR_ARB              : constant := 16#8577#;
  GL_PREVIOUS_ARB                   : constant := 16#8578#;
  --#endif

  --#ifndef GL_ARB_texture_env_crossbar
  --#endif

  --#ifndef GL_ARB_texture_env_dot3
  GL_DOT3_RGB_ARB                   : constant := 16#86AE#;
  GL_DOT3_RGBA_ARB                  : constant := 16#86AF#;
  --#endif

  --#ifndef GL_ARB_texture_mirrored_repeat
  GL_MIRRORED_REPEAT_ARB            : constant := 16#8370#;
  --#endif

  --#ifndef GL_ARB_depth_texture
  GL_DEPTH_COMPONENT16_ARB          : constant := 16#81A5#;
  GL_DEPTH_COMPONENT24_ARB          : constant := 16#81A6#;
  GL_DEPTH_COMPONENT32_ARB          : constant := 16#81A7#;
  GL_TEXTURE_DEPTH_SIZE_ARB         : constant := 16#884A#;
  GL_DEPTH_TEXTURE_MODE_ARB         : constant := 16#884B#;
  --#endif

  --#ifndef GL_ARB_shadow
  GL_TEXTURE_COMPARE_MODE_ARB       : constant := 16#884C#;
  GL_TEXTURE_COMPARE_FUNC_ARB       : constant := 16#884D#;
  GL_COMPARE_R_TO_TEXTURE_ARB       : constant := 16#884E#;
  --#endif

  --#ifndef GL_ARB_shadow_ambient
  GL_TEXTURE_COMPARE_FAIL_VALUE_ARB : constant := 16#80BF#;
  --#endif

  --#ifndef GL_ARB_window_pos
  --#endif

  --#ifndef GL_ARB_vertex_program
  GL_COLOR_SUM_ARB                            : constant := 16#8458#;
  GL_VERTEX_PROGRAM_ARB                       : constant := 16#8620#;
  GL_VERTEX_ATTRIB_ARRAY_ENABLED_ARB          : constant := 16#8622#;
  GL_VERTEX_ATTRIB_ARRAY_SIZE_ARB             : constant := 16#8623#;
  GL_VERTEX_ATTRIB_ARRAY_STRIDE_ARB           : constant := 16#8624#;
  GL_VERTEX_ATTRIB_ARRAY_TYPE_ARB             : constant := 16#8625#;
  GL_CURRENT_VERTEX_ATTRIB_ARB                : constant := 16#8626#;
  GL_PROGRAM_LENGTH_ARB                       : constant := 16#8627#;
  GL_PROGRAM_STRING_ARB                       : constant := 16#8628#;
  GL_MAX_PROGRAM_MATRIX_STACK_DEPTH_ARB       : constant := 16#862E#;
  GL_MAX_PROGRAM_MATRICES_ARB                 : constant := 16#862F#;
  GL_CURRENT_MATRIX_STACK_DEPTH_ARB           : constant := 16#8640#;
  GL_CURRENT_MATRIX_ARB                       : constant := 16#8641#;
  GL_VERTEX_PROGRAM_POINT_SIZE_ARB            : constant := 16#8642#;
  GL_VERTEX_PROGRAM_TWO_SIDE_ARB              : constant := 16#8643#;
  GL_VERTEX_ATTRIB_ARRAY_POINTER_ARB          : constant := 16#8645#;
  GL_PROGRAM_ERROR_POSITION_ARB               : constant := 16#864B#;
  GL_PROGRAM_BINDING_ARB                      : constant := 16#8677#;
  GL_MAX_VERTEX_ATTRIBS_ARB                   : constant := 16#8869#;
  GL_VERTEX_ATTRIB_ARRAY_NORMALIZED_ARB       : constant := 16#886A#;
  GL_PROGRAM_ERROR_STRING_ARB                 : constant := 16#8874#;
  GL_PROGRAM_FORMAT_ASCII_ARB                 : constant := 16#8875#;
  GL_PROGRAM_FORMAT_ARB                       : constant := 16#8876#;
  GL_PROGRAM_INSTRUCTIONS_ARB                 : constant := 16#88A0#;
  GL_MAX_PROGRAM_INSTRUCTIONS_ARB             : constant := 16#88A1#;
  GL_PROGRAM_NATIVE_INSTRUCTIONS_ARB          : constant := 16#88A2#;
  GL_MAX_PROGRAM_NATIVE_INSTRUCTIONS_ARB      : constant := 16#88A3#;
  GL_PROGRAM_TEMPORARIES_ARB                  : constant := 16#88A4#;
  GL_MAX_PROGRAM_TEMPORARIES_ARB              : constant := 16#88A5#;
  GL_PROGRAM_NATIVE_TEMPORARIES_ARB           : constant := 16#88A6#;
  GL_MAX_PROGRAM_NATIVE_TEMPORARIES_ARB       : constant := 16#88A7#;
  GL_PROGRAM_PARAMETERS_ARB                   : constant := 16#88A8#;
  GL_MAX_PROGRAM_PARAMETERS_ARB               : constant := 16#88A9#;
  GL_PROGRAM_NATIVE_PARAMETERS_ARB            : constant := 16#88AA#;
  GL_MAX_PROGRAM_NATIVE_PARAMETERS_ARB        : constant := 16#88AB#;
  GL_PROGRAM_ATTRIBS_ARB                      : constant := 16#88AC#;
  GL_MAX_PROGRAM_ATTRIBS_ARB                  : constant := 16#88AD#;
  GL_PROGRAM_NATIVE_ATTRIBS_ARB               : constant := 16#88AE#;
  GL_MAX_PROGRAM_NATIVE_ATTRIBS_ARB           : constant := 16#88AF#;
  GL_PROGRAM_ADDRESS_REGISTERS_ARB            : constant := 16#88B0#;
  GL_MAX_PROGRAM_ADDRESS_REGISTERS_ARB        : constant := 16#88B1#;
  GL_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB     : constant := 16#88B2#;
  GL_MAX_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB : constant := 16#88B3#;
  GL_MAX_PROGRAM_LOCAL_PARAMETERS_ARB         : constant := 16#88B4#;
  GL_MAX_PROGRAM_ENV_PARAMETERS_ARB           : constant := 16#88B5#;
  GL_PROGRAM_UNDER_NATIVE_LIMITS_ARB          : constant := 16#88B6#;
  GL_TRANSPOSE_CURRENT_MATRIX_ARB             : constant := 16#88B7#;
  GL_MATRIX0_ARB                              : constant := 16#88C0#;
  GL_MATRIX1_ARB                              : constant := 16#88C1#;
  GL_MATRIX2_ARB                              : constant := 16#88C2#;
  GL_MATRIX3_ARB                              : constant := 16#88C3#;
  GL_MATRIX4_ARB                              : constant := 16#88C4#;
  GL_MATRIX5_ARB                              : constant := 16#88C5#;
  GL_MATRIX6_ARB                              : constant := 16#88C6#;
  GL_MATRIX7_ARB                              : constant := 16#88C7#;
  GL_MATRIX8_ARB                              : constant := 16#88C8#;
  GL_MATRIX9_ARB                              : constant := 16#88C9#;
  GL_MATRIX10_ARB                             : constant := 16#88CA#;
  GL_MATRIX11_ARB                             : constant := 16#88CB#;
  GL_MATRIX12_ARB                             : constant := 16#88CC#;
  GL_MATRIX13_ARB                             : constant := 16#88CD#;
  GL_MATRIX14_ARB                             : constant := 16#88CE#;
  GL_MATRIX15_ARB                             : constant := 16#88CF#;
  GL_MATRIX16_ARB                             : constant := 16#88D0#;
  GL_MATRIX17_ARB                             : constant := 16#88D1#;
  GL_MATRIX18_ARB                             : constant := 16#88D2#;
  GL_MATRIX19_ARB                             : constant := 16#88D3#;
  GL_MATRIX20_ARB                             : constant := 16#88D4#;
  GL_MATRIX21_ARB                             : constant := 16#88D5#;
  GL_MATRIX22_ARB                             : constant := 16#88D6#;
  GL_MATRIX23_ARB                             : constant := 16#88D7#;
  GL_MATRIX24_ARB                             : constant := 16#88D8#;
  GL_MATRIX25_ARB                             : constant := 16#88D9#;
  GL_MATRIX26_ARB                             : constant := 16#88DA#;
  GL_MATRIX27_ARB                             : constant := 16#88DB#;
  GL_MATRIX28_ARB                             : constant := 16#88DC#;
  GL_MATRIX29_ARB                             : constant := 16#88DD#;
  GL_MATRIX30_ARB                             : constant := 16#88DE#;
  GL_MATRIX31_ARB                             : constant := 16#88DF#;
  --#endif

  --#ifndef GL_ARB_fragment_program
  GL_FRAGMENT_PROGRAM_ARB                     : constant := 16#8804#;
  GL_PROGRAM_ALU_INSTRUCTIONS_ARB             : constant := 16#8805#;
  GL_PROGRAM_TEX_INSTRUCTIONS_ARB             : constant := 16#8806#;
  GL_PROGRAM_TEX_INDIRECTIONS_ARB             : constant := 16#8807#;
  GL_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB      : constant := 16#8808#;
  GL_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB      : constant := 16#8809#;
  GL_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB      : constant := 16#880A#;
  GL_MAX_PROGRAM_ALU_INSTRUCTIONS_ARB         : constant := 16#880B#;
  GL_MAX_PROGRAM_TEX_INSTRUCTIONS_ARB         : constant := 16#880C#;
  GL_MAX_PROGRAM_TEX_INDIRECTIONS_ARB         : constant := 16#880D#;
  GL_MAX_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB  : constant := 16#880E#;
  GL_MAX_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB  : constant := 16#880F#;
  GL_MAX_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB  : constant := 16#8810#;
  GL_MAX_TEXTURE_COORDS_ARB                   : constant := 16#8871#;
  GL_MAX_TEXTURE_IMAGE_UNITS_ARB              : constant := 16#8872#;
  --#endif

  --#ifndef GL_ARB_vertex_buffer_object
  GL_BUFFER_SIZE_ARB                          : constant := 16#8764#;
  GL_BUFFER_USAGE_ARB                         : constant := 16#8765#;
  GL_ARRAY_BUFFER_ARB                         : constant := 16#8892#;
  GL_ELEMENT_ARRAY_BUFFER_ARB                 : constant := 16#8893#;
  GL_ARRAY_BUFFER_BINDING_ARB                 : constant := 16#8894#;
  GL_ELEMENT_ARRAY_BUFFER_BINDING_ARB         : constant := 16#8895#;
  GL_VERTEX_ARRAY_BUFFER_BINDING_ARB          : constant := 16#8896#;
  GL_NORMAL_ARRAY_BUFFER_BINDING_ARB          : constant := 16#8897#;
  GL_COLOR_ARRAY_BUFFER_BINDING_ARB           : constant := 16#8898#;
  GL_INDEX_ARRAY_BUFFER_BINDING_ARB           : constant := 16#8899#;
  GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING_ARB   : constant := 16#889A#;
  GL_EDGE_FLAG_ARRAY_BUFFER_BINDING_ARB       : constant := 16#889B#;
  GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING_ARB : constant := 16#889C#;
  GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING_ARB  : constant := 16#889D#;
  GL_WEIGHT_ARRAY_BUFFER_BINDING_ARB          : constant := 16#889E#;
  GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING_ARB   : constant := 16#889F#;
  GL_READ_ONLY_ARB                            : constant := 16#88B8#;
  GL_WRITE_ONLY_ARB                           : constant := 16#88B9#;
  GL_READ_WRITE_ARB                           : constant := 16#88BA#;
  GL_BUFFER_ACCESS_ARB                        : constant := 16#88BB#;
  GL_BUFFER_MAPPED_ARB                        : constant := 16#88BC#;
  GL_BUFFER_MAP_POINTER_ARB                   : constant := 16#88BD#;
  GL_STREAM_DRAW_ARB                          : constant := 16#88E0#;
  GL_STREAM_READ_ARB                          : constant := 16#88E1#;
  GL_STREAM_COPY_ARB                          : constant := 16#88E2#;
  GL_STATIC_DRAW_ARB                          : constant := 16#88E4#;
  GL_STATIC_READ_ARB                          : constant := 16#88E5#;
  GL_STATIC_COPY_ARB                          : constant := 16#88E6#;
  GL_DYNAMIC_DRAW_ARB                         : constant := 16#88E8#;
  GL_DYNAMIC_READ_ARB                         : constant := 16#88E9#;
  GL_DYNAMIC_COPY_ARB                         : constant := 16#88EA#;
  --#endif

  --#ifndef GL_ARB_occlusion_query
  GL_QUERY_COUNTER_BITS_ARB         : constant := 16#8864#;
  GL_CURRENT_QUERY_ARB              : constant := 16#8865#;
  GL_QUERY_RESULT_ARB               : constant := 16#8866#;
  GL_QUERY_RESULT_AVAILABLE_ARB     : constant := 16#8867#;
  GL_SAMPLES_PASSED_ARB             : constant := 16#8914#;
  --#endif

  --#ifndef GL_ARB_shader_objects
  GL_PROGRAM_OBJECT_ARB                   : constant := 16#8B40#;
  GL_SHADER_OBJECT_ARB                    : constant := 16#8B48#;
  GL_OBJECT_TYPE_ARB                      : constant := 16#8B4E#;
  GL_OBJECT_SUBTYPE_ARB                   : constant := 16#8B4F#;
  GL_FLOAT_VEC2_ARB                       : constant := 16#8B50#;
  GL_FLOAT_VEC3_ARB                       : constant := 16#8B51#;
  GL_FLOAT_VEC4_ARB                       : constant := 16#8B52#;
  GL_INT_VEC2_ARB                         : constant := 16#8B53#;
  GL_INT_VEC3_ARB                         : constant := 16#8B54#;
  GL_INT_VEC4_ARB                         : constant := 16#8B55#;
  GL_BOOL_ARB                             : constant := 16#8B56#;
  GL_BOOL_VEC2_ARB                        : constant := 16#8B57#;
  GL_BOOL_VEC3_ARB                        : constant := 16#8B58#;
  GL_BOOL_VEC4_ARB                        : constant := 16#8B59#;
  GL_FLOAT_MAT2_ARB                       : constant := 16#8B5A#;
  GL_FLOAT_MAT3_ARB                       : constant := 16#8B5B#;
  GL_FLOAT_MAT4_ARB                       : constant := 16#8B5C#;
  GL_SAMPLER_1D_ARB                       : constant := 16#8B5D#;
  GL_SAMPLER_2D_ARB                       : constant := 16#8B5E#;
  GL_SAMPLER_3D_ARB                       : constant := 16#8B5F#;
  GL_SAMPLER_CUBE_ARB                     : constant := 16#8B60#;
  GL_SAMPLER_1D_SHADOW_ARB                : constant := 16#8B61#;
  GL_SAMPLER_2D_SHADOW_ARB                : constant := 16#8B62#;
  GL_SAMPLER_2D_RECT_ARB                  : constant := 16#8B63#;
  GL_SAMPLER_2D_RECT_SHADOW_ARB           : constant := 16#8B64#;
  GL_OBJECT_DELETE_STATUS_ARB             : constant := 16#8B80#;
  GL_OBJECT_COMPILE_STATUS_ARB            : constant := 16#8B81#;
  GL_OBJECT_LINK_STATUS_ARB               : constant := 16#8B82#;
  GL_OBJECT_VALIDATE_STATUS_ARB           : constant := 16#8B83#;
  GL_OBJECT_INFO_LOG_LENGTH_ARB           : constant := 16#8B84#;
  GL_OBJECT_ATTACHED_OBJECTS_ARB          : constant := 16#8B85#;
  GL_OBJECT_ACTIVE_UNIFORMS_ARB           : constant := 16#8B86#;
  GL_OBJECT_ACTIVE_UNIFORM_MAX_LENGTH_ARB : constant := 16#8B87#;
  GL_OBJECT_SHADER_SOURCE_LENGTH_ARB      : constant := 16#8B88#;
  --#endif

  --#ifndef GL_ARB_vertex_shader
  GL_VERTEX_SHADER_ARB                      : constant := 16#8B31#;
  GL_MAX_VERTEX_UNIFORM_COMPONENTS_ARB      : constant := 16#8B4A#;
  GL_MAX_VARYING_FLOATS_ARB                 : constant := 16#8B4B#;
  GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS_ARB     : constant := 16#8B4C#;
  GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS_ARB   : constant := 16#8B4D#;
  GL_OBJECT_ACTIVE_ATTRIBUTES_ARB           : constant := 16#8B89#;
  GL_OBJECT_ACTIVE_ATTRIBUTE_MAX_LENGTH_ARB : constant := 16#8B8A#;
  --#endif

  --#ifndef GL_ARB_fragment_shader
  GL_FRAGMENT_SHADER_ARB                 : constant := 16#8B30#;
  GL_MAX_FRAGMENT_UNIFORM_COMPONENTS_ARB : constant := 16#8B49#;
  GL_FRAGMENT_SHADER_DERIVATIVE_HINT_ARB : constant := 16#8B8B#;
  --#endif

  --#ifndef GL_ARB_shading_language_100
  GL_SHADING_LANGUAGE_VERSION_ARB   : constant := 16#8B8C#;
  --#endif

  --#ifndef GL_ARB_texture_non_power_of_two
  --#endif

  --#ifndef GL_ARB_point_sprite
  GL_POINT_SPRITE_ARB               : constant := 16#8861#;
  GL_COORD_REPLACE_ARB              : constant := 16#8862#;
  --#endif

  --#ifndef GL_ARB_fragment_program_shadow
  --#endif

  --#ifndef GL_EXT_abgr
  GL_ABGR_EXT                       : constant := 16#8000#;
  --#endif

  --#ifndef GL_EXT_blend_color
  GL_CONSTANT_COLOR_EXT             : constant := 16#8001#;
  GL_ONE_MINUS_CONSTANT_COLOR_EXT   : constant := 16#8002#;
  GL_CONSTANT_ALPHA_EXT             : constant := 16#8003#;
  GL_ONE_MINUS_CONSTANT_ALPHA_EXT   : constant := 16#8004#;
  GL_BLEND_COLOR_EXT                : constant := 16#8005#;
  --#endif

  --#ifndef GL_EXT_polygon_offset
  GL_POLYGON_OFFSET_EXT             : constant := 16#8037#;
  GL_POLYGON_OFFSET_FACTOR_EXT      : constant := 16#8038#;
  GL_POLYGON_OFFSET_BIAS_EXT        : constant := 16#8039#;
  --#endif

  --#ifndef GL_EXT_texture
  GL_ALPHA4_EXT                     : constant := 16#803B#;
  GL_ALPHA8_EXT                     : constant := 16#803C#;
  GL_ALPHA12_EXT                    : constant := 16#803D#;
  GL_ALPHA16_EXT                    : constant := 16#803E#;
  GL_LUMINANCE4_EXT                 : constant := 16#803F#;
  GL_LUMINANCE8_EXT                 : constant := 16#8040#;
  GL_LUMINANCE12_EXT                : constant := 16#8041#;
  GL_LUMINANCE16_EXT                : constant := 16#8042#;
  GL_LUMINANCE4_ALPHA4_EXT          : constant := 16#8043#;
  GL_LUMINANCE6_ALPHA2_EXT          : constant := 16#8044#;
  GL_LUMINANCE8_ALPHA8_EXT          : constant := 16#8045#;
  GL_LUMINANCE12_ALPHA4_EXT         : constant := 16#8046#;
  GL_LUMINANCE12_ALPHA12_EXT        : constant := 16#8047#;
  GL_LUMINANCE16_ALPHA16_EXT        : constant := 16#8048#;
  GL_INTENSITY_EXT                  : constant := 16#8049#;
  GL_INTENSITY4_EXT                 : constant := 16#804A#;
  GL_INTENSITY8_EXT                 : constant := 16#804B#;
  GL_INTENSITY12_EXT                : constant := 16#804C#;
  GL_INTENSITY16_EXT                : constant := 16#804D#;
  GL_RGB2_EXT                       : constant := 16#804E#;
  GL_RGB4_EXT                       : constant := 16#804F#;
  GL_RGB5_EXT                       : constant := 16#8050#;
  GL_RGB8_EXT                       : constant := 16#8051#;
  GL_RGB10_EXT                      : constant := 16#8052#;
  GL_RGB12_EXT                      : constant := 16#8053#;
  GL_RGB16_EXT                      : constant := 16#8054#;
  GL_RGBA2_EXT                      : constant := 16#8055#;
  GL_RGBA4_EXT                      : constant := 16#8056#;
  GL_RGB5_A1_EXT                    : constant := 16#8057#;
  GL_RGBA8_EXT                      : constant := 16#8058#;
  GL_RGB10_A2_EXT                   : constant := 16#8059#;
  GL_RGBA12_EXT                     : constant := 16#805A#;
  GL_RGBA16_EXT                     : constant := 16#805B#;
  GL_TEXTURE_RED_SIZE_EXT           : constant := 16#805C#;
  GL_TEXTURE_GREEN_SIZE_EXT         : constant := 16#805D#;
  GL_TEXTURE_BLUE_SIZE_EXT          : constant := 16#805E#;
  GL_TEXTURE_ALPHA_SIZE_EXT         : constant := 16#805F#;
  GL_TEXTURE_LUMINANCE_SIZE_EXT     : constant := 16#8060#;
  GL_TEXTURE_INTENSITY_SIZE_EXT     : constant := 16#8061#;
  GL_REPLACE_EXT                    : constant := 16#8062#;
  GL_PROXY_TEXTURE_1D_EXT           : constant := 16#8063#;
  GL_PROXY_TEXTURE_2D_EXT           : constant := 16#8064#;
  GL_TEXTURE_TOO_LARGE_EXT          : constant := 16#8065#;
  --#endif

  --#ifndef GL_EXT_texture3D
  GL_PACK_SKIP_IMAGES_EXT           : constant := 16#806B#;
  GL_PACK_IMAGE_HEIGHT_EXT          : constant := 16#806C#;
  GL_UNPACK_SKIP_IMAGES_EXT         : constant := 16#806D#;
  GL_UNPACK_IMAGE_HEIGHT_EXT        : constant := 16#806E#;
  GL_TEXTURE_3D_EXT                 : constant := 16#806F#;
  GL_PROXY_TEXTURE_3D_EXT           : constant := 16#8070#;
  GL_TEXTURE_DEPTH_EXT              : constant := 16#8071#;
  GL_TEXTURE_WRAP_R_EXT             : constant := 16#8072#;
  GL_MAX_3D_TEXTURE_SIZE_EXT        : constant := 16#8073#;
  --#endif

  --#ifndef GL_SGIS_texture_filter4
  GL_FILTER4_SGIS                   : constant := 16#8146#;
  GL_TEXTURE_FILTER4_SIZE_SGIS      : constant := 16#8147#;
  --#endif

  --#ifndef GL_EXT_subtexture
  --#endif

  --#ifndef GL_EXT_copy_texture
  --#endif

  --#ifndef GL_EXT_histogram
  GL_HISTOGRAM_EXT                  : constant := 16#8024#;
  GL_PROXY_HISTOGRAM_EXT            : constant := 16#8025#;
  GL_HISTOGRAM_WIDTH_EXT            : constant := 16#8026#;
  GL_HISTOGRAM_FORMAT_EXT           : constant := 16#8027#;
  GL_HISTOGRAM_RED_SIZE_EXT         : constant := 16#8028#;
  GL_HISTOGRAM_GREEN_SIZE_EXT       : constant := 16#8029#;
  GL_HISTOGRAM_BLUE_SIZE_EXT        : constant := 16#802A#;
  GL_HISTOGRAM_ALPHA_SIZE_EXT       : constant := 16#802B#;
  GL_HISTOGRAM_LUMINANCE_SIZE_EXT   : constant := 16#802C#;
  GL_HISTOGRAM_SINK_EXT             : constant := 16#802D#;
  GL_MINMAX_EXT                     : constant := 16#802E#;
  GL_MINMAX_FORMAT_EXT              : constant := 16#802F#;
  GL_MINMAX_SINK_EXT                : constant := 16#8030#;
  GL_TABLE_TOO_LARGE_EXT            : constant := 16#8031#;
  --#endif

  --#ifndef GL_EXT_convolution
  GL_CONVOLUTION_1D_EXT               : constant := 16#8010#;
  GL_CONVOLUTION_2D_EXT               : constant := 16#8011#;
  GL_SEPARABLE_2D_EXT                 : constant := 16#8012#;
  GL_CONVOLUTION_BORDER_MODE_EXT      : constant := 16#8013#;
  GL_CONVOLUTION_FILTER_SCALE_EXT     : constant := 16#8014#;
  GL_CONVOLUTION_FILTER_BIAS_EXT      : constant := 16#8015#;
  GL_REDUCE_EXT                       : constant := 16#8016#;
  GL_CONVOLUTION_FORMAT_EXT           : constant := 16#8017#;
  GL_CONVOLUTION_WIDTH_EXT            : constant := 16#8018#;
  GL_CONVOLUTION_HEIGHT_EXT           : constant := 16#8019#;
  GL_MAX_CONVOLUTION_WIDTH_EXT        : constant := 16#801A#;
  GL_MAX_CONVOLUTION_HEIGHT_EXT       : constant := 16#801B#;
  GL_POST_CONVOLUTION_RED_SCALE_EXT   : constant := 16#801C#;
  GL_POST_CONVOLUTION_GREEN_SCALE_EXT : constant := 16#801D#;
  GL_POST_CONVOLUTION_BLUE_SCALE_EXT  : constant := 16#801E#;
  GL_POST_CONVOLUTION_ALPHA_SCALE_EXT : constant := 16#801F#;
  GL_POST_CONVOLUTION_RED_BIAS_EXT    : constant := 16#8020#;
  GL_POST_CONVOLUTION_GREEN_BIAS_EXT  : constant := 16#8021#;
  GL_POST_CONVOLUTION_BLUE_BIAS_EXT   : constant := 16#8022#;
  GL_POST_CONVOLUTION_ALPHA_BIAS_EXT  : constant := 16#8023#;
  --#endif

  --#ifndef GL_SGI_color_matrix
  GL_COLOR_MATRIX_SGI                  : constant := 16#80B1#;
  GL_COLOR_MATRIX_STACK_DEPTH_SGI      : constant := 16#80B2#;
  GL_MAX_COLOR_MATRIX_STACK_DEPTH_SGI  : constant := 16#80B3#;
  GL_POST_COLOR_MATRIX_RED_SCALE_SGI   : constant := 16#80B4#;
  GL_POST_COLOR_MATRIX_GREEN_SCALE_SGI : constant := 16#80B5#;
  GL_POST_COLOR_MATRIX_BLUE_SCALE_SGI  : constant := 16#80B6#;
  GL_POST_COLOR_MATRIX_ALPHA_SCALE_SGI : constant := 16#80B7#;
  GL_POST_COLOR_MATRIX_RED_BIAS_SGI    : constant := 16#80B8#;
  GL_POST_COLOR_MATRIX_GREEN_BIAS_SGI  : constant := 16#80B9#;
  GL_POST_COLOR_MATRIX_BLUE_BIAS_SGI   : constant := 16#80BA#;
  GL_POST_COLOR_MATRIX_ALPHA_BIAS_SGI  : constant := 16#80BB#;
  --#endif

  --#ifndef GL_SGI_color_table
  GL_COLOR_TABLE_SGI                         : constant := 16#80D0#;
  GL_POST_CONVOLUTION_COLOR_TABLE_SGI        : constant := 16#80D1#;
  GL_POST_COLOR_MATRIX_COLOR_TABLE_SGI       : constant := 16#80D2#;
  GL_PROXY_COLOR_TABLE_SGI                   : constant := 16#80D3#;
  GL_PROXY_POST_CONVOLUTION_COLOR_TABLE_SGI  : constant := 16#80D4#;
  GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE_SGI : constant := 16#80D5#;
  GL_COLOR_TABLE_SCALE_SGI                   : constant := 16#80D6#;
  GL_COLOR_TABLE_BIAS_SGI                    : constant := 16#80D7#;
  GL_COLOR_TABLE_FORMAT_SGI                  : constant := 16#80D8#;
  GL_COLOR_TABLE_WIDTH_SGI                   : constant := 16#80D9#;
  GL_COLOR_TABLE_RED_SIZE_SGI                : constant := 16#80DA#;
  GL_COLOR_TABLE_GREEN_SIZE_SGI              : constant := 16#80DB#;
  GL_COLOR_TABLE_BLUE_SIZE_SGI               : constant := 16#80DC#;
  GL_COLOR_TABLE_ALPHA_SIZE_SGI              : constant := 16#80DD#;
  GL_COLOR_TABLE_LUMINANCE_SIZE_SGI          : constant := 16#80DE#;
  GL_COLOR_TABLE_INTENSITY_SIZE_SGI          : constant := 16#80DF#;
  --#endif

  --#ifndef GL_SGIS_pixel_texture
  GL_PIXEL_TEXTURE_SGIS               : constant := 16#8353#;
  GL_PIXEL_FRAGMENT_RGB_SOURCE_SGIS   : constant := 16#8354#;
  GL_PIXEL_FRAGMENT_ALPHA_SOURCE_SGIS : constant := 16#8355#;
  GL_PIXEL_GROUP_COLOR_SGIS           : constant := 16#8356#;
  --#endif

  --#ifndef GL_SGIX_pixel_texture
  GL_PIXEL_TEX_GEN_SGIX             : constant := 16#8139#;
  GL_PIXEL_TEX_GEN_MODE_SGIX        : constant := 16#832B#;
  --#endif

  --#ifndef GL_SGIS_texture4D
  GL_PACK_SKIP_VOLUMES_SGIS         : constant := 16#8130#;
  GL_PACK_IMAGE_DEPTH_SGIS          : constant := 16#8131#;
  GL_UNPACK_SKIP_VOLUMES_SGIS       : constant := 16#8132#;
  GL_UNPACK_IMAGE_DEPTH_SGIS        : constant := 16#8133#;
  GL_TEXTURE_4D_SGIS                : constant := 16#8134#;
  GL_PROXY_TEXTURE_4D_SGIS          : constant := 16#8135#;
  GL_TEXTURE_4DSIZE_SGIS            : constant := 16#8136#;
  GL_TEXTURE_WRAP_Q_SGIS            : constant := 16#8137#;
  GL_MAX_4D_TEXTURE_SIZE_SGIS       : constant := 16#8138#;
  GL_TEXTURE_4D_BINDING_SGIS        : constant := 16#814F#;
  --#endif

  --#ifndef GL_SGI_texture_color_table
  GL_TEXTURE_COLOR_TABLE_SGI        : constant := 16#80BC#;
  GL_PROXY_TEXTURE_COLOR_TABLE_SGI  : constant := 16#80BD#;
  --#endif

  --#ifndef GL_EXT_cmyka
  GL_CMYK_EXT                       : constant := 16#800C#;
  GL_CMYKA_EXT                      : constant := 16#800D#;
  GL_PACK_CMYK_HINT_EXT             : constant := 16#800E#;
  GL_UNPACK_CMYK_HINT_EXT           : constant := 16#800F#;
  --#endif

  --#ifndef GL_EXT_texture_object
  GL_TEXTURE_PRIORITY_EXT           : constant := 16#8066#;
  GL_TEXTURE_RESIDENT_EXT           : constant := 16#8067#;
  GL_TEXTURE_1D_BINDING_EXT         : constant := 16#8068#;
  GL_TEXTURE_2D_BINDING_EXT         : constant := 16#8069#;
  GL_TEXTURE_3D_BINDING_EXT         : constant := 16#806A#;
  --#endif

  --#ifndef GL_SGIS_detail_texture
  GL_DETAIL_TEXTURE_2D_SGIS          : constant := 16#8095#;
  GL_DETAIL_TEXTURE_2D_BINDING_SGIS  : constant := 16#8096#;
  GL_LINEAR_DETAIL_SGIS              : constant := 16#8097#;
  GL_LINEAR_DETAIL_ALPHA_SGIS        : constant := 16#8098#;
  GL_LINEAR_DETAIL_COLOR_SGIS        : constant := 16#8099#;
  GL_DETAIL_TEXTURE_LEVEL_SGIS       : constant := 16#809A#;
  GL_DETAIL_TEXTURE_MODE_SGIS        : constant := 16#809B#;
  GL_DETAIL_TEXTURE_FUNC_POINTS_SGIS : constant := 16#809C#;
  --#endif

  --#ifndef GL_SGIS_sharpen_texture
  GL_LINEAR_SHARPEN_SGIS              : constant := 16#80AD#;
  GL_LINEAR_SHARPEN_ALPHA_SGIS        : constant := 16#80AE#;
  GL_LINEAR_SHARPEN_COLOR_SGIS        : constant := 16#80AF#;
  GL_SHARPEN_TEXTURE_FUNC_POINTS_SGIS : constant := 16#80B0#;
  --#endif

  --#ifndef GL_EXT_packed_pixels
  GL_UNSIGNED_BYTE_3_3_2_EXT        : constant := 16#8032#;
  GL_UNSIGNED_SHORT_4_4_4_4_EXT     : constant := 16#8033#;
  GL_UNSIGNED_SHORT_5_5_5_1_EXT     : constant := 16#8034#;
  GL_UNSIGNED_INT_8_8_8_8_EXT       : constant := 16#8035#;
  GL_UNSIGNED_INT_10_10_10_2_EXT    : constant := 16#8036#;
  --#endif

  --#ifndef GL_SGIS_texture_lod
  GL_TEXTURE_MIN_LOD_SGIS           : constant := 16#813A#;
  GL_TEXTURE_MAX_LOD_SGIS           : constant := 16#813B#;
  GL_TEXTURE_BASE_LEVEL_SGIS        : constant := 16#813C#;
  GL_TEXTURE_MAX_LEVEL_SGIS         : constant := 16#813D#;
  --#endif

  --#ifndef GL_SGIS_multisample
  GL_MULTISAMPLE_SGIS               : constant := 16#809D#;
  GL_SAMPLE_ALPHA_TO_MASK_SGIS      : constant := 16#809E#;
  GL_SAMPLE_ALPHA_TO_ONE_SGIS       : constant := 16#809F#;
  GL_SAMPLE_MASK_SGIS               : constant := 16#80A0#;
  GL_1PASS_SGIS                     : constant := 16#80A1#;
  GL_2PASS_0_SGIS                   : constant := 16#80A2#;
  GL_2PASS_1_SGIS                   : constant := 16#80A3#;
  GL_4PASS_0_SGIS                   : constant := 16#80A4#;
  GL_4PASS_1_SGIS                   : constant := 16#80A5#;
  GL_4PASS_2_SGIS                   : constant := 16#80A6#;
  GL_4PASS_3_SGIS                   : constant := 16#80A7#;
  GL_SAMPLE_BUFFERS_SGIS            : constant := 16#80A8#;
  GL_SAMPLES_SGIS                   : constant := 16#80A9#;
  GL_SAMPLE_MASK_VALUE_SGIS         : constant := 16#80AA#;
  GL_SAMPLE_MASK_INVERT_SGIS        : constant := 16#80AB#;
  GL_SAMPLE_PATTERN_SGIS            : constant := 16#80AC#;
  --#endif

  --#ifndef GL_EXT_rescale_normal
  GL_RESCALE_NORMAL_EXT             : constant := 16#803A#;
  --#endif

  --#ifndef GL_EXT_vertex_array
  GL_VERTEX_ARRAY_EXT                : constant := 16#8074#;
  GL_NORMAL_ARRAY_EXT                : constant := 16#8075#;
  GL_COLOR_ARRAY_EXT                 : constant := 16#8076#;
  GL_INDEX_ARRAY_EXT                 : constant := 16#8077#;
  GL_TEXTURE_COORD_ARRAY_EXT         : constant := 16#8078#;
  GL_EDGE_FLAG_ARRAY_EXT             : constant := 16#8079#;
  GL_VERTEX_ARRAY_SIZE_EXT           : constant := 16#807A#;
  GL_VERTEX_ARRAY_TYPE_EXT           : constant := 16#807B#;
  GL_VERTEX_ARRAY_STRIDE_EXT         : constant := 16#807C#;
  GL_VERTEX_ARRAY_COUNT_EXT          : constant := 16#807D#;
  GL_NORMAL_ARRAY_TYPE_EXT           : constant := 16#807E#;
  GL_NORMAL_ARRAY_STRIDE_EXT         : constant := 16#807F#;
  GL_NORMAL_ARRAY_COUNT_EXT          : constant := 16#8080#;
  GL_COLOR_ARRAY_SIZE_EXT            : constant := 16#8081#;
  GL_COLOR_ARRAY_TYPE_EXT            : constant := 16#8082#;
  GL_COLOR_ARRAY_STRIDE_EXT          : constant := 16#8083#;
  GL_COLOR_ARRAY_COUNT_EXT           : constant := 16#8084#;
  GL_INDEX_ARRAY_TYPE_EXT            : constant := 16#8085#;
  GL_INDEX_ARRAY_STRIDE_EXT          : constant := 16#8086#;
  GL_INDEX_ARRAY_COUNT_EXT           : constant := 16#8087#;
  GL_TEXTURE_COORD_ARRAY_SIZE_EXT    : constant := 16#8088#;
  GL_TEXTURE_COORD_ARRAY_TYPE_EXT    : constant := 16#8089#;
  GL_TEXTURE_COORD_ARRAY_STRIDE_EXT  : constant := 16#808A#;
  GL_TEXTURE_COORD_ARRAY_COUNT_EXT   : constant := 16#808B#;
  GL_EDGE_FLAG_ARRAY_STRIDE_EXT      : constant := 16#808C#;
  GL_EDGE_FLAG_ARRAY_COUNT_EXT       : constant := 16#808D#;
  GL_VERTEX_ARRAY_POINTER_EXT        : constant := 16#808E#;
  GL_NORMAL_ARRAY_POINTER_EXT        : constant := 16#808F#;
  GL_COLOR_ARRAY_POINTER_EXT         : constant := 16#8090#;
  GL_INDEX_ARRAY_POINTER_EXT         : constant := 16#8091#;
  GL_TEXTURE_COORD_ARRAY_POINTER_EXT : constant := 16#8092#;
  GL_EDGE_FLAG_ARRAY_POINTER_EXT     : constant := 16#8093#;
  --#endif

  --#ifndef GL_EXT_misc_attribute
  --#endif

  --#ifndef GL_SGIS_generate_mipmap
  GL_GENERATE_MIPMAP_SGIS           : constant := 16#8191#;
  GL_GENERATE_MIPMAP_HINT_SGIS      : constant := 16#8192#;
  --#endif

  --#ifndef GL_SGIX_clipmap
  GL_LINEAR_CLIPMAP_LINEAR_SGIX         : constant := 16#8170#;
  GL_TEXTURE_CLIPMAP_CENTER_SGIX        : constant := 16#8171#;
  GL_TEXTURE_CLIPMAP_FRAME_SGIX         : constant := 16#8172#;
  GL_TEXTURE_CLIPMAP_OFFSET_SGIX        : constant := 16#8173#;
  GL_TEXTURE_CLIPMAP_VIRTUAL_DEPTH_SGIX : constant := 16#8174#;
  GL_TEXTURE_CLIPMAP_LOD_OFFSET_SGIX    : constant := 16#8175#;
  GL_TEXTURE_CLIPMAP_DEPTH_SGIX         : constant := 16#8176#;
  GL_MAX_CLIPMAP_DEPTH_SGIX             : constant := 16#8177#;
  GL_MAX_CLIPMAP_VIRTUAL_DEPTH_SGIX     : constant := 16#8178#;
  GL_NEAREST_CLIPMAP_NEAREST_SGIX       : constant := 16#844D#;
  GL_NEAREST_CLIPMAP_LINEAR_SGIX        : constant := 16#844E#;
  GL_LINEAR_CLIPMAP_NEAREST_SGIX        : constant := 16#844F#;
  --#endif

  --#ifndef GL_SGIX_shadow
  GL_TEXTURE_COMPARE_SGIX           : constant := 16#819A#;
  GL_TEXTURE_COMPARE_OPERATOR_SGIX  : constant := 16#819B#;
  GL_TEXTURE_LEQUAL_R_SGIX          : constant := 16#819C#;
  GL_TEXTURE_GEQUAL_R_SGIX          : constant := 16#819D#;
  --#endif

  --#ifndef GL_SGIS_texture_edge_clamp
  GL_CLAMP_TO_EDGE_SGIS             : constant := 16#812F#;
  --#endif

  --#ifndef GL_SGIS_texture_border_clamp
  GL_CLAMP_TO_BORDER_SGIS           : constant := 16#812D#;
  --#endif

  --#ifndef GL_EXT_blend_minmax
  GL_FUNC_ADD_EXT                   : constant := 16#8006#;
  GL_MIN_EXT                        : constant := 16#8007#;
  GL_MAX_EXT                        : constant := 16#8008#;
  GL_BLEND_EQUATION_EXT             : constant := 16#8009#;
  --#endif

  --#ifndef GL_EXT_blend_subtract
  GL_FUNC_SUBTRACT_EXT              : constant := 16#800A#;
  GL_FUNC_REVERSE_SUBTRACT_EXT      : constant := 16#800B#;
  --#endif

  --#ifndef GL_EXT_blend_logic_op
  --#endif

  --#ifndef GL_SGIX_interlace
  GL_INTERLACE_SGIX                 : constant := 16#8094#;
  --#endif

  --#ifndef GL_SGIX_pixel_tiles
  GL_PIXEL_TILE_BEST_ALIGNMENT_SGIX  : constant := 16#813E#;
  GL_PIXEL_TILE_CACHE_INCREMENT_SGIX : constant := 16#813F#;
  GL_PIXEL_TILE_WIDTH_SGIX           : constant := 16#8140#;
  GL_PIXEL_TILE_HEIGHT_SGIX          : constant := 16#8141#;
  GL_PIXEL_TILE_GRID_WIDTH_SGIX      : constant := 16#8142#;
  GL_PIXEL_TILE_GRID_HEIGHT_SGIX     : constant := 16#8143#;
  GL_PIXEL_TILE_GRID_DEPTH_SGIX      : constant := 16#8144#;
  GL_PIXEL_TILE_CACHE_SIZE_SGIX      : constant := 16#8145#;
  --#endif

  --#ifndef GL_SGIS_texture_select
  GL_DUAL_ALPHA4_SGIS               : constant := 16#8110#;
  GL_DUAL_ALPHA8_SGIS               : constant := 16#8111#;
  GL_DUAL_ALPHA12_SGIS              : constant := 16#8112#;
  GL_DUAL_ALPHA16_SGIS              : constant := 16#8113#;
  GL_DUAL_LUMINANCE4_SGIS           : constant := 16#8114#;
  GL_DUAL_LUMINANCE8_SGIS           : constant := 16#8115#;
  GL_DUAL_LUMINANCE12_SGIS          : constant := 16#8116#;
  GL_DUAL_LUMINANCE16_SGIS          : constant := 16#8117#;
  GL_DUAL_INTENSITY4_SGIS           : constant := 16#8118#;
  GL_DUAL_INTENSITY8_SGIS           : constant := 16#8119#;
  GL_DUAL_INTENSITY12_SGIS          : constant := 16#811A#;
  GL_DUAL_INTENSITY16_SGIS          : constant := 16#811B#;
  GL_DUAL_LUMINANCE_ALPHA4_SGIS     : constant := 16#811C#;
  GL_DUAL_LUMINANCE_ALPHA8_SGIS     : constant := 16#811D#;
  GL_QUAD_ALPHA4_SGIS               : constant := 16#811E#;
  GL_QUAD_ALPHA8_SGIS               : constant := 16#811F#;
  GL_QUAD_LUMINANCE4_SGIS           : constant := 16#8120#;
  GL_QUAD_LUMINANCE8_SGIS           : constant := 16#8121#;
  GL_QUAD_INTENSITY4_SGIS           : constant := 16#8122#;
  GL_QUAD_INTENSITY8_SGIS           : constant := 16#8123#;
  GL_DUAL_TEXTURE_SELECT_SGIS       : constant := 16#8124#;
  GL_QUAD_TEXTURE_SELECT_SGIS       : constant := 16#8125#;
  --#endif

  --#ifndef GL_SGIX_sprite
  GL_SPRITE_SGIX                    : constant := 16#8148#;
  GL_SPRITE_MODE_SGIX               : constant := 16#8149#;
  GL_SPRITE_AXIS_SGIX               : constant := 16#814A#;
  GL_SPRITE_TRANSLATION_SGIX        : constant := 16#814B#;
  GL_SPRITE_AXIAL_SGIX              : constant := 16#814C#;
  GL_SPRITE_OBJECT_ALIGNED_SGIX     : constant := 16#814D#;
  GL_SPRITE_EYE_ALIGNED_SGIX        : constant := 16#814E#;
  --#endif

  --#ifndef GL_SGIX_texture_multi_buffer
  GL_TEXTURE_MULTI_BUFFER_HINT_SGIX : constant := 16#812E#;
  --#endif

  --#ifndef GL_EXT_point_parameters
  GL_POINT_SIZE_MIN_EXT             : constant := 16#8126#;
  GL_POINT_SIZE_MAX_EXT             : constant := 16#8127#;
  GL_POINT_FADE_THRESHOLD_SIZE_EXT  : constant := 16#8128#;
  GL_DISTANCE_ATTENUATION_EXT       : constant := 16#8129#;
  --#endif

  --#ifndef GL_SGIS_point_parameters
  GL_POINT_SIZE_MIN_SGIS            : constant := 16#8126#;
  GL_POINT_SIZE_MAX_SGIS            : constant := 16#8127#;
  GL_POINT_FADE_THRESHOLD_SIZE_SGIS : constant := 16#8128#;
  GL_DISTANCE_ATTENUATION_SGIS      : constant := 16#8129#;
  --#endif

  --#ifndef GL_SGIX_instruments
  GL_INSTRUMENT_BUFFER_POINTER_SGIX : constant := 16#8180#;
  GL_INSTRUMENT_MEASUREMENTS_SGIX   : constant := 16#8181#;
  --#endif

  --#ifndef GL_SGIX_texture_scale_bias
  GL_POST_TEXTURE_FILTER_BIAS_SGIX        : constant := 16#8179#;
  GL_POST_TEXTURE_FILTER_SCALE_SGIX       : constant := 16#817A#;
  GL_POST_TEXTURE_FILTER_BIAS_RANGE_SGIX  : constant := 16#817B#;
  GL_POST_TEXTURE_FILTER_SCALE_RANGE_SGIX : constant := 16#817C#;
  --#endif

  --#ifndef GL_SGIX_framezoom
  GL_FRAMEZOOM_SGIX                 : constant := 16#818B#;
  GL_FRAMEZOOM_FACTOR_SGIX          : constant := 16#818C#;
  GL_MAX_FRAMEZOOM_FACTOR_SGIX      : constant := 16#818D#;
  --#endif

  --#ifndef GL_SGIX_tag_sample_buffer
  --#endif

  --#ifndef GL_FfdMaskSGIX
  GL_TEXTURE_DEFORMATION_BIT_SGIX   : constant := 16#0000_0001#;
  GL_GEOMETRY_DEFORMATION_BIT_SGIX  : constant := 16#0000_0002#;
  --#endif

  --#ifndef GL_SGIX_polynomial_ffd
  GL_GEOMETRY_DEFORMATION_SGIX      : constant := 16#8194#;
  GL_TEXTURE_DEFORMATION_SGIX       : constant := 16#8195#;
  GL_DEFORMATIONS_MASK_SGIX         : constant := 16#8196#;
  GL_MAX_DEFORMATION_ORDER_SGIX     : constant := 16#8197#;
  --#endif

  --#ifndef GL_SGIX_reference_plane
  GL_REFERENCE_PLANE_SGIX           : constant := 16#817D#;
  GL_REFERENCE_PLANE_EQUATION_SGIX  : constant := 16#817E#;
  --#endif

  --#ifndef GL_SGIX_flush_raster
  --#endif

  --#ifndef GL_SGIX_depth_texture
  GL_DEPTH_COMPONENT16_SGIX         : constant := 16#81A5#;
  GL_DEPTH_COMPONENT24_SGIX         : constant := 16#81A6#;
  GL_DEPTH_COMPONENT32_SGIX         : constant := 16#81A7#;
  --#endif

  --#ifndef GL_SGIS_fog_function
  GL_FOG_FUNC_SGIS                  : constant := 16#812A#;
  GL_FOG_FUNC_POINTS_SGIS           : constant := 16#812B#;
  GL_MAX_FOG_FUNC_POINTS_SGIS       : constant := 16#812C#;
  --#endif

  --#ifndef GL_SGIX_fog_offset
  GL_FOG_OFFSET_SGIX                : constant := 16#8198#;
  GL_FOG_OFFSET_VALUE_SGIX          : constant := 16#8199#;
  --#endif

  --#ifndef GL_HP_image_transform
  GL_IMAGE_SCALE_X_HP                          : constant := 16#8155#;
  GL_IMAGE_SCALE_Y_HP                          : constant := 16#8156#;
  GL_IMAGE_TRANSLATE_X_HP                      : constant := 16#8157#;
  GL_IMAGE_TRANSLATE_Y_HP                      : constant := 16#8158#;
  GL_IMAGE_ROTATE_ANGLE_HP                     : constant := 16#8159#;
  GL_IMAGE_ROTATE_ORIGIN_X_HP                  : constant := 16#815A#;
  GL_IMAGE_ROTATE_ORIGIN_Y_HP                  : constant := 16#815B#;
  GL_IMAGE_MAG_FILTER_HP                       : constant := 16#815C#;
  GL_IMAGE_MIN_FILTER_HP                       : constant := 16#815D#;
  GL_IMAGE_CUBIC_WEIGHT_HP                     : constant := 16#815E#;
  GL_CUBIC_HP                                  : constant := 16#815F#;
  GL_AVERAGE_HP                                : constant := 16#8160#;
  GL_IMAGE_TRANSFORM_2D_HP                     : constant := 16#8161#;
  GL_POST_IMAGE_TRANSFORM_COLOR_TABLE_HP       : constant := 16#8162#;
  GL_PROXY_POST_IMAGE_TRANSFORM_COLOR_TABLE_HP : constant := 16#8163#;
  --#endif

  --#ifndef GL_HP_convolution_border_modes
  GL_IGNORE_BORDER_HP               : constant := 16#8150#;
  GL_CONSTANT_BORDER_HP             : constant := 16#8151#;
  GL_REPLICATE_BORDER_HP            : constant := 16#8153#;
  GL_CONVOLUTION_BORDER_COLOR_HP    : constant := 16#8154#;
  --#endif

  --#ifndef GL_INGR_palette_buffer
  --#endif

  --#ifndef GL_SGIX_texture_add_env
  GL_TEXTURE_ENV_BIAS_SGIX          : constant := 16#80BE#;
  --#endif

  --#ifndef GL_EXT_color_subtable
  --#endif

  --#ifndef GL_PGI_vertex_hints
  GL_VERTEX_DATA_HINT_PGI            : constant := 16#1A22A#;
  GL_VERTEX_CONSISTENT_HINT_PGI      : constant := 16#1A22B#;
  GL_MATERIAL_SIDE_HINT_PGI          : constant := 16#1A22C#;
  GL_MAX_VERTEX_HINT_PGI             : constant := 16#1A22D#;
  GL_COLOR3_BIT_PGI                  : constant := 16#0001_0000#;
  GL_COLOR4_BIT_PGI                  : constant := 16#0002_0000#;
  GL_EDGEFLAG_BIT_PGI                : constant := 16#0004_0000#;
  GL_INDEX_BIT_PGI                   : constant := 16#0008_0000#;
  GL_MAT_AMBIENT_BIT_PGI             : constant := 16#0010_0000#;
  GL_MAT_AMBIENT_AND_DIFFUSE_BIT_PGI : constant := 16#0020_0000#;
  GL_MAT_DIFFUSE_BIT_PGI             : constant := 16#0040_0000#;
  GL_MAT_EMISSION_BIT_PGI            : constant := 16#0080_0000#;
  GL_MAT_COLOR_INDEXES_BIT_PGI       : constant := 16#0100_0000#;
  GL_MAT_SHININESS_BIT_PGI           : constant := 16#0200_0000#;
  GL_MAT_SPECULAR_BIT_PGI            : constant := 16#0400_0000#;
  GL_NORMAL_BIT_PGI                  : constant := 16#0800_0000#;
  GL_TEXCOORD1_BIT_PGI               : constant := 16#1000_0000#;
  GL_TEXCOORD2_BIT_PGI               : constant := 16#2000_0000#;
  GL_TEXCOORD3_BIT_PGI               : constant := 16#4000_0000#;
  GL_TEXCOORD4_BIT_PGI               : constant := 16#8000_0000#;
  GL_VERTEX23_BIT_PGI                : constant := 16#0000_0004#;
  GL_VERTEX4_BIT_PGI                 : constant := 16#0000_0008#;
  --#endif

  --#ifndef GL_PGI_misc_hints
  GL_PREFER_DOUBLEBUFFER_HINT_PGI   : constant := 16#1A1F8#;
  GL_CONSERVE_MEMORY_HINT_PGI       : constant := 16#1A1FD#;
  GL_RECLAIM_MEMORY_HINT_PGI        : constant := 16#1A1FE#;
  GL_NATIVE_GRAPHICS_HANDLE_PGI     : constant := 16#1A202#;
  GL_NATIVE_GRAPHICS_BEGIN_HINT_PGI : constant := 16#1A203#;
  GL_NATIVE_GRAPHICS_END_HINT_PGI   : constant := 16#1A204#;
  GL_ALWAYS_FAST_HINT_PGI           : constant := 16#1A20C#;
  GL_ALWAYS_SOFT_HINT_PGI           : constant := 16#1A20D#;
  GL_ALLOW_DRAW_OBJ_HINT_PGI        : constant := 16#1A20E#;
  GL_ALLOW_DRAW_WIN_HINT_PGI        : constant := 16#1A20F#;
  GL_ALLOW_DRAW_FRG_HINT_PGI        : constant := 16#1A210#;
  GL_ALLOW_DRAW_MEM_HINT_PGI        : constant := 16#1A211#;
  GL_STRICT_DEPTHFUNC_HINT_PGI      : constant := 16#1A216#;
  GL_STRICT_LIGHTING_HINT_PGI       : constant := 16#1A217#;
  GL_STRICT_SCISSOR_HINT_PGI        : constant := 16#1A218#;
  GL_FULL_STIPPLE_HINT_PGI          : constant := 16#1A219#;
  GL_CLIP_NEAR_HINT_PGI             : constant := 16#1A220#;
  GL_CLIP_FAR_HINT_PGI              : constant := 16#1A221#;
  GL_WIDE_LINE_HINT_PGI             : constant := 16#1A222#;
  GL_BACK_NORMALS_HINT_PGI          : constant := 16#1A223#;
  --#endif

  --#ifndef GL_EXT_paletted_texture
  GL_COLOR_INDEX1_EXT               : constant := 16#80E2#;
  GL_COLOR_INDEX2_EXT               : constant := 16#80E3#;
  GL_COLOR_INDEX4_EXT               : constant := 16#80E4#;
  GL_COLOR_INDEX8_EXT               : constant := 16#80E5#;
  GL_COLOR_INDEX12_EXT              : constant := 16#80E6#;
  GL_COLOR_INDEX16_EXT              : constant := 16#80E7#;
  GL_TEXTURE_INDEX_SIZE_EXT         : constant := 16#80ED#;
  --#endif

  --#ifndef GL_EXT_clip_volume_hint
  GL_CLIP_VOLUME_CLIPPING_HINT_EXT  : constant := 16#80F0#;
  --#endif

  --#ifndef GL_SGIX_list_priority
  GL_LIST_PRIORITY_SGIX             : constant := 16#8182#;
  --#endif

  --#ifndef GL_SGIX_ir_instrument1
  GL_IR_INSTRUMENT1_SGIX            : constant := 16#817F#;
  --#endif

  --#ifndef GL_SGIX_calligraphic_fragment
  GL_CALLIGRAPHIC_FRAGMENT_SGIX     : constant := 16#8183#;
  --#endif

  --#ifndef GL_SGIX_texture_lod_bias
  GL_TEXTURE_LOD_BIAS_S_SGIX        : constant := 16#818E#;
  GL_TEXTURE_LOD_BIAS_T_SGIX        : constant := 16#818F#;
  GL_TEXTURE_LOD_BIAS_R_SGIX        : constant := 16#8190#;
  --#endif

  --#ifndef GL_SGIX_shadow_ambient
  GL_SHADOW_AMBIENT_SGIX            : constant := 16#80BF#;
  --#endif

  --#ifndef GL_EXT_index_texture
  --#endif

  --#ifndef GL_EXT_index_material
  GL_INDEX_MATERIAL_EXT             : constant := 16#81B8#;
  GL_INDEX_MATERIAL_PARAMETER_EXT   : constant := 16#81B9#;
  GL_INDEX_MATERIAL_FACE_EXT        : constant := 16#81BA#;
  --#endif

  --#ifndef GL_EXT_index_func
  GL_INDEX_TEST_EXT                 : constant := 16#81B5#;
  GL_INDEX_TEST_FUNC_EXT            : constant := 16#81B6#;
  GL_INDEX_TEST_REF_EXT             : constant := 16#81B7#;
  --#endif

  --#ifndef GL_EXT_index_array_formats
  GL_IUI_V2F_EXT                    : constant := 16#81AD#;
  GL_IUI_V3F_EXT                    : constant := 16#81AE#;
  GL_IUI_N3F_V2F_EXT                : constant := 16#81AF#;
  GL_IUI_N3F_V3F_EXT                : constant := 16#81B0#;
  GL_T2F_IUI_V2F_EXT                : constant := 16#81B1#;
  GL_T2F_IUI_V3F_EXT                : constant := 16#81B2#;
  GL_T2F_IUI_N3F_V2F_EXT            : constant := 16#81B3#;
  GL_T2F_IUI_N3F_V3F_EXT            : constant := 16#81B4#;
  --#endif

  --#ifndef GL_EXT_compiled_vertex_array
  GL_ARRAY_ELEMENT_LOCK_FIRST_EXT   : constant := 16#81A8#;
  GL_ARRAY_ELEMENT_LOCK_COUNT_EXT   : constant := 16#81A9#;
  --#endif

  --#ifndef GL_EXT_cull_vertex
  GL_CULL_VERTEX_EXT                : constant := 16#81AA#;
  GL_CULL_VERTEX_EYE_POSITION_EXT   : constant := 16#81AB#;
  GL_CULL_VERTEX_OBJECT_POSITION_EXT : constant := 16#81AC#;
  --#endif

  --#ifndef GL_SGIX_ycrcb
  GL_YCRCB_422_SGIX                 : constant := 16#81BB#;
  GL_YCRCB_444_SGIX                 : constant := 16#81BC#;
  --#endif

  --#ifndef GL_SGIX_fragment_lighting
  GL_FRAGMENT_LIGHTING_SGIX                         : constant := 16#8400#;
  GL_FRAGMENT_COLOR_MATERIAL_SGIX                   : constant := 16#8401#;
  GL_FRAGMENT_COLOR_MATERIAL_FACE_SGIX              : constant := 16#8402#;
  GL_FRAGMENT_COLOR_MATERIAL_PARAMETER_SGIX         : constant := 16#8403#;
  GL_MAX_FRAGMENT_LIGHTS_SGIX                       : constant := 16#8404#;
  GL_MAX_ACTIVE_LIGHTS_SGIX                         : constant := 16#8405#;
  GL_CURRENT_RASTER_NORMAL_SGIX                     : constant := 16#8406#;
  GL_LIGHT_ENV_MODE_SGIX                            : constant := 16#8407#;
  GL_FRAGMENT_LIGHT_MODEL_LOCAL_VIEWER_SGIX         : constant := 16#8408#;
  GL_FRAGMENT_LIGHT_MODEL_TWO_SIDE_SGIX             : constant := 16#8409#;
  GL_FRAGMENT_LIGHT_MODEL_AMBIENT_SGIX              : constant := 16#840A#;
  GL_FRAGMENT_LIGHT_MODEL_NORMAL_INTERPOLATION_SGIX : constant := 16#840B#;
  GL_FRAGMENT_LIGHT0_SGIX                           : constant := 16#840C#;
  GL_FRAGMENT_LIGHT1_SGIX                           : constant := 16#840D#;
  GL_FRAGMENT_LIGHT2_SGIX                           : constant := 16#840E#;
  GL_FRAGMENT_LIGHT3_SGIX                           : constant := 16#840F#;
  GL_FRAGMENT_LIGHT4_SGIX                           : constant := 16#8410#;
  GL_FRAGMENT_LIGHT5_SGIX                           : constant := 16#8411#;
  GL_FRAGMENT_LIGHT6_SGIX                           : constant := 16#8412#;
  GL_FRAGMENT_LIGHT7_SGIX                           : constant := 16#8413#;
  --#endif

  --#ifndef GL_IBM_rasterpos_clip
  GL_RASTER_POSITION_UNCLIPPED_IBM  : constant := 16#19262#;
  --#endif

  --#ifndef GL_HP_texture_lighting
  GL_TEXTURE_LIGHTING_MODE_HP       : constant := 16#8167#;
  GL_TEXTURE_POST_SPECULAR_HP       : constant := 16#8168#;
  GL_TEXTURE_PRE_SPECULAR_HP        : constant := 16#8169#;
  --#endif

  --#ifndef GL_EXT_draw_range_elements
  GL_MAX_ELEMENTS_VERTICES_EXT      : constant := 16#80E8#;
  GL_MAX_ELEMENTS_INDICES_EXT       : constant := 16#80E9#;
  --#endif

  --#ifndef GL_WIN_phong_shading
  GL_PHONG_WIN                      : constant := 16#80EA#;
  GL_PHONG_HINT_WIN                 : constant := 16#80EB#;
  --#endif

  --#ifndef GL_WIN_specular_fog
  GL_FOG_SPECULAR_TEXTURE_WIN       : constant := 16#80EC#;
  --#endif

  --#ifndef GL_EXT_light_texture
  GL_FRAGMENT_MATERIAL_EXT          : constant := 16#8349#;
  GL_FRAGMENT_NORMAL_EXT            : constant := 16#834A#;
  GL_FRAGMENT_COLOR_EXT             : constant := 16#834C#;
  GL_ATTENUATION_EXT                : constant := 16#834D#;
  GL_SHADOW_ATTENUATION_EXT         : constant := 16#834E#;
  GL_TEXTURE_APPLICATION_MODE_EXT   : constant := 16#834F#;
  GL_TEXTURE_LIGHT_EXT              : constant := 16#8350#;
  GL_TEXTURE_MATERIAL_FACE_EXT      : constant := 16#8351#;
  GL_TEXTURE_MATERIAL_PARAMETER_EXT : constant := 16#8352#;
  --/* reuse GL_FRAGMENT_DEPTH_EXT */
  --#endif

  --#ifndef GL_SGIX_blend_alpha_minmax
  GL_ALPHA_MIN_SGIX                 : constant := 16#8320#;
  GL_ALPHA_MAX_SGIX                 : constant := 16#8321#;
  --#endif

  --#ifndef GL_SGIX_impact_pixel_texture
  GL_PIXEL_TEX_GEN_Q_CEILING_SGIX        : constant := 16#8184#;
  GL_PIXEL_TEX_GEN_Q_ROUND_SGIX          : constant := 16#8185#;
  GL_PIXEL_TEX_GEN_Q_FLOOR_SGIX          : constant := 16#8186#;
  GL_PIXEL_TEX_GEN_ALPHA_REPLACE_SGIX    : constant := 16#8187#;
  GL_PIXEL_TEX_GEN_ALPHA_NO_REPLACE_SGIX : constant := 16#8188#;
  GL_PIXEL_TEX_GEN_ALPHA_LS_SGIX         : constant := 16#8189#;
  GL_PIXEL_TEX_GEN_ALPHA_MS_SGIX         : constant := 16#818A#;
  --#endif

  --#ifndef GL_EXT_bgra
  GL_BGR_EXT                        : constant := 16#80E0#;
  GL_BGRA_EXT                       : constant := 16#80E1#;
  --#endif

  --#ifndef GL_SGIX_async
  GL_ASYNC_MARKER_SGIX              : constant := 16#8329#;
  --#endif

  --#ifndef GL_SGIX_async_pixel
  GL_ASYNC_TEX_IMAGE_SGIX           : constant := 16#835C#;
  GL_ASYNC_DRAW_PIXELS_SGIX         : constant := 16#835D#;
  GL_ASYNC_READ_PIXELS_SGIX         : constant := 16#835E#;
  GL_MAX_ASYNC_TEX_IMAGE_SGIX       : constant := 16#835F#;
  GL_MAX_ASYNC_DRAW_PIXELS_SGIX     : constant := 16#8360#;
  GL_MAX_ASYNC_READ_PIXELS_SGIX     : constant := 16#8361#;
  --#endif

  --#ifndef GL_SGIX_async_histogram
  GL_ASYNC_HISTOGRAM_SGIX           : constant := 16#832C#;
  GL_MAX_ASYNC_HISTOGRAM_SGIX       : constant := 16#832D#;
  --#endif

  --#ifndef GL_INTEL_texture_scissor
  --#endif

  --#ifndef GL_INTEL_parallel_arrays
  GL_PARALLEL_ARRAYS_INTEL                       : constant := 16#83F4#;
  GL_VERTEX_ARRAY_PARALLEL_POINTERS_INTEL        : constant := 16#83F5#;
  GL_NORMAL_ARRAY_PARALLEL_POINTERS_INTEL        : constant := 16#83F6#;
  GL_COLOR_ARRAY_PARALLEL_POINTERS_INTEL         : constant := 16#83F7#;
  GL_TEXTURE_COORD_ARRAY_PARALLEL_POINTERS_INTEL : constant := 16#83F8#;
  --#endif

  --#ifndef GL_HP_occlusion_test
  GL_OCCLUSION_TEST_HP              : constant := 16#8165#;
  GL_OCCLUSION_TEST_RESULT_HP       : constant := 16#8166#;
  --#endif

  --#ifndef GL_EXT_pixel_transform
  GL_PIXEL_TRANSFORM_2D_EXT                 : constant := 16#8330#;
  GL_PIXEL_MAG_FILTER_EXT                   : constant := 16#8331#;
  GL_PIXEL_MIN_FILTER_EXT                   : constant := 16#8332#;
  GL_PIXEL_CUBIC_WEIGHT_EXT                 : constant := 16#8333#;
  GL_CUBIC_EXT                              : constant := 16#8334#;
  GL_AVERAGE_EXT                            : constant := 16#8335#;
  GL_PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT     : constant := 16#8336#;
  GL_MAX_PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT : constant := 16#8337#;
  GL_PIXEL_TRANSFORM_2D_MATRIX_EXT          : constant := 16#8338#;
  --#endif

  --#ifndef GL_EXT_pixel_transform_color_table
  --#endif

  --#ifndef GL_EXT_shared_texture_palette
  GL_SHARED_TEXTURE_PALETTE_EXT     : constant := 16#81FB#;
  --#endif

  --#ifndef GL_EXT_separate_specular_color
  GL_LIGHT_MODEL_COLOR_CONTROL_EXT  : constant := 16#81F8#;
  GL_SINGLE_COLOR_EXT               : constant := 16#81F9#;
  GL_SEPARATE_SPECULAR_COLOR_EXT    : constant := 16#81FA#;
  --#endif

  --#ifndef GL_EXT_secondary_color
  GL_COLOR_SUM_EXT                     : constant := 16#8458#;
  GL_CURRENT_SECONDARY_COLOR_EXT       : constant := 16#8459#;
  GL_SECONDARY_COLOR_ARRAY_SIZE_EXT    : constant := 16#845A#;
  GL_SECONDARY_COLOR_ARRAY_TYPE_EXT    : constant := 16#845B#;
  GL_SECONDARY_COLOR_ARRAY_STRIDE_EXT  : constant := 16#845C#;
  GL_SECONDARY_COLOR_ARRAY_POINTER_EXT : constant := 16#845D#;
  GL_SECONDARY_COLOR_ARRAY_EXT         : constant := 16#845E#;
  --#endif

  --#ifndef GL_EXT_texture_perturb_normal
  GL_PERTURB_EXT                    : constant := 16#85AE#;
  GL_TEXTURE_NORMAL_EXT             : constant := 16#85AF#;
  --#endif

  --#ifndef GL_EXT_multi_draw_arrays
  --#endif

  --#ifndef GL_EXT_fog_coord
  GL_FOG_COORDINATE_SOURCE_EXT        : constant := 16#8450#;
  GL_FOG_COORDINATE_EXT               : constant := 16#8451#;
  GL_FRAGMENT_DEPTH_EXT               : constant := 16#8452#;
  GL_CURRENT_FOG_COORDINATE_EXT       : constant := 16#8453#;
  GL_FOG_COORDINATE_ARRAY_TYPE_EXT    : constant := 16#8454#;
  GL_FOG_COORDINATE_ARRAY_STRIDE_EXT  : constant := 16#8455#;
  GL_FOG_COORDINATE_ARRAY_POINTER_EXT : constant := 16#8456#;
  GL_FOG_COORDINATE_ARRAY_EXT         : constant := 16#8457#;
  --#endif

  --#ifndef GL_REND_screen_coordinates
  GL_SCREEN_COORDINATES_REND        : constant := 16#8490#;
  GL_INVERTED_SCREEN_W_REND         : constant := 16#8491#;
  --#endif

  --#ifndef GL_EXT_coordinate_frame
  GL_TANGENT_ARRAY_EXT              : constant := 16#8439#;
  GL_BINORMAL_ARRAY_EXT             : constant := 16#843A#;
  GL_CURRENT_TANGENT_EXT            : constant := 16#843B#;
  GL_CURRENT_BINORMAL_EXT           : constant := 16#843C#;
  GL_TANGENT_ARRAY_TYPE_EXT         : constant := 16#843E#;
  GL_TANGENT_ARRAY_STRIDE_EXT       : constant := 16#843F#;
  GL_BINORMAL_ARRAY_TYPE_EXT        : constant := 16#8440#;
  GL_BINORMAL_ARRAY_STRIDE_EXT      : constant := 16#8441#;
  GL_TANGENT_ARRAY_POINTER_EXT      : constant := 16#8442#;
  GL_BINORMAL_ARRAY_POINTER_EXT     : constant := 16#8443#;
  GL_MAP1_TANGENT_EXT               : constant := 16#8444#;
  GL_MAP2_TANGENT_EXT               : constant := 16#8445#;
  GL_MAP1_BINORMAL_EXT              : constant := 16#8446#;
  GL_MAP2_BINORMAL_EXT              : constant := 16#8447#;
  --#endif

  --#ifndef GL_EXT_texture_env_combine
  GL_COMBINE_EXT                    : constant := 16#8570#;
  GL_COMBINE_RGB_EXT                : constant := 16#8571#;
  GL_COMBINE_ALPHA_EXT              : constant := 16#8572#;
  GL_RGB_SCALE_EXT                  : constant := 16#8573#;
  GL_ADD_SIGNED_EXT                 : constant := 16#8574#;
  GL_INTERPOLATE_EXT                : constant := 16#8575#;
  GL_CONSTANT_EXT                   : constant := 16#8576#;
  GL_PRIMARY_COLOR_EXT              : constant := 16#8577#;
  GL_PREVIOUS_EXT                   : constant := 16#8578#;
  GL_SOURCE0_RGB_EXT                : constant := 16#8580#;
  GL_SOURCE1_RGB_EXT                : constant := 16#8581#;
  GL_SOURCE2_RGB_EXT                : constant := 16#8582#;
  GL_SOURCE0_ALPHA_EXT              : constant := 16#8588#;
  GL_SOURCE1_ALPHA_EXT              : constant := 16#8589#;
  GL_SOURCE2_ALPHA_EXT              : constant := 16#858A#;
  GL_OPERAND0_RGB_EXT               : constant := 16#8590#;
  GL_OPERAND1_RGB_EXT               : constant := 16#8591#;
  GL_OPERAND2_RGB_EXT               : constant := 16#8592#;
  GL_OPERAND0_ALPHA_EXT             : constant := 16#8598#;
  GL_OPERAND1_ALPHA_EXT             : constant := 16#8599#;
  GL_OPERAND2_ALPHA_EXT             : constant := 16#859A#;
  --#endif

  --#ifndef GL_APPLE_specular_vector
  GL_LIGHT_MODEL_SPECULAR_VECTOR_APPLE : constant := 16#85B0#;
  --#endif

  --#ifndef GL_APPLE_transform_hint
  GL_TRANSFORM_HINT_APPLE           : constant := 16#85B1#;
  --#endif

  --#ifndef GL_SGIX_fog_scale
  GL_FOG_SCALE_SGIX                 : constant := 16#81FC#;
  GL_FOG_SCALE_VALUE_SGIX           : constant := 16#81FD#;
  --#endif

  --#ifndef GL_SUNX_constant_data
  GL_UNPACK_CONSTANT_DATA_SUNX      : constant := 16#81D5#;
  GL_TEXTURE_CONSTANT_DATA_SUNX     : constant := 16#81D6#;
  --#endif

  --#ifndef GL_SUN_global_alpha
  GL_GLOBAL_ALPHA_SUN               : constant := 16#81D9#;
  GL_GLOBAL_ALPHA_FACTOR_SUN        : constant := 16#81DA#;
  --#endif

  --#ifndef GL_SUN_triangle_list
  GL_RESTART_SUN                        : constant := 16#0001#;
  GL_REPLACE_MIDDLE_SUN                 : constant := 16#0002#;
  GL_REPLACE_OLDEST_SUN                 : constant := 16#0003#;
  GL_TRIANGLE_LIST_SUN                  : constant := 16#81D7#;
  GL_REPLACEMENT_CODE_SUN               : constant := 16#81D8#;
  GL_REPLACEMENT_CODE_ARRAY_SUN         : constant := 16#85C0#;
  GL_REPLACEMENT_CODE_ARRAY_TYPE_SUN    : constant := 16#85C1#;
  GL_REPLACEMENT_CODE_ARRAY_STRIDE_SUN  : constant := 16#85C2#;
  GL_REPLACEMENT_CODE_ARRAY_POINTER_SUN : constant := 16#85C3#;
  GL_R1UI_V3F_SUN                       : constant := 16#85C4#;
  GL_R1UI_C4UB_V3F_SUN                  : constant := 16#85C5#;
  GL_R1UI_C3F_V3F_SUN                   : constant := 16#85C6#;
  GL_R1UI_N3F_V3F_SUN                   : constant := 16#85C7#;
  GL_R1UI_C4F_N3F_V3F_SUN               : constant := 16#85C8#;
  GL_R1UI_T2F_V3F_SUN                   : constant := 16#85C9#;
  GL_R1UI_T2F_N3F_V3F_SUN               : constant := 16#85CA#;
  GL_R1UI_T2F_C4F_N3F_V3F_SUN           : constant := 16#85CB#;
  --#endif

  --#ifndef GL_SUN_vertex
  --#endif

  --#ifndef GL_EXT_blend_func_separate
  GL_BLEND_DST_RGB_EXT              : constant := 16#80C8#;
  GL_BLEND_SRC_RGB_EXT              : constant := 16#80C9#;
  GL_BLEND_DST_ALPHA_EXT            : constant := 16#80CA#;
  GL_BLEND_SRC_ALPHA_EXT            : constant := 16#80CB#;
  --#endif

  --#ifndef GL_INGR_color_clamp
  GL_RED_MIN_CLAMP_INGR             : constant := 16#8560#;
  GL_GREEN_MIN_CLAMP_INGR           : constant := 16#8561#;
  GL_BLUE_MIN_CLAMP_INGR            : constant := 16#8562#;
  GL_ALPHA_MIN_CLAMP_INGR           : constant := 16#8563#;
  GL_RED_MAX_CLAMP_INGR             : constant := 16#8564#;
  GL_GREEN_MAX_CLAMP_INGR           : constant := 16#8565#;
  GL_BLUE_MAX_CLAMP_INGR            : constant := 16#8566#;
  GL_ALPHA_MAX_CLAMP_INGR           : constant := 16#8567#;
  --#endif

  --#ifndef GL_INGR_interlace_read
  GL_INTERLACE_READ_INGR            : constant := 16#8568#;
  --#endif

  --#ifndef GL_EXT_stencil_wrap
  GL_INCR_WRAP_EXT                  : constant := 16#8507#;
  GL_DECR_WRAP_EXT                  : constant := 16#8508#;
  --#endif

  --#ifndef GL_EXT_422_pixels
  GL_422_EXT                        : constant := 16#80CC#;
  GL_422_REV_EXT                    : constant := 16#80CD#;
  GL_422_AVERAGE_EXT                : constant := 16#80CE#;
  GL_422_REV_AVERAGE_EXT            : constant := 16#80CF#;
  --#endif

  --#ifndef GL_NV_texgen_reflection
  GL_NORMAL_MAP_NV                  : constant := 16#8511#;
  GL_REFLECTION_MAP_NV              : constant := 16#8512#;
  --#endif

  --#ifndef GL_EXT_texture_cube_map
  GL_NORMAL_MAP_EXT                  : constant := 16#8511#;
  GL_REFLECTION_MAP_EXT              : constant := 16#8512#;
  GL_TEXTURE_CUBE_MAP_EXT            : constant := 16#8513#;
  GL_TEXTURE_BINDING_CUBE_MAP_EXT    : constant := 16#8514#;
  GL_TEXTURE_CUBE_MAP_POSITIVE_X_EXT : constant := 16#8515#;
  GL_TEXTURE_CUBE_MAP_NEGATIVE_X_EXT : constant := 16#8516#;
  GL_TEXTURE_CUBE_MAP_POSITIVE_Y_EXT : constant := 16#8517#;
  GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_EXT : constant := 16#8518#;
  GL_TEXTURE_CUBE_MAP_POSITIVE_Z_EXT : constant := 16#8519#;
  GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_EXT : constant := 16#851A#;
  GL_PROXY_TEXTURE_CUBE_MAP_EXT      : constant := 16#851B#;
  GL_MAX_CUBE_MAP_TEXTURE_SIZE_EXT   : constant := 16#851C#;
  --#endif

  --#ifndef GL_SUN_convolution_border_modes
  GL_WRAP_BORDER_SUN                : constant := 16#81D4#;
  --#endif

  --#ifndef GL_EXT_texture_env_add
  --#endif

  --#ifndef GL_EXT_texture_lod_bias
  GL_MAX_TEXTURE_LOD_BIAS_EXT       : constant := 16#84FD#;
  GL_TEXTURE_FILTER_CONTROL_EXT     : constant := 16#8500#;
  GL_TEXTURE_LOD_BIAS_EXT           : constant := 16#8501#;
  --#endif

  --#ifndef GL_EXT_texture_filter_anisotropic
  GL_TEXTURE_MAX_ANISOTROPY_EXT     : constant := 16#84FE#;
  GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT : constant := 16#84FF#;
  --#endif

  --#ifndef GL_EXT_vertex_weighting
  GL_MODELVIEW0_STACK_DEPTH_EXT      : constant := GL.GL_MODELVIEW_STACK_DEPTH;
  GL_MODELVIEW1_STACK_DEPTH_EXT      : constant := 16#8502#;
  GL_MODELVIEW0_MATRIX_EXT           : constant := GL.GL_MODELVIEW_MATRIX;
  GL_MODELVIEW1_MATRIX_EXT           : constant := 16#8506#;
  GL_VERTEX_WEIGHTING_EXT            : constant := 16#8509#;
  -- Fix the next line, in GL it's an enumeration.
  GL_MODELVIEW0_EXT                  : constant := 16#1700#;--GL.GL_MODELVIEW;
  GL_MODELVIEW1_EXT                  : constant := 16#850A#;
  GL_CURRENT_VERTEX_WEIGHT_EXT       : constant := 16#850B#;
  GL_VERTEX_WEIGHT_ARRAY_EXT         : constant := 16#850C#;
  GL_VERTEX_WEIGHT_ARRAY_SIZE_EXT    : constant := 16#850D#;
  GL_VERTEX_WEIGHT_ARRAY_TYPE_EXT    : constant := 16#850E#;
  GL_VERTEX_WEIGHT_ARRAY_STRIDE_EXT  : constant := 16#850F#;
  GL_VERTEX_WEIGHT_ARRAY_POINTER_EXT : constant := 16#8510#;
  --#endif

  --#ifndef GL_NV_light_max_exponent
  GL_MAX_SHININESS_NV               : constant := 16#8504#;
  GL_MAX_SPOT_EXPONENT_NV           : constant := 16#8505#;
  --#endif

  --#ifndef GL_NV_vertex_array_range
  GL_VERTEX_ARRAY_RANGE_NV             : constant := 16#851D#;
  GL_VERTEX_ARRAY_RANGE_LENGTH_NV      : constant := 16#851E#;
  GL_VERTEX_ARRAY_RANGE_VALID_NV       : constant := 16#851F#;
  GL_MAX_VERTEX_ARRAY_RANGE_ELEMENT_NV : constant := 16#8520#;
  GL_VERTEX_ARRAY_RANGE_POINTER_NV     : constant := 16#8521#;
  --#endif

  --#ifndef GL_NV_register_combiners
  GL_REGISTER_COMBINERS_NV          : constant := 16#8522#;
  GL_VARIABLE_A_NV                  : constant := 16#8523#;
  GL_VARIABLE_B_NV                  : constant := 16#8524#;
  GL_VARIABLE_C_NV                  : constant := 16#8525#;
  GL_VARIABLE_D_NV                  : constant := 16#8526#;
  GL_VARIABLE_E_NV                  : constant := 16#8527#;
  GL_VARIABLE_F_NV                  : constant := 16#8528#;
  GL_VARIABLE_G_NV                  : constant := 16#8529#;
  GL_CONSTANT_COLOR0_NV             : constant := 16#852A#;
  GL_CONSTANT_COLOR1_NV             : constant := 16#852B#;
  GL_PRIMARY_COLOR_NV               : constant := 16#852C#;
  GL_SECONDARY_COLOR_NV             : constant := 16#852D#;
  GL_SPARE0_NV                      : constant := 16#852E#;
  GL_SPARE1_NV                      : constant := 16#852F#;
  GL_DISCARD_NV                     : constant := 16#8530#;
  GL_E_TIMES_F_NV                   : constant := 16#8531#;
  GL_SPARE0_PLUS_SECONDARY_COLOR_NV : constant := 16#8532#;
  GL_UNSIGNED_IDENTITY_NV           : constant := 16#8536#;
  GL_UNSIGNED_INVERT_NV             : constant := 16#8537#;
  GL_EXPAND_NORMAL_NV               : constant := 16#8538#;
  GL_EXPAND_NEGATE_NV               : constant := 16#8539#;
  GL_HALF_BIAS_NORMAL_NV            : constant := 16#853A#;
  GL_HALF_BIAS_NEGATE_NV            : constant := 16#853B#;
  GL_SIGNED_IDENTITY_NV             : constant := 16#853C#;
  GL_SIGNED_NEGATE_NV               : constant := 16#853D#;
  GL_SCALE_BY_TWO_NV                : constant := 16#853E#;
  GL_SCALE_BY_FOUR_NV               : constant := 16#853F#;
  GL_SCALE_BY_ONE_HALF_NV           : constant := 16#8540#;
  GL_BIAS_BY_NEGATIVE_ONE_HALF_NV   : constant := 16#8541#;
  GL_COMBINER_INPUT_NV              : constant := 16#8542#;
  GL_COMBINER_MAPPING_NV            : constant := 16#8543#;
  GL_COMBINER_COMPONENT_USAGE_NV    : constant := 16#8544#;
  GL_COMBINER_AB_DOT_PRODUCT_NV     : constant := 16#8545#;
  GL_COMBINER_CD_DOT_PRODUCT_NV     : constant := 16#8546#;
  GL_COMBINER_MUX_SUM_NV            : constant := 16#8547#;
  GL_COMBINER_SCALE_NV              : constant := 16#8548#;
  GL_COMBINER_BIAS_NV               : constant := 16#8549#;
  GL_COMBINER_AB_OUTPUT_NV          : constant := 16#854A#;
  GL_COMBINER_CD_OUTPUT_NV          : constant := 16#854B#;
  GL_COMBINER_SUM_OUTPUT_NV         : constant := 16#854C#;
  GL_MAX_GENERAL_COMBINERS_NV       : constant := 16#854D#;
  GL_NUM_GENERAL_COMBINERS_NV       : constant := 16#854E#;
  GL_COLOR_SUM_CLAMP_NV             : constant := 16#854F#;
  GL_COMBINER0_NV                   : constant := 16#8550#;
  GL_COMBINER1_NV                   : constant := 16#8551#;
  GL_COMBINER2_NV                   : constant := 16#8552#;
  GL_COMBINER3_NV                   : constant := 16#8553#;
  GL_COMBINER4_NV                   : constant := 16#8554#;
  GL_COMBINER5_NV                   : constant := 16#8555#;
  GL_COMBINER6_NV                   : constant := 16#8556#;
  GL_COMBINER7_NV                   : constant := 16#8557#;
  --/* reuse GL_TEXTURE0_ARB */
  --/* reuse GL_TEXTURE1_ARB */
  --/* reuse GL_ZERO */
  --/* reuse GL_NONE */
  --/* reuse GL_FOG */
  --#endif

  --#ifndef GL_NV_fog_distance
  GL_FOG_DISTANCE_MODE_NV           : constant := 16#855A#;
  GL_EYE_RADIAL_NV                  : constant := 16#855B#;
  GL_EYE_PLANE_ABSOLUTE_NV          : constant := 16#855C#;
  --/* reuse GL_EYE_PLANE */
  --#endif

  --#ifndef GL_NV_texgen_emboss
  GL_EMBOSS_LIGHT_NV                : constant := 16#855D#;
  GL_EMBOSS_CONSTANT_NV             : constant := 16#855E#;
  GL_EMBOSS_MAP_NV                  : constant := 16#855F#;
  --#endif

  --#ifndef GL_NV_blend_square
  --#endif

  --#ifndef GL_NV_texture_env_combine4
  GL_COMBINE4_NV                    : constant := 16#8503#;
  GL_SOURCE3_RGB_NV                 : constant := 16#8583#;
  GL_SOURCE3_ALPHA_NV               : constant := 16#858B#;
  GL_OPERAND3_RGB_NV                : constant := 16#8593#;
  GL_OPERAND3_ALPHA_NV              : constant := 16#859B#;
  --#endif

  --#ifndef GL_MESA_resize_buffers
  --#endif

  --#ifndef GL_MESA_window_pos
  --#endif

  --#ifndef GL_EXT_texture_compression_s3tc
  GL_COMPRESSED_RGB_S3TC_DXT1_EXT   : constant := 16#83F0#;
  GL_COMPRESSED_RGBA_S3TC_DXT1_EXT  : constant := 16#83F1#;
  GL_COMPRESSED_RGBA_S3TC_DXT3_EXT  : constant := 16#83F2#;
  GL_COMPRESSED_RGBA_S3TC_DXT5_EXT  : constant := 16#83F3#;
  --#endif

  --#ifndef GL_IBM_cull_vertex
  GL_CULL_VERTEX_IBM                : constant := 103050;
  --#endif

  --#ifndef GL_IBM_multimode_draw_arrays
  --#endif

  --#ifndef GL_IBM_vertex_array_lists
  GL_VERTEX_ARRAY_LIST_IBM                 : constant := 103070;
  GL_NORMAL_ARRAY_LIST_IBM                 : constant := 103071;
  GL_COLOR_ARRAY_LIST_IBM                  : constant := 103072;
  GL_INDEX_ARRAY_LIST_IBM                  : constant := 103073;
  GL_TEXTURE_COORD_ARRAY_LIST_IBM          : constant := 103074;
  GL_EDGE_FLAG_ARRAY_LIST_IBM              : constant := 103075;
  GL_FOG_COORDINATE_ARRAY_LIST_IBM         : constant := 103076;
  GL_SECONDARY_COLOR_ARRAY_LIST_IBM        : constant := 103077;
  GL_VERTEX_ARRAY_LIST_STRIDE_IBM          : constant := 103080;
  GL_NORMAL_ARRAY_LIST_STRIDE_IBM          : constant := 103081;
  GL_COLOR_ARRAY_LIST_STRIDE_IBM           : constant := 103082;
  GL_INDEX_ARRAY_LIST_STRIDE_IBM           : constant := 103083;
  GL_TEXTURE_COORD_ARRAY_LIST_STRIDE_IBM   : constant := 103084;
  GL_EDGE_FLAG_ARRAY_LIST_STRIDE_IBM       : constant := 103085;
  GL_FOG_COORDINATE_ARRAY_LIST_STRIDE_IBM  : constant := 103086;
  GL_SECONDARY_COLOR_ARRAY_LIST_STRIDE_IBM : constant := 103087;
  --#endif

  --#ifndef GL_SGIX_subsample
  GL_PACK_SUBSAMPLE_RATE_SGIX       : constant := 16#85A0#;
  GL_UNPACK_SUBSAMPLE_RATE_SGIX     : constant := 16#85A1#;
  GL_PIXEL_SUBSAMPLE_4444_SGIX      : constant := 16#85A2#;
  GL_PIXEL_SUBSAMPLE_2424_SGIX      : constant := 16#85A3#;
  GL_PIXEL_SUBSAMPLE_4242_SGIX      : constant := 16#85A4#;
  --#endif

  --#ifndef GL_SGIX_ycrcb_subsample
  --#endif

  --#ifndef GL_SGIX_ycrcba
  GL_YCRCB_SGIX                     : constant := 16#8318#;
  GL_YCRCBA_SGIX                    : constant := 16#8319#;
  --#endif

  --#ifndef GL_SGI_depth_pass_instrument
  GL_DEPTH_PASS_INSTRUMENT_SGIX          : constant := 16#8310#;
  GL_DEPTH_PASS_INSTRUMENT_COUNTERS_SGIX : constant := 16#8311#;
  GL_DEPTH_PASS_INSTRUMENT_MAX_SGIX      : constant := 16#8312#;
  --#endif

  --#ifndef GL_3DFX_texture_compression_FXT1
  GL_COMPRESSED_RGB_FXT1_3DFX       : constant := 16#86B0#;
  GL_COMPRESSED_RGBA_FXT1_3DFX      : constant := 16#86B1#;
  --#endif

  --#ifndef GL_3DFX_multisample
  GL_MULTISAMPLE_3DFX               : constant := 16#86B2#;
  GL_SAMPLE_BUFFERS_3DFX            : constant := 16#86B3#;
  GL_SAMPLES_3DFX                   : constant := 16#86B4#;
  GL_MULTISAMPLE_BIT_3DFX           : constant := 16#2000_0000#;
  --#endif

  --#ifndef GL_3DFX_tbuffer
  --#endif

  --#ifndef GL_EXT_multisample
  GL_MULTISAMPLE_EXT                : constant := 16#809D#;
  GL_SAMPLE_ALPHA_TO_MASK_EXT       : constant := 16#809E#;
  GL_SAMPLE_ALPHA_TO_ONE_EXT        : constant := 16#809F#;
  GL_SAMPLE_MASK_EXT                : constant := 16#80A0#;
  GL_1PASS_EXT                      : constant := 16#80A1#;
  GL_2PASS_0_EXT                    : constant := 16#80A2#;
  GL_2PASS_1_EXT                    : constant := 16#80A3#;
  GL_4PASS_0_EXT                    : constant := 16#80A4#;
  GL_4PASS_1_EXT                    : constant := 16#80A5#;
  GL_4PASS_2_EXT                    : constant := 16#80A6#;
  GL_4PASS_3_EXT                    : constant := 16#80A7#;
  GL_SAMPLE_BUFFERS_EXT             : constant := 16#80A8#;
  GL_SAMPLES_EXT                    : constant := 16#80A9#;
  GL_SAMPLE_MASK_VALUE_EXT          : constant := 16#80AA#;
  GL_SAMPLE_MASK_INVERT_EXT         : constant := 16#80AB#;
  GL_SAMPLE_PATTERN_EXT             : constant := 16#80AC#;
  GL_MULTISAMPLE_BIT_EXT            : constant := 16#2000_0000#;
  --#endif

  --#ifndef GL_SGIX_vertex_preclip
  GL_VERTEX_PRECLIP_SGIX            : constant := 16#83EE#;
  GL_VERTEX_PRECLIP_HINT_SGIX       : constant := 16#83EF#;
  --#endif

  --#ifndef GL_SGIX_convolution_accuracy
  GL_CONVOLUTION_HINT_SGIX          : constant := 16#8316#;
  --#endif

  --#ifndef GL_SGIX_resample
  GL_PACK_RESAMPLE_SGIX             : constant := 16#842C#;
  GL_UNPACK_RESAMPLE_SGIX           : constant := 16#842D#;
  GL_RESAMPLE_REPLICATE_SGIX        : constant := 16#842E#;
  GL_RESAMPLE_ZERO_FILL_SGIX        : constant := 16#842F#;
  GL_RESAMPLE_DECIMATE_SGIX         : constant := 16#8430#;
  --#endif

  --#ifndef GL_SGIS_point_line_texgen
  GL_EYE_DISTANCE_TO_POINT_SGIS     : constant := 16#81F0#;
  GL_OBJECT_DISTANCE_TO_POINT_SGIS  : constant := 16#81F1#;
  GL_EYE_DISTANCE_TO_LINE_SGIS      : constant := 16#81F2#;
  GL_OBJECT_DISTANCE_TO_LINE_SGIS   : constant := 16#81F3#;
  GL_EYE_POINT_SGIS                 : constant := 16#81F4#;
  GL_OBJECT_POINT_SGIS              : constant := 16#81F5#;
  GL_EYE_LINE_SGIS                  : constant := 16#81F6#;
  GL_OBJECT_LINE_SGIS               : constant := 16#81F7#;
  --#endif

  --#ifndef GL_SGIS_texture_color_mask
  GL_TEXTURE_COLOR_WRITEMASK_SGIS   : constant := 16#81EF#;
  --#endif

  --#ifndef GL_EXT_texture_env_dot3
  GL_DOT3_RGB_EXT                   : constant := 16#8740#;
  GL_DOT3_RGBA_EXT                  : constant := 16#8741#;
  --#endif

  --#ifndef GL_ATI_texture_mirror_once
  GL_MIRROR_CLAMP_ATI               : constant := 16#8742#;
  GL_MIRROR_CLAMP_TO_EDGE_ATI       : constant := 16#8743#;
  --#endif

  --#ifndef GL_NV_fence
  GL_ALL_COMPLETED_NV               : constant := 16#84F2#;
  GL_FENCE_STATUS_NV                : constant := 16#84F3#;
  GL_FENCE_CONDITION_NV             : constant := 16#84F4#;
  --#endif

  --#ifndef GL_IBM_texture_mirrored_repeat
  GL_MIRRORED_REPEAT_IBM            : constant := 16#8370#;
  --#endif

  --#ifndef GL_NV_evaluators
  GL_EVAL_2D_NV                      : constant := 16#86C0#;
  GL_EVAL_TRIANGULAR_2D_NV           : constant := 16#86C1#;
  GL_MAP_TESSELLATION_NV             : constant := 16#86C2#;
  GL_MAP_ATTRIB_U_ORDER_NV           : constant := 16#86C3#;
  GL_MAP_ATTRIB_V_ORDER_NV           : constant := 16#86C4#;
  GL_EVAL_FRACTIONAL_TESSELLATION_NV : constant := 16#86C5#;
  GL_EVAL_VERTEX_ATTRIB0_NV          : constant := 16#86C6#;
  GL_EVAL_VERTEX_ATTRIB1_NV          : constant := 16#86C7#;
  GL_EVAL_VERTEX_ATTRIB2_NV          : constant := 16#86C8#;
  GL_EVAL_VERTEX_ATTRIB3_NV          : constant := 16#86C9#;
  GL_EVAL_VERTEX_ATTRIB4_NV          : constant := 16#86CA#;
  GL_EVAL_VERTEX_ATTRIB5_NV          : constant := 16#86CB#;
  GL_EVAL_VERTEX_ATTRIB6_NV          : constant := 16#86CC#;
  GL_EVAL_VERTEX_ATTRIB7_NV          : constant := 16#86CD#;
  GL_EVAL_VERTEX_ATTRIB8_NV          : constant := 16#86CE#;
  GL_EVAL_VERTEX_ATTRIB9_NV          : constant := 16#86CF#;
  GL_EVAL_VERTEX_ATTRIB10_NV         : constant := 16#86D0#;
  GL_EVAL_VERTEX_ATTRIB11_NV         : constant := 16#86D1#;
  GL_EVAL_VERTEX_ATTRIB12_NV         : constant := 16#86D2#;
  GL_EVAL_VERTEX_ATTRIB13_NV         : constant := 16#86D3#;
  GL_EVAL_VERTEX_ATTRIB14_NV         : constant := 16#86D4#;
  GL_EVAL_VERTEX_ATTRIB15_NV         : constant := 16#86D5#;
  GL_MAX_MAP_TESSELLATION_NV         : constant := 16#86D6#;
  GL_MAX_RATIONAL_EVAL_ORDER_NV      : constant := 16#86D7#;
  --#endif

  --#ifndef GL_NV_packed_depth_stencil
  GL_DEPTH_STENCIL_NV               : constant := 16#84F9#;
  GL_UNSIGNED_INT_24_8_NV           : constant := 16#84FA#;
  --#endif

  --#ifndef GL_NV_register_combiners2
  GL_PER_STAGE_CONSTANTS_NV         : constant := 16#8535#;
  --#endif

  --#ifndef GL_NV_texture_compression_vtc
  --#endif

  --#ifndef GL_NV_texture_rectangle
  GL_TEXTURE_RECTANGLE_NV           : constant := 16#84F5#;
  GL_TEXTURE_BINDING_RECTANGLE_NV   : constant := 16#84F6#;
  GL_PROXY_TEXTURE_RECTANGLE_NV     : constant := 16#84F7#;
  GL_MAX_RECTANGLE_TEXTURE_SIZE_NV  : constant := 16#84F8#;
  --#endif

  --#ifndef GL_NV_texture_shader
  GL_OFFSET_TEXTURE_RECTANGLE_NV               : constant := 16#864C#;
  GL_OFFSET_TEXTURE_RECTANGLE_SCALE_NV         : constant := 16#864D#;
  GL_DOT_PRODUCT_TEXTURE_RECTANGLE_NV          : constant := 16#864E#;
  GL_RGBA_UNSIGNED_DOT_PRODUCT_MAPPING_NV      : constant := 16#86D9#;
  GL_UNSIGNED_INT_S8_S8_8_8_NV                 : constant := 16#86DA#;
  GL_UNSIGNED_INT_8_8_S8_S8_REV_NV             : constant := 16#86DB#;
  GL_DSDT_MAG_INTENSITY_NV                     : constant := 16#86DC#;
  GL_SHADER_CONSISTENT_NV                      : constant := 16#86DD#;
  GL_TEXTURE_SHADER_NV                         : constant := 16#86DE#;
  GL_SHADER_OPERATION_NV                       : constant := 16#86DF#;
  GL_CULL_MODES_NV                             : constant := 16#86E0#;
  GL_OFFSET_TEXTURE_MATRIX_NV                  : constant := 16#86E1#;
  GL_OFFSET_TEXTURE_SCALE_NV                   : constant := 16#86E2#;
  GL_OFFSET_TEXTURE_BIAS_NV                    : constant := 16#86E3#;
  GL_OFFSET_TEXTURE_2D_MATRIX_NV               : constant := GL_OFFSET_TEXTURE_MATRIX_NV;
  GL_OFFSET_TEXTURE_2D_SCALE_NV                : constant := GL_OFFSET_TEXTURE_SCALE_NV;
  GL_OFFSET_TEXTURE_2D_BIAS_NV                 : constant := GL_OFFSET_TEXTURE_BIAS_NV;
  GL_PREVIOUS_TEXTURE_INPUT_NV                 : constant := 16#86E4#;
  GL_CONST_EYE_NV                              : constant := 16#86E5#;
  GL_PASS_THROUGH_NV                           : constant := 16#86E6#;
  GL_CULL_FRAGMENT_NV                          : constant := 16#86E7#;
  GL_OFFSET_TEXTURE_2D_NV                      : constant := 16#86E8#;
  GL_DEPENDENT_AR_TEXTURE_2D_NV                : constant := 16#86E9#;
  GL_DEPENDENT_GB_TEXTURE_2D_NV                : constant := 16#86EA#;
  GL_DOT_PRODUCT_NV                            : constant := 16#86EC#;
  GL_DOT_PRODUCT_DEPTH_REPLACE_NV              : constant := 16#86ED#;
  GL_DOT_PRODUCT_TEXTURE_2D_NV                 : constant := 16#86EE#;
  GL_DOT_PRODUCT_TEXTURE_CUBE_MAP_NV           : constant := 16#86F0#;
  GL_DOT_PRODUCT_DIFFUSE_CUBE_MAP_NV           : constant := 16#86F1#;
  GL_DOT_PRODUCT_REFLECT_CUBE_MAP_NV           : constant := 16#86F2#;
  GL_DOT_PRODUCT_CONST_EYE_REFLECT_CUBE_MAP_NV : constant := 16#86F3#;
  GL_HILO_NV                                   : constant := 16#86F4#;
  GL_DSDT_NV                                   : constant := 16#86F5#;
  GL_DSDT_MAG_NV                               : constant := 16#86F6#;
  GL_DSDT_MAG_VIB_NV                           : constant := 16#86F7#;
  GL_HILO16_NV                                 : constant := 16#86F8#;
  GL_SIGNED_HILO_NV                            : constant := 16#86F9#;
  GL_SIGNED_HILO16_NV                          : constant := 16#86FA#;
  GL_SIGNED_RGBA_NV                            : constant := 16#86FB#;
  GL_SIGNED_RGBA8_NV                           : constant := 16#86FC#;
  GL_SIGNED_RGB_NV                             : constant := 16#86FE#;
  GL_SIGNED_RGB8_NV                            : constant := 16#86FF#;
  GL_SIGNED_LUMINANCE_NV                       : constant := 16#8701#;
  GL_SIGNED_LUMINANCE8_NV                      : constant := 16#8702#;
  GL_SIGNED_LUMINANCE_ALPHA_NV                 : constant := 16#8703#;
  GL_SIGNED_LUMINANCE8_ALPHA8_NV               : constant := 16#8704#;
  GL_SIGNED_ALPHA_NV                           : constant := 16#8705#;
  GL_SIGNED_ALPHA8_NV                          : constant := 16#8706#;
  GL_SIGNED_INTENSITY_NV                       : constant := 16#8707#;
  GL_SIGNED_INTENSITY8_NV                      : constant := 16#8708#;
  GL_DSDT8_NV                                  : constant := 16#8709#;
  GL_DSDT8_MAG8_NV                             : constant := 16#870A#;
  GL_DSDT8_MAG8_INTENSITY8_NV                  : constant := 16#870B#;
  GL_SIGNED_RGB_UNSIGNED_ALPHA_NV              : constant := 16#870C#;
  GL_SIGNED_RGB8_UNSIGNED_ALPHA8_NV            : constant := 16#870D#;
  GL_HI_SCALE_NV                               : constant := 16#870E#;
  GL_LO_SCALE_NV                               : constant := 16#870F#;
  GL_DS_SCALE_NV                               : constant := 16#8710#;
  GL_DT_SCALE_NV                               : constant := 16#8711#;
  GL_MAGNITUDE_SCALE_NV                        : constant := 16#8712#;
  GL_VIBRANCE_SCALE_NV                         : constant := 16#8713#;
  GL_HI_BIAS_NV                                : constant := 16#8714#;
  GL_LO_BIAS_NV                                : constant := 16#8715#;
  GL_DS_BIAS_NV                                : constant := 16#8716#;
  GL_DT_BIAS_NV                                : constant := 16#8717#;
  GL_MAGNITUDE_BIAS_NV                         : constant := 16#8718#;
  GL_VIBRANCE_BIAS_NV                          : constant := 16#8719#;
  GL_TEXTURE_BORDER_VALUES_NV                  : constant := 16#871A#;
  GL_TEXTURE_HI_SIZE_NV                        : constant := 16#871B#;
  GL_TEXTURE_LO_SIZE_NV                        : constant := 16#871C#;
  GL_TEXTURE_DS_SIZE_NV                        : constant := 16#871D#;
  GL_TEXTURE_DT_SIZE_NV                        : constant := 16#871E#;
  GL_TEXTURE_MAG_SIZE_NV                       : constant := 16#871F#;
  --#endif

  --#ifndef GL_NV_texture_shader2
  GL_DOT_PRODUCT_TEXTURE_3D_NV      : constant := 16#86EF#;
  --#endif

  --#ifndef GL_NV_vertex_array_range2
  GL_VERTEX_ARRAY_RANGE_WITHOUT_FLUSH_NV : constant := 16#8533#;
  --#endif

  --#ifndef GL_NV_vertex_program
  GL_VERTEX_PROGRAM_NV               : constant := 16#8620#;
  GL_VERTEX_STATE_PROGRAM_NV         : constant := 16#8621#;
  GL_ATTRIB_ARRAY_SIZE_NV            : constant := 16#8623#;
  GL_ATTRIB_ARRAY_STRIDE_NV          : constant := 16#8624#;
  GL_ATTRIB_ARRAY_TYPE_NV            : constant := 16#8625#;
  GL_CURRENT_ATTRIB_NV               : constant := 16#8626#;
  GL_PROGRAM_LENGTH_NV               : constant := 16#8627#;
  GL_PROGRAM_STRING_NV               : constant := 16#8628#;
  GL_MODELVIEW_PROJECTION_NV         : constant := 16#8629#;
  GL_IDENTITY_NV                     : constant := 16#862A#;
  GL_INVERSE_NV                      : constant := 16#862B#;
  GL_TRANSPOSE_NV                    : constant := 16#862C#;
  GL_INVERSE_TRANSPOSE_NV            : constant := 16#862D#;
  GL_MAX_TRACK_MATRIX_STACK_DEPTH_NV : constant := 16#862E#;
  GL_MAX_TRACK_MATRICES_NV           : constant := 16#862F#;
  GL_MATRIX0_NV                      : constant := 16#8630#;
  GL_MATRIX1_NV                      : constant := 16#8631#;
  GL_MATRIX2_NV                      : constant := 16#8632#;
  GL_MATRIX3_NV                      : constant := 16#8633#;
  GL_MATRIX4_NV                      : constant := 16#8634#;
  GL_MATRIX5_NV                      : constant := 16#8635#;
  GL_MATRIX6_NV                      : constant := 16#8636#;
  GL_MATRIX7_NV                      : constant := 16#8637#;
  GL_CURRENT_MATRIX_STACK_DEPTH_NV   : constant := 16#8640#;
  GL_CURRENT_MATRIX_NV               : constant := 16#8641#;
  GL_VERTEX_PROGRAM_POINT_SIZE_NV    : constant := 16#8642#;
  GL_VERTEX_PROGRAM_TWO_SIDE_NV      : constant := 16#8643#;
  GL_PROGRAM_PARAMETER_NV            : constant := 16#8644#;
  GL_ATTRIB_ARRAY_POINTER_NV         : constant := 16#8645#;
  GL_PROGRAM_TARGET_NV               : constant := 16#8646#;
  GL_PROGRAM_RESIDENT_NV             : constant := 16#8647#;
  GL_TRACK_MATRIX_NV                 : constant := 16#8648#;
  GL_TRACK_MATRIX_TRANSFORM_NV       : constant := 16#8649#;
  GL_VERTEX_PROGRAM_BINDING_NV       : constant := 16#864A#;
  GL_PROGRAM_ERROR_POSITION_NV       : constant := 16#864B#;
  GL_VERTEX_ATTRIB_ARRAY0_NV         : constant := 16#8650#;
  GL_VERTEX_ATTRIB_ARRAY1_NV         : constant := 16#8651#;
  GL_VERTEX_ATTRIB_ARRAY2_NV         : constant := 16#8652#;
  GL_VERTEX_ATTRIB_ARRAY3_NV         : constant := 16#8653#;
  GL_VERTEX_ATTRIB_ARRAY4_NV         : constant := 16#8654#;
  GL_VERTEX_ATTRIB_ARRAY5_NV         : constant := 16#8655#;
  GL_VERTEX_ATTRIB_ARRAY6_NV         : constant := 16#8656#;
  GL_VERTEX_ATTRIB_ARRAY7_NV         : constant := 16#8657#;
  GL_VERTEX_ATTRIB_ARRAY8_NV         : constant := 16#8658#;
  GL_VERTEX_ATTRIB_ARRAY9_NV         : constant := 16#8659#;
  GL_VERTEX_ATTRIB_ARRAY10_NV        : constant := 16#865A#;
  GL_VERTEX_ATTRIB_ARRAY11_NV        : constant := 16#865B#;
  GL_VERTEX_ATTRIB_ARRAY12_NV        : constant := 16#865C#;
  GL_VERTEX_ATTRIB_ARRAY13_NV        : constant := 16#865D#;
  GL_VERTEX_ATTRIB_ARRAY14_NV        : constant := 16#865E#;
  GL_VERTEX_ATTRIB_ARRAY15_NV        : constant := 16#865F#;
  GL_MAP1_VERTEX_ATTRIB0_4_NV        : constant := 16#8660#;
  GL_MAP1_VERTEX_ATTRIB1_4_NV        : constant := 16#8661#;
  GL_MAP1_VERTEX_ATTRIB2_4_NV        : constant := 16#8662#;
  GL_MAP1_VERTEX_ATTRIB3_4_NV        : constant := 16#8663#;
  GL_MAP1_VERTEX_ATTRIB4_4_NV        : constant := 16#8664#;
  GL_MAP1_VERTEX_ATTRIB5_4_NV        : constant := 16#8665#;
  GL_MAP1_VERTEX_ATTRIB6_4_NV        : constant := 16#8666#;
  GL_MAP1_VERTEX_ATTRIB7_4_NV        : constant := 16#8667#;
  GL_MAP1_VERTEX_ATTRIB8_4_NV        : constant := 16#8668#;
  GL_MAP1_VERTEX_ATTRIB9_4_NV        : constant := 16#8669#;
  GL_MAP1_VERTEX_ATTRIB10_4_NV       : constant := 16#866A#;
  GL_MAP1_VERTEX_ATTRIB11_4_NV       : constant := 16#866B#;
  GL_MAP1_VERTEX_ATTRIB12_4_NV       : constant := 16#866C#;
  GL_MAP1_VERTEX_ATTRIB13_4_NV       : constant := 16#866D#;
  GL_MAP1_VERTEX_ATTRIB14_4_NV       : constant := 16#866E#;
  GL_MAP1_VERTEX_ATTRIB15_4_NV       : constant := 16#866F#;
  GL_MAP2_VERTEX_ATTRIB0_4_NV        : constant := 16#8670#;
  GL_MAP2_VERTEX_ATTRIB1_4_NV        : constant := 16#8671#;
  GL_MAP2_VERTEX_ATTRIB2_4_NV        : constant := 16#8672#;
  GL_MAP2_VERTEX_ATTRIB3_4_NV        : constant := 16#8673#;
  GL_MAP2_VERTEX_ATTRIB4_4_NV        : constant := 16#8674#;
  GL_MAP2_VERTEX_ATTRIB5_4_NV        : constant := 16#8675#;
  GL_MAP2_VERTEX_ATTRIB6_4_NV        : constant := 16#8676#;
  GL_MAP2_VERTEX_ATTRIB7_4_NV        : constant := 16#8677#;
  GL_MAP2_VERTEX_ATTRIB8_4_NV        : constant := 16#8678#;
  GL_MAP2_VERTEX_ATTRIB9_4_NV        : constant := 16#8679#;
  GL_MAP2_VERTEX_ATTRIB10_4_NV       : constant := 16#867A#;
  GL_MAP2_VERTEX_ATTRIB11_4_NV       : constant := 16#867B#;
  GL_MAP2_VERTEX_ATTRIB12_4_NV       : constant := 16#867C#;
  GL_MAP2_VERTEX_ATTRIB13_4_NV       : constant := 16#867D#;
  GL_MAP2_VERTEX_ATTRIB14_4_NV       : constant := 16#867E#;
  GL_MAP2_VERTEX_ATTRIB15_4_NV       : constant := 16#867F#;
  --#endif

  --#ifndef GL_SGIX_texture_coordinate_clamp
  GL_TEXTURE_MAX_CLAMP_S_SGIX       : constant := 16#8369#;
  GL_TEXTURE_MAX_CLAMP_T_SGIX       : constant := 16#836A#;
  GL_TEXTURE_MAX_CLAMP_R_SGIX       : constant := 16#836B#;
  --#endif

  --#ifndef GL_SGIX_scalebias_hint
  GL_SCALEBIAS_HINT_SGIX            : constant := 16#8322#;
  --#endif

  --#ifndef GL_OML_interlace
  GL_INTERLACE_OML                  : constant := 16#8980#;
  GL_INTERLACE_READ_OML             : constant := 16#8981#;
  --#endif

  --#ifndef GL_OML_subsample
  GL_FORMAT_SUBSAMPLE_24_24_OML     : constant := 16#8982#;
  GL_FORMAT_SUBSAMPLE_244_244_OML   : constant := 16#8983#;
  --#endif

  --#ifndef GL_OML_resample
  GL_PACK_RESAMPLE_OML              : constant := 16#8984#;
  GL_UNPACK_RESAMPLE_OML            : constant := 16#8985#;
  GL_RESAMPLE_REPLICATE_OML         : constant := 16#8986#;
  GL_RESAMPLE_ZERO_FILL_OML         : constant := 16#8987#;
  GL_RESAMPLE_AVERAGE_OML           : constant := 16#8988#;
  GL_RESAMPLE_DECIMATE_OML          : constant := 16#8989#;
  --#endif

  --#ifndef GL_NV_copy_depth_to_color
  GL_DEPTH_STENCIL_TO_RGBA_NV       : constant := 16#886E#;
  GL_DEPTH_STENCIL_TO_BGRA_NV       : constant := 16#886F#;
  --#endif

  --#ifndef GL_ATI_envmap_bumpmap
  GL_BUMP_ROT_MATRIX_ATI            : constant := 16#8775#;
  GL_BUMP_ROT_MATRIX_SIZE_ATI       : constant := 16#8776#;
  GL_BUMP_NUM_TEX_UNITS_ATI         : constant := 16#8777#;
  GL_BUMP_TEX_UNITS_ATI             : constant := 16#8778#;
  GL_DUDV_ATI                       : constant := 16#8779#;
  GL_DU8DV8_ATI                     : constant := 16#877A#;
  GL_BUMP_ENVMAP_ATI                : constant := 16#877B#;
  GL_BUMP_TARGET_ATI                : constant := 16#877C#;
  --#endif

  --#ifndef GL_ATI_fragment_shader
  GL_FRAGMENT_SHADER_ATI                   : constant := 16#8920#;
  GL_REG_0_ATI                             : constant := 16#8921#;
  GL_REG_1_ATI                             : constant := 16#8922#;
  GL_REG_2_ATI                             : constant := 16#8923#;
  GL_REG_3_ATI                             : constant := 16#8924#;
  GL_REG_4_ATI                             : constant := 16#8925#;
  GL_REG_5_ATI                             : constant := 16#8926#;
  GL_REG_6_ATI                             : constant := 16#8927#;
  GL_REG_7_ATI                             : constant := 16#8928#;
  GL_REG_8_ATI                             : constant := 16#8929#;
  GL_REG_9_ATI                             : constant := 16#892A#;
  GL_REG_10_ATI                            : constant := 16#892B#;
  GL_REG_11_ATI                            : constant := 16#892C#;
  GL_REG_12_ATI                            : constant := 16#892D#;
  GL_REG_13_ATI                            : constant := 16#892E#;
  GL_REG_14_ATI                            : constant := 16#892F#;
  GL_REG_15_ATI                            : constant := 16#8930#;
  GL_REG_16_ATI                            : constant := 16#8931#;
  GL_REG_17_ATI                            : constant := 16#8932#;
  GL_REG_18_ATI                            : constant := 16#8933#;
  GL_REG_19_ATI                            : constant := 16#8934#;
  GL_REG_20_ATI                            : constant := 16#8935#;
  GL_REG_21_ATI                            : constant := 16#8936#;
  GL_REG_22_ATI                            : constant := 16#8937#;
  GL_REG_23_ATI                            : constant := 16#8938#;
  GL_REG_24_ATI                            : constant := 16#8939#;
  GL_REG_25_ATI                            : constant := 16#893A#;
  GL_REG_26_ATI                            : constant := 16#893B#;
  GL_REG_27_ATI                            : constant := 16#893C#;
  GL_REG_28_ATI                            : constant := 16#893D#;
  GL_REG_29_ATI                            : constant := 16#893E#;
  GL_REG_30_ATI                            : constant := 16#893F#;
  GL_REG_31_ATI                            : constant := 16#8940#;
  GL_CON_0_ATI                             : constant := 16#8941#;
  GL_CON_1_ATI                             : constant := 16#8942#;
  GL_CON_2_ATI                             : constant := 16#8943#;
  GL_CON_3_ATI                             : constant := 16#8944#;
  GL_CON_4_ATI                             : constant := 16#8945#;
  GL_CON_5_ATI                             : constant := 16#8946#;
  GL_CON_6_ATI                             : constant := 16#8947#;
  GL_CON_7_ATI                             : constant := 16#8948#;
  GL_CON_8_ATI                             : constant := 16#8949#;
  GL_CON_9_ATI                             : constant := 16#894A#;
  GL_CON_10_ATI                            : constant := 16#894B#;
  GL_CON_11_ATI                            : constant := 16#894C#;
  GL_CON_12_ATI                            : constant := 16#894D#;
  GL_CON_13_ATI                            : constant := 16#894E#;
  GL_CON_14_ATI                            : constant := 16#894F#;
  GL_CON_15_ATI                            : constant := 16#8950#;
  GL_CON_16_ATI                            : constant := 16#8951#;
  GL_CON_17_ATI                            : constant := 16#8952#;
  GL_CON_18_ATI                            : constant := 16#8953#;
  GL_CON_19_ATI                            : constant := 16#8954#;
  GL_CON_20_ATI                            : constant := 16#8955#;
  GL_CON_21_ATI                            : constant := 16#8956#;
  GL_CON_22_ATI                            : constant := 16#8957#;
  GL_CON_23_ATI                            : constant := 16#8958#;
  GL_CON_24_ATI                            : constant := 16#8959#;
  GL_CON_25_ATI                            : constant := 16#895A#;
  GL_CON_26_ATI                            : constant := 16#895B#;
  GL_CON_27_ATI                            : constant := 16#895C#;
  GL_CON_28_ATI                            : constant := 16#895D#;
  GL_CON_29_ATI                            : constant := 16#895E#;
  GL_CON_30_ATI                            : constant := 16#895F#;
  GL_CON_31_ATI                            : constant := 16#8960#;
  GL_MOV_ATI                               : constant := 16#8961#;
  GL_ADD_ATI                               : constant := 16#8963#;
  GL_MUL_ATI                               : constant := 16#8964#;
  GL_SUB_ATI                               : constant := 16#8965#;
  GL_DOT3_ATI                              : constant := 16#8966#;
  GL_DOT4_ATI                              : constant := 16#8967#;
  GL_MAD_ATI                               : constant := 16#8968#;
  GL_LERP_ATI                              : constant := 16#8969#;
  GL_CND_ATI                               : constant := 16#896A#;
  GL_CND0_ATI                              : constant := 16#896B#;
  GL_DOT2_ADD_ATI                          : constant := 16#896C#;
  GL_SECONDARY_INTERPOLATOR_ATI            : constant := 16#896D#;
  GL_NUM_FRAGMENT_REGISTERS_ATI            : constant := 16#896E#;
  GL_NUM_FRAGMENT_CONSTANTS_ATI            : constant := 16#896F#;
  GL_NUM_PASSES_ATI                        : constant := 16#8970#;
  GL_NUM_INSTRUCTIONS_PER_PASS_ATI         : constant := 16#8971#;
  GL_NUM_INSTRUCTIONS_TOTAL_ATI            : constant := 16#8972#;
  GL_NUM_INPUT_INTERPOLATOR_COMPONENTS_ATI : constant := 16#8973#;
  GL_NUM_LOOPBACK_COMPONENTS_ATI           : constant := 16#8974#;
  GL_COLOR_ALPHA_PAIRING_ATI               : constant := 16#8975#;
  GL_SWIZZLE_STR_ATI                       : constant := 16#8976#;
  GL_SWIZZLE_STQ_ATI                       : constant := 16#8977#;
  GL_SWIZZLE_STR_DR_ATI                    : constant := 16#8978#;
  GL_SWIZZLE_STQ_DQ_ATI                    : constant := 16#8979#;
  GL_SWIZZLE_STRQ_ATI                      : constant := 16#897A#;
  GL_SWIZZLE_STRQ_DQ_ATI                   : constant := 16#897B#;
  GL_RED_BIT_ATI                           : constant := 16#0000_0001#;
  GL_GREEN_BIT_ATI                         : constant := 16#0000_0002#;
  GL_BLUE_BIT_ATI                          : constant := 16#0000_0004#;
  GL_2X_BIT_ATI                            : constant := 16#0000_0001#;
  GL_4X_BIT_ATI                            : constant := 16#0000_0002#;
  GL_8X_BIT_ATI                            : constant := 16#0000_0004#;
  GL_HALF_BIT_ATI                          : constant := 16#0000_0008#;
  GL_QUARTER_BIT_ATI                       : constant := 16#0000_0010#;
  GL_EIGHTH_BIT_ATI                        : constant := 16#0000_0020#;
  GL_SATURATE_BIT_ATI                      : constant := 16#0000_0040#;
  GL_COMP_BIT_ATI                          : constant := 16#0000_0002#;
  GL_NEGATE_BIT_ATI                        : constant := 16#0000_0004#;
  GL_BIAS_BIT_ATI                          : constant := 16#0000_0008#;
  --#endif

  --#ifndef GL_ATI_pn_triangles
  GL_PN_TRIANGLES_ATI                       : constant := 16#87F0#;
  GL_MAX_PN_TRIANGLES_TESSELATION_LEVEL_ATI : constant := 16#87F1#;
  GL_PN_TRIANGLES_POINT_MODE_ATI            : constant := 16#87F2#;
  GL_PN_TRIANGLES_NORMAL_MODE_ATI           : constant := 16#87F3#;
  GL_PN_TRIANGLES_TESSELATION_LEVEL_ATI     : constant := 16#87F4#;
  GL_PN_TRIANGLES_POINT_MODE_LINEAR_ATI     : constant := 16#87F5#;
  GL_PN_TRIANGLES_POINT_MODE_CUBIC_ATI      : constant := 16#87F6#;
  GL_PN_TRIANGLES_NORMAL_MODE_LINEAR_ATI    : constant := 16#87F7#;
  GL_PN_TRIANGLES_NORMAL_MODE_QUADRATIC_ATI : constant := 16#87F8#;
  --#endif

  --#ifndef GL_ATI_vertex_array_object
  GL_STATIC_ATI                     : constant := 16#8760#;
  GL_DYNAMIC_ATI                    : constant := 16#8761#;
  GL_PRESERVE_ATI                   : constant := 16#8762#;
  GL_DISCARD_ATI                    : constant := 16#8763#;
  GL_OBJECT_BUFFER_SIZE_ATI         : constant := 16#8764#;
  GL_OBJECT_BUFFER_USAGE_ATI        : constant := 16#8765#;
  GL_ARRAY_OBJECT_BUFFER_ATI        : constant := 16#8766#;
  GL_ARRAY_OBJECT_OFFSET_ATI        : constant := 16#8767#;
  --#endif

  --#ifndef GL_EXT_vertex_shader
  GL_VERTEX_SHADER_EXT                               : constant := 16#8780#;
  GL_VERTEX_SHADER_BINDING_EXT                       : constant := 16#8781#;
  GL_OP_INDEX_EXT                                    : constant := 16#8782#;
  GL_OP_NEGATE_EXT                                   : constant := 16#8783#;
  GL_OP_DOT3_EXT                                     : constant := 16#8784#;
  GL_OP_DOT4_EXT                                     : constant := 16#8785#;
  GL_OP_MUL_EXT                                      : constant := 16#8786#;
  GL_OP_ADD_EXT                                      : constant := 16#8787#;
  GL_OP_MADD_EXT                                     : constant := 16#8788#;
  GL_OP_FRAC_EXT                                     : constant := 16#8789#;
  GL_OP_MAX_EXT                                      : constant := 16#878A#;
  GL_OP_MIN_EXT                                      : constant := 16#878B#;
  GL_OP_SET_GE_EXT                                   : constant := 16#878C#;
  GL_OP_SET_LT_EXT                                   : constant := 16#878D#;
  GL_OP_CLAMP_EXT                                    : constant := 16#878E#;
  GL_OP_FLOOR_EXT                                    : constant := 16#878F#;
  GL_OP_ROUND_EXT                                    : constant := 16#8790#;
  GL_OP_EXP_BASE_2_EXT                               : constant := 16#8791#;
  GL_OP_LOG_BASE_2_EXT                               : constant := 16#8792#;
  GL_OP_POWER_EXT                                    : constant := 16#8793#;
  GL_OP_RECIP_EXT                                    : constant := 16#8794#;
  GL_OP_RECIP_SQRT_EXT                               : constant := 16#8795#;
  GL_OP_SUB_EXT                                      : constant := 16#8796#;
  GL_OP_CROSS_PRODUCT_EXT                            : constant := 16#8797#;
  GL_OP_MULTIPLY_MATRIX_EXT                          : constant := 16#8798#;
  GL_OP_MOV_EXT                                      : constant := 16#8799#;
  GL_OUTPUT_VERTEX_EXT                               : constant := 16#879A#;
  GL_OUTPUT_COLOR0_EXT                               : constant := 16#879B#;
  GL_OUTPUT_COLOR1_EXT                               : constant := 16#879C#;
  GL_OUTPUT_TEXTURE_COORD0_EXT                       : constant := 16#879D#;
  GL_OUTPUT_TEXTURE_COORD1_EXT                       : constant := 16#879E#;
  GL_OUTPUT_TEXTURE_COORD2_EXT                       : constant := 16#879F#;
  GL_OUTPUT_TEXTURE_COORD3_EXT                       : constant := 16#87A0#;
  GL_OUTPUT_TEXTURE_COORD4_EXT                       : constant := 16#87A1#;
  GL_OUTPUT_TEXTURE_COORD5_EXT                       : constant := 16#87A2#;
  GL_OUTPUT_TEXTURE_COORD6_EXT                       : constant := 16#87A3#;
  GL_OUTPUT_TEXTURE_COORD7_EXT                       : constant := 16#87A4#;
  GL_OUTPUT_TEXTURE_COORD8_EXT                       : constant := 16#87A5#;
  GL_OUTPUT_TEXTURE_COORD9_EXT                       : constant := 16#87A6#;
  GL_OUTPUT_TEXTURE_COORD10_EXT                      : constant := 16#87A7#;
  GL_OUTPUT_TEXTURE_COORD11_EXT                      : constant := 16#87A8#;
  GL_OUTPUT_TEXTURE_COORD12_EXT                      : constant := 16#87A9#;
  GL_OUTPUT_TEXTURE_COORD13_EXT                      : constant := 16#87AA#;
  GL_OUTPUT_TEXTURE_COORD14_EXT                      : constant := 16#87AB#;
  GL_OUTPUT_TEXTURE_COORD15_EXT                      : constant := 16#87AC#;
  GL_OUTPUT_TEXTURE_COORD16_EXT                      : constant := 16#87AD#;
  GL_OUTPUT_TEXTURE_COORD17_EXT                      : constant := 16#87AE#;
  GL_OUTPUT_TEXTURE_COORD18_EXT                      : constant := 16#87AF#;
  GL_OUTPUT_TEXTURE_COORD19_EXT                      : constant := 16#87B0#;
  GL_OUTPUT_TEXTURE_COORD20_EXT                      : constant := 16#87B1#;
  GL_OUTPUT_TEXTURE_COORD21_EXT                      : constant := 16#87B2#;
  GL_OUTPUT_TEXTURE_COORD22_EXT                      : constant := 16#87B3#;
  GL_OUTPUT_TEXTURE_COORD23_EXT                      : constant := 16#87B4#;
  GL_OUTPUT_TEXTURE_COORD24_EXT                      : constant := 16#87B5#;
  GL_OUTPUT_TEXTURE_COORD25_EXT                      : constant := 16#87B6#;
  GL_OUTPUT_TEXTURE_COORD26_EXT                      : constant := 16#87B7#;
  GL_OUTPUT_TEXTURE_COORD27_EXT                      : constant := 16#87B8#;
  GL_OUTPUT_TEXTURE_COORD28_EXT                      : constant := 16#87B9#;
  GL_OUTPUT_TEXTURE_COORD29_EXT                      : constant := 16#87BA#;
  GL_OUTPUT_TEXTURE_COORD30_EXT                      : constant := 16#87BB#;
  GL_OUTPUT_TEXTURE_COORD31_EXT                      : constant := 16#87BC#;
  GL_OUTPUT_FOG_EXT                                  : constant := 16#87BD#;
  GL_SCALAR_EXT                                      : constant := 16#87BE#;
  GL_VECTOR_EXT                                      : constant := 16#87BF#;
  GL_MATRIX_EXT                                      : constant := 16#87C0#;
  GL_VARIANT_EXT                                     : constant := 16#87C1#;
  GL_INVARIANT_EXT                                   : constant := 16#87C2#;
  GL_LOCAL_CONSTANT_EXT                              : constant := 16#87C3#;
  GL_LOCAL_EXT                                       : constant := 16#87C4#;
  GL_MAX_VERTEX_SHADER_INSTRUCTIONS_EXT              : constant := 16#87C5#;
  GL_MAX_VERTEX_SHADER_VARIANTS_EXT                  : constant := 16#87C6#;
  GL_MAX_VERTEX_SHADER_INVARIANTS_EXT                : constant := 16#87C7#;
  GL_MAX_VERTEX_SHADER_LOCAL_CONSTANTS_EXT           : constant := 16#87C8#;
  GL_MAX_VERTEX_SHADER_LOCALS_EXT                    : constant := 16#87C9#;
  GL_MAX_OPTIMIZED_VERTEX_SHADER_INSTRUCTIONS_EXT    : constant := 16#87CA#;
  GL_MAX_OPTIMIZED_VERTEX_SHADER_VARIANTS_EXT        : constant := 16#87CB#;
  GL_MAX_OPTIMIZED_VERTEX_SHADER_LOCAL_CONSTANTS_EXT : constant := 16#87CC#;
  GL_MAX_OPTIMIZED_VERTEX_SHADER_INVARIANTS_EXT      : constant := 16#87CD#;
  GL_MAX_OPTIMIZED_VERTEX_SHADER_LOCALS_EXT          : constant := 16#87CE#;
  GL_VERTEX_SHADER_INSTRUCTIONS_EXT                  : constant := 16#87CF#;
  GL_VERTEX_SHADER_VARIANTS_EXT                      : constant := 16#87D0#;
  GL_VERTEX_SHADER_INVARIANTS_EXT                    : constant := 16#87D1#;
  GL_VERTEX_SHADER_LOCAL_CONSTANTS_EXT               : constant := 16#87D2#;
  GL_VERTEX_SHADER_LOCALS_EXT                        : constant := 16#87D3#;
  GL_VERTEX_SHADER_OPTIMIZED_EXT                     : constant := 16#87D4#;
  GL_X_EXT                                           : constant := 16#87D5#;
  GL_Y_EXT                                           : constant := 16#87D6#;
  GL_Z_EXT                                           : constant := 16#87D7#;
  GL_W_EXT                                           : constant := 16#87D8#;
  GL_NEGATIVE_X_EXT                                  : constant := 16#87D9#;
  GL_NEGATIVE_Y_EXT                                  : constant := 16#87DA#;
  GL_NEGATIVE_Z_EXT                                  : constant := 16#87DB#;
  GL_NEGATIVE_W_EXT                                  : constant := 16#87DC#;
  GL_ZERO_EXT                                        : constant := 16#87DD#;
  GL_ONE_EXT                                         : constant := 16#87DE#;
  GL_NEGATIVE_ONE_EXT                                : constant := 16#87DF#;
  GL_NORMALIZED_RANGE_EXT                            : constant := 16#87E0#;
  GL_FULL_RANGE_EXT                                  : constant := 16#87E1#;
  GL_CURRENT_VERTEX_EXT                              : constant := 16#87E2#;
  GL_MVP_MATRIX_EXT                                  : constant := 16#87E3#;
  GL_VARIANT_VALUE_EXT                               : constant := 16#87E4#;
  GL_VARIANT_DATATYPE_EXT                            : constant := 16#87E5#;
  GL_VARIANT_ARRAY_STRIDE_EXT                        : constant := 16#87E6#;
  GL_VARIANT_ARRAY_TYPE_EXT                          : constant := 16#87E7#;
  GL_VARIANT_ARRAY_EXT                               : constant := 16#87E8#;
  GL_VARIANT_ARRAY_POINTER_EXT                       : constant := 16#87E9#;
  GL_INVARIANT_VALUE_EXT                             : constant := 16#87EA#;
  GL_INVARIANT_DATATYPE_EXT                          : constant := 16#87EB#;
  GL_LOCAL_CONSTANT_VALUE_EXT                        : constant := 16#87EC#;
  GL_LOCAL_CONSTANT_DATATYPE_EXT                     : constant := 16#87ED#;
  --#endif

  --#ifndef GL_ATI_vertex_streams
  GL_MAX_VERTEX_STREAMS_ATI         : constant := 16#876B#;
  GL_VERTEX_STREAM0_ATI             : constant := 16#876C#;
  GL_VERTEX_STREAM1_ATI             : constant := 16#876D#;
  GL_VERTEX_STREAM2_ATI             : constant := 16#876E#;
  GL_VERTEX_STREAM3_ATI             : constant := 16#876F#;
  GL_VERTEX_STREAM4_ATI             : constant := 16#8770#;
  GL_VERTEX_STREAM5_ATI             : constant := 16#8771#;
  GL_VERTEX_STREAM6_ATI             : constant := 16#8772#;
  GL_VERTEX_STREAM7_ATI             : constant := 16#8773#;
  GL_VERTEX_SOURCE_ATI              : constant := 16#8774#;
  --#endif

  --#ifndef GL_ATI_element_array
  GL_ELEMENT_ARRAY_ATI              : constant := 16#8768#;
  GL_ELEMENT_ARRAY_TYPE_ATI         : constant := 16#8769#;
  GL_ELEMENT_ARRAY_POINTER_ATI      : constant := 16#876A#;
  --#endif

  --#ifndef GL_SUN_mesh_array
  GL_QUAD_MESH_SUN                  : constant := 16#8614#;
  GL_TRIANGLE_MESH_SUN              : constant := 16#8615#;
  --#endif

  --#ifndef GL_SUN_slice_accum
  GL_SLICE_ACCUM_SUN                : constant := 16#85CC#;
  --#endif

  --#ifndef GL_NV_multisample_filter_hint
  GL_MULTISAMPLE_FILTER_HINT_NV     : constant := 16#8534#;
  --#endif

  --#ifndef GL_NV_depth_clamp
  GL_DEPTH_CLAMP_NV                 : constant := 16#864F#;
  --#endif

  --#ifndef GL_NV_occlusion_query
  GL_PIXEL_COUNTER_BITS_NV          : constant := 16#8864#;
  GL_CURRENT_OCCLUSION_QUERY_ID_NV  : constant := 16#8865#;
  GL_PIXEL_COUNT_NV                 : constant := 16#8866#;
  GL_PIXEL_COUNT_AVAILABLE_NV       : constant := 16#8867#;
  --#endif

  --#ifndef GL_NV_point_sprite
  GL_POINT_SPRITE_NV                : constant := 16#8861#;
  GL_COORD_REPLACE_NV               : constant := 16#8862#;
  GL_POINT_SPRITE_R_MODE_NV         : constant := 16#8863#;
  --#endif

  --#ifndef GL_NV_texture_shader3
  GL_OFFSET_PROJECTIVE_TEXTURE_2D_NV              : constant := 16#8850#;
  GL_OFFSET_PROJECTIVE_TEXTURE_2D_SCALE_NV        : constant := 16#8851#;
  GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_NV       : constant := 16#8852#;
  GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_SCALE_NV : constant := 16#8853#;
  GL_OFFSET_HILO_TEXTURE_2D_NV                    : constant := 16#8854#;
  GL_OFFSET_HILO_TEXTURE_RECTANGLE_NV             : constant := 16#8855#;
  GL_OFFSET_HILO_PROJECTIVE_TEXTURE_2D_NV         : constant := 16#8856#;
  GL_OFFSET_HILO_PROJECTIVE_TEXTURE_RECTANGLE_NV  : constant := 16#8857#;
  GL_DEPENDENT_HILO_TEXTURE_2D_NV                 : constant := 16#8858#;
  GL_DEPENDENT_RGB_TEXTURE_3D_NV                  : constant := 16#8859#;
  GL_DEPENDENT_RGB_TEXTURE_CUBE_MAP_NV            : constant := 16#885A#;
  GL_DOT_PRODUCT_PASS_THROUGH_NV                  : constant := 16#885B#;
  GL_DOT_PRODUCT_TEXTURE_1D_NV                    : constant := 16#885C#;
  GL_DOT_PRODUCT_AFFINE_DEPTH_REPLACE_NV          : constant := 16#885D#;
  GL_HILO8_NV                                     : constant := 16#885E#;
  GL_SIGNED_HILO8_NV                              : constant := 16#885F#;
  GL_FORCE_BLUE_TO_ONE_NV                         : constant := 16#8860#;
  --#endif

  --#ifndef GL_NV_vertex_program1_1
  --#endif

  --#ifndef GL_EXT_shadow_funcs
  --#endif

  --#ifndef GL_EXT_stencil_two_side
  GL_STENCIL_TEST_TWO_SIDE_EXT      : constant := 16#8910#;
  GL_ACTIVE_STENCIL_FACE_EXT        : constant := 16#8911#;
  --#endif

  --#ifndef GL_ATI_text_fragment_shader
  GL_TEXT_FRAGMENT_SHADER_ATI       : constant := 16#8200#;
  --#endif

  --#ifndef GL_APPLE_client_storage
  GL_UNPACK_CLIENT_STORAGE_APPLE    : constant := 16#85B2#;
  --#endif

  --#ifndef GL_APPLE_element_array
  GL_ELEMENT_ARRAY_APPLE            : constant := 16#8768#;
  GL_ELEMENT_ARRAY_TYPE_APPLE       : constant := 16#8769#;
  GL_ELEMENT_ARRAY_POINTER_APPLE    : constant := 16#876A#;
  --#endif

  --#ifndef GL_APPLE_fence
  GL_DRAW_PIXELS_APPLE              : constant := 16#8A0A#;
  GL_FENCE_APPLE                    : constant := 16#8A0B#;
  --#endif

  --#ifndef GL_APPLE_vertex_array_object
  GL_VERTEX_ARRAY_BINDING_APPLE     : constant := 16#85B5#;
  --#endif

  --#ifndef GL_APPLE_vertex_array_range
  GL_VERTEX_ARRAY_RANGE_APPLE         : constant := 16#851D#;
  GL_VERTEX_ARRAY_RANGE_LENGTH_APPLE  : constant := 16#851E#;
  GL_VERTEX_ARRAY_STORAGE_HINT_APPLE  : constant := 16#851F#;
  GL_VERTEX_ARRAY_RANGE_POINTER_APPLE : constant := 16#8521#;
  GL_STORAGE_CACHED_APPLE             : constant := 16#85BE#;
  GL_STORAGE_SHARED_APPLE             : constant := 16#85BF#;
  --#endif

  --#ifndef GL_APPLE_ycbcr_422
  GL_YCBCR_422_APPLE                : constant := 16#85B9#;
  GL_UNSIGNED_SHORT_8_8_APPLE       : constant := 16#85BA#;
  GL_UNSIGNED_SHORT_8_8_REV_APPLE   : constant := 16#85BB#;
  --#endif

  --#ifndef GL_S3_s3tc
  GL_RGB_S3TC                       : constant := 16#83A0#;
  GL_RGB4_S3TC                      : constant := 16#83A1#;
  GL_RGBA_S3TC                      : constant := 16#83A2#;
  GL_RGBA4_S3TC                     : constant := 16#83A3#;
  --#endif

  --#ifndef GL_ATI_draw_buffers
  GL_MAX_DRAW_BUFFERS_ATI           : constant := 16#8824#;
  GL_DRAW_BUFFER0_ATI               : constant := 16#8825#;
  GL_DRAW_BUFFER1_ATI               : constant := 16#8826#;
  GL_DRAW_BUFFER2_ATI               : constant := 16#8827#;
  GL_DRAW_BUFFER3_ATI               : constant := 16#8828#;
  GL_DRAW_BUFFER4_ATI               : constant := 16#8829#;
  GL_DRAW_BUFFER5_ATI               : constant := 16#882A#;
  GL_DRAW_BUFFER6_ATI               : constant := 16#882B#;
  GL_DRAW_BUFFER7_ATI               : constant := 16#882C#;
  GL_DRAW_BUFFER8_ATI               : constant := 16#882D#;
  GL_DRAW_BUFFER9_ATI               : constant := 16#882E#;
  GL_DRAW_BUFFER10_ATI              : constant := 16#882F#;
  GL_DRAW_BUFFER11_ATI              : constant := 16#8830#;
  GL_DRAW_BUFFER12_ATI              : constant := 16#8831#;
  GL_DRAW_BUFFER13_ATI              : constant := 16#8832#;
  GL_DRAW_BUFFER14_ATI              : constant := 16#8833#;
  GL_DRAW_BUFFER15_ATI              : constant := 16#8834#;
  --#endif

  --#ifndef GL_ATI_texture_env_combine3
  GL_MODULATE_ADD_ATI               : constant := 16#8744#;
  GL_MODULATE_SIGNED_ADD_ATI        : constant := 16#8745#;
  GL_MODULATE_SUBTRACT_ATI          : constant := 16#8746#;
  --#endif

  --#ifndef GL_ATI_texture_float
  GL_RGBA_FLOAT32_ATI               : constant := 16#8814#;
  GL_RGB_FLOAT32_ATI                : constant := 16#8815#;
  GL_ALPHA_FLOAT32_ATI              : constant := 16#8816#;
  GL_INTENSITY_FLOAT32_ATI          : constant := 16#8817#;
  GL_LUMINANCE_FLOAT32_ATI          : constant := 16#8818#;
  GL_LUMINANCE_ALPHA_FLOAT32_ATI    : constant := 16#8819#;
  GL_RGBA_FLOAT16_ATI               : constant := 16#881A#;
  GL_RGB_FLOAT16_ATI                : constant := 16#881B#;
  GL_ALPHA_FLOAT16_ATI              : constant := 16#881C#;
  GL_INTENSITY_FLOAT16_ATI          : constant := 16#881D#;
  GL_LUMINANCE_FLOAT16_ATI          : constant := 16#881E#;
  GL_LUMINANCE_ALPHA_FLOAT16_ATI    : constant := 16#881F#;
  --#endif

  --#ifndef GL_NV_float_buffer
  GL_FLOAT_R_NV                     : constant := 16#8880#;
  GL_FLOAT_RG_NV                    : constant := 16#8881#;
  GL_FLOAT_RGB_NV                   : constant := 16#8882#;
  GL_FLOAT_RGBA_NV                  : constant := 16#8883#;
  GL_FLOAT_R16_NV                   : constant := 16#8884#;
  GL_FLOAT_R32_NV                   : constant := 16#8885#;
  GL_FLOAT_RG16_NV                  : constant := 16#8886#;
  GL_FLOAT_RG32_NV                  : constant := 16#8887#;
  GL_FLOAT_RGB16_NV                 : constant := 16#8888#;
  GL_FLOAT_RGB32_NV                 : constant := 16#8889#;
  GL_FLOAT_RGBA16_NV                : constant := 16#888A#;
  GL_FLOAT_RGBA32_NV                : constant := 16#888B#;
  GL_TEXTURE_FLOAT_COMPONENTS_NV    : constant := 16#888C#;
  GL_FLOAT_CLEAR_COLOR_VALUE_NV     : constant := 16#888D#;
  GL_FLOAT_RGBA_MODE_NV             : constant := 16#888E#;
  --#endif

  --#ifndef GL_NV_fragment_program
  GL_MAX_FRAGMENT_PROGRAM_LOCAL_PARAMETERS_NV : constant := 16#8868#;
  GL_FRAGMENT_PROGRAM_NV                      : constant := 16#8870#;
  GL_MAX_TEXTURE_COORDS_NV                    : constant := 16#8871#;
  GL_MAX_TEXTURE_IMAGE_UNITS_NV               : constant := 16#8872#;
  GL_FRAGMENT_PROGRAM_BINDING_NV              : constant := 16#8873#;
  GL_PROGRAM_ERROR_STRING_NV                  : constant := 16#8874#;
  --#endif

  --#ifndef GL_NV_half_float
  GL_HALF_FLOAT_NV                  : constant := 16#140B#;
  --#endif

  --#ifndef GL_NV_pixel_data_range
  GL_WRITE_PIXEL_DATA_RANGE_NV         : constant := 16#8878#;
  GL_READ_PIXEL_DATA_RANGE_NV          : constant := 16#8879#;
  GL_WRITE_PIXEL_DATA_RANGE_LENGTH_NV  : constant := 16#887A#;
  GL_READ_PIXEL_DATA_RANGE_LENGTH_NV   : constant := 16#887B#;
  GL_WRITE_PIXEL_DATA_RANGE_POINTER_NV : constant := 16#887C#;
  GL_READ_PIXEL_DATA_RANGE_POINTER_NV  : constant := 16#887D#;
  --#endif

  --#ifndef GL_NV_primitive_restart
  GL_PRIMITIVE_RESTART_NV           : constant := 16#8558#;
  GL_PRIMITIVE_RESTART_INDEX_NV     : constant := 16#8559#;
  --#endif

  --#ifndef GL_NV_texture_expand_normal
  GL_TEXTURE_UNSIGNED_REMAP_MODE_NV : constant := 16#888F#;
  --#endif

  --#ifndef GL_NV_vertex_program2
  --#endif

  --#ifndef GL_ATI_map_object_buffer
  --#endif

  --#ifndef GL_ATI_separate_stencil
  GL_STENCIL_BACK_FUNC_ATI            : constant := 16#8800#;
  GL_STENCIL_BACK_FAIL_ATI            : constant := 16#8801#;
  GL_STENCIL_BACK_PASS_DEPTH_FAIL_ATI : constant := 16#8802#;
  GL_STENCIL_BACK_PASS_DEPTH_PASS_ATI : constant := 16#8803#;
  --#endif

  --#ifndef GL_ATI_vertex_attrib_array_object
  --#endif

  --#ifndef GL_EXT_depth_bounds_test
  GL_DEPTH_BOUNDS_TEST_EXT          : constant := 16#8890#;
  GL_DEPTH_BOUNDS_EXT               : constant := 16#8891#;
  --#endif

  --#ifndef GL_EXT_texture_mirror_clamp
  GL_MIRROR_CLAMP_EXT               : constant := 16#8742#;
  GL_MIRROR_CLAMP_TO_EDGE_EXT       : constant := 16#8743#;
  GL_MIRROR_CLAMP_TO_BORDER_EXT     : constant := 16#8912#;
  --#endif

  --#ifndef GL_EXT_blend_equation_separate
  GL_BLEND_EQUATION_RGB_EXT         : constant := GL_BLEND_EQUATION;
  GL_BLEND_EQUATION_ALPHA_EXT       : constant := 16#883D#;
  --#endif

  --#ifndef GL_MESA_pack_invert
  GL_PACK_INVERT_MESA               : constant := 16#8758#;
  --#endif

  --#ifndef GL_MESA_ycbcr_texture
  GL_UNSIGNED_SHORT_8_8_MESA        : constant := 16#85BA#;
  GL_UNSIGNED_SHORT_8_8_REV_MESA    : constant := 16#85BB#;
  GL_YCBCR_MESA                     : constant := 16#8757#;
  --#endif

  --#ifndef GL_EXT_pixel_buffer_object
  GL_PIXEL_PACK_BUFFER_EXT           : constant := 16#88EB#;
  GL_PIXEL_UNPACK_BUFFER_EXT         : constant := 16#88EC#;
  GL_PIXEL_PACK_BUFFER_BINDING_EXT   : constant := 16#88ED#;
  GL_PIXEL_UNPACK_BUFFER_BINDING_EXT : constant := 16#88EF#;
  --#endif

  --#ifndef GL_NV_fragment_program_option
  --#endif

  --#ifndef GL_NV_fragment_program2
  GL_MAX_PROGRAM_EXEC_INSTRUCTIONS_NV : constant := 16#88F4#;
  GL_MAX_PROGRAM_CALL_DEPTH_NV        : constant := 16#88F5#;
  GL_MAX_PROGRAM_IF_DEPTH_NV          : constant := 16#88F6#;
  GL_MAX_PROGRAM_LOOP_DEPTH_NV        : constant := 16#88F7#;
  GL_MAX_PROGRAM_LOOP_COUNT_NV        : constant := 16#88F8#;
  --#endif

  --#ifndef GL_NV_vertex_program2_option
  --/* reuse GL_MAX_PROGRAM_EXEC_INSTRUCTIONS_NV */
  --/* reuse GL_MAX_PROGRAM_CALL_DEPTH_NV */
  --#endif

  --#ifndef GL_NV_vertex_program3
  --/* reuse GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS_ARB */
  --#endif


  -- *****************************************************************************
  --#include <stddef.h>
  --#ifndef GL_VERSION_1_5
  -- GL types for handling large vertex buffer objects
  --typedef ptrdiff_t GLintptr;
  --typedef ptrdiff_t GLsizeiptr;
  --#endif

  --#ifndef GL_ARB_vertex_buffer_object
  -- GL types for handling large vertex buffer objects
  --typedef ptrdiff_t GLintptrARB;
  --typedef ptrdiff_t GLsizeiptrARB;
  type GLintptrARB is new GL.GLintPtr;
  type GLsizeiptrARB is new GL.GLintPtr;
  --#endif

  --#ifndef GL_ARB_shader_objects
  -- GL types for handling shader object handles and characters
  --typedef char GLcharARB;		/* native character */
  --typedef unsigned int GLhandleARB;	/* shader object handle */
  type GLcharARB is new GL.GLbyte;
  --#endif

  --#ifndef GL_NV_half_float
  -- GL type for representing NVIDIA "half" floating point type in host memory
  --typedef unsigned short GLhalfNV;
  type GLhalfNV is new GL.GLshort;
  --#endif

  --#ifndef GL_VERSION_1_2
  --#define GL_VERSION_1_2 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glBlendColor (GLclampf, GLclampf, GLclampf, GLclampf);
  --GLAPI void APIENTRY glBlendEquation (GLenum);
  --GLAPI void APIENTRY glDrawRangeElements (GLenum, GLuint, GLuint, GLsizei, GLenum, const GLvoid *);
  --GLAPI void APIENTRY glColorTable (GLenum, GLenum, GLsizei, GLenum, GLenum, const GLvoid *);
  --GLAPI void APIENTRY glColorTableParameterfv (GLenum, GLenum, const GLfloat *);
  --GLAPI void APIENTRY glColorTableParameteriv (GLenum, GLenum, const GLint *);
  --GLAPI void APIENTRY glCopyColorTable (GLenum, GLenum, GLint, GLint, GLsizei);
  --GLAPI void APIENTRY glGetColorTable (GLenum, GLenum, GLenum, GLvoid *);
  --GLAPI void APIENTRY glGetColorTableParameterfv (GLenum, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetColorTableParameteriv (GLenum, GLenum, GLint *);
  --GLAPI void APIENTRY glColorSubTable (GLenum, GLsizei, GLsizei, GLenum, GLenum, const GLvoid *);
  --GLAPI void APIENTRY glCopyColorSubTable (GLenum, GLsizei, GLint, GLint, GLsizei);
  --GLAPI void APIENTRY glConvolutionFilter1D (GLenum, GLenum, GLsizei, GLenum, GLenum, const GLvoid *);
  --GLAPI void APIENTRY glConvolutionFilter2D (GLenum, GLenum, GLsizei, GLsizei, GLenum, GLenum, const GLvoid *);
  --GLAPI void APIENTRY glConvolutionParameterf (GLenum, GLenum, GLfloat);
  --GLAPI void APIENTRY glConvolutionParameterfv (GLenum, GLenum, const GLfloat *);
  --GLAPI void APIENTRY glConvolutionParameteri (GLenum, GLenum, GLint);
  --GLAPI void APIENTRY glConvolutionParameteriv (GLenum, GLenum, const GLint *);
  --GLAPI void APIENTRY glCopyConvolutionFilter1D (GLenum, GLenum, GLint, GLint, GLsizei);
  --GLAPI void APIENTRY glCopyConvolutionFilter2D (GLenum, GLenum, GLint, GLint, GLsizei, GLsizei);
  --GLAPI void APIENTRY glGetConvolutionFilter (GLenum, GLenum, GLenum, GLvoid *);
  --GLAPI void APIENTRY glGetConvolutionParameterfv (GLenum, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetConvolutionParameteriv (GLenum, GLenum, GLint *);
  --GLAPI void APIENTRY glGetSeparableFilter (GLenum, GLenum, GLenum, GLvoid *, GLvoid *, GLvoid *);
  --GLAPI void APIENTRY glSeparableFilter2D (GLenum, GLenum, GLsizei, GLsizei, GLenum, GLenum, const GLvoid *, const GLvoid *);
  --GLAPI void APIENTRY glGetHistogram (GLenum, GLboolean, GLenum, GLenum, GLvoid *);
  --GLAPI void APIENTRY glGetHistogramParameterfv (GLenum, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetHistogramParameteriv (GLenum, GLenum, GLint *);
  --GLAPI void APIENTRY glGetMinmax (GLenum, GLboolean, GLenum, GLenum, GLvoid *);
  --GLAPI void APIENTRY glGetMinmaxParameterfv (GLenum, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetMinmaxParameteriv (GLenum, GLenum, GLint *);
  --GLAPI void APIENTRY glHistogram (GLenum, GLsizei, GLenum, GLboolean);
  --GLAPI void APIENTRY glMinmax (GLenum, GLenum, GLboolean);
  --GLAPI void APIENTRY glResetHistogram (GLenum);
  --GLAPI void APIENTRY glResetMinmax (GLenum);
  --GLAPI void APIENTRY glTexImage3D (GLenum, GLint, GLint, GLsizei, GLsizei, GLsizei, GLint, GLenum, GLenum, const GLvoid *);
  --GLAPI void APIENTRY glTexSubImage3D (GLenum, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLenum, GLenum, const GLvoid *);
  --GLAPI void APIENTRY glCopyTexSubImage3D (GLenum, GLint, GLint, GLint, GLint, GLint, GLint, GLsizei, GLsizei);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLBLENDCOLORPROC) (GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha);
  --typedef void (APIENTRYP PFNGLBLENDEQUATIONPROC) (GLenum mode);
  --typedef void (APIENTRYP PFNGLDRAWRANGEELEMENTSPROC) (GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, const GLvoid *indices);
  --typedef void (APIENTRYP PFNGLCOLORTABLEPROC) (GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type, const GLvoid *table);
  --typedef void (APIENTRYP PFNGLCOLORTABLEPARAMETERFVPROC) (GLenum target, GLenum pname, const GLfloat *params);
  --typedef void (APIENTRYP PFNGLCOLORTABLEPARAMETERIVPROC) (GLenum target, GLenum pname, const GLint *params);
  --typedef void (APIENTRYP PFNGLCOPYCOLORTABLEPROC) (GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width);
  --typedef void (APIENTRYP PFNGLGETCOLORTABLEPROC) (GLenum target, GLenum format, GLenum type, GLvoid *table);
  --typedef void (APIENTRYP PFNGLGETCOLORTABLEPARAMETERFVPROC) (GLenum target, GLenum pname, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETCOLORTABLEPARAMETERIVPROC) (GLenum target, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLCOLORSUBTABLEPROC) (GLenum target, GLsizei start, GLsizei count, GLenum format, GLenum type, const GLvoid *data);
  --typedef void (APIENTRYP PFNGLCOPYCOLORSUBTABLEPROC) (GLenum target, GLsizei start, GLint x, GLint y, GLsizei width);
  --typedef void (APIENTRYP PFNGLCONVOLUTIONFILTER1DPROC) (GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type, const GLvoid *image);
  --typedef void (APIENTRYP PFNGLCONVOLUTIONFILTER2DPROC) (GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type, const GLvoid *image);
  --typedef void (APIENTRYP PFNGLCONVOLUTIONPARAMETERFPROC) (GLenum target, GLenum pname, GLfloat params);
  --typedef void (APIENTRYP PFNGLCONVOLUTIONPARAMETERFVPROC) (GLenum target, GLenum pname, const GLfloat *params);
  --typedef void (APIENTRYP PFNGLCONVOLUTIONPARAMETERIPROC) (GLenum target, GLenum pname, GLint params);
  --typedef void (APIENTRYP PFNGLCONVOLUTIONPARAMETERIVPROC) (GLenum target, GLenum pname, const GLint *params);
  --typedef void (APIENTRYP PFNGLCOPYCONVOLUTIONFILTER1DPROC) (GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width);
  --typedef void (APIENTRYP PFNGLCOPYCONVOLUTIONFILTER2DPROC) (GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height);
  --typedef void (APIENTRYP PFNGLGETCONVOLUTIONFILTERPROC) (GLenum target, GLenum format, GLenum type, GLvoid *image);
  --typedef void (APIENTRYP PFNGLGETCONVOLUTIONPARAMETERFVPROC) (GLenum target, GLenum pname, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETCONVOLUTIONPARAMETERIVPROC) (GLenum target, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETSEPARABLEFILTERPROC) (GLenum target, GLenum format, GLenum type, GLvoid *row, GLvoid *column, GLvoid *span);
  --typedef void (APIENTRYP PFNGLSEPARABLEFILTER2DPROC) (GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type, const GLvoid *row, const GLvoid *column);
  --typedef void (APIENTRYP PFNGLGETHISTOGRAMPROC) (GLenum target, GLboolean reset, GLenum format, GLenum type, GLvoid *values);
  --typedef void (APIENTRYP PFNGLGETHISTOGRAMPARAMETERFVPROC) (GLenum target, GLenum pname, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETHISTOGRAMPARAMETERIVPROC) (GLenum target, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETMINMAXPROC) (GLenum target, GLboolean reset, GLenum format, GLenum type, GLvoid *values);
  --typedef void (APIENTRYP PFNGLGETMINMAXPARAMETERFVPROC) (GLenum target, GLenum pname, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETMINMAXPARAMETERIVPROC) (GLenum target, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLHISTOGRAMPROC) (GLenum target, GLsizei width, GLenum internalformat, GLboolean sink);
  --typedef void (APIENTRYP PFNGLMINMAXPROC) (GLenum target, GLenum internalformat, GLboolean sink);
  --typedef void (APIENTRYP PFNGLRESETHISTOGRAMPROC) (GLenum target);
  --typedef void (APIENTRYP PFNGLRESETMINMAXPROC) (GLenum target);
  --typedef void (APIENTRYP PFNGLTEXIMAGE3DPROC) (GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const GLvoid *pixels);
  --typedef void (APIENTRYP PFNGLTEXSUBIMAGE3DPROC) (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const GLvoid *pixels);
  --typedef void (APIENTRYP PFNGLCOPYTEXSUBIMAGE3DPROC) (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height);
  --#endif

  --#ifndef GL_VERSION_1_3
  --#define GL_VERSION_1_3 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glActiveTexture (GLenum);
  --GLAPI void APIENTRY glClientActiveTexture (GLenum);
  --GLAPI void APIENTRY glMultiTexCoord1d (GLenum, GLdouble);
  --GLAPI void APIENTRY glMultiTexCoord1dv (GLenum, const GLdouble *);
  --GLAPI void APIENTRY glMultiTexCoord1f (GLenum, GLfloat);
  --GLAPI void APIENTRY glMultiTexCoord1fv (GLenum, const GLfloat *);
  --GLAPI void APIENTRY glMultiTexCoord1i (GLenum, GLint);
  --GLAPI void APIENTRY glMultiTexCoord1iv (GLenum, const GLint *);
  --GLAPI void APIENTRY glMultiTexCoord1s (GLenum, GLshort);
  --GLAPI void APIENTRY glMultiTexCoord1sv (GLenum, const GLshort *);
  --GLAPI void APIENTRY glMultiTexCoord2d (GLenum, GLdouble, GLdouble);
  --GLAPI void APIENTRY glMultiTexCoord2dv (GLenum, const GLdouble *);
  --GLAPI void APIENTRY glMultiTexCoord2f (GLenum, GLfloat, GLfloat);
  --GLAPI void APIENTRY glMultiTexCoord2fv (GLenum, const GLfloat *);
  --GLAPI void APIENTRY glMultiTexCoord2i (GLenum, GLint, GLint);
  --GLAPI void APIENTRY glMultiTexCoord2iv (GLenum, const GLint *);
  --GLAPI void APIENTRY glMultiTexCoord2s (GLenum, GLshort, GLshort);
  --GLAPI void APIENTRY glMultiTexCoord2sv (GLenum, const GLshort *);
  --GLAPI void APIENTRY glMultiTexCoord3d (GLenum, GLdouble, GLdouble, GLdouble);
  --GLAPI void APIENTRY glMultiTexCoord3dv (GLenum, const GLdouble *);
  --GLAPI void APIENTRY glMultiTexCoord3f (GLenum, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glMultiTexCoord3fv (GLenum, const GLfloat *);
  --GLAPI void APIENTRY glMultiTexCoord3i (GLenum, GLint, GLint, GLint);
  --GLAPI void APIENTRY glMultiTexCoord3iv (GLenum, const GLint *);
  --GLAPI void APIENTRY glMultiTexCoord3s (GLenum, GLshort, GLshort, GLshort);
  --GLAPI void APIENTRY glMultiTexCoord3sv (GLenum, const GLshort *);
  --GLAPI void APIENTRY glMultiTexCoord4d (GLenum, GLdouble, GLdouble, GLdouble, GLdouble);
  --GLAPI void APIENTRY glMultiTexCoord4dv (GLenum, const GLdouble *);
  --GLAPI void APIENTRY glMultiTexCoord4f (GLenum, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glMultiTexCoord4fv (GLenum, const GLfloat *);
  --GLAPI void APIENTRY glMultiTexCoord4i (GLenum, GLint, GLint, GLint, GLint);
  --GLAPI void APIENTRY glMultiTexCoord4iv (GLenum, const GLint *);
  --GLAPI void APIENTRY glMultiTexCoord4s (GLenum, GLshort, GLshort, GLshort, GLshort);
  --GLAPI void APIENTRY glMultiTexCoord4sv (GLenum, const GLshort *);
  --GLAPI void APIENTRY glLoadTransposeMatrixf (const GLfloat *);
  --GLAPI void APIENTRY glLoadTransposeMatrixd (const GLdouble *);
  --GLAPI void APIENTRY glMultTransposeMatrixf (const GLfloat *);
  --GLAPI void APIENTRY glMultTransposeMatrixd (const GLdouble *);
  --GLAPI void APIENTRY glSampleCoverage (GLclampf, GLboolean);
  --GLAPI void APIENTRY glCompressedTexImage3D (GLenum, GLint, GLenum, GLsizei, GLsizei, GLsizei, GLint, GLsizei, const GLvoid *);
  --GLAPI void APIENTRY glCompressedTexImage2D (GLenum, GLint, GLenum, GLsizei, GLsizei, GLint, GLsizei, const GLvoid *);
  --GLAPI void APIENTRY glCompressedTexImage1D (GLenum, GLint, GLenum, GLsizei, GLint, GLsizei, const GLvoid *);
  --GLAPI void APIENTRY glCompressedTexSubImage3D (GLenum, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLenum, GLsizei, const GLvoid *);
  --GLAPI void APIENTRY glCompressedTexSubImage2D (GLenum, GLint, GLint, GLint, GLsizei, GLsizei, GLenum, GLsizei, const GLvoid *);
  --GLAPI void APIENTRY glCompressedTexSubImage1D (GLenum, GLint, GLint, GLsizei, GLenum, GLsizei, const GLvoid *);
  --GLAPI void APIENTRY glGetCompressedTexImage (GLenum, GLint, GLvoid *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLACTIVETEXTUREPROC) (GLenum texture);
  --typedef void (APIENTRYP PFNGLCLIENTACTIVETEXTUREPROC) (GLenum texture);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD1DPROC) (GLenum target, GLdouble s);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD1DVPROC) (GLenum target, const GLdouble *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD1FPROC) (GLenum target, GLfloat s);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD1FVPROC) (GLenum target, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD1IPROC) (GLenum target, GLint s);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD1IVPROC) (GLenum target, const GLint *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD1SPROC) (GLenum target, GLshort s);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD1SVPROC) (GLenum target, const GLshort *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD2DPROC) (GLenum target, GLdouble s, GLdouble t);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD2DVPROC) (GLenum target, const GLdouble *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD2FPROC) (GLenum target, GLfloat s, GLfloat t);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD2FVPROC) (GLenum target, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD2IPROC) (GLenum target, GLint s, GLint t);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD2IVPROC) (GLenum target, const GLint *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD2SPROC) (GLenum target, GLshort s, GLshort t);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD2SVPROC) (GLenum target, const GLshort *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD3DPROC) (GLenum target, GLdouble s, GLdouble t, GLdouble r);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD3DVPROC) (GLenum target, const GLdouble *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD3FPROC) (GLenum target, GLfloat s, GLfloat t, GLfloat r);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD3FVPROC) (GLenum target, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD3IPROC) (GLenum target, GLint s, GLint t, GLint r);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD3IVPROC) (GLenum target, const GLint *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD3SPROC) (GLenum target, GLshort s, GLshort t, GLshort r);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD3SVPROC) (GLenum target, const GLshort *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD4DPROC) (GLenum target, GLdouble s, GLdouble t, GLdouble r, GLdouble q);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD4DVPROC) (GLenum target, const GLdouble *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD4FPROC) (GLenum target, GLfloat s, GLfloat t, GLfloat r, GLfloat q);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD4FVPROC) (GLenum target, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD4IPROC) (GLenum target, GLint s, GLint t, GLint r, GLint q);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD4IVPROC) (GLenum target, const GLint *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD4SPROC) (GLenum target, GLshort s, GLshort t, GLshort r, GLshort q);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD4SVPROC) (GLenum target, const GLshort *v);
  --typedef void (APIENTRYP PFNGLLOADTRANSPOSEMATRIXFPROC) (const GLfloat *m);
  --typedef void (APIENTRYP PFNGLLOADTRANSPOSEMATRIXDPROC) (const GLdouble *m);
  --typedef void (APIENTRYP PFNGLMULTTRANSPOSEMATRIXFPROC) (const GLfloat *m);
  --typedef void (APIENTRYP PFNGLMULTTRANSPOSEMATRIXDPROC) (const GLdouble *m);
  --typedef void (APIENTRYP PFNGLSAMPLECOVERAGEPROC) (GLclampf value, GLboolean invert);
  --typedef void (APIENTRYP PFNGLCOMPRESSEDTEXIMAGE3DPROC) (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const GLvoid *data);
  --typedef void (APIENTRYP PFNGLCOMPRESSEDTEXIMAGE2DPROC) (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const GLvoid *data);
  --typedef void (APIENTRYP PFNGLCOMPRESSEDTEXIMAGE1DPROC) (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, const GLvoid *data);
  --typedef void (APIENTRYP PFNGLCOMPRESSEDTEXSUBIMAGE3DPROC) (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const GLvoid *data);
  --typedef void (APIENTRYP PFNGLCOMPRESSEDTEXSUBIMAGE2DPROC) (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const GLvoid *data);
  --typedef void (APIENTRYP PFNGLCOMPRESSEDTEXSUBIMAGE1DPROC) (GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, const GLvoid *data);
  --typedef void (APIENTRYP PFNGLGETCOMPRESSEDTEXIMAGEPROC) (GLenum target, GLint level, GLvoid *img);
  --#endif

  --#ifndef GL_VERSION_1_4
  --#define GL_VERSION_1_4 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glBlendFuncSeparate (GLenum, GLenum, GLenum, GLenum);
  --GLAPI void APIENTRY glFogCoordf (GLfloat);
  --GLAPI void APIENTRY glFogCoordfv (const GLfloat *);
  --GLAPI void APIENTRY glFogCoordd (GLdouble);
  --GLAPI void APIENTRY glFogCoorddv (const GLdouble *);
  --GLAPI void APIENTRY glFogCoordPointer (GLenum, GLsizei, const GLvoid *);
  --GLAPI void APIENTRY glMultiDrawArrays (GLenum, GLint *, GLsizei *, GLsizei);
  --GLAPI void APIENTRY glMultiDrawElements (GLenum, const GLsizei *, GLenum, const GLvoid* *, GLsizei);
  --GLAPI void APIENTRY glPointParameterf (GLenum, GLfloat);
  --GLAPI void APIENTRY glPointParameterfv (GLenum, const GLfloat *);
  --GLAPI void APIENTRY glPointParameteri (GLenum, GLint);
  --GLAPI void APIENTRY glPointParameteriv (GLenum, const GLint *);
  --GLAPI void APIENTRY glSecondaryColor3b (GLbyte, GLbyte, GLbyte);
  --GLAPI void APIENTRY glSecondaryColor3bv (const GLbyte *);
  --GLAPI void APIENTRY glSecondaryColor3d (GLdouble, GLdouble, GLdouble);
  --GLAPI void APIENTRY glSecondaryColor3dv (const GLdouble *);
  --GLAPI void APIENTRY glSecondaryColor3f (GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glSecondaryColor3fv (const GLfloat *);
  --GLAPI void APIENTRY glSecondaryColor3i (GLint, GLint, GLint);
  --GLAPI void APIENTRY glSecondaryColor3iv (const GLint *);
  --GLAPI void APIENTRY glSecondaryColor3s (GLshort, GLshort, GLshort);
  --GLAPI void APIENTRY glSecondaryColor3sv (const GLshort *);
  --GLAPI void APIENTRY glSecondaryColor3ub (GLubyte, GLubyte, GLubyte);
  --GLAPI void APIENTRY glSecondaryColor3ubv (const GLubyte *);
  --GLAPI void APIENTRY glSecondaryColor3ui (GLuint, GLuint, GLuint);
  --GLAPI void APIENTRY glSecondaryColor3uiv (const GLuint *);
  --GLAPI void APIENTRY glSecondaryColor3us (GLushort, GLushort, GLushort);
  --GLAPI void APIENTRY glSecondaryColor3usv (const GLushort *);
  --GLAPI void APIENTRY glSecondaryColorPointer (GLint, GLenum, GLsizei, const GLvoid *);
  --GLAPI void APIENTRY glWindowPos2d (GLdouble, GLdouble);
  --GLAPI void APIENTRY glWindowPos2dv (const GLdouble *);
  --GLAPI void APIENTRY glWindowPos2f (GLfloat, GLfloat);
  --GLAPI void APIENTRY glWindowPos2fv (const GLfloat *);
  --GLAPI void APIENTRY glWindowPos2i (GLint, GLint);
  --GLAPI void APIENTRY glWindowPos2iv (const GLint *);
  --GLAPI void APIENTRY glWindowPos2s (GLshort, GLshort);
  --GLAPI void APIENTRY glWindowPos2sv (const GLshort *);
  --GLAPI void APIENTRY glWindowPos3d (GLdouble, GLdouble, GLdouble);
  --GLAPI void APIENTRY glWindowPos3dv (const GLdouble *);
  --GLAPI void APIENTRY glWindowPos3f (GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glWindowPos3fv (const GLfloat *);
  --GLAPI void APIENTRY glWindowPos3i (GLint, GLint, GLint);
  --GLAPI void APIENTRY glWindowPos3iv (const GLint *);
  --GLAPI void APIENTRY glWindowPos3s (GLshort, GLshort, GLshort);
  --GLAPI void APIENTRY glWindowPos3sv (const GLshort *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLBLENDFUNCSEPARATEPROC) (GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha);
  --typedef void (APIENTRYP PFNGLFOGCOORDFPROC) (GLfloat coord);
  --typedef void (APIENTRYP PFNGLFOGCOORDFVPROC) (const GLfloat *coord);
  --typedef void (APIENTRYP PFNGLFOGCOORDDPROC) (GLdouble coord);
  --typedef void (APIENTRYP PFNGLFOGCOORDDVPROC) (const GLdouble *coord);
  --typedef void (APIENTRYP PFNGLFOGCOORDPOINTERPROC) (GLenum type, GLsizei stride, const GLvoid *pointer);
  --typedef void (APIENTRYP PFNGLMULTIDRAWARRAYSPROC) (GLenum mode, GLint *first, GLsizei *count, GLsizei primcount);
  --typedef void (APIENTRYP PFNGLMULTIDRAWELEMENTSPROC) (GLenum mode, const GLsizei *count, GLenum type, const GLvoid* *indices, GLsizei primcount);
  --typedef void (APIENTRYP PFNGLPOINTPARAMETERFPROC) (GLenum pname, GLfloat param);
  --typedef void (APIENTRYP PFNGLPOINTPARAMETERFVPROC) (GLenum pname, const GLfloat *params);
  --typedef void (APIENTRYP PFNGLPOINTPARAMETERIPROC) (GLenum pname, GLint param);
  --typedef void (APIENTRYP PFNGLPOINTPARAMETERIVPROC) (GLenum pname, const GLint *params);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3BPROC) (GLbyte red, GLbyte green, GLbyte blue);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3BVPROC) (const GLbyte *v);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3DPROC) (GLdouble red, GLdouble green, GLdouble blue);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3DVPROC) (const GLdouble *v);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3FPROC) (GLfloat red, GLfloat green, GLfloat blue);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3FVPROC) (const GLfloat *v);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3IPROC) (GLint red, GLint green, GLint blue);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3IVPROC) (const GLint *v);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3SPROC) (GLshort red, GLshort green, GLshort blue);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3SVPROC) (const GLshort *v);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3UBPROC) (GLubyte red, GLubyte green, GLubyte blue);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3UBVPROC) (const GLubyte *v);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3UIPROC) (GLuint red, GLuint green, GLuint blue);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3UIVPROC) (const GLuint *v);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3USPROC) (GLushort red, GLushort green, GLushort blue);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3USVPROC) (const GLushort *v);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLORPOINTERPROC) (GLint size, GLenum type, GLsizei stride, const GLvoid *pointer);
  --typedef void (APIENTRYP PFNGLWINDOWPOS2DPROC) (GLdouble x, GLdouble y);
  --typedef void (APIENTRYP PFNGLWINDOWPOS2DVPROC) (const GLdouble *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS2FPROC) (GLfloat x, GLfloat y);
  --typedef void (APIENTRYP PFNGLWINDOWPOS2FVPROC) (const GLfloat *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS2IPROC) (GLint x, GLint y);
  --typedef void (APIENTRYP PFNGLWINDOWPOS2IVPROC) (const GLint *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS2SPROC) (GLshort x, GLshort y);
  --typedef void (APIENTRYP PFNGLWINDOWPOS2SVPROC) (const GLshort *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS3DPROC) (GLdouble x, GLdouble y, GLdouble z);
  --typedef void (APIENTRYP PFNGLWINDOWPOS3DVPROC) (const GLdouble *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS3FPROC) (GLfloat x, GLfloat y, GLfloat z);
  --typedef void (APIENTRYP PFNGLWINDOWPOS3FVPROC) (const GLfloat *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS3IPROC) (GLint x, GLint y, GLint z);
  --typedef void (APIENTRYP PFNGLWINDOWPOS3IVPROC) (const GLint *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS3SPROC) (GLshort x, GLshort y, GLshort z);
  --typedef void (APIENTRYP PFNGLWINDOWPOS3SVPROC) (const GLshort *v);
  --#endif

  --#ifndef GL_VERSION_1_5
  --#define GL_VERSION_1_5 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glGenQueries (GLsizei, GLuint *);
  --GLAPI void APIENTRY glDeleteQueries (GLsizei, const GLuint *);
  --GLAPI GLboolean APIENTRY glIsQuery (GLuint);
  --GLAPI void APIENTRY glBeginQuery (GLenum, GLuint);
  --GLAPI void APIENTRY glEndQuery (GLenum);
  --GLAPI void APIENTRY glGetQueryiv (GLenum, GLenum, GLint *);
  --GLAPI void APIENTRY glGetQueryObjectiv (GLuint, GLenum, GLint *);
  --GLAPI void APIENTRY glGetQueryObjectuiv (GLuint, GLenum, GLuint *);
  --GLAPI void APIENTRY glBindBuffer (GLenum, GLuint);
  --GLAPI void APIENTRY glDeleteBuffers (GLsizei, const GLuint *);
  --GLAPI void APIENTRY glGenBuffers (GLsizei, GLuint *);
  --GLAPI GLboolean APIENTRY glIsBuffer (GLuint);
  --GLAPI void APIENTRY glBufferData (GLenum, GLsizeiptr, const GLvoid *, GLenum);
  --GLAPI void APIENTRY glBufferSubData (GLenum, GLintptr, GLsizeiptr, const GLvoid *);
  --GLAPI void APIENTRY glGetBufferSubData (GLenum, GLintptr, GLsizeiptr, GLvoid *);
  --GLAPI GLvoid* APIENTRY glMapBuffer (GLenum, GLenum);
  --GLAPI GLboolean APIENTRY glUnmapBuffer (GLenum);
  --GLAPI void APIENTRY glGetBufferParameteriv (GLenum, GLenum, GLint *);
  --GLAPI void APIENTRY glGetBufferPointerv (GLenum, GLenum, GLvoid* *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLGENQUERIESPROC) (GLsizei n, GLuint *ids);
  --typedef void (APIENTRYP PFNGLDELETEQUERIESPROC) (GLsizei n, const GLuint *ids);
  --typedef GLboolean (APIENTRYP PFNGLISQUERYPROC) (GLuint id);
  --typedef void (APIENTRYP PFNGLBEGINQUERYPROC) (GLenum target, GLuint id);
  --typedef void (APIENTRYP PFNGLENDQUERYPROC) (GLenum target);
  --typedef void (APIENTRYP PFNGLGETQUERYIVPROC) (GLenum target, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETQUERYOBJECTIVPROC) (GLuint id, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETQUERYOBJECTUIVPROC) (GLuint id, GLenum pname, GLuint *params);
  --typedef void (APIENTRYP PFNGLBINDBUFFERPROC) (GLenum target, GLuint buffer);
  --typedef void (APIENTRYP PFNGLDELETEBUFFERSPROC) (GLsizei n, const GLuint *buffers);
  --typedef void (APIENTRYP PFNGLGENBUFFERSPROC) (GLsizei n, GLuint *buffers);
  --typedef GLboolean (APIENTRYP PFNGLISBUFFERPROC) (GLuint buffer);
  --typedef void (APIENTRYP PFNGLBUFFERDATAPROC) (GLenum target, GLsizeiptr size, const GLvoid *data, GLenum usage);
  --typedef void (APIENTRYP PFNGLBUFFERSUBDATAPROC) (GLenum target, GLintptr offset, GLsizeiptr size, const GLvoid *data);
  --typedef void (APIENTRYP PFNGLGETBUFFERSUBDATAPROC) (GLenum target, GLintptr offset, GLsizeiptr size, GLvoid *data);
  --typedef GLvoid* (APIENTRYP PFNGLMAPBUFFERPROC) (GLenum target, GLenum access);
  --typedef GLboolean (APIENTRYP PFNGLUNMAPBUFFERPROC) (GLenum target);
  --typedef void (APIENTRYP PFNGLGETBUFFERPARAMETERIVPROC) (GLenum target, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETBUFFERPOINTERVPROC) (GLenum target, GLenum pname, GLvoid* *params);
  --#endif

  --#ifndef GL_ARB_multitexture
  --#define GL_ARB_multitexture 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glActiveTextureARB (GLenum);
  --GLAPI void APIENTRY glClientActiveTextureARB (GLenum);
  --GLAPI void APIENTRY glMultiTexCoord1dARB (GLenum, GLdouble);
  --GLAPI void APIENTRY glMultiTexCoord1dvARB (GLenum, const GLdouble *);
  --GLAPI void APIENTRY glMultiTexCoord1fARB (GLenum, GLfloat);
  --GLAPI void APIENTRY glMultiTexCoord1fvARB (GLenum, const GLfloat *);
  --GLAPI void APIENTRY glMultiTexCoord1iARB (GLenum, GLint);
  --GLAPI void APIENTRY glMultiTexCoord1ivARB (GLenum, const GLint *);
  --GLAPI void APIENTRY glMultiTexCoord1sARB (GLenum, GLshort);
  --GLAPI void APIENTRY glMultiTexCoord1svARB (GLenum, const GLshort *);
  --GLAPI void APIENTRY glMultiTexCoord2dARB (GLenum, GLdouble, GLdouble);
  --GLAPI void APIENTRY glMultiTexCoord2dvARB (GLenum, const GLdouble *);
  --GLAPI void APIENTRY glMultiTexCoord2fARB (GLenum, GLfloat, GLfloat);
  --GLAPI void APIENTRY glMultiTexCoord2fvARB (GLenum, const GLfloat *);
  --GLAPI void APIENTRY glMultiTexCoord2iARB (GLenum, GLint, GLint);
  --GLAPI void APIENTRY glMultiTexCoord2ivARB (GLenum, const GLint *);
  --GLAPI void APIENTRY glMultiTexCoord2sARB (GLenum, GLshort, GLshort);
  --GLAPI void APIENTRY glMultiTexCoord2svARB (GLenum, const GLshort *);
  --GLAPI void APIENTRY glMultiTexCoord3dARB (GLenum, GLdouble, GLdouble, GLdouble);
  --GLAPI void APIENTRY glMultiTexCoord3dvARB (GLenum, const GLdouble *);
  --GLAPI void APIENTRY glMultiTexCoord3fARB (GLenum, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glMultiTexCoord3fvARB (GLenum, const GLfloat *);
  --GLAPI void APIENTRY glMultiTexCoord3iARB (GLenum, GLint, GLint, GLint);
  --GLAPI void APIENTRY glMultiTexCoord3ivARB (GLenum, const GLint *);
  --GLAPI void APIENTRY glMultiTexCoord3sARB (GLenum, GLshort, GLshort, GLshort);
  --GLAPI void APIENTRY glMultiTexCoord3svARB (GLenum, const GLshort *);
  --GLAPI void APIENTRY glMultiTexCoord4dARB (GLenum, GLdouble, GLdouble, GLdouble, GLdouble);
  --GLAPI void APIENTRY glMultiTexCoord4dvARB (GLenum, const GLdouble *);
  --GLAPI void APIENTRY glMultiTexCoord4fARB (GLenum, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glMultiTexCoord4fvARB (GLenum, const GLfloat *);
  --GLAPI void APIENTRY glMultiTexCoord4iARB (GLenum, GLint, GLint, GLint, GLint);
  --GLAPI void APIENTRY glMultiTexCoord4ivARB (GLenum, const GLint *);
  --GLAPI void APIENTRY glMultiTexCoord4sARB (GLenum, GLshort, GLshort, GLshort, GLshort);
  --GLAPI void APIENTRY glMultiTexCoord4svARB (GLenum, const GLshort *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLACTIVETEXTUREARBPROC) (GLenum texture);
  --typedef void (APIENTRYP PFNGLCLIENTACTIVETEXTUREARBPROC) (GLenum texture);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD1DARBPROC) (GLenum target, GLdouble s);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD1DVARBPROC) (GLenum target, const GLdouble *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD1FARBPROC) (GLenum target, GLfloat s);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD1FVARBPROC) (GLenum target, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD1IARBPROC) (GLenum target, GLint s);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD1IVARBPROC) (GLenum target, const GLint *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD1SARBPROC) (GLenum target, GLshort s);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD1SVARBPROC) (GLenum target, const GLshort *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD2DARBPROC) (GLenum target, GLdouble s, GLdouble t);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD2DVARBPROC) (GLenum target, const GLdouble *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD2FARBPROC) (GLenum target, GLfloat s, GLfloat t);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD2FVARBPROC) (GLenum target, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD2IARBPROC) (GLenum target, GLint s, GLint t);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD2IVARBPROC) (GLenum target, const GLint *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD2SARBPROC) (GLenum target, GLshort s, GLshort t);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD2SVARBPROC) (GLenum target, const GLshort *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD3DARBPROC) (GLenum target, GLdouble s, GLdouble t, GLdouble r);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD3DVARBPROC) (GLenum target, const GLdouble *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD3FARBPROC) (GLenum target, GLfloat s, GLfloat t, GLfloat r);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD3FVARBPROC) (GLenum target, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD3IARBPROC) (GLenum target, GLint s, GLint t, GLint r);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD3IVARBPROC) (GLenum target, const GLint *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD3SARBPROC) (GLenum target, GLshort s, GLshort t, GLshort r);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD3SVARBPROC) (GLenum target, const GLshort *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD4DARBPROC) (GLenum target, GLdouble s, GLdouble t, GLdouble r, GLdouble q);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD4DVARBPROC) (GLenum target, const GLdouble *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD4FARBPROC) (GLenum target, GLfloat s, GLfloat t, GLfloat r, GLfloat q);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD4FVARBPROC) (GLenum target, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD4IARBPROC) (GLenum target, GLint s, GLint t, GLint r, GLint q);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD4IVARBPROC) (GLenum target, const GLint *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD4SARBPROC) (GLenum target, GLshort s, GLshort t, GLshort r, GLshort q);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD4SVARBPROC) (GLenum target, const GLshort *v);
  --#endif

  --#ifndef GL_ARB_transpose_matrix
  --#define GL_ARB_transpose_matrix 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glLoadTransposeMatrixfARB (const GLfloat *);
  --GLAPI void APIENTRY glLoadTransposeMatrixdARB (const GLdouble *);
  --GLAPI void APIENTRY glMultTransposeMatrixfARB (const GLfloat *);
  --GLAPI void APIENTRY glMultTransposeMatrixdARB (const GLdouble *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLLOADTRANSPOSEMATRIXFARBPROC) (const GLfloat *m);
  --typedef void (APIENTRYP PFNGLLOADTRANSPOSEMATRIXDARBPROC) (const GLdouble *m);
  --typedef void (APIENTRYP PFNGLMULTTRANSPOSEMATRIXFARBPROC) (const GLfloat *m);
  --typedef void (APIENTRYP PFNGLMULTTRANSPOSEMATRIXDARBPROC) (const GLdouble *m);
  --#endif

  --#ifndef GL_ARB_multisample
  --#define GL_ARB_multisample 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glSampleCoverageARB (GLclampf, GLboolean);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLSAMPLECOVERAGEARBPROC) (GLclampf value, GLboolean invert);
  --#endif

  --#ifndef GL_ARB_texture_env_add
  --#define GL_ARB_texture_env_add 1
  --#endif

  --#ifndef GL_ARB_texture_cube_map
  --#define GL_ARB_texture_cube_map 1
  --#endif

  --#ifndef GL_ARB_texture_compression
  --#define GL_ARB_texture_compression 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glCompressedTexImage3DARB (GLenum, GLint, GLenum, GLsizei, GLsizei, GLsizei, GLint, GLsizei, const GLvoid *);
  --GLAPI void APIENTRY glCompressedTexImage2DARB (GLenum, GLint, GLenum, GLsizei, GLsizei, GLint, GLsizei, const GLvoid *);
  --GLAPI void APIENTRY glCompressedTexImage1DARB (GLenum, GLint, GLenum, GLsizei, GLint, GLsizei, const GLvoid *);
  --GLAPI void APIENTRY glCompressedTexSubImage3DARB (GLenum, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLenum, GLsizei, const GLvoid *);
  --GLAPI void APIENTRY glCompressedTexSubImage2DARB (GLenum, GLint, GLint, GLint, GLsizei, GLsizei, GLenum, GLsizei, const GLvoid *);
  --GLAPI void APIENTRY glCompressedTexSubImage1DARB (GLenum, GLint, GLint, GLsizei, GLenum, GLsizei, const GLvoid *);
  --GLAPI void APIENTRY glGetCompressedTexImageARB (GLenum, GLint, GLvoid *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLCOMPRESSEDTEXIMAGE3DARBPROC) (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const GLvoid *data);
  --typedef void (APIENTRYP PFNGLCOMPRESSEDTEXIMAGE2DARBPROC) (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const GLvoid *data);
  --typedef void (APIENTRYP PFNGLCOMPRESSEDTEXIMAGE1DARBPROC) (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, const GLvoid *data);
  --typedef void (APIENTRYP PFNGLCOMPRESSEDTEXSUBIMAGE3DARBPROC) (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const GLvoid *data);
  --typedef void (APIENTRYP PFNGLCOMPRESSEDTEXSUBIMAGE2DARBPROC) (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const GLvoid *data);
  --typedef void (APIENTRYP PFNGLCOMPRESSEDTEXSUBIMAGE1DARBPROC) (GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, const GLvoid *data);
  --typedef void (APIENTRYP PFNGLGETCOMPRESSEDTEXIMAGEARBPROC) (GLenum target, GLint level, GLvoid *img);
  --#endif

  --#ifndef GL_ARB_texture_border_clamp
  --#define GL_ARB_texture_border_clamp 1
  --#endif

  --#ifndef GL_ARB_point_parameters
  --#define GL_ARB_point_parameters 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glPointParameterfARB (GLenum, GLfloat);
  --GLAPI void APIENTRY glPointParameterfvARB (GLenum, const GLfloat *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLPOINTPARAMETERFARBPROC) (GLenum pname, GLfloat param);
  --typedef void (APIENTRYP PFNGLPOINTPARAMETERFVARBPROC) (GLenum pname, const GLfloat *params);
  --#endif

  --#ifndef GL_ARB_vertex_blend
  --#define GL_ARB_vertex_blend 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glWeightbvARB (GLint, const GLbyte *);
  --GLAPI void APIENTRY glWeightsvARB (GLint, const GLshort *);
  --GLAPI void APIENTRY glWeightivARB (GLint, const GLint *);
  --GLAPI void APIENTRY glWeightfvARB (GLint, const GLfloat *);
  --GLAPI void APIENTRY glWeightdvARB (GLint, const GLdouble *);
  --GLAPI void APIENTRY glWeightubvARB (GLint, const GLubyte *);
  --GLAPI void APIENTRY glWeightusvARB (GLint, const GLushort *);
  --GLAPI void APIENTRY glWeightuivARB (GLint, const GLuint *);
  --GLAPI void APIENTRY glWeightPointerARB (GLint, GLenum, GLsizei, const GLvoid *);
  --GLAPI void APIENTRY glVertexBlendARB (GLint);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLWEIGHTBVARBPROC) (GLint size, const GLbyte *weights);
  --typedef void (APIENTRYP PFNGLWEIGHTSVARBPROC) (GLint size, const GLshort *weights);
  --typedef void (APIENTRYP PFNGLWEIGHTIVARBPROC) (GLint size, const GLint *weights);
  --typedef void (APIENTRYP PFNGLWEIGHTFVARBPROC) (GLint size, const GLfloat *weights);
  --typedef void (APIENTRYP PFNGLWEIGHTDVARBPROC) (GLint size, const GLdouble *weights);
  --typedef void (APIENTRYP PFNGLWEIGHTUBVARBPROC) (GLint size, const GLubyte *weights);
  --typedef void (APIENTRYP PFNGLWEIGHTUSVARBPROC) (GLint size, const GLushort *weights);
  --typedef void (APIENTRYP PFNGLWEIGHTUIVARBPROC) (GLint size, const GLuint *weights);
  --typedef void (APIENTRYP PFNGLWEIGHTPOINTERARBPROC) (GLint size, GLenum type, GLsizei stride, const GLvoid *pointer);
  --typedef void (APIENTRYP PFNGLVERTEXBLENDARBPROC) (GLint count);
  --#endif

  --#ifndef GL_ARB_matrix_palette
  --#define GL_ARB_matrix_palette 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glCurrentPaletteMatrixARB (GLint);
  --GLAPI void APIENTRY glMatrixIndexubvARB (GLint, const GLubyte *);
  --GLAPI void APIENTRY glMatrixIndexusvARB (GLint, const GLushort *);
  --GLAPI void APIENTRY glMatrixIndexuivARB (GLint, const GLuint *);
  --GLAPI void APIENTRY glMatrixIndexPointerARB (GLint, GLenum, GLsizei, const GLvoid *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLCURRENTPALETTEMATRIXARBPROC) (GLint index);
  --typedef void (APIENTRYP PFNGLMATRIXINDEXUBVARBPROC) (GLint size, const GLubyte *indices);
  --typedef void (APIENTRYP PFNGLMATRIXINDEXUSVARBPROC) (GLint size, const GLushort *indices);
  --typedef void (APIENTRYP PFNGLMATRIXINDEXUIVARBPROC) (GLint size, const GLuint *indices);
  --typedef void (APIENTRYP PFNGLMATRIXINDEXPOINTERARBPROC) (GLint size, GLenum type, GLsizei stride, const GLvoid *pointer);
  --#endif

  --#ifndef GL_ARB_texture_env_combine
  --#define GL_ARB_texture_env_combine 1
  --#endif

  --#ifndef GL_ARB_texture_env_crossbar
  --#define GL_ARB_texture_env_crossbar 1
  --#endif

  --#ifndef GL_ARB_texture_env_dot3
  --#define GL_ARB_texture_env_dot3 1
  --#endif

  --#ifndef GL_ARB_texture_mirrored_repeat
  --#define GL_ARB_texture_mirrored_repeat 1
  --#endif

  --#ifndef GL_ARB_depth_texture
  --#define GL_ARB_depth_texture 1
  --#endif

  --#ifndef GL_ARB_shadow
  --#define GL_ARB_shadow 1
  --#endif

  --#ifndef GL_ARB_shadow_ambient
  --#define GL_ARB_shadow_ambient 1
  --#endif

  --#ifndef GL_ARB_window_pos
  --#define GL_ARB_window_pos 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glWindowPos2dARB (GLdouble, GLdouble);
  --GLAPI void APIENTRY glWindowPos2dvARB (const GLdouble *);
  --GLAPI void APIENTRY glWindowPos2fARB (GLfloat, GLfloat);
  --GLAPI void APIENTRY glWindowPos2fvARB (const GLfloat *);
  --GLAPI void APIENTRY glWindowPos2iARB (GLint, GLint);
  --GLAPI void APIENTRY glWindowPos2ivARB (const GLint *);
  --GLAPI void APIENTRY glWindowPos2sARB (GLshort, GLshort);
  --GLAPI void APIENTRY glWindowPos2svARB (const GLshort *);
  --GLAPI void APIENTRY glWindowPos3dARB (GLdouble, GLdouble, GLdouble);
  --GLAPI void APIENTRY glWindowPos3dvARB (const GLdouble *);
  --GLAPI void APIENTRY glWindowPos3fARB (GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glWindowPos3fvARB (const GLfloat *);
  --GLAPI void APIENTRY glWindowPos3iARB (GLint, GLint, GLint);
  --GLAPI void APIENTRY glWindowPos3ivARB (const GLint *);
  --GLAPI void APIENTRY glWindowPos3sARB (GLshort, GLshort, GLshort);
  --GLAPI void APIENTRY glWindowPos3svARB (const GLshort *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLWINDOWPOS2DARBPROC) (GLdouble x, GLdouble y);
  --typedef void (APIENTRYP PFNGLWINDOWPOS2DVARBPROC) (const GLdouble *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS2FARBPROC) (GLfloat x, GLfloat y);
  --typedef void (APIENTRYP PFNGLWINDOWPOS2FVARBPROC) (const GLfloat *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS2IARBPROC) (GLint x, GLint y);
  --typedef void (APIENTRYP PFNGLWINDOWPOS2IVARBPROC) (const GLint *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS2SARBPROC) (GLshort x, GLshort y);
  --typedef void (APIENTRYP PFNGLWINDOWPOS2SVARBPROC) (const GLshort *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS3DARBPROC) (GLdouble x, GLdouble y, GLdouble z);
  --typedef void (APIENTRYP PFNGLWINDOWPOS3DVARBPROC) (const GLdouble *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS3FARBPROC) (GLfloat x, GLfloat y, GLfloat z);
  --typedef void (APIENTRYP PFNGLWINDOWPOS3FVARBPROC) (const GLfloat *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS3IARBPROC) (GLint x, GLint y, GLint z);
  --typedef void (APIENTRYP PFNGLWINDOWPOS3IVARBPROC) (const GLint *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS3SARBPROC) (GLshort x, GLshort y, GLshort z);
  --typedef void (APIENTRYP PFNGLWINDOWPOS3SVARBPROC) (const GLshort *v);
  --#endif

  --#ifndef GL_ARB_vertex_program
  --#define GL_ARB_vertex_program 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glVertexAttrib1dARB (GLuint, GLdouble);
  --GLAPI void APIENTRY glVertexAttrib1dvARB (GLuint, const GLdouble *);
  --GLAPI void APIENTRY glVertexAttrib1fARB (GLuint, GLfloat);
  --GLAPI void APIENTRY glVertexAttrib1fvARB (GLuint, const GLfloat *);
  --GLAPI void APIENTRY glVertexAttrib1sARB (GLuint, GLshort);
  --GLAPI void APIENTRY glVertexAttrib1svARB (GLuint, const GLshort *);
  --GLAPI void APIENTRY glVertexAttrib2dARB (GLuint, GLdouble, GLdouble);
  --GLAPI void APIENTRY glVertexAttrib2dvARB (GLuint, const GLdouble *);
  --GLAPI void APIENTRY glVertexAttrib2fARB (GLuint, GLfloat, GLfloat);
  --GLAPI void APIENTRY glVertexAttrib2fvARB (GLuint, const GLfloat *);
  --GLAPI void APIENTRY glVertexAttrib2sARB (GLuint, GLshort, GLshort);
  --GLAPI void APIENTRY glVertexAttrib2svARB (GLuint, const GLshort *);
  --GLAPI void APIENTRY glVertexAttrib3dARB (GLuint, GLdouble, GLdouble, GLdouble);
  --GLAPI void APIENTRY glVertexAttrib3dvARB (GLuint, const GLdouble *);
  --GLAPI void APIENTRY glVertexAttrib3fARB (GLuint, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glVertexAttrib3fvARB (GLuint, const GLfloat *);
  --GLAPI void APIENTRY glVertexAttrib3sARB (GLuint, GLshort, GLshort, GLshort);
  --GLAPI void APIENTRY glVertexAttrib3svARB (GLuint, const GLshort *);
  --GLAPI void APIENTRY glVertexAttrib4NbvARB (GLuint, const GLbyte *);
  --GLAPI void APIENTRY glVertexAttrib4NivARB (GLuint, const GLint *);
  --GLAPI void APIENTRY glVertexAttrib4NsvARB (GLuint, const GLshort *);
  --GLAPI void APIENTRY glVertexAttrib4NubARB (GLuint, GLubyte, GLubyte, GLubyte, GLubyte);
  --GLAPI void APIENTRY glVertexAttrib4NubvARB (GLuint, const GLubyte *);
  --GLAPI void APIENTRY glVertexAttrib4NuivARB (GLuint, const GLuint *);
  --GLAPI void APIENTRY glVertexAttrib4NusvARB (GLuint, const GLushort *);
  --GLAPI void APIENTRY glVertexAttrib4bvARB (GLuint, const GLbyte *);
  --GLAPI void APIENTRY glVertexAttrib4dARB (GLuint, GLdouble, GLdouble, GLdouble, GLdouble);
  --GLAPI void APIENTRY glVertexAttrib4dvARB (GLuint, const GLdouble *);
  --GLAPI void APIENTRY glVertexAttrib4fARB (GLuint, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glVertexAttrib4fvARB (GLuint, const GLfloat *);
  --GLAPI void APIENTRY glVertexAttrib4ivARB (GLuint, const GLint *);
  --GLAPI void APIENTRY glVertexAttrib4sARB (GLuint, GLshort, GLshort, GLshort, GLshort);
  --GLAPI void APIENTRY glVertexAttrib4svARB (GLuint, const GLshort *);
  --GLAPI void APIENTRY glVertexAttrib4ubvARB (GLuint, const GLubyte *);
  --GLAPI void APIENTRY glVertexAttrib4uivARB (GLuint, const GLuint *);
  --GLAPI void APIENTRY glVertexAttrib4usvARB (GLuint, const GLushort *);
  --GLAPI void APIENTRY glVertexAttribPointerARB (GLuint, GLint, GLenum, GLboolean, GLsizei, const GLvoid *);
  --GLAPI void APIENTRY glEnableVertexAttribArrayARB (GLuint);
  --GLAPI void APIENTRY glDisableVertexAttribArrayARB (GLuint);
  --GLAPI void APIENTRY glProgramStringARB (GLenum, GLenum, GLsizei, const GLvoid *);
  --GLAPI void APIENTRY glBindProgramARB (GLenum, GLuint);
  --GLAPI void APIENTRY glDeleteProgramsARB (GLsizei, const GLuint *);
  --GLAPI void APIENTRY glGenProgramsARB (GLsizei, GLuint *);
  --GLAPI void APIENTRY glProgramEnvParameter4dARB (GLenum, GLuint, GLdouble, GLdouble, GLdouble, GLdouble);
  --GLAPI void APIENTRY glProgramEnvParameter4dvARB (GLenum, GLuint, const GLdouble *);
  --GLAPI void APIENTRY glProgramEnvParameter4fARB (GLenum, GLuint, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glProgramEnvParameter4fvARB (GLenum, GLuint, const GLfloat *);
  --GLAPI void APIENTRY glProgramLocalParameter4dARB (GLenum, GLuint, GLdouble, GLdouble, GLdouble, GLdouble);
  --GLAPI void APIENTRY glProgramLocalParameter4dvARB (GLenum, GLuint, const GLdouble *);
  --GLAPI void APIENTRY glProgramLocalParameter4fARB (GLenum, GLuint, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glProgramLocalParameter4fvARB (GLenum, GLuint, const GLfloat *);
  --GLAPI void APIENTRY glGetProgramEnvParameterdvARB (GLenum, GLuint, GLdouble *);
  --GLAPI void APIENTRY glGetProgramEnvParameterfvARB (GLenum, GLuint, GLfloat *);
  --GLAPI void APIENTRY glGetProgramLocalParameterdvARB (GLenum, GLuint, GLdouble *);
  --GLAPI void APIENTRY glGetProgramLocalParameterfvARB (GLenum, GLuint, GLfloat *);
  --GLAPI void APIENTRY glGetProgramivARB (GLenum, GLenum, GLint *);
  --GLAPI void APIENTRY glGetProgramStringARB (GLenum, GLenum, GLvoid *);
  --GLAPI void APIENTRY glGetVertexAttribdvARB (GLuint, GLenum, GLdouble *);
  --GLAPI void APIENTRY glGetVertexAttribfvARB (GLuint, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetVertexAttribivARB (GLuint, GLenum, GLint *);
  --GLAPI void APIENTRY glGetVertexAttribPointervARB (GLuint, GLenum, GLvoid* *);
  --GLAPI GLboolean APIENTRY glIsProgramARB (GLuint);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB1DARBPROC) (GLuint index, GLdouble x);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB1DVARBPROC) (GLuint index, const GLdouble *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB1FARBPROC) (GLuint index, GLfloat x);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB1FVARBPROC) (GLuint index, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB1SARBPROC) (GLuint index, GLshort x);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB1SVARBPROC) (GLuint index, const GLshort *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB2DARBPROC) (GLuint index, GLdouble x, GLdouble y);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB2DVARBPROC) (GLuint index, const GLdouble *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB2FARBPROC) (GLuint index, GLfloat x, GLfloat y);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB2FVARBPROC) (GLuint index, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB2SARBPROC) (GLuint index, GLshort x, GLshort y);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB2SVARBPROC) (GLuint index, const GLshort *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB3DARBPROC) (GLuint index, GLdouble x, GLdouble y, GLdouble z);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB3DVARBPROC) (GLuint index, const GLdouble *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB3FARBPROC) (GLuint index, GLfloat x, GLfloat y, GLfloat z);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB3FVARBPROC) (GLuint index, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB3SARBPROC) (GLuint index, GLshort x, GLshort y, GLshort z);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB3SVARBPROC) (GLuint index, const GLshort *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4NBVARBPROC) (GLuint index, const GLbyte *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4NIVARBPROC) (GLuint index, const GLint *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4NSVARBPROC) (GLuint index, const GLshort *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4NUBARBPROC) (GLuint index, GLubyte x, GLubyte y, GLubyte z, GLubyte w);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4NUBVARBPROC) (GLuint index, const GLubyte *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4NUIVARBPROC) (GLuint index, const GLuint *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4NUSVARBPROC) (GLuint index, const GLushort *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4BVARBPROC) (GLuint index, const GLbyte *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4DARBPROC) (GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4DVARBPROC) (GLuint index, const GLdouble *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4FARBPROC) (GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4FVARBPROC) (GLuint index, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4IVARBPROC) (GLuint index, const GLint *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4SARBPROC) (GLuint index, GLshort x, GLshort y, GLshort z, GLshort w);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4SVARBPROC) (GLuint index, const GLshort *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4UBVARBPROC) (GLuint index, const GLubyte *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4UIVARBPROC) (GLuint index, const GLuint *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4USVARBPROC) (GLuint index, const GLushort *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIBPOINTERARBPROC) (GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, const GLvoid *pointer);
  --typedef void (APIENTRYP PFNGLENABLEVERTEXATTRIBARRAYARBPROC) (GLuint index);
  --typedef void (APIENTRYP PFNGLDISABLEVERTEXATTRIBARRAYARBPROC) (GLuint index);
  --typedef void (APIENTRYP PFNGLPROGRAMSTRINGARBPROC) (GLenum target, GLenum format, GLsizei len, const GLvoid *string);
  --typedef void (APIENTRYP PFNGLBINDPROGRAMARBPROC) (GLenum target, GLuint program);
  --typedef void (APIENTRYP PFNGLDELETEPROGRAMSARBPROC) (GLsizei n, const GLuint *programs);
  --typedef void (APIENTRYP PFNGLGENPROGRAMSARBPROC) (GLsizei n, GLuint *programs);
  --typedef void (APIENTRYP PFNGLPROGRAMENVPARAMETER4DARBPROC) (GLenum target, GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
  --typedef void (APIENTRYP PFNGLPROGRAMENVPARAMETER4DVARBPROC) (GLenum target, GLuint index, const GLdouble *params);
  --typedef void (APIENTRYP PFNGLPROGRAMENVPARAMETER4FARBPROC) (GLenum target, GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
  --typedef void (APIENTRYP PFNGLPROGRAMENVPARAMETER4FVARBPROC) (GLenum target, GLuint index, const GLfloat *params);
  --typedef void (APIENTRYP PFNGLPROGRAMLOCALPARAMETER4DARBPROC) (GLenum target, GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
  --typedef void (APIENTRYP PFNGLPROGRAMLOCALPARAMETER4DVARBPROC) (GLenum target, GLuint index, const GLdouble *params);
  --typedef void (APIENTRYP PFNGLPROGRAMLOCALPARAMETER4FARBPROC) (GLenum target, GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
  --typedef void (APIENTRYP PFNGLPROGRAMLOCALPARAMETER4FVARBPROC) (GLenum target, GLuint index, const GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETPROGRAMENVPARAMETERDVARBPROC) (GLenum target, GLuint index, GLdouble *params);
  --typedef void (APIENTRYP PFNGLGETPROGRAMENVPARAMETERFVARBPROC) (GLenum target, GLuint index, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETPROGRAMLOCALPARAMETERDVARBPROC) (GLenum target, GLuint index, GLdouble *params);
  --typedef void (APIENTRYP PFNGLGETPROGRAMLOCALPARAMETERFVARBPROC) (GLenum target, GLuint index, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETPROGRAMIVARBPROC) (GLenum target, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETPROGRAMSTRINGARBPROC) (GLenum target, GLenum pname, GLvoid *string);
  --typedef void (APIENTRYP PFNGLGETVERTEXATTRIBDVARBPROC) (GLuint index, GLenum pname, GLdouble *params);
  --typedef void (APIENTRYP PFNGLGETVERTEXATTRIBFVARBPROC) (GLuint index, GLenum pname, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETVERTEXATTRIBIVARBPROC) (GLuint index, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETVERTEXATTRIBPOINTERVARBPROC) (GLuint index, GLenum pname, GLvoid* *pointer);
  --typedef GLboolean (APIENTRYP PFNGLISPROGRAMARBPROC) (GLuint program);
  --#endif

  --#ifndef GL_ARB_fragment_program
  --#define GL_ARB_fragment_program 1
  -- All ARB_fragment_program entry points are shared with ARB_vertex_program.
  --#endif

  --#ifndef GL_ARB_vertex_buffer_object
  --#define GL_ARB_vertex_buffer_object 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glBindBufferARB (GLenum, GLuint);
  --GLAPI void APIENTRY glDeleteBuffersARB (GLsizei, const GLuint *);
  --GLAPI void APIENTRY glGenBuffersARB (GLsizei, GLuint *);
  --GLAPI GLboolean APIENTRY glIsBufferARB (GLuint);
  --GLAPI void APIENTRY glBufferDataARB (GLenum, GLsizeiptrARB, const GLvoid *, GLenum);
  --GLAPI void APIENTRY glBufferSubDataARB (GLenum, GLintptrARB, GLsizeiptrARB, const GLvoid *);
  --GLAPI void APIENTRY glGetBufferSubDataARB (GLenum, GLintptrARB, GLsizeiptrARB, GLvoid *);
  --GLAPI GLvoid* APIENTRY glMapBufferARB (GLenum, GLenum);
  --GLAPI GLboolean APIENTRY glUnmapBufferARB (GLenum);
  --GLAPI void APIENTRY glGetBufferParameterivARB (GLenum, GLenum, GLint *);
  --GLAPI void APIENTRY glGetBufferPointervARB (GLenum, GLenum, GLvoid* *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLBINDBUFFERARBPROC) (GLenum target, GLuint buffer);
  --typedef void (APIENTRYP PFNGLDELETEBUFFERSARBPROC) (GLsizei n, const GLuint *buffers);
  --typedef void (APIENTRYP PFNGLGENBUFFERSARBPROC) (GLsizei n, GLuint *buffers);
  --typedef GLboolean (APIENTRYP PFNGLISBUFFERARBPROC) (GLuint buffer);
  --typedef void (APIENTRYP PFNGLBUFFERDATAARBPROC) (GLenum target, GLsizeiptrARB size, const GLvoid *data, GLenum usage);
  --typedef void (APIENTRYP PFNGLBUFFERSUBDATAARBPROC) (GLenum target, GLintptrARB offset, GLsizeiptrARB size, const GLvoid *data);
  --typedef void (APIENTRYP PFNGLGETBUFFERSUBDATAARBPROC) (GLenum target, GLintptrARB offset, GLsizeiptrARB size, GLvoid *data);
  --typedef GLvoid* (APIENTRYP PFNGLMAPBUFFERARBPROC) (GLenum target, GLenum access);
  --typedef GLboolean (APIENTRYP PFNGLUNMAPBUFFERARBPROC) (GLenum target);
  --typedef void (APIENTRYP PFNGLGETBUFFERPARAMETERIVARBPROC) (GLenum target, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETBUFFERPOINTERVARBPROC) (GLenum target, GLenum pname, GLvoid* *params);
  --#endif

  --#ifndef GL_ARB_occlusion_query
  --#define GL_ARB_occlusion_query 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glGenQueriesARB (GLsizei, GLuint *);
  --GLAPI void APIENTRY glDeleteQueriesARB (GLsizei, const GLuint *);
  --GLAPI GLboolean APIENTRY glIsQueryARB (GLuint);
  --GLAPI void APIENTRY glBeginQueryARB (GLenum, GLuint);
  --GLAPI void APIENTRY glEndQueryARB (GLenum);
  --GLAPI void APIENTRY glGetQueryivARB (GLenum, GLenum, GLint *);
  --GLAPI void APIENTRY glGetQueryObjectivARB (GLuint, GLenum, GLint *);
  --GLAPI void APIENTRY glGetQueryObjectuivARB (GLuint, GLenum, GLuint *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLGENQUERIESARBPROC) (GLsizei n, GLuint *ids);
  --typedef void (APIENTRYP PFNGLDELETEQUERIESARBPROC) (GLsizei n, const GLuint *ids);
  --typedef GLboolean (APIENTRYP PFNGLISQUERYARBPROC) (GLuint id);
  --typedef void (APIENTRYP PFNGLBEGINQUERYARBPROC) (GLenum target, GLuint id);
  --typedef void (APIENTRYP PFNGLENDQUERYARBPROC) (GLenum target);
  --typedef void (APIENTRYP PFNGLGETQUERYIVARBPROC) (GLenum target, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETQUERYOBJECTIVARBPROC) (GLuint id, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETQUERYOBJECTUIVARBPROC) (GLuint id, GLenum pname, GLuint *params);
  --#endif

  --#ifndef GL_ARB_shader_objects
  --#define GL_ARB_shader_objects 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glDeleteObjectARB (GLhandleARB);
  --GLAPI GLhandleARB APIENTRY glGetHandleARB (GLenum);
  --GLAPI void APIENTRY glDetachObjectARB (GLhandleARB, GLhandleARB);
  --GLAPI GLhandleARB APIENTRY glCreateShaderObjectARB (GLenum);
  --GLAPI void APIENTRY glShaderSourceARB (GLhandleARB, GLsizei, const GLcharARB* *, const GLint *);
  --GLAPI void APIENTRY glCompileShaderARB (GLhandleARB);
  --GLAPI GLhandleARB APIENTRY glCreateProgramObjectARB (void);
  --GLAPI void APIENTRY glAttachObjectARB (GLhandleARB, GLhandleARB);
  --GLAPI void APIENTRY glLinkProgramARB (GLhandleARB);
  --GLAPI void APIENTRY glUseProgramObjectARB (GLhandleARB);
  --GLAPI void APIENTRY glValidateProgramARB (GLhandleARB);
  --GLAPI void APIENTRY glUniform1fARB (GLint, GLfloat);
  --GLAPI void APIENTRY glUniform2fARB (GLint, GLfloat, GLfloat);
  --GLAPI void APIENTRY glUniform3fARB (GLint, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glUniform4fARB (GLint, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glUniform1iARB (GLint, GLint);
  --GLAPI void APIENTRY glUniform2iARB (GLint, GLint, GLint);
  --GLAPI void APIENTRY glUniform3iARB (GLint, GLint, GLint, GLint);
  --GLAPI void APIENTRY glUniform4iARB (GLint, GLint, GLint, GLint, GLint);
  --GLAPI void APIENTRY glUniform1fvARB (GLint, GLsizei, const GLfloat *);
  --GLAPI void APIENTRY glUniform2fvARB (GLint, GLsizei, const GLfloat *);
  --GLAPI void APIENTRY glUniform3fvARB (GLint, GLsizei, const GLfloat *);
  --GLAPI void APIENTRY glUniform4fvARB (GLint, GLsizei, const GLfloat *);
  --GLAPI void APIENTRY glUniform1ivARB (GLint, GLsizei, const GLint *);
  --GLAPI void APIENTRY glUniform2ivARB (GLint, GLsizei, const GLint *);
  --GLAPI void APIENTRY glUniform3ivARB (GLint, GLsizei, const GLint *);
  --GLAPI void APIENTRY glUniform4ivARB (GLint, GLsizei, const GLint *);
  --GLAPI void APIENTRY glUniformMatrix2fvARB (GLint, GLsizei, GLboolean, const GLfloat *);
  --GLAPI void APIENTRY glUniformMatrix3fvARB (GLint, GLsizei, GLboolean, const GLfloat *);
  --GLAPI void APIENTRY glUniformMatrix4fvARB (GLint, GLsizei, GLboolean, const GLfloat *);
  --GLAPI void APIENTRY glGetObjectParameterfvARB (GLhandleARB, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetObjectParameterivARB (GLhandleARB, GLenum, GLint *);
  --GLAPI void APIENTRY glGetInfoLogARB (GLhandleARB, GLsizei, GLsizei *, GLcharARB *);
  --GLAPI void APIENTRY glGetAttachedObjectsARB (GLhandleARB, GLsizei, GLsizei *, GLhandleARB *);
  --GLAPI GLint APIENTRY glGetUniformLocationARB (GLhandleARB, const GLcharARB *);
  --GLAPI void APIENTRY glGetActiveUniformARB (GLhandleARB, GLuint, GLsizei, GLsizei *, GLint *, GLenum *, GLcharARB *);
  --GLAPI void APIENTRY glGetUniformfvARB (GLhandleARB, GLint, GLfloat *);
  --GLAPI void APIENTRY glGetUniformivARB (GLhandleARB, GLint, GLint *);
  --GLAPI void APIENTRY glGetShaderSourceARB (GLhandleARB, GLsizei, GLsizei *, GLcharARB *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLDELETEOBJECTARBPROC) (GLhandleARB obj);
  --typedef GLhandleARB (APIENTRYP PFNGLGETHANDLEARBPROC) (GLenum pname);
  --typedef void (APIENTRYP PFNGLDETACHOBJECTARBPROC) (GLhandleARB containerObj, GLhandleARB attachedObj);
  --typedef GLhandleARB (APIENTRYP PFNGLCREATESHADEROBJECTARBPROC) (GLenum shaderType);
  --typedef void (APIENTRYP PFNGLSHADERSOURCEARBPROC) (GLhandleARB shaderObj, GLsizei count, const GLcharARB* *string, const GLint *length);
  --typedef void (APIENTRYP PFNGLCOMPILESHADERARBPROC) (GLhandleARB shaderObj);
  --typedef GLhandleARB (APIENTRYP PFNGLCREATEPROGRAMOBJECTARBPROC) (void);
  --typedef void (APIENTRYP PFNGLATTACHOBJECTARBPROC) (GLhandleARB containerObj, GLhandleARB obj);
  --typedef void (APIENTRYP PFNGLLINKPROGRAMARBPROC) (GLhandleARB programObj);
  --typedef void (APIENTRYP PFNGLUSEPROGRAMOBJECTARBPROC) (GLhandleARB programObj);
  --typedef void (APIENTRYP PFNGLVALIDATEPROGRAMARBPROC) (GLhandleARB programObj);
  --typedef void (APIENTRYP PFNGLUNIFORM1FARBPROC) (GLint location, GLfloat v0);
  --typedef void (APIENTRYP PFNGLUNIFORM2FARBPROC) (GLint location, GLfloat v0, GLfloat v1);
  --typedef void (APIENTRYP PFNGLUNIFORM3FARBPROC) (GLint location, GLfloat v0, GLfloat v1, GLfloat v2);
  --typedef void (APIENTRYP PFNGLUNIFORM4FARBPROC) (GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3);
  --typedef void (APIENTRYP PFNGLUNIFORM1IARBPROC) (GLint location, GLint v0);
  --typedef void (APIENTRYP PFNGLUNIFORM2IARBPROC) (GLint location, GLint v0, GLint v1);
  --typedef void (APIENTRYP PFNGLUNIFORM3IARBPROC) (GLint location, GLint v0, GLint v1, GLint v2);
  --typedef void (APIENTRYP PFNGLUNIFORM4IARBPROC) (GLint location, GLint v0, GLint v1, GLint v2, GLint v3);
  --typedef void (APIENTRYP PFNGLUNIFORM1FVARBPROC) (GLint location, GLsizei count, const GLfloat *value);
  --typedef void (APIENTRYP PFNGLUNIFORM2FVARBPROC) (GLint location, GLsizei count, const GLfloat *value);
  --typedef void (APIENTRYP PFNGLUNIFORM3FVARBPROC) (GLint location, GLsizei count, const GLfloat *value);
  --typedef void (APIENTRYP PFNGLUNIFORM4FVARBPROC) (GLint location, GLsizei count, const GLfloat *value);
  --typedef void (APIENTRYP PFNGLUNIFORM1IVARBPROC) (GLint location, GLsizei count, const GLint *value);
  --typedef void (APIENTRYP PFNGLUNIFORM2IVARBPROC) (GLint location, GLsizei count, const GLint *value);
  --typedef void (APIENTRYP PFNGLUNIFORM3IVARBPROC) (GLint location, GLsizei count, const GLint *value);
  --typedef void (APIENTRYP PFNGLUNIFORM4IVARBPROC) (GLint location, GLsizei count, const GLint *value);
  --typedef void (APIENTRYP PFNGLUNIFORMMATRIX2FVARBPROC) (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
  --typedef void (APIENTRYP PFNGLUNIFORMMATRIX3FVARBPROC) (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
  --typedef void (APIENTRYP PFNGLUNIFORMMATRIX4FVARBPROC) (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
  --typedef void (APIENTRYP PFNGLGETOBJECTPARAMETERFVARBPROC) (GLhandleARB obj, GLenum pname, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETOBJECTPARAMETERIVARBPROC) (GLhandleARB obj, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETINFOLOGARBPROC) (GLhandleARB obj, GLsizei maxLength, GLsizei *length, GLcharARB *infoLog);
  --typedef void (APIENTRYP PFNGLGETATTACHEDOBJECTSARBPROC) (GLhandleARB containerObj, GLsizei maxCount, GLsizei *count, GLhandleARB *obj);
  --typedef GLint (APIENTRYP PFNGLGETUNIFORMLOCATIONARBPROC) (GLhandleARB programObj, const GLcharARB *name);
  --typedef void (APIENTRYP PFNGLGETACTIVEUNIFORMARBPROC) (GLhandleARB programObj, GLuint index, GLsizei maxLength, GLsizei *length, GLint *size, GLenum *type, GLcharARB *name);
  --typedef void (APIENTRYP PFNGLGETUNIFORMFVARBPROC) (GLhandleARB programObj, GLint location, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETUNIFORMIVARBPROC) (GLhandleARB programObj, GLint location, GLint *params);
  --typedef void (APIENTRYP PFNGLGETSHADERSOURCEARBPROC) (GLhandleARB obj, GLsizei maxLength, GLsizei *length, GLcharARB *source);
  --#endif

  --#ifndef GL_ARB_vertex_shader
  --#define GL_ARB_vertex_shader 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glBindAttribLocationARB (GLhandleARB, GLuint, const GLcharARB *);
  --GLAPI void APIENTRY glGetActiveAttribARB (GLhandleARB, GLuint, GLsizei, GLsizei *, GLint *, GLenum *, GLcharARB *);
  --GLAPI GLint APIENTRY glGetAttribLocationARB (GLhandleARB, const GLcharARB *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLBINDATTRIBLOCATIONARBPROC) (GLhandleARB programObj, GLuint index, const GLcharARB *name);
  --typedef void (APIENTRYP PFNGLGETACTIVEATTRIBARBPROC) (GLhandleARB programObj, GLuint index, GLsizei maxLength, GLsizei *length, GLint *size, GLenum *type, GLcharARB *name);
  --typedef GLint (APIENTRYP PFNGLGETATTRIBLOCATIONARBPROC) (GLhandleARB programObj, const GLcharARB *name);
  --#endif

  --#ifndef GL_ARB_fragment_shader
  --#define GL_ARB_fragment_shader 1
  --#endif

  --#ifndef GL_ARB_shading_language_100
  --#define GL_ARB_shading_language_100 1
  --#endif

  --#ifndef GL_ARB_texture_non_power_of_two
  --#define GL_ARB_texture_non_power_of_two 1
  --#endif

  --#ifndef GL_ARB_point_sprite
  --#define GL_ARB_point_sprite 1
  --#endif

  --#ifndef GL_ARB_fragment_program_shadow
  --#define GL_ARB_fragment_program_shadow 1
  --#endif

  --#ifndef GL_EXT_abgr
  --#define GL_EXT_abgr 1
  --#endif

  --#ifndef GL_EXT_blend_color
  --#define GL_EXT_blend_color 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glBlendColorEXT (GLclampf, GLclampf, GLclampf, GLclampf);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLBLENDCOLOREXTPROC) (GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha);
  --#endif

  --#ifndef GL_EXT_polygon_offset
  --#define GL_EXT_polygon_offset 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glPolygonOffsetEXT (GLfloat, GLfloat);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLPOLYGONOFFSETEXTPROC) (GLfloat factor, GLfloat bias);
  --#endif

  --#ifndef GL_EXT_texture
  --#define GL_EXT_texture 1
  --#endif

  --#ifndef GL_EXT_texture3D
  --#define GL_EXT_texture3D 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glTexImage3DEXT (GLenum, GLint, GLenum, GLsizei, GLsizei, GLsizei, GLint, GLenum, GLenum, const GLvoid *);
  --GLAPI void APIENTRY glTexSubImage3DEXT (GLenum, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLenum, GLenum, const GLvoid *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLTEXIMAGE3DEXTPROC) (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const GLvoid *pixels);
  --typedef void (APIENTRYP PFNGLTEXSUBIMAGE3DEXTPROC) (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const GLvoid *pixels);
  --#endif

  --#ifndef GL_SGIS_texture_filter4
  --#define GL_SGIS_texture_filter4 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glGetTexFilterFuncSGIS (GLenum, GLenum, GLfloat *);
  --GLAPI void APIENTRY glTexFilterFuncSGIS (GLenum, GLenum, GLsizei, const GLfloat *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLGETTEXFILTERFUNCSGISPROC) (GLenum target, GLenum filter, GLfloat *weights);
  --typedef void (APIENTRYP PFNGLTEXFILTERFUNCSGISPROC) (GLenum target, GLenum filter, GLsizei n, const GLfloat *weights);
  --#endif

  --#ifndef GL_EXT_subtexture
  --#define GL_EXT_subtexture 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glTexSubImage1DEXT (GLenum, GLint, GLint, GLsizei, GLenum, GLenum, const GLvoid *);
  --GLAPI void APIENTRY glTexSubImage2DEXT (GLenum, GLint, GLint, GLint, GLsizei, GLsizei, GLenum, GLenum, const GLvoid *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLTEXSUBIMAGE1DEXTPROC) (GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type, const GLvoid *pixels);
  --typedef void (APIENTRYP PFNGLTEXSUBIMAGE2DEXTPROC) (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const GLvoid *pixels);
  --#endif

  --#ifndef GL_EXT_copy_texture
  --#define GL_EXT_copy_texture 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glCopyTexImage1DEXT (GLenum, GLint, GLenum, GLint, GLint, GLsizei, GLint);
  --GLAPI void APIENTRY glCopyTexImage2DEXT (GLenum, GLint, GLenum, GLint, GLint, GLsizei, GLsizei, GLint);
  --GLAPI void APIENTRY glCopyTexSubImage1DEXT (GLenum, GLint, GLint, GLint, GLint, GLsizei);
  --GLAPI void APIENTRY glCopyTexSubImage2DEXT (GLenum, GLint, GLint, GLint, GLint, GLint, GLsizei, GLsizei);
  --GLAPI void APIENTRY glCopyTexSubImage3DEXT (GLenum, GLint, GLint, GLint, GLint, GLint, GLint, GLsizei, GLsizei);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLCOPYTEXIMAGE1DEXTPROC) (GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLint border);
  --typedef void (APIENTRYP PFNGLCOPYTEXIMAGE2DEXTPROC) (GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border);
  --typedef void (APIENTRYP PFNGLCOPYTEXSUBIMAGE1DEXTPROC) (GLenum target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width);
  --typedef void (APIENTRYP PFNGLCOPYTEXSUBIMAGE2DEXTPROC) (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height);
  --typedef void (APIENTRYP PFNGLCOPYTEXSUBIMAGE3DEXTPROC) (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height);
  --#endif

  --#ifndef GL_EXT_histogram
  --#define GL_EXT_histogram 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glGetHistogramEXT (GLenum, GLboolean, GLenum, GLenum, GLvoid *);
  --GLAPI void APIENTRY glGetHistogramParameterfvEXT (GLenum, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetHistogramParameterivEXT (GLenum, GLenum, GLint *);
  --GLAPI void APIENTRY glGetMinmaxEXT (GLenum, GLboolean, GLenum, GLenum, GLvoid *);
  --GLAPI void APIENTRY glGetMinmaxParameterfvEXT (GLenum, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetMinmaxParameterivEXT (GLenum, GLenum, GLint *);
  --GLAPI void APIENTRY glHistogramEXT (GLenum, GLsizei, GLenum, GLboolean);
  --GLAPI void APIENTRY glMinmaxEXT (GLenum, GLenum, GLboolean);
  --GLAPI void APIENTRY glResetHistogramEXT (GLenum);
  --GLAPI void APIENTRY glResetMinmaxEXT (GLenum);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLGETHISTOGRAMEXTPROC) (GLenum target, GLboolean reset, GLenum format, GLenum type, GLvoid *values);
  --typedef void (APIENTRYP PFNGLGETHISTOGRAMPARAMETERFVEXTPROC) (GLenum target, GLenum pname, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETHISTOGRAMPARAMETERIVEXTPROC) (GLenum target, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETMINMAXEXTPROC) (GLenum target, GLboolean reset, GLenum format, GLenum type, GLvoid *values);
  --typedef void (APIENTRYP PFNGLGETMINMAXPARAMETERFVEXTPROC) (GLenum target, GLenum pname, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETMINMAXPARAMETERIVEXTPROC) (GLenum target, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLHISTOGRAMEXTPROC) (GLenum target, GLsizei width, GLenum internalformat, GLboolean sink);
  --typedef void (APIENTRYP PFNGLMINMAXEXTPROC) (GLenum target, GLenum internalformat, GLboolean sink);
  --typedef void (APIENTRYP PFNGLRESETHISTOGRAMEXTPROC) (GLenum target);
  --typedef void (APIENTRYP PFNGLRESETMINMAXEXTPROC) (GLenum target);
  --#endif

  --#ifndef GL_EXT_convolution
  --#define GL_EXT_convolution 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glConvolutionFilter1DEXT (GLenum, GLenum, GLsizei, GLenum, GLenum, const GLvoid *);
  --GLAPI void APIENTRY glConvolutionFilter2DEXT (GLenum, GLenum, GLsizei, GLsizei, GLenum, GLenum, const GLvoid *);
  --GLAPI void APIENTRY glConvolutionParameterfEXT (GLenum, GLenum, GLfloat);
  --GLAPI void APIENTRY glConvolutionParameterfvEXT (GLenum, GLenum, const GLfloat *);
  --GLAPI void APIENTRY glConvolutionParameteriEXT (GLenum, GLenum, GLint);
  --GLAPI void APIENTRY glConvolutionParameterivEXT (GLenum, GLenum, const GLint *);
  --GLAPI void APIENTRY glCopyConvolutionFilter1DEXT (GLenum, GLenum, GLint, GLint, GLsizei);
  --GLAPI void APIENTRY glCopyConvolutionFilter2DEXT (GLenum, GLenum, GLint, GLint, GLsizei, GLsizei);
  --GLAPI void APIENTRY glGetConvolutionFilterEXT (GLenum, GLenum, GLenum, GLvoid *);
  --GLAPI void APIENTRY glGetConvolutionParameterfvEXT (GLenum, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetConvolutionParameterivEXT (GLenum, GLenum, GLint *);
  --GLAPI void APIENTRY glGetSeparableFilterEXT (GLenum, GLenum, GLenum, GLvoid *, GLvoid *, GLvoid *);
  --GLAPI void APIENTRY glSeparableFilter2DEXT (GLenum, GLenum, GLsizei, GLsizei, GLenum, GLenum, const GLvoid *, const GLvoid *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLCONVOLUTIONFILTER1DEXTPROC) (GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type, const GLvoid *image);
  --typedef void (APIENTRYP PFNGLCONVOLUTIONFILTER2DEXTPROC) (GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type, const GLvoid *image);
  --typedef void (APIENTRYP PFNGLCONVOLUTIONPARAMETERFEXTPROC) (GLenum target, GLenum pname, GLfloat params);
  --typedef void (APIENTRYP PFNGLCONVOLUTIONPARAMETERFVEXTPROC) (GLenum target, GLenum pname, const GLfloat *params);
  --typedef void (APIENTRYP PFNGLCONVOLUTIONPARAMETERIEXTPROC) (GLenum target, GLenum pname, GLint params);
  --typedef void (APIENTRYP PFNGLCONVOLUTIONPARAMETERIVEXTPROC) (GLenum target, GLenum pname, const GLint *params);
  --typedef void (APIENTRYP PFNGLCOPYCONVOLUTIONFILTER1DEXTPROC) (GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width);
  --typedef void (APIENTRYP PFNGLCOPYCONVOLUTIONFILTER2DEXTPROC) (GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height);
  --typedef void (APIENTRYP PFNGLGETCONVOLUTIONFILTEREXTPROC) (GLenum target, GLenum format, GLenum type, GLvoid *image);
  --typedef void (APIENTRYP PFNGLGETCONVOLUTIONPARAMETERFVEXTPROC) (GLenum target, GLenum pname, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETCONVOLUTIONPARAMETERIVEXTPROC) (GLenum target, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETSEPARABLEFILTEREXTPROC) (GLenum target, GLenum format, GLenum type, GLvoid *row, GLvoid *column, GLvoid *span);
  --typedef void (APIENTRYP PFNGLSEPARABLEFILTER2DEXTPROC) (GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type, const GLvoid *row, const GLvoid *column);
  --#endif

  --#ifndef GL_EXT_color_matrix
  --#define GL_EXT_color_matrix 1
  --#endif

  --#ifndef GL_SGI_color_table
  --#define GL_SGI_color_table 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glColorTableSGI (GLenum, GLenum, GLsizei, GLenum, GLenum, const GLvoid *);
  --GLAPI void APIENTRY glColorTableParameterfvSGI (GLenum, GLenum, const GLfloat *);
  --GLAPI void APIENTRY glColorTableParameterivSGI (GLenum, GLenum, const GLint *);
  --GLAPI void APIENTRY glCopyColorTableSGI (GLenum, GLenum, GLint, GLint, GLsizei);
  --GLAPI void APIENTRY glGetColorTableSGI (GLenum, GLenum, GLenum, GLvoid *);
  --GLAPI void APIENTRY glGetColorTableParameterfvSGI (GLenum, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetColorTableParameterivSGI (GLenum, GLenum, GLint *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLCOLORTABLESGIPROC) (GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type, const GLvoid *table);
  --typedef void (APIENTRYP PFNGLCOLORTABLEPARAMETERFVSGIPROC) (GLenum target, GLenum pname, const GLfloat *params);
  --typedef void (APIENTRYP PFNGLCOLORTABLEPARAMETERIVSGIPROC) (GLenum target, GLenum pname, const GLint *params);
  --typedef void (APIENTRYP PFNGLCOPYCOLORTABLESGIPROC) (GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width);
  --typedef void (APIENTRYP PFNGLGETCOLORTABLESGIPROC) (GLenum target, GLenum format, GLenum type, GLvoid *table);
  --typedef void (APIENTRYP PFNGLGETCOLORTABLEPARAMETERFVSGIPROC) (GLenum target, GLenum pname, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETCOLORTABLEPARAMETERIVSGIPROC) (GLenum target, GLenum pname, GLint *params);
  --#endif

  --#ifndef GL_SGIX_pixel_texture
  --#define GL_SGIX_pixel_texture 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glPixelTexGenSGIX (GLenum);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLPIXELTEXGENSGIXPROC) (GLenum mode);
  --#endif

  --#ifndef GL_SGIS_pixel_texture
  --#define GL_SGIS_pixel_texture 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glPixelTexGenParameteriSGIS (GLenum, GLint);
  --GLAPI void APIENTRY glPixelTexGenParameterivSGIS (GLenum, const GLint *);
  --GLAPI void APIENTRY glPixelTexGenParameterfSGIS (GLenum, GLfloat);
  --GLAPI void APIENTRY glPixelTexGenParameterfvSGIS (GLenum, const GLfloat *);
  --GLAPI void APIENTRY glGetPixelTexGenParameterivSGIS (GLenum, GLint *);
  --GLAPI void APIENTRY glGetPixelTexGenParameterfvSGIS (GLenum, GLfloat *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLPIXELTEXGENPARAMETERISGISPROC) (GLenum pname, GLint param);
  --typedef void (APIENTRYP PFNGLPIXELTEXGENPARAMETERIVSGISPROC) (GLenum pname, const GLint *params);
  --typedef void (APIENTRYP PFNGLPIXELTEXGENPARAMETERFSGISPROC) (GLenum pname, GLfloat param);
  --typedef void (APIENTRYP PFNGLPIXELTEXGENPARAMETERFVSGISPROC) (GLenum pname, const GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETPIXELTEXGENPARAMETERIVSGISPROC) (GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETPIXELTEXGENPARAMETERFVSGISPROC) (GLenum pname, GLfloat *params);
  --#endif

  --#ifndef GL_SGIS_texture4D
  --#define GL_SGIS_texture4D 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glTexImage4DSGIS (GLenum, GLint, GLenum, GLsizei, GLsizei, GLsizei, GLsizei, GLint, GLenum, GLenum, const GLvoid *);
  --GLAPI void APIENTRY glTexSubImage4DSGIS (GLenum, GLint, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLsizei, GLenum, GLenum, const GLvoid *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLTEXIMAGE4DSGISPROC) (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLsizei size4d, GLint border, GLenum format, GLenum type, const GLvoid *pixels);
  --typedef void (APIENTRYP PFNGLTEXSUBIMAGE4DSGISPROC) (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint woffset, GLsizei width, GLsizei height, GLsizei depth, GLsizei size4d,
  --  GLenum format, GLenum type, const GLvoid *pixels);
  --#endif

  --#ifndef GL_SGI_texture_color_table
  --#define GL_SGI_texture_color_table 1
  --#endif

  --#ifndef GL_EXT_cmyka
  --#define GL_EXT_cmyka 1
  --#endif

  --#ifndef GL_EXT_texture_object
  --#define GL_EXT_texture_object 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI GLboolean APIENTRY glAreTexturesResidentEXT (GLsizei, const GLuint *, GLboolean *);
  --GLAPI void APIENTRY glBindTextureEXT (GLenum, GLuint);
  --GLAPI void APIENTRY glDeleteTexturesEXT (GLsizei, const GLuint *);
  --GLAPI void APIENTRY glGenTexturesEXT (GLsizei, GLuint *);
  --GLAPI GLboolean APIENTRY glIsTextureEXT (GLuint);
  --GLAPI void APIENTRY glPrioritizeTexturesEXT (GLsizei, const GLuint *, const GLclampf *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef GLboolean (APIENTRYP PFNGLARETEXTURESRESIDENTEXTPROC) (GLsizei n, const GLuint *textures, GLboolean *residences);
  --typedef void (APIENTRYP PFNGLBINDTEXTUREEXTPROC) (GLenum target, GLuint texture);
  --typedef void (APIENTRYP PFNGLDELETETEXTURESEXTPROC) (GLsizei n, const GLuint *textures);
  --typedef void (APIENTRYP PFNGLGENTEXTURESEXTPROC) (GLsizei n, GLuint *textures);
  --typedef GLboolean (APIENTRYP PFNGLISTEXTUREEXTPROC) (GLuint texture);
  --typedef void (APIENTRYP PFNGLPRIORITIZETEXTURESEXTPROC) (GLsizei n, const GLuint *textures, const GLclampf *priorities);
  --#endif

  --#ifndef GL_SGIS_detail_texture
  --#define GL_SGIS_detail_texture 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glDetailTexFuncSGIS (GLenum, GLsizei, const GLfloat *);
  --GLAPI void APIENTRY glGetDetailTexFuncSGIS (GLenum, GLfloat *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLDETAILTEXFUNCSGISPROC) (GLenum target, GLsizei n, const GLfloat *points);
  --typedef void (APIENTRYP PFNGLGETDETAILTEXFUNCSGISPROC) (GLenum target, GLfloat *points);
  --#endif

  --#ifndef GL_SGIS_sharpen_texture
  --#define GL_SGIS_sharpen_texture 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glSharpenTexFuncSGIS (GLenum, GLsizei, const GLfloat *);
  --GLAPI void APIENTRY glGetSharpenTexFuncSGIS (GLenum, GLfloat *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLSHARPENTEXFUNCSGISPROC) (GLenum target, GLsizei n, const GLfloat *points);
  --typedef void (APIENTRYP PFNGLGETSHARPENTEXFUNCSGISPROC) (GLenum target, GLfloat *points);
  --#endif

  --#ifndef GL_EXT_packed_pixels
  --#define GL_EXT_packed_pixels 1
  --#endif

  --#ifndef GL_SGIS_texture_lod
  --#define GL_SGIS_texture_lod 1
  --#endif

  --#ifndef GL_SGIS_multisample
  --#define GL_SGIS_multisample 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glSampleMaskSGIS (GLclampf, GLboolean);
  --GLAPI void APIENTRY glSamplePatternSGIS (GLenum);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLSAMPLEMASKSGISPROC) (GLclampf value, GLboolean invert);
  --typedef void (APIENTRYP PFNGLSAMPLEPATTERNSGISPROC) (GLenum pattern);
  --#endif

  --#ifndef GL_EXT_rescale_normal
  --#define GL_EXT_rescale_normal 1
  --#endif

  --#ifndef GL_EXT_vertex_array
  --#define GL_EXT_vertex_array 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glArrayElementEXT (GLint);
  --GLAPI void APIENTRY glColorPointerEXT (GLint, GLenum, GLsizei, GLsizei, const GLvoid *);
  --GLAPI void APIENTRY glDrawArraysEXT (GLenum, GLint, GLsizei);
  --GLAPI void APIENTRY glEdgeFlagPointerEXT (GLsizei, GLsizei, const GLboolean *);
  --GLAPI void APIENTRY glGetPointervEXT (GLenum, GLvoid* *);
  --GLAPI void APIENTRY glIndexPointerEXT (GLenum, GLsizei, GLsizei, const GLvoid *);
  --GLAPI void APIENTRY glNormalPointerEXT (GLenum, GLsizei, GLsizei, const GLvoid *);
  --GLAPI void APIENTRY glTexCoordPointerEXT (GLint, GLenum, GLsizei, GLsizei, const GLvoid *);
  --GLAPI void APIENTRY glVertexPointerEXT (GLint, GLenum, GLsizei, GLsizei, const GLvoid *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLARRAYELEMENTEXTPROC) (GLint i);
  --typedef void (APIENTRYP PFNGLCOLORPOINTEREXTPROC) (GLint size, GLenum type, GLsizei stride, GLsizei count, const GLvoid *pointer);
  --typedef void (APIENTRYP PFNGLDRAWARRAYSEXTPROC) (GLenum mode, GLint first, GLsizei count);
  --typedef void (APIENTRYP PFNGLEDGEFLAGPOINTEREXTPROC) (GLsizei stride, GLsizei count, const GLboolean *pointer);
  --typedef void (APIENTRYP PFNGLGETPOINTERVEXTPROC) (GLenum pname, GLvoid* *params);
  --typedef void (APIENTRYP PFNGLINDEXPOINTEREXTPROC) (GLenum type, GLsizei stride, GLsizei count, const GLvoid *pointer);
  --typedef void (APIENTRYP PFNGLNORMALPOINTEREXTPROC) (GLenum type, GLsizei stride, GLsizei count, const GLvoid *pointer);
  --typedef void (APIENTRYP PFNGLTEXCOORDPOINTEREXTPROC) (GLint size, GLenum type, GLsizei stride, GLsizei count, const GLvoid *pointer);
  --typedef void (APIENTRYP PFNGLVERTEXPOINTEREXTPROC) (GLint size, GLenum type, GLsizei stride, GLsizei count, const GLvoid *pointer);
  --#endif

  --#ifndef GL_EXT_misc_attribute
  --#define GL_EXT_misc_attribute 1
  --#endif

  --#ifndef GL_SGIS_generate_mipmap
  --#define GL_SGIS_generate_mipmap 1
  --#endif

  --#ifndef GL_SGIX_clipmap
  --#define GL_SGIX_clipmap 1
  --#endif

  --#ifndef GL_SGIX_shadow
  --#define GL_SGIX_shadow 1
  --#endif

  --#ifndef GL_SGIS_texture_edge_clamp
  --#define GL_SGIS_texture_edge_clamp 1
  --#endif

  --#ifndef GL_SGIS_texture_border_clamp
  --#define GL_SGIS_texture_border_clamp 1
  --#endif

  --#ifndef GL_EXT_blend_minmax
  --#define GL_EXT_blend_minmax 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glBlendEquationEXT (GLenum);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLBLENDEQUATIONEXTPROC) (GLenum mode);
  --#endif

  --#ifndef GL_EXT_blend_subtract
  --#define GL_EXT_blend_subtract 1
  --#endif

  --#ifndef GL_EXT_blend_logic_op
  --#define GL_EXT_blend_logic_op 1
  --#endif

  --#ifndef GL_SGIX_interlace
  --#define GL_SGIX_interlace 1
  --#endif

  --#ifndef GL_SGIX_pixel_tiles
  --#define GL_SGIX_pixel_tiles 1
  --#endif

  --#ifndef GL_SGIX_texture_select
  --#define GL_SGIX_texture_select 1
  --#endif

  --#ifndef GL_SGIX_sprite
  --#define GL_SGIX_sprite 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glSpriteParameterfSGIX (GLenum, GLfloat);
  --GLAPI void APIENTRY glSpriteParameterfvSGIX (GLenum, const GLfloat *);
  --GLAPI void APIENTRY glSpriteParameteriSGIX (GLenum, GLint);
  --GLAPI void APIENTRY glSpriteParameterivSGIX (GLenum, const GLint *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLSPRITEPARAMETERFSGIXPROC) (GLenum pname, GLfloat param);
  --typedef void (APIENTRYP PFNGLSPRITEPARAMETERFVSGIXPROC) (GLenum pname, const GLfloat *params);
  --typedef void (APIENTRYP PFNGLSPRITEPARAMETERISGIXPROC) (GLenum pname, GLint param);
  --typedef void (APIENTRYP PFNGLSPRITEPARAMETERIVSGIXPROC) (GLenum pname, const GLint *params);
  --#endif

  --#ifndef GL_SGIX_texture_multi_buffer
  --#define GL_SGIX_texture_multi_buffer 1
  --#endif

  --#ifndef GL_EXT_point_parameters
  --#define GL_EXT_point_parameters 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glPointParameterfEXT (GLenum, GLfloat);
  --GLAPI void APIENTRY glPointParameterfvEXT (GLenum, const GLfloat *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLPOINTPARAMETERFEXTPROC) (GLenum pname, GLfloat param);
  --typedef void (APIENTRYP PFNGLPOINTPARAMETERFVEXTPROC) (GLenum pname, const GLfloat *params);
  --#endif

  --#ifndef GL_SGIS_point_parameters
  --#define GL_SGIS_point_parameters 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glPointParameterfSGIS (GLenum, GLfloat);
  --GLAPI void APIENTRY glPointParameterfvSGIS (GLenum, const GLfloat *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLPOINTPARAMETERFSGISPROC) (GLenum pname, GLfloat param);
  --typedef void (APIENTRYP PFNGLPOINTPARAMETERFVSGISPROC) (GLenum pname, const GLfloat *params);
  --#endif

  --#ifndef GL_SGIX_instruments
  --#define GL_SGIX_instruments 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI GLint APIENTRY glGetInstrumentsSGIX (void);
  --GLAPI void APIENTRY glInstrumentsBufferSGIX (GLsizei, GLint *);
  --GLAPI GLint APIENTRY glPollInstrumentsSGIX (GLint *);
  --GLAPI void APIENTRY glReadInstrumentsSGIX (GLint);
  --GLAPI void APIENTRY glStartInstrumentsSGIX (void);
  --GLAPI void APIENTRY glStopInstrumentsSGIX (GLint);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef GLint (APIENTRYP PFNGLGETINSTRUMENTSSGIXPROC) (void);
  --typedef void (APIENTRYP PFNGLINSTRUMENTSBUFFERSGIXPROC) (GLsizei size, GLint *buffer);
  --typedef GLint (APIENTRYP PFNGLPOLLINSTRUMENTSSGIXPROC) (GLint *marker_p);
  --typedef void (APIENTRYP PFNGLREADINSTRUMENTSSGIXPROC) (GLint marker);
  --typedef void (APIENTRYP PFNGLSTARTINSTRUMENTSSGIXPROC) (void);
  --typedef void (APIENTRYP PFNGLSTOPINSTRUMENTSSGIXPROC) (GLint marker);
  --#endif

  --#ifndef GL_SGIX_texture_scale_bias
  --#define GL_SGIX_texture_scale_bias 1
  --#endif

  --#ifndef GL_SGIX_framezoom
  --#define GL_SGIX_framezoom 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glFrameZoomSGIX (GLint);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLFRAMEZOOMSGIXPROC) (GLint factor);
  --#endif

  --#ifndef GL_SGIX_tag_sample_buffer
  --#define GL_SGIX_tag_sample_buffer 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glTagSampleBufferSGIX (void);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLTAGSAMPLEBUFFERSGIXPROC) (void);
  --#endif

  --#ifndef GL_SGIX_polynomial_ffd
  --#define GL_SGIX_polynomial_ffd 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glDeformationMap3dSGIX (GLenum, GLdouble, GLdouble, GLint, GLint, GLdouble, GLdouble, GLint, GLint, GLdouble, GLdouble, GLint, GLint, const GLdouble *);
  --GLAPI void APIENTRY glDeformationMap3fSGIX (GLenum, GLfloat, GLfloat, GLint, GLint, GLfloat, GLfloat, GLint, GLint, GLfloat, GLfloat, GLint, GLint, const GLfloat *);
  --GLAPI void APIENTRY glDeformSGIX (GLbitfield);
  --GLAPI void APIENTRY glLoadIdentityDeformationMapSGIX (GLbitfield);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLDEFORMATIONMAP3DSGIXPROC) (GLenum target, GLdouble u1, GLdouble u2, GLint ustride, GLint uorder, GLdouble v1, GLdouble v2, GLint vstride, GLint vorder,
  --  GLdouble w1, GLdouble w2, GLint wstride, GLint worder, const GLdouble *points);
  --typedef void (APIENTRYP PFNGLDEFORMATIONMAP3FSGIXPROC) (GLenum target, GLfloat u1, GLfloat u2, GLint ustride, GLint uorder, GLfloat v1, GLfloat v2, GLint vstride, GLint vorder,
  --  GLfloat w1, GLfloat w2, GLint wstride, GLint worder, const GLfloat *points);
  --typedef void (APIENTRYP PFNGLDEFORMSGIXPROC) (GLbitfield mask);
  --typedef void (APIENTRYP PFNGLLOADIDENTITYDEFORMATIONMAPSGIXPROC) (GLbitfield mask);
  --#endif

  --#ifndef GL_SGIX_reference_plane
  --#define GL_SGIX_reference_plane 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glReferencePlaneSGIX (const GLdouble *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLREFERENCEPLANESGIXPROC) (const GLdouble *equation);
  --#endif

  --#ifndef GL_SGIX_flush_raster
  --#define GL_SGIX_flush_raster 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glFlushRasterSGIX (void);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLFLUSHRASTERSGIXPROC) (void);
  --#endif

  --#ifndef GL_SGIX_depth_texture
  --#define GL_SGIX_depth_texture 1
  --#endif

  --#ifndef GL_SGIS_fog_function
  --#define GL_SGIS_fog_function 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glFogFuncSGIS (GLsizei, const GLfloat *);
  --GLAPI void APIENTRY glGetFogFuncSGIS (GLfloat *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLFOGFUNCSGISPROC) (GLsizei n, const GLfloat *points);
  --typedef void (APIENTRYP PFNGLGETFOGFUNCSGISPROC) (GLfloat *points);
  --#endif

  --#ifndef GL_SGIX_fog_offset
  --#define GL_SGIX_fog_offset 1
  --#endif

  --#ifndef GL_HP_image_transform
  --#define GL_HP_image_transform 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glImageTransformParameteriHP (GLenum, GLenum, GLint);
  --GLAPI void APIENTRY glImageTransformParameterfHP (GLenum, GLenum, GLfloat);
  --GLAPI void APIENTRY glImageTransformParameterivHP (GLenum, GLenum, const GLint *);
  --GLAPI void APIENTRY glImageTransformParameterfvHP (GLenum, GLenum, const GLfloat *);
  --GLAPI void APIENTRY glGetImageTransformParameterivHP (GLenum, GLenum, GLint *);
  --GLAPI void APIENTRY glGetImageTransformParameterfvHP (GLenum, GLenum, GLfloat *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLIMAGETRANSFORMPARAMETERIHPPROC) (GLenum target, GLenum pname, GLint param);
  --typedef void (APIENTRYP PFNGLIMAGETRANSFORMPARAMETERFHPPROC) (GLenum target, GLenum pname, GLfloat param);
  --typedef void (APIENTRYP PFNGLIMAGETRANSFORMPARAMETERIVHPPROC) (GLenum target, GLenum pname, const GLint *params);
  --typedef void (APIENTRYP PFNGLIMAGETRANSFORMPARAMETERFVHPPROC) (GLenum target, GLenum pname, const GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETIMAGETRANSFORMPARAMETERIVHPPROC) (GLenum target, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETIMAGETRANSFORMPARAMETERFVHPPROC) (GLenum target, GLenum pname, GLfloat *params);
  --#endif

  --#ifndef GL_HP_convolution_border_modes
  --#define GL_HP_convolution_border_modes 1
  --#endif

  --#ifndef GL_SGIX_texture_add_env
  --#define GL_SGIX_texture_add_env 1
  --#endif

  --#ifndef GL_EXT_color_subtable
  --#define GL_EXT_color_subtable 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glColorSubTableEXT (GLenum, GLsizei, GLsizei, GLenum, GLenum, const GLvoid *);
  --GLAPI void APIENTRY glCopyColorSubTableEXT (GLenum, GLsizei, GLint, GLint, GLsizei);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLCOLORSUBTABLEEXTPROC) (GLenum target, GLsizei start, GLsizei count, GLenum format, GLenum type, const GLvoid *data);
  --typedef void (APIENTRYP PFNGLCOPYCOLORSUBTABLEEXTPROC) (GLenum target, GLsizei start, GLint x, GLint y, GLsizei width);
  --#endif

  --#ifndef GL_PGI_vertex_hints
  --#define GL_PGI_vertex_hints 1
  --#endif

  --#ifndef GL_PGI_misc_hints
  --#define GL_PGI_misc_hints 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glHintPGI (GLenum, GLint);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLHINTPGIPROC) (GLenum target, GLint mode);
  --#endif

  --#ifndef GL_EXT_paletted_texture
  --#define GL_EXT_paletted_texture 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glColorTableEXT (GLenum, GLenum, GLsizei, GLenum, GLenum, const GLvoid *);
  --GLAPI void APIENTRY glGetColorTableEXT (GLenum, GLenum, GLenum, GLvoid *);
  --GLAPI void APIENTRY glGetColorTableParameterivEXT (GLenum, GLenum, GLint *);
  --GLAPI void APIENTRY glGetColorTableParameterfvEXT (GLenum, GLenum, GLfloat *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLCOLORTABLEEXTPROC) (GLenum target, GLenum internalFormat, GLsizei width, GLenum format, GLenum type, const GLvoid *table);
  --typedef void (APIENTRYP PFNGLGETCOLORTABLEEXTPROC) (GLenum target, GLenum format, GLenum type, GLvoid *data);
  --typedef void (APIENTRYP PFNGLGETCOLORTABLEPARAMETERIVEXTPROC) (GLenum target, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETCOLORTABLEPARAMETERFVEXTPROC) (GLenum target, GLenum pname, GLfloat *params);
  --#endif

  --#ifndef GL_EXT_clip_volume_hint
  --#define GL_EXT_clip_volume_hint 1
  --#endif

  --#ifndef GL_SGIX_list_priority
  --#define GL_SGIX_list_priority 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glGetListParameterfvSGIX (GLuint, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetListParameterivSGIX (GLuint, GLenum, GLint *);
  --GLAPI void APIENTRY glListParameterfSGIX (GLuint, GLenum, GLfloat);
  --GLAPI void APIENTRY glListParameterfvSGIX (GLuint, GLenum, const GLfloat *);
  --GLAPI void APIENTRY glListParameteriSGIX (GLuint, GLenum, GLint);
  --GLAPI void APIENTRY glListParameterivSGIX (GLuint, GLenum, const GLint *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLGETLISTPARAMETERFVSGIXPROC) (GLuint list, GLenum pname, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETLISTPARAMETERIVSGIXPROC) (GLuint list, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLLISTPARAMETERFSGIXPROC) (GLuint list, GLenum pname, GLfloat param);
  --typedef void (APIENTRYP PFNGLLISTPARAMETERFVSGIXPROC) (GLuint list, GLenum pname, const GLfloat *params);
  --typedef void (APIENTRYP PFNGLLISTPARAMETERISGIXPROC) (GLuint list, GLenum pname, GLint param);
  --typedef void (APIENTRYP PFNGLLISTPARAMETERIVSGIXPROC) (GLuint list, GLenum pname, const GLint *params);
  --#endif

  --#ifndef GL_SGIX_ir_instrument1
  --#define GL_SGIX_ir_instrument1 1
  --#endif

  --#ifndef GL_SGIX_calligraphic_fragment
  --#define GL_SGIX_calligraphic_fragment 1
  --#endif

  --#ifndef GL_SGIX_texture_lod_bias
  --#define GL_SGIX_texture_lod_bias 1
  --#endif

  --#ifndef GL_SGIX_shadow_ambient
  --#define GL_SGIX_shadow_ambient 1
  --#endif

  --#ifndef GL_EXT_index_texture
  --#define GL_EXT_index_texture 1
  --#endif

  --#ifndef GL_EXT_index_material
  --#define GL_EXT_index_material 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glIndexMaterialEXT (GLenum, GLenum);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLINDEXMATERIALEXTPROC) (GLenum face, GLenum mode);
  --#endif

  --#ifndef GL_EXT_index_func
  --#define GL_EXT_index_func 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glIndexFuncEXT (GLenum, GLclampf);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLINDEXFUNCEXTPROC) (GLenum func, GLclampf ref);
  --#endif

  --#ifndef GL_EXT_index_array_formats
  --#define GL_EXT_index_array_formats 1
  --#endif

  --#ifndef GL_EXT_compiled_vertex_array
  --#define GL_EXT_compiled_vertex_array 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glLockArraysEXT (GLint, GLsizei);
  --GLAPI void APIENTRY glUnlockArraysEXT (void);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLLOCKARRAYSEXTPROC) (GLint first, GLsizei count);
  --typedef void (APIENTRYP PFNGLUNLOCKARRAYSEXTPROC) (void);
  --#endif
  type glLockArraysEXTPtr is access procedure(First : in GL.GLint; ItemCount : in GL.GLsizei);
  type glUnlockArraysEXTPtr is access procedure ;

  --#ifndef GL_EXT_cull_vertex
  --#define GL_EXT_cull_vertex 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glCullParameterdvEXT (GLenum, GLdouble *);
  --GLAPI void APIENTRY glCullParameterfvEXT (GLenum, GLfloat *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLCULLPARAMETERDVEXTPROC) (GLenum pname, GLdouble *params);
  --typedef void (APIENTRYP PFNGLCULLPARAMETERFVEXTPROC) (GLenum pname, GLfloat *params);
  --#endif

  --#ifndef GL_SGIX_ycrcb
  --#define GL_SGIX_ycrcb 1
  --#endif

  --#ifndef GL_SGIX_fragment_lighting
  --#define GL_SGIX_fragment_lighting 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glFragmentColorMaterialSGIX (GLenum, GLenum);
  --GLAPI void APIENTRY glFragmentLightfSGIX (GLenum, GLenum, GLfloat);
  --GLAPI void APIENTRY glFragmentLightfvSGIX (GLenum, GLenum, const GLfloat *);
  --GLAPI void APIENTRY glFragmentLightiSGIX (GLenum, GLenum, GLint);
  --GLAPI void APIENTRY glFragmentLightivSGIX (GLenum, GLenum, const GLint *);
  --GLAPI void APIENTRY glFragmentLightModelfSGIX (GLenum, GLfloat);
  --GLAPI void APIENTRY glFragmentLightModelfvSGIX (GLenum, const GLfloat *);
  --GLAPI void APIENTRY glFragmentLightModeliSGIX (GLenum, GLint);
  --GLAPI void APIENTRY glFragmentLightModelivSGIX (GLenum, const GLint *);
  --GLAPI void APIENTRY glFragmentMaterialfSGIX (GLenum, GLenum, GLfloat);
  --GLAPI void APIENTRY glFragmentMaterialfvSGIX (GLenum, GLenum, const GLfloat *);
  --GLAPI void APIENTRY glFragmentMaterialiSGIX (GLenum, GLenum, GLint);
  --GLAPI void APIENTRY glFragmentMaterialivSGIX (GLenum, GLenum, const GLint *);
  --GLAPI void APIENTRY glGetFragmentLightfvSGIX (GLenum, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetFragmentLightivSGIX (GLenum, GLenum, GLint *);
  --GLAPI void APIENTRY glGetFragmentMaterialfvSGIX (GLenum, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetFragmentMaterialivSGIX (GLenum, GLenum, GLint *);
  --GLAPI void APIENTRY glLightEnviSGIX (GLenum, GLint);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLFRAGMENTCOLORMATERIALSGIXPROC) (GLenum face, GLenum mode);
  --typedef void (APIENTRYP PFNGLFRAGMENTLIGHTFSGIXPROC) (GLenum light, GLenum pname, GLfloat param);
  --typedef void (APIENTRYP PFNGLFRAGMENTLIGHTFVSGIXPROC) (GLenum light, GLenum pname, const GLfloat *params);
  --typedef void (APIENTRYP PFNGLFRAGMENTLIGHTISGIXPROC) (GLenum light, GLenum pname, GLint param);
  --typedef void (APIENTRYP PFNGLFRAGMENTLIGHTIVSGIXPROC) (GLenum light, GLenum pname, const GLint *params);
  --typedef void (APIENTRYP PFNGLFRAGMENTLIGHTMODELFSGIXPROC) (GLenum pname, GLfloat param);
  --typedef void (APIENTRYP PFNGLFRAGMENTLIGHTMODELFVSGIXPROC) (GLenum pname, const GLfloat *params);
  --typedef void (APIENTRYP PFNGLFRAGMENTLIGHTMODELISGIXPROC) (GLenum pname, GLint param);
  --typedef void (APIENTRYP PFNGLFRAGMENTLIGHTMODELIVSGIXPROC) (GLenum pname, const GLint *params);
  --typedef void (APIENTRYP PFNGLFRAGMENTMATERIALFSGIXPROC) (GLenum face, GLenum pname, GLfloat param);
  --typedef void (APIENTRYP PFNGLFRAGMENTMATERIALFVSGIXPROC) (GLenum face, GLenum pname, const GLfloat *params);
  --typedef void (APIENTRYP PFNGLFRAGMENTMATERIALISGIXPROC) (GLenum face, GLenum pname, GLint param);
  --typedef void (APIENTRYP PFNGLFRAGMENTMATERIALIVSGIXPROC) (GLenum face, GLenum pname, const GLint *params);
  --typedef void (APIENTRYP PFNGLGETFRAGMENTLIGHTFVSGIXPROC) (GLenum light, GLenum pname, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETFRAGMENTLIGHTIVSGIXPROC) (GLenum light, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETFRAGMENTMATERIALFVSGIXPROC) (GLenum face, GLenum pname, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETFRAGMENTMATERIALIVSGIXPROC) (GLenum face, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLLIGHTENVISGIXPROC) (GLenum pname, GLint param);
  --#endif

  --#ifndef GL_IBM_rasterpos_clip
  --#define GL_IBM_rasterpos_clip 1
  --#endif

  --#ifndef GL_HP_texture_lighting
  --#define GL_HP_texture_lighting 1
  --#endif

  --#ifndef GL_EXT_draw_range_elements
  --#define GL_EXT_draw_range_elements 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glDrawRangeElementsEXT (GLenum, GLuint, GLuint, GLsizei, GLenum, const GLvoid *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLDRAWRANGEELEMENTSEXTPROC) (GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, const GLvoid *indices);
  --#endif

  --#ifndef GL_WIN_phong_shading
  --#define GL_WIN_phong_shading 1
  --#endif

  --#ifndef GL_WIN_specular_fog
  --#define GL_WIN_specular_fog 1
  --#endif

  --#ifndef GL_EXT_light_texture
  --#define GL_EXT_light_texture 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glApplyTextureEXT (GLenum);
  --GLAPI void APIENTRY glTextureLightEXT (GLenum);
  --GLAPI void APIENTRY glTextureMaterialEXT (GLenum, GLenum);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLAPPLYTEXTUREEXTPROC) (GLenum mode);
  --typedef void (APIENTRYP PFNGLTEXTURELIGHTEXTPROC) (GLenum pname);
  --typedef void (APIENTRYP PFNGLTEXTUREMATERIALEXTPROC) (GLenum face, GLenum mode);
  --#endif

  --#ifndef GL_SGIX_blend_alpha_minmax
  --#define GL_SGIX_blend_alpha_minmax 1
  --#endif

  --#ifndef GL_EXT_bgra
  --#define GL_EXT_bgra 1
  --#endif

  --#ifndef GL_SGIX_async
  --#define GL_SGIX_async 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glAsyncMarkerSGIX (GLuint);
  --GLAPI GLint APIENTRY glFinishAsyncSGIX (GLuint *);
  --GLAPI GLint APIENTRY glPollAsyncSGIX (GLuint *);
  --GLAPI GLuint APIENTRY glGenAsyncMarkersSGIX (GLsizei);
  --GLAPI void APIENTRY glDeleteAsyncMarkersSGIX (GLuint, GLsizei);
  --GLAPI GLboolean APIENTRY glIsAsyncMarkerSGIX (GLuint);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLASYNCMARKERSGIXPROC) (GLuint marker);
  --typedef GLint (APIENTRYP PFNGLFINISHASYNCSGIXPROC) (GLuint *markerp);
  --typedef GLint (APIENTRYP PFNGLPOLLASYNCSGIXPROC) (GLuint *markerp);
  --typedef GLuint (APIENTRYP PFNGLGENASYNCMARKERSSGIXPROC) (GLsizei range);
  --typedef void (APIENTRYP PFNGLDELETEASYNCMARKERSSGIXPROC) (GLuint marker, GLsizei range);
  --typedef GLboolean (APIENTRYP PFNGLISASYNCMARKERSGIXPROC) (GLuint marker);
  --#endif

  --#ifndef GL_SGIX_async_pixel
  --#define GL_SGIX_async_pixel 1
  --#endif

  --#ifndef GL_SGIX_async_histogram
  --#define GL_SGIX_async_histogram 1
  --#endif

  --#ifndef GL_INTEL_parallel_arrays
  --#define GL_INTEL_parallel_arrays 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glVertexPointervINTEL (GLint, GLenum, const GLvoid* *);
  --GLAPI void APIENTRY glNormalPointervINTEL (GLenum, const GLvoid* *);
  --GLAPI void APIENTRY glColorPointervINTEL (GLint, GLenum, const GLvoid* *);
  --GLAPI void APIENTRY glTexCoordPointervINTEL (GLint, GLenum, const GLvoid* *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLVERTEXPOINTERVINTELPROC) (GLint size, GLenum type, const GLvoid* *pointer);
  --typedef void (APIENTRYP PFNGLNORMALPOINTERVINTELPROC) (GLenum type, const GLvoid* *pointer);
  --typedef void (APIENTRYP PFNGLCOLORPOINTERVINTELPROC) (GLint size, GLenum type, const GLvoid* *pointer);
  --typedef void (APIENTRYP PFNGLTEXCOORDPOINTERVINTELPROC) (GLint size, GLenum type, const GLvoid* *pointer);
  --#endif

  --#ifndef GL_HP_occlusion_test
  --#define GL_HP_occlusion_test 1
  --#endif

  --#ifndef GL_EXT_pixel_transform
  --#define GL_EXT_pixel_transform 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glPixelTransformParameteriEXT (GLenum, GLenum, GLint);
  --GLAPI void APIENTRY glPixelTransformParameterfEXT (GLenum, GLenum, GLfloat);
  --GLAPI void APIENTRY glPixelTransformParameterivEXT (GLenum, GLenum, const GLint *);
  --GLAPI void APIENTRY glPixelTransformParameterfvEXT (GLenum, GLenum, const GLfloat *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLPIXELTRANSFORMPARAMETERIEXTPROC) (GLenum target, GLenum pname, GLint param);
  --typedef void (APIENTRYP PFNGLPIXELTRANSFORMPARAMETERFEXTPROC) (GLenum target, GLenum pname, GLfloat param);
  --typedef void (APIENTRYP PFNGLPIXELTRANSFORMPARAMETERIVEXTPROC) (GLenum target, GLenum pname, const GLint *params);
  --typedef void (APIENTRYP PFNGLPIXELTRANSFORMPARAMETERFVEXTPROC) (GLenum target, GLenum pname, const GLfloat *params);
  --#endif

  --#ifndef GL_EXT_pixel_transform_color_table
  --#define GL_EXT_pixel_transform_color_table 1
  --#endif

  --#ifndef GL_EXT_shared_texture_palette
  --#define GL_EXT_shared_texture_palette 1
  --#endif

  --#ifndef GL_EXT_separate_specular_color
  --#define GL_EXT_separate_specular_color 1
  --#endif

  --#ifndef GL_EXT_secondary_color
  --#define GL_EXT_secondary_color 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glSecondaryColor3bEXT (GLbyte, GLbyte, GLbyte);
  --GLAPI void APIENTRY glSecondaryColor3bvEXT (const GLbyte *);
  --GLAPI void APIENTRY glSecondaryColor3dEXT (GLdouble, GLdouble, GLdouble);
  --GLAPI void APIENTRY glSecondaryColor3dvEXT (const GLdouble *);
  --GLAPI void APIENTRY glSecondaryColor3fEXT (GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glSecondaryColor3fvEXT (const GLfloat *);
  --GLAPI void APIENTRY glSecondaryColor3iEXT (GLint, GLint, GLint);
  --GLAPI void APIENTRY glSecondaryColor3ivEXT (const GLint *);
  --GLAPI void APIENTRY glSecondaryColor3sEXT (GLshort, GLshort, GLshort);
  --GLAPI void APIENTRY glSecondaryColor3svEXT (const GLshort *);
  --GLAPI void APIENTRY glSecondaryColor3ubEXT (GLubyte, GLubyte, GLubyte);
  --GLAPI void APIENTRY glSecondaryColor3ubvEXT (const GLubyte *);
  --GLAPI void APIENTRY glSecondaryColor3uiEXT (GLuint, GLuint, GLuint);
  --GLAPI void APIENTRY glSecondaryColor3uivEXT (const GLuint *);
  --GLAPI void APIENTRY glSecondaryColor3usEXT (GLushort, GLushort, GLushort);
  --GLAPI void APIENTRY glSecondaryColor3usvEXT (const GLushort *);
  --GLAPI void APIENTRY glSecondaryColorPointerEXT (GLint, GLenum, GLsizei, const GLvoid *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3BEXTPROC) (GLbyte red, GLbyte green, GLbyte blue);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3BVEXTPROC) (const GLbyte *v);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3DEXTPROC) (GLdouble red, GLdouble green, GLdouble blue);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3DVEXTPROC) (const GLdouble *v);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3FEXTPROC) (GLfloat red, GLfloat green, GLfloat blue);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3FVEXTPROC) (const GLfloat *v);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3IEXTPROC) (GLint red, GLint green, GLint blue);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3IVEXTPROC) (const GLint *v);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3SEXTPROC) (GLshort red, GLshort green, GLshort blue);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3SVEXTPROC) (const GLshort *v);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3UBEXTPROC) (GLubyte red, GLubyte green, GLubyte blue);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3UBVEXTPROC) (const GLubyte *v);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3UIEXTPROC) (GLuint red, GLuint green, GLuint blue);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3UIVEXTPROC) (const GLuint *v);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3USEXTPROC) (GLushort red, GLushort green, GLushort blue);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3USVEXTPROC) (const GLushort *v);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLORPOINTEREXTPROC) (GLint size, GLenum type, GLsizei stride, const GLvoid *pointer);
  --#endif

  --#ifndef GL_EXT_texture_perturb_normal
  --#define GL_EXT_texture_perturb_normal 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glTextureNormalEXT (GLenum);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLTEXTURENORMALEXTPROC) (GLenum mode);
  --#endif

  --#ifndef GL_EXT_multi_draw_arrays
  --#define GL_EXT_multi_draw_arrays 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glMultiDrawArraysEXT (GLenum, GLint *, GLsizei *, GLsizei);
  --GLAPI void APIENTRY glMultiDrawElementsEXT (GLenum, const GLsizei *, GLenum, const GLvoid* *, GLsizei);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLMULTIDRAWARRAYSEXTPROC) (GLenum mode, GLint *first, GLsizei *count, GLsizei primcount);
  --typedef void (APIENTRYP PFNGLMULTIDRAWELEMENTSEXTPROC) (GLenum mode, const GLsizei *count, GLenum type, const GLvoid* *indices, GLsizei primcount);
  --#endif

  --#ifndef GL_EXT_fog_coord
  --#define GL_EXT_fog_coord 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glFogCoordfEXT (GLfloat);
  --GLAPI void APIENTRY glFogCoordfvEXT (const GLfloat *);
  --GLAPI void APIENTRY glFogCoorddEXT (GLdouble);
  --GLAPI void APIENTRY glFogCoorddvEXT (const GLdouble *);
  --GLAPI void APIENTRY glFogCoordPointerEXT (GLenum, GLsizei, const GLvoid *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLFOGCOORDFEXTPROC) (GLfloat coord);
  --typedef void (APIENTRYP PFNGLFOGCOORDFVEXTPROC) (const GLfloat *coord);
  --typedef void (APIENTRYP PFNGLFOGCOORDDEXTPROC) (GLdouble coord);
  --typedef void (APIENTRYP PFNGLFOGCOORDDVEXTPROC) (const GLdouble *coord);
  --typedef void (APIENTRYP PFNGLFOGCOORDPOINTEREXTPROC) (GLenum type, GLsizei stride, const GLvoid *pointer);
  --#endif

  --#ifndef GL_REND_screen_coordinates
  --#define GL_REND_screen_coordinates 1
  --#endif

  --#ifndef GL_EXT_coordinate_frame
  --#define GL_EXT_coordinate_frame 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glTangent3bEXT (GLbyte, GLbyte, GLbyte);
  --GLAPI void APIENTRY glTangent3bvEXT (const GLbyte *);
  --GLAPI void APIENTRY glTangent3dEXT (GLdouble, GLdouble, GLdouble);
  --GLAPI void APIENTRY glTangent3dvEXT (const GLdouble *);
  --GLAPI void APIENTRY glTangent3fEXT (GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glTangent3fvEXT (const GLfloat *);
  --GLAPI void APIENTRY glTangent3iEXT (GLint, GLint, GLint);
  --GLAPI void APIENTRY glTangent3ivEXT (const GLint *);
  --GLAPI void APIENTRY glTangent3sEXT (GLshort, GLshort, GLshort);
  --GLAPI void APIENTRY glTangent3svEXT (const GLshort *);
  --GLAPI void APIENTRY glBinormal3bEXT (GLbyte, GLbyte, GLbyte);
  --GLAPI void APIENTRY glBinormal3bvEXT (const GLbyte *);
  --GLAPI void APIENTRY glBinormal3dEXT (GLdouble, GLdouble, GLdouble);
  --GLAPI void APIENTRY glBinormal3dvEXT (const GLdouble *);
  --GLAPI void APIENTRY glBinormal3fEXT (GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glBinormal3fvEXT (const GLfloat *);
  --GLAPI void APIENTRY glBinormal3iEXT (GLint, GLint, GLint);
  --GLAPI void APIENTRY glBinormal3ivEXT (const GLint *);
  --GLAPI void APIENTRY glBinormal3sEXT (GLshort, GLshort, GLshort);
  --GLAPI void APIENTRY glBinormal3svEXT (const GLshort *);
  --GLAPI void APIENTRY glTangentPointerEXT (GLenum, GLsizei, const GLvoid *);
  --GLAPI void APIENTRY glBinormalPointerEXT (GLenum, GLsizei, const GLvoid *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLTANGENT3BEXTPROC) (GLbyte tx, GLbyte ty, GLbyte tz);
  --typedef void (APIENTRYP PFNGLTANGENT3BVEXTPROC) (const GLbyte *v);
  --typedef void (APIENTRYP PFNGLTANGENT3DEXTPROC) (GLdouble tx, GLdouble ty, GLdouble tz);
  --typedef void (APIENTRYP PFNGLTANGENT3DVEXTPROC) (const GLdouble *v);
  --typedef void (APIENTRYP PFNGLTANGENT3FEXTPROC) (GLfloat tx, GLfloat ty, GLfloat tz);
  --typedef void (APIENTRYP PFNGLTANGENT3FVEXTPROC) (const GLfloat *v);
  --typedef void (APIENTRYP PFNGLTANGENT3IEXTPROC) (GLint tx, GLint ty, GLint tz);
  --typedef void (APIENTRYP PFNGLTANGENT3IVEXTPROC) (const GLint *v);
  --typedef void (APIENTRYP PFNGLTANGENT3SEXTPROC) (GLshort tx, GLshort ty, GLshort tz);
  --typedef void (APIENTRYP PFNGLTANGENT3SVEXTPROC) (const GLshort *v);
  --typedef void (APIENTRYP PFNGLBINORMAL3BEXTPROC) (GLbyte bx, GLbyte by, GLbyte bz);
  --typedef void (APIENTRYP PFNGLBINORMAL3BVEXTPROC) (const GLbyte *v);
  --typedef void (APIENTRYP PFNGLBINORMAL3DEXTPROC) (GLdouble bx, GLdouble by, GLdouble bz);
  --typedef void (APIENTRYP PFNGLBINORMAL3DVEXTPROC) (const GLdouble *v);
  --typedef void (APIENTRYP PFNGLBINORMAL3FEXTPROC) (GLfloat bx, GLfloat by, GLfloat bz);
  --typedef void (APIENTRYP PFNGLBINORMAL3FVEXTPROC) (const GLfloat *v);
  --typedef void (APIENTRYP PFNGLBINORMAL3IEXTPROC) (GLint bx, GLint by, GLint bz);
  --typedef void (APIENTRYP PFNGLBINORMAL3IVEXTPROC) (const GLint *v);
  --typedef void (APIENTRYP PFNGLBINORMAL3SEXTPROC) (GLshort bx, GLshort by, GLshort bz);
  --typedef void (APIENTRYP PFNGLBINORMAL3SVEXTPROC) (const GLshort *v);
  --typedef void (APIENTRYP PFNGLTANGENTPOINTEREXTPROC) (GLenum type, GLsizei stride, const GLvoid *pointer);
  --typedef void (APIENTRYP PFNGLBINORMALPOINTEREXTPROC) (GLenum type, GLsizei stride, const GLvoid *pointer);
  --#endif

  --#ifndef GL_EXT_texture_env_combine
  --#define GL_EXT_texture_env_combine 1
  --#endif

  --#ifndef GL_APPLE_specular_vector
  --#define GL_APPLE_specular_vector 1
  --#endif

  --#ifndef GL_APPLE_transform_hint
  --#define GL_APPLE_transform_hint 1
  --#endif

  --#ifndef GL_SGIX_fog_scale
  --#define GL_SGIX_fog_scale 1
  --#endif

  --#ifndef GL_SUNX_constant_data
  --#define GL_SUNX_constant_data 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glFinishTextureSUNX (void);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLFINISHTEXTURESUNXPROC) (void);
  --#endif

  --#ifndef GL_SUN_global_alpha
  --#define GL_SUN_global_alpha 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glGlobalAlphaFactorbSUN (GLbyte);
  --GLAPI void APIENTRY glGlobalAlphaFactorsSUN (GLshort);
  --GLAPI void APIENTRY glGlobalAlphaFactoriSUN (GLint);
  --GLAPI void APIENTRY glGlobalAlphaFactorfSUN (GLfloat);
  --GLAPI void APIENTRY glGlobalAlphaFactordSUN (GLdouble);
  --GLAPI void APIENTRY glGlobalAlphaFactorubSUN (GLubyte);
  --GLAPI void APIENTRY glGlobalAlphaFactorusSUN (GLushort);
  --GLAPI void APIENTRY glGlobalAlphaFactoruiSUN (GLuint);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLGLOBALALPHAFACTORBSUNPROC) (GLbyte factor);
  --typedef void (APIENTRYP PFNGLGLOBALALPHAFACTORSSUNPROC) (GLshort factor);
  --typedef void (APIENTRYP PFNGLGLOBALALPHAFACTORISUNPROC) (GLint factor);
  --typedef void (APIENTRYP PFNGLGLOBALALPHAFACTORFSUNPROC) (GLfloat factor);
  --typedef void (APIENTRYP PFNGLGLOBALALPHAFACTORDSUNPROC) (GLdouble factor);
  --typedef void (APIENTRYP PFNGLGLOBALALPHAFACTORUBSUNPROC) (GLubyte factor);
  --typedef void (APIENTRYP PFNGLGLOBALALPHAFACTORUSSUNPROC) (GLushort factor);
  --typedef void (APIENTRYP PFNGLGLOBALALPHAFACTORUISUNPROC) (GLuint factor);
  --#endif

  --#ifndef GL_SUN_triangle_list
  --#define GL_SUN_triangle_list 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glReplacementCodeuiSUN (GLuint);
  --GLAPI void APIENTRY glReplacementCodeusSUN (GLushort);
  --GLAPI void APIENTRY glReplacementCodeubSUN (GLubyte);
  --GLAPI void APIENTRY glReplacementCodeuivSUN (const GLuint *);
  --GLAPI void APIENTRY glReplacementCodeusvSUN (const GLushort *);
  --GLAPI void APIENTRY glReplacementCodeubvSUN (const GLubyte *);
  --GLAPI void APIENTRY glReplacementCodePointerSUN (GLenum, GLsizei, const GLvoid* *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLREPLACEMENTCODEUISUNPROC) (GLuint code);
  --typedef void (APIENTRYP PFNGLREPLACEMENTCODEUSSUNPROC) (GLushort code);
  --typedef void (APIENTRYP PFNGLREPLACEMENTCODEUBSUNPROC) (GLubyte code);
  --typedef void (APIENTRYP PFNGLREPLACEMENTCODEUIVSUNPROC) (const GLuint *code);
  --typedef void (APIENTRYP PFNGLREPLACEMENTCODEUSVSUNPROC) (const GLushort *code);
  --typedef void (APIENTRYP PFNGLREPLACEMENTCODEUBVSUNPROC) (const GLubyte *code);
  --typedef void (APIENTRYP PFNGLREPLACEMENTCODEPOINTERSUNPROC) (GLenum type, GLsizei stride, const GLvoid* *pointer);
  --#endif

  --#ifndef GL_SUN_vertex
  --#define GL_SUN_vertex 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glColor4ubVertex2fSUN (GLubyte, GLubyte, GLubyte, GLubyte, GLfloat, GLfloat);
  --GLAPI void APIENTRY glColor4ubVertex2fvSUN (const GLubyte *, const GLfloat *);
  --GLAPI void APIENTRY glColor4ubVertex3fSUN (GLubyte, GLubyte, GLubyte, GLubyte, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glColor4ubVertex3fvSUN (const GLubyte *, const GLfloat *);
  --GLAPI void APIENTRY glColor3fVertex3fSUN (GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glColor3fVertex3fvSUN (const GLfloat *, const GLfloat *);
  --GLAPI void APIENTRY glNormal3fVertex3fSUN (GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glNormal3fVertex3fvSUN (const GLfloat *, const GLfloat *);
  --GLAPI void APIENTRY glColor4fNormal3fVertex3fSUN (GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glColor4fNormal3fVertex3fvSUN (const GLfloat *, const GLfloat *, const GLfloat *);
  --GLAPI void APIENTRY glTexCoord2fVertex3fSUN (GLfloat, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glTexCoord2fVertex3fvSUN (const GLfloat *, const GLfloat *);
  --GLAPI void APIENTRY glTexCoord4fVertex4fSUN (GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glTexCoord4fVertex4fvSUN (const GLfloat *, const GLfloat *);
  --GLAPI void APIENTRY glTexCoord2fColor4ubVertex3fSUN (GLfloat, GLfloat, GLubyte, GLubyte, GLubyte, GLubyte, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glTexCoord2fColor4ubVertex3fvSUN (const GLfloat *, const GLubyte *, const GLfloat *);
  --GLAPI void APIENTRY glTexCoord2fColor3fVertex3fSUN (GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glTexCoord2fColor3fVertex3fvSUN (const GLfloat *, const GLfloat *, const GLfloat *);
  --GLAPI void APIENTRY glTexCoord2fNormal3fVertex3fSUN (GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glTexCoord2fNormal3fVertex3fvSUN (const GLfloat *, const GLfloat *, const GLfloat *);
  --GLAPI void APIENTRY glTexCoord2fColor4fNormal3fVertex3fSUN (GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glTexCoord2fColor4fNormal3fVertex3fvSUN (const GLfloat *, const GLfloat *, const GLfloat *, const GLfloat *);
  --GLAPI void APIENTRY glTexCoord4fColor4fNormal3fVertex4fSUN (GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glTexCoord4fColor4fNormal3fVertex4fvSUN (const GLfloat *, const GLfloat *, const GLfloat *, const GLfloat *);
  --GLAPI void APIENTRY glReplacementCodeuiVertex3fSUN (GLuint, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glReplacementCodeuiVertex3fvSUN (const GLuint *, const GLfloat *);
  --GLAPI void APIENTRY glReplacementCodeuiColor4ubVertex3fSUN (GLuint, GLubyte, GLubyte, GLubyte, GLubyte, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glReplacementCodeuiColor4ubVertex3fvSUN (const GLuint *, const GLubyte *, const GLfloat *);
  --GLAPI void APIENTRY glReplacementCodeuiColor3fVertex3fSUN (GLuint, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glReplacementCodeuiColor3fVertex3fvSUN (const GLuint *, const GLfloat *, const GLfloat *);
  --GLAPI void APIENTRY glReplacementCodeuiNormal3fVertex3fSUN (GLuint, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glReplacementCodeuiNormal3fVertex3fvSUN (const GLuint *, const GLfloat *, const GLfloat *);
  --GLAPI void APIENTRY glReplacementCodeuiColor4fNormal3fVertex3fSUN (GLuint, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glReplacementCodeuiColor4fNormal3fVertex3fvSUN (const GLuint *, const GLfloat *, const GLfloat *, const GLfloat *);
  --GLAPI void APIENTRY glReplacementCodeuiTexCoord2fVertex3fSUN (GLuint, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glReplacementCodeuiTexCoord2fVertex3fvSUN (const GLuint *, const GLfloat *, const GLfloat *);
  --GLAPI void APIENTRY glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN (GLuint, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN (const GLuint *, const GLfloat *, const GLfloat *, const GLfloat *);
  --GLAPI void APIENTRY glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN (GLuint, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN (const GLuint *, const GLfloat *, const GLfloat *, const GLfloat *, const GLfloat *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLCOLOR4UBVERTEX2FSUNPROC) (GLubyte r, GLubyte g, GLubyte b, GLubyte a, GLfloat x, GLfloat y);
  --typedef void (APIENTRYP PFNGLCOLOR4UBVERTEX2FVSUNPROC) (const GLubyte *c, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLCOLOR4UBVERTEX3FSUNPROC) (GLubyte r, GLubyte g, GLubyte b, GLubyte a, GLfloat x, GLfloat y, GLfloat z);
  --typedef void (APIENTRYP PFNGLCOLOR4UBVERTEX3FVSUNPROC) (const GLubyte *c, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLCOLOR3FVERTEX3FSUNPROC) (GLfloat r, GLfloat g, GLfloat b, GLfloat x, GLfloat y, GLfloat z);
  --typedef void (APIENTRYP PFNGLCOLOR3FVERTEX3FVSUNPROC) (const GLfloat *c, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLNORMAL3FVERTEX3FSUNPROC) (GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z);
  --typedef void (APIENTRYP PFNGLNORMAL3FVERTEX3FVSUNPROC) (const GLfloat *n, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLCOLOR4FNORMAL3FVERTEX3FSUNPROC) (GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z);
  --typedef void (APIENTRYP PFNGLCOLOR4FNORMAL3FVERTEX3FVSUNPROC) (const GLfloat *c, const GLfloat *n, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLTEXCOORD2FVERTEX3FSUNPROC) (GLfloat s, GLfloat t, GLfloat x, GLfloat y, GLfloat z);
  --typedef void (APIENTRYP PFNGLTEXCOORD2FVERTEX3FVSUNPROC) (const GLfloat *tc, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLTEXCOORD4FVERTEX4FSUNPROC) (GLfloat s, GLfloat t, GLfloat p, GLfloat q, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
  --typedef void (APIENTRYP PFNGLTEXCOORD4FVERTEX4FVSUNPROC) (const GLfloat *tc, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLTEXCOORD2FCOLOR4UBVERTEX3FSUNPROC) (GLfloat s, GLfloat t, GLubyte r, GLubyte g, GLubyte b, GLubyte a, GLfloat x, GLfloat y, GLfloat z);
  --typedef void (APIENTRYP PFNGLTEXCOORD2FCOLOR4UBVERTEX3FVSUNPROC) (const GLfloat *tc, const GLubyte *c, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLTEXCOORD2FCOLOR3FVERTEX3FSUNPROC) (GLfloat s, GLfloat t, GLfloat r, GLfloat g, GLfloat b, GLfloat x, GLfloat y, GLfloat z);
  --typedef void (APIENTRYP PFNGLTEXCOORD2FCOLOR3FVERTEX3FVSUNPROC) (const GLfloat *tc, const GLfloat *c, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLTEXCOORD2FNORMAL3FVERTEX3FSUNPROC) (GLfloat s, GLfloat t, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z);
  --typedef void (APIENTRYP PFNGLTEXCOORD2FNORMAL3FVERTEX3FVSUNPROC) (const GLfloat *tc, const GLfloat *n, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLTEXCOORD2FCOLOR4FNORMAL3FVERTEX3FSUNPROC) (GLfloat s, GLfloat t, GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z);
  --typedef void (APIENTRYP PFNGLTEXCOORD2FCOLOR4FNORMAL3FVERTEX3FVSUNPROC) (const GLfloat *tc, const GLfloat *c, const GLfloat *n, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLTEXCOORD4FCOLOR4FNORMAL3FVERTEX4FSUNPROC) (GLfloat s, GLfloat t, GLfloat p, GLfloat q, GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
  --typedef void (APIENTRYP PFNGLTEXCOORD4FCOLOR4FNORMAL3FVERTEX4FVSUNPROC) (const GLfloat *tc, const GLfloat *c, const GLfloat *n, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLREPLACEMENTCODEUIVERTEX3FSUNPROC) (GLuint rc, GLfloat x, GLfloat y, GLfloat z);
  --typedef void (APIENTRYP PFNGLREPLACEMENTCODEUIVERTEX3FVSUNPROC) (const GLuint *rc, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLREPLACEMENTCODEUICOLOR4UBVERTEX3FSUNPROC) (GLuint rc, GLubyte r, GLubyte g, GLubyte b, GLubyte a, GLfloat x, GLfloat y, GLfloat z);
  --typedef void (APIENTRYP PFNGLREPLACEMENTCODEUICOLOR4UBVERTEX3FVSUNPROC) (const GLuint *rc, const GLubyte *c, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLREPLACEMENTCODEUICOLOR3FVERTEX3FSUNPROC) (GLuint rc, GLfloat r, GLfloat g, GLfloat b, GLfloat x, GLfloat y, GLfloat z);
  --typedef void (APIENTRYP PFNGLREPLACEMENTCODEUICOLOR3FVERTEX3FVSUNPROC) (const GLuint *rc, const GLfloat *c, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLREPLACEMENTCODEUINORMAL3FVERTEX3FSUNPROC) (GLuint rc, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z);
  --typedef void (APIENTRYP PFNGLREPLACEMENTCODEUINORMAL3FVERTEX3FVSUNPROC) (const GLuint *rc, const GLfloat *n, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLREPLACEMENTCODEUICOLOR4FNORMAL3FVERTEX3FSUNPROC) (GLuint rc, GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z);
  --typedef void (APIENTRYP PFNGLREPLACEMENTCODEUICOLOR4FNORMAL3FVERTEX3FVSUNPROC) (const GLuint *rc, const GLfloat *c, const GLfloat *n, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLREPLACEMENTCODEUITEXCOORD2FVERTEX3FSUNPROC) (GLuint rc, GLfloat s, GLfloat t, GLfloat x, GLfloat y, GLfloat z);
  --typedef void (APIENTRYP PFNGLREPLACEMENTCODEUITEXCOORD2FVERTEX3FVSUNPROC) (const GLuint *rc, const GLfloat *tc, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLREPLACEMENTCODEUITEXCOORD2FNORMAL3FVERTEX3FSUNPROC) (GLuint rc, GLfloat s, GLfloat t, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z);
  --typedef void (APIENTRYP PFNGLREPLACEMENTCODEUITEXCOORD2FNORMAL3FVERTEX3FVSUNPROC) (const GLuint *rc, const GLfloat *tc, const GLfloat *n, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLREPLACEMENTCODEUITEXCOORD2FCOLOR4FNORMAL3FVERTEX3FSUNPROC) (GLuint rc, GLfloat s, GLfloat t, GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z);
  --typedef void (APIENTRYP PFNGLREPLACEMENTCODEUITEXCOORD2FCOLOR4FNORMAL3FVERTEX3FVSUNPROC) (const GLuint *rc, const GLfloat *tc, const GLfloat *c, const GLfloat *n, const GLfloat *v);
  --#endif

  --#ifndef GL_EXT_blend_func_separate
  --#define GL_EXT_blend_func_separate 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glBlendFuncSeparateEXT (GLenum, GLenum, GLenum, GLenum);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLBLENDFUNCSEPARATEEXTPROC) (GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha);
  --#endif

  --#ifndef GL_INGR_blend_func_separate
  --#define GL_INGR_blend_func_separate 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glBlendFuncSeparateINGR (GLenum, GLenum, GLenum, GLenum);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLBLENDFUNCSEPARATEINGRPROC) (GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha);
  --#endif

  --#ifndef GL_INGR_color_clamp
  --#define GL_INGR_color_clamp 1
  --#endif

  --#ifndef GL_INGR_interlace_read
  --#define GL_INGR_interlace_read 1
  --#endif

  --#ifndef GL_EXT_stencil_wrap
  --#define GL_EXT_stencil_wrap 1
  --#endif

  --#ifndef GL_EXT_422_pixels
  --#define GL_EXT_422_pixels 1
  --#endif

  --#ifndef GL_NV_texgen_reflection
  --#define GL_NV_texgen_reflection 1
  --#endif

  --#ifndef GL_SUN_convolution_border_modes
  --#define GL_SUN_convolution_border_modes 1
  --#endif

  --#ifndef GL_EXT_texture_env_add
  --#define GL_EXT_texture_env_add 1
  --#endif

  --#ifndef GL_EXT_texture_lod_bias
  --#define GL_EXT_texture_lod_bias 1
  --#endif

  --#ifndef GL_EXT_texture_filter_anisotropic
  --#define GL_EXT_texture_filter_anisotropic 1
  --#endif

  --#ifndef GL_EXT_vertex_weighting
  --#define GL_EXT_vertex_weighting 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glVertexWeightfEXT (GLfloat);
  --GLAPI void APIENTRY glVertexWeightfvEXT (const GLfloat *);
  --GLAPI void APIENTRY glVertexWeightPointerEXT (GLsizei, GLenum, GLsizei, const GLvoid *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLVERTEXWEIGHTFEXTPROC) (GLfloat weight);
  --typedef void (APIENTRYP PFNGLVERTEXWEIGHTFVEXTPROC) (const GLfloat *weight);
  --typedef void (APIENTRYP PFNGLVERTEXWEIGHTPOINTEREXTPROC) (GLsizei size, GLenum type, GLsizei stride, const GLvoid *pointer);
  --#endif

  --#ifndef GL_NV_light_max_exponent
  --#define GL_NV_light_max_exponent 1
  --#endif

  --#ifndef GL_NV_vertex_array_range
  --#define GL_NV_vertex_array_range 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glFlushVertexArrayRangeNV (void);
  --GLAPI void APIENTRY glVertexArrayRangeNV (GLsizei, const GLvoid *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLFLUSHVERTEXARRAYRANGENVPROC) (void);
  --typedef void (APIENTRYP PFNGLVERTEXARRAYRANGENVPROC) (GLsizei length, const GLvoid *pointer);
  --#endif

  --#ifndef GL_NV_register_combiners
  --#define GL_NV_register_combiners 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glCombinerParameterfvNV (GLenum, const GLfloat *);
  --GLAPI void APIENTRY glCombinerParameterfNV (GLenum, GLfloat);
  --GLAPI void APIENTRY glCombinerParameterivNV (GLenum, const GLint *);
  --GLAPI void APIENTRY glCombinerParameteriNV (GLenum, GLint);
  --GLAPI void APIENTRY glCombinerInputNV (GLenum, GLenum, GLenum, GLenum, GLenum, GLenum);
  --GLAPI void APIENTRY glCombinerOutputNV (GLenum, GLenum, GLenum, GLenum, GLenum, GLenum, GLenum, GLboolean, GLboolean, GLboolean);
  --GLAPI void APIENTRY glFinalCombinerInputNV (GLenum, GLenum, GLenum, GLenum);
  --GLAPI void APIENTRY glGetCombinerInputParameterfvNV (GLenum, GLenum, GLenum, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetCombinerInputParameterivNV (GLenum, GLenum, GLenum, GLenum, GLint *);
  --GLAPI void APIENTRY glGetCombinerOutputParameterfvNV (GLenum, GLenum, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetCombinerOutputParameterivNV (GLenum, GLenum, GLenum, GLint *);
  --GLAPI void APIENTRY glGetFinalCombinerInputParameterfvNV (GLenum, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetFinalCombinerInputParameterivNV (GLenum, GLenum, GLint *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLCOMBINERPARAMETERFVNVPROC) (GLenum pname, const GLfloat *params);
  --typedef void (APIENTRYP PFNGLCOMBINERPARAMETERFNVPROC) (GLenum pname, GLfloat param);
  --typedef void (APIENTRYP PFNGLCOMBINERPARAMETERIVNVPROC) (GLenum pname, const GLint *params);
  --typedef void (APIENTRYP PFNGLCOMBINERPARAMETERINVPROC) (GLenum pname, GLint param);
  --typedef void (APIENTRYP PFNGLCOMBINERINPUTNVPROC) (GLenum stage, GLenum portion, GLenum variable, GLenum input, GLenum mapping, GLenum componentUsage);
  --typedef void (APIENTRYP PFNGLCOMBINEROUTPUTNVPROC) (GLenum stage, GLenum portion, GLenum abOutput, GLenum cdOutput, GLenum sumOutput, GLenum scale, GLenum bias, GLboolean abDotProduct, GLboolean cdDotProduct, GLboolean muxSum);
  --typedef void (APIENTRYP PFNGLFINALCOMBINERINPUTNVPROC) (GLenum variable, GLenum input, GLenum mapping, GLenum componentUsage);
  --typedef void (APIENTRYP PFNGLGETCOMBINERINPUTPARAMETERFVNVPROC) (GLenum stage, GLenum portion, GLenum variable, GLenum pname, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETCOMBINERINPUTPARAMETERIVNVPROC) (GLenum stage, GLenum portion, GLenum variable, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETCOMBINEROUTPUTPARAMETERFVNVPROC) (GLenum stage, GLenum portion, GLenum pname, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETCOMBINEROUTPUTPARAMETERIVNVPROC) (GLenum stage, GLenum portion, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETFINALCOMBINERINPUTPARAMETERFVNVPROC) (GLenum variable, GLenum pname, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETFINALCOMBINERINPUTPARAMETERIVNVPROC) (GLenum variable, GLenum pname, GLint *params);
  --#endif

  --#ifndef GL_NV_fog_distance
  --#define GL_NV_fog_distance 1
  --#endif

  --#ifndef GL_NV_texgen_emboss
  --#define GL_NV_texgen_emboss 1
  --#endif

  --#ifndef GL_NV_blend_square
  --#define GL_NV_blend_square 1
  --#endif

  --#ifndef GL_NV_texture_env_combine4
  --#define GL_NV_texture_env_combine4 1
  --#endif

  --#ifndef GL_MESA_resize_buffers
  --#define GL_MESA_resize_buffers 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glResizeBuffersMESA (void);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLRESIZEBUFFERSMESAPROC) (void);
  --#endif

  --#ifndef GL_MESA_window_pos
  --#define GL_MESA_window_pos 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glWindowPos2dMESA (GLdouble, GLdouble);
  --GLAPI void APIENTRY glWindowPos2dvMESA (const GLdouble *);
  --GLAPI void APIENTRY glWindowPos2fMESA (GLfloat, GLfloat);
  --GLAPI void APIENTRY glWindowPos2fvMESA (const GLfloat *);
  --GLAPI void APIENTRY glWindowPos2iMESA (GLint, GLint);
  --GLAPI void APIENTRY glWindowPos2ivMESA (const GLint *);
  --GLAPI void APIENTRY glWindowPos2sMESA (GLshort, GLshort);
  --GLAPI void APIENTRY glWindowPos2svMESA (const GLshort *);
  --GLAPI void APIENTRY glWindowPos3dMESA (GLdouble, GLdouble, GLdouble);
  --GLAPI void APIENTRY glWindowPos3dvMESA (const GLdouble *);
  --GLAPI void APIENTRY glWindowPos3fMESA (GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glWindowPos3fvMESA (const GLfloat *);
  --GLAPI void APIENTRY glWindowPos3iMESA (GLint, GLint, GLint);
  --GLAPI void APIENTRY glWindowPos3ivMESA (const GLint *);
  --GLAPI void APIENTRY glWindowPos3sMESA (GLshort, GLshort, GLshort);
  --GLAPI void APIENTRY glWindowPos3svMESA (const GLshort *);
  --GLAPI void APIENTRY glWindowPos4dMESA (GLdouble, GLdouble, GLdouble, GLdouble);
  --GLAPI void APIENTRY glWindowPos4dvMESA (const GLdouble *);
  --GLAPI void APIENTRY glWindowPos4fMESA (GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glWindowPos4fvMESA (const GLfloat *);
  --GLAPI void APIENTRY glWindowPos4iMESA (GLint, GLint, GLint, GLint);
  --GLAPI void APIENTRY glWindowPos4ivMESA (const GLint *);
  --GLAPI void APIENTRY glWindowPos4sMESA (GLshort, GLshort, GLshort, GLshort);
  --GLAPI void APIENTRY glWindowPos4svMESA (const GLshort *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLWINDOWPOS2DMESAPROC) (GLdouble x, GLdouble y);
  --typedef void (APIENTRYP PFNGLWINDOWPOS2DVMESAPROC) (const GLdouble *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS2FMESAPROC) (GLfloat x, GLfloat y);
  --typedef void (APIENTRYP PFNGLWINDOWPOS2FVMESAPROC) (const GLfloat *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS2IMESAPROC) (GLint x, GLint y);
  --typedef void (APIENTRYP PFNGLWINDOWPOS2IVMESAPROC) (const GLint *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS2SMESAPROC) (GLshort x, GLshort y);
  --typedef void (APIENTRYP PFNGLWINDOWPOS2SVMESAPROC) (const GLshort *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS3DMESAPROC) (GLdouble x, GLdouble y, GLdouble z);
  --typedef void (APIENTRYP PFNGLWINDOWPOS3DVMESAPROC) (const GLdouble *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS3FMESAPROC) (GLfloat x, GLfloat y, GLfloat z);
  --typedef void (APIENTRYP PFNGLWINDOWPOS3FVMESAPROC) (const GLfloat *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS3IMESAPROC) (GLint x, GLint y, GLint z);
  --typedef void (APIENTRYP PFNGLWINDOWPOS3IVMESAPROC) (const GLint *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS3SMESAPROC) (GLshort x, GLshort y, GLshort z);
  --typedef void (APIENTRYP PFNGLWINDOWPOS3SVMESAPROC) (const GLshort *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS4DMESAPROC) (GLdouble x, GLdouble y, GLdouble z, GLdouble w);
  --typedef void (APIENTRYP PFNGLWINDOWPOS4DVMESAPROC) (const GLdouble *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS4FMESAPROC) (GLfloat x, GLfloat y, GLfloat z, GLfloat w);
  --typedef void (APIENTRYP PFNGLWINDOWPOS4FVMESAPROC) (const GLfloat *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS4IMESAPROC) (GLint x, GLint y, GLint z, GLint w);
  --typedef void (APIENTRYP PFNGLWINDOWPOS4IVMESAPROC) (const GLint *v);
  --typedef void (APIENTRYP PFNGLWINDOWPOS4SMESAPROC) (GLshort x, GLshort y, GLshort z, GLshort w);
  --typedef void (APIENTRYP PFNGLWINDOWPOS4SVMESAPROC) (const GLshort *v);
  --#endif

  --#ifndef GL_IBM_cull_vertex
  --#define GL_IBM_cull_vertex 1
  --#endif

  --#ifndef GL_IBM_multimode_draw_arrays
  --#define GL_IBM_multimode_draw_arrays 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glMultiModeDrawArraysIBM (const GLenum *, const GLint *, const GLsizei *, GLsizei, GLint);
  --GLAPI void APIENTRY glMultiModeDrawElementsIBM (const GLenum *, const GLsizei *, GLenum, const GLvoid* const *, GLsizei, GLint);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLMULTIMODEDRAWARRAYSIBMPROC) (const GLenum *mode, const GLint *first, const GLsizei *count, GLsizei primcount, GLint modestride);
  --typedef void (APIENTRYP PFNGLMULTIMODEDRAWELEMENTSIBMPROC) (const GLenum *mode, const GLsizei *count, GLenum type, const GLvoid* const *indices, GLsizei primcount, GLint modestride);
  --#endif

  --#ifndef GL_IBM_vertex_array_lists
  --#define GL_IBM_vertex_array_lists 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glColorPointerListIBM (GLint, GLenum, GLint, const GLvoid* *, GLint);
  --GLAPI void APIENTRY glSecondaryColorPointerListIBM (GLint, GLenum, GLint, const GLvoid* *, GLint);
  --GLAPI void APIENTRY glEdgeFlagPointerListIBM (GLint, const GLboolean* *, GLint);
  --GLAPI void APIENTRY glFogCoordPointerListIBM (GLenum, GLint, const GLvoid* *, GLint);
  --GLAPI void APIENTRY glIndexPointerListIBM (GLenum, GLint, const GLvoid* *, GLint);
  --GLAPI void APIENTRY glNormalPointerListIBM (GLenum, GLint, const GLvoid* *, GLint);
  --GLAPI void APIENTRY glTexCoordPointerListIBM (GLint, GLenum, GLint, const GLvoid* *, GLint);
  --GLAPI void APIENTRY glVertexPointerListIBM (GLint, GLenum, GLint, const GLvoid* *, GLint);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLCOLORPOINTERLISTIBMPROC) (GLint size, GLenum type, GLint stride, const GLvoid* *pointer, GLint ptrstride);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLORPOINTERLISTIBMPROC) (GLint size, GLenum type, GLint stride, const GLvoid* *pointer, GLint ptrstride);
  --typedef void (APIENTRYP PFNGLEDGEFLAGPOINTERLISTIBMPROC) (GLint stride, const GLboolean* *pointer, GLint ptrstride);
  --typedef void (APIENTRYP PFNGLFOGCOORDPOINTERLISTIBMPROC) (GLenum type, GLint stride, const GLvoid* *pointer, GLint ptrstride);
  --typedef void (APIENTRYP PFNGLINDEXPOINTERLISTIBMPROC) (GLenum type, GLint stride, const GLvoid* *pointer, GLint ptrstride);
  --typedef void (APIENTRYP PFNGLNORMALPOINTERLISTIBMPROC) (GLenum type, GLint stride, const GLvoid* *pointer, GLint ptrstride);
  --typedef void (APIENTRYP PFNGLTEXCOORDPOINTERLISTIBMPROC) (GLint size, GLenum type, GLint stride, const GLvoid* *pointer, GLint ptrstride);
  --typedef void (APIENTRYP PFNGLVERTEXPOINTERLISTIBMPROC) (GLint size, GLenum type, GLint stride, const GLvoid* *pointer, GLint ptrstride);
  --#endif

  --#ifndef GL_SGIX_subsample
  --#define GL_SGIX_subsample 1
  --#endif

  --#ifndef GL_SGIX_ycrcba
  --#define GL_SGIX_ycrcba 1
  --#endif

  --#ifndef GL_SGIX_ycrcb_subsample
  --#define GL_SGIX_ycrcb_subsample 1
  --#endif

  --#ifndef GL_SGIX_depth_pass_instrument
  --#define GL_SGIX_depth_pass_instrument 1
  --#endif

  --#ifndef GL_3DFX_texture_compression_FXT1
  --#define GL_3DFX_texture_compression_FXT1 1
  --#endif

  --#ifndef GL_3DFX_multisample
  --#define GL_3DFX_multisample 1
  --#endif

  --#ifndef GL_3DFX_tbuffer
  --#define GL_3DFX_tbuffer 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glTbufferMask3DFX (GLuint);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLTBUFFERMASK3DFXPROC) (GLuint mask);
  --#endif

  --#ifndef GL_EXT_multisample
  --#define GL_EXT_multisample 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glSampleMaskEXT (GLclampf, GLboolean);
  --GLAPI void APIENTRY glSamplePatternEXT (GLenum);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLSAMPLEMASKEXTPROC) (GLclampf value, GLboolean invert);
  --typedef void (APIENTRYP PFNGLSAMPLEPATTERNEXTPROC) (GLenum pattern);
  --#endif

  --#ifndef GL_SGIX_vertex_preclip
  --#define GL_SGIX_vertex_preclip 1
  --#endif

  --#ifndef GL_SGIX_convolution_accuracy
  --#define GL_SGIX_convolution_accuracy 1
  --#endif

  --#ifndef GL_SGIX_resample
  --#define GL_SGIX_resample 1
  --#endif

  --#ifndef GL_SGIS_point_line_texgen
  --#define GL_SGIS_point_line_texgen 1
  --#endif

  --#ifndef GL_SGIS_texture_color_mask
  --#define GL_SGIS_texture_color_mask 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glTextureColorMaskSGIS (GLboolean, GLboolean, GLboolean, GLboolean);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLTEXTURECOLORMASKSGISPROC) (GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha);
  --#endif

  --#ifndef GL_SGIX_igloo_interface
  --#define GL_SGIX_igloo_interface 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glIglooInterfaceSGIX (GLenum, const GLvoid *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLIGLOOINTERFACESGIXPROC) (GLenum pname, const GLvoid *params);
  --#endif

  --#ifndef GL_EXT_texture_env_dot3
  --#define GL_EXT_texture_env_dot3 1
  --#endif

  --#ifndef GL_ATI_texture_mirror_once
  --#define GL_ATI_texture_mirror_once 1
  --#endif

  --#ifndef GL_NV_fence
  --#define GL_NV_fence 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glDeleteFencesNV (GLsizei, const GLuint *);
  --GLAPI void APIENTRY glGenFencesNV (GLsizei, GLuint *);
  --GLAPI GLboolean APIENTRY glIsFenceNV (GLuint);
  --GLAPI GLboolean APIENTRY glTestFenceNV (GLuint);
  --GLAPI void APIENTRY glGetFenceivNV (GLuint, GLenum, GLint *);
  --GLAPI void APIENTRY glFinishFenceNV (GLuint);
  --GLAPI void APIENTRY glSetFenceNV (GLuint, GLenum);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLDELETEFENCESNVPROC) (GLsizei n, const GLuint *fences);
  --typedef void (APIENTRYP PFNGLGENFENCESNVPROC) (GLsizei n, GLuint *fences);
  --typedef GLboolean (APIENTRYP PFNGLISFENCENVPROC) (GLuint fence);
  --typedef GLboolean (APIENTRYP PFNGLTESTFENCENVPROC) (GLuint fence);
  --typedef void (APIENTRYP PFNGLGETFENCEIVNVPROC) (GLuint fence, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLFINISHFENCENVPROC) (GLuint fence);
  --typedef void (APIENTRYP PFNGLSETFENCENVPROC) (GLuint fence, GLenum condition);
  --#endif

  --#ifndef GL_NV_evaluators
  --#define GL_NV_evaluators 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glMapControlPointsNV (GLenum, GLuint, GLenum, GLsizei, GLsizei, GLint, GLint, GLboolean, const GLvoid *);
  --GLAPI void APIENTRY glMapParameterivNV (GLenum, GLenum, const GLint *);
  --GLAPI void APIENTRY glMapParameterfvNV (GLenum, GLenum, const GLfloat *);
  --GLAPI void APIENTRY glGetMapControlPointsNV (GLenum, GLuint, GLenum, GLsizei, GLsizei, GLboolean, GLvoid *);
  --GLAPI void APIENTRY glGetMapParameterivNV (GLenum, GLenum, GLint *);
  --GLAPI void APIENTRY glGetMapParameterfvNV (GLenum, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetMapAttribParameterivNV (GLenum, GLuint, GLenum, GLint *);
  --GLAPI void APIENTRY glGetMapAttribParameterfvNV (GLenum, GLuint, GLenum, GLfloat *);
  --GLAPI void APIENTRY glEvalMapsNV (GLenum, GLenum);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLMAPCONTROLPOINTSNVPROC) (GLenum target, GLuint index, GLenum type, GLsizei ustride, GLsizei vstride, GLint uorder, GLint vorder, GLboolean packed, const GLvoid *points);
  --typedef void (APIENTRYP PFNGLMAPPARAMETERIVNVPROC) (GLenum target, GLenum pname, const GLint *params);
  --typedef void (APIENTRYP PFNGLMAPPARAMETERFVNVPROC) (GLenum target, GLenum pname, const GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETMAPCONTROLPOINTSNVPROC) (GLenum target, GLuint index, GLenum type, GLsizei ustride, GLsizei vstride, GLboolean packed, GLvoid *points);
  --typedef void (APIENTRYP PFNGLGETMAPPARAMETERIVNVPROC) (GLenum target, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETMAPPARAMETERFVNVPROC) (GLenum target, GLenum pname, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETMAPATTRIBPARAMETERIVNVPROC) (GLenum target, GLuint index, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETMAPATTRIBPARAMETERFVNVPROC) (GLenum target, GLuint index, GLenum pname, GLfloat *params);
  --typedef void (APIENTRYP PFNGLEVALMAPSNVPROC) (GLenum target, GLenum mode);
  --#endif

  --#ifndef GL_NV_packed_depth_stencil
  --#define GL_NV_packed_depth_stencil 1
  --#endif

  --#ifndef GL_NV_register_combiners2
  --#define GL_NV_register_combiners2 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glCombinerStageParameterfvNV (GLenum, GLenum, const GLfloat *);
  --GLAPI void APIENTRY glGetCombinerStageParameterfvNV (GLenum, GLenum, GLfloat *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLCOMBINERSTAGEPARAMETERFVNVPROC) (GLenum stage, GLenum pname, const GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETCOMBINERSTAGEPARAMETERFVNVPROC) (GLenum stage, GLenum pname, GLfloat *params);
  --#endif

  --#ifndef GL_NV_texture_compression_vtc
  --#define GL_NV_texture_compression_vtc 1
  --#endif

  --#ifndef GL_NV_texture_rectangle
  --#define GL_NV_texture_rectangle 1
  --#endif

  --#ifndef GL_NV_texture_shader
  --#define GL_NV_texture_shader 1
  --#endif

  --#ifndef GL_NV_texture_shader2
  --#define GL_NV_texture_shader2 1
  --#endif

  --#ifndef GL_NV_vertex_array_range2
  --#define GL_NV_vertex_array_range2 1
  --#endif

  --#ifndef GL_NV_vertex_program
  --#define GL_NV_vertex_program 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI GLboolean APIENTRY glAreProgramsResidentNV (GLsizei, const GLuint *, GLboolean *);
  --GLAPI void APIENTRY glBindProgramNV (GLenum, GLuint);
  --GLAPI void APIENTRY glDeleteProgramsNV (GLsizei, const GLuint *);
  --GLAPI void APIENTRY glExecuteProgramNV (GLenum, GLuint, const GLfloat *);
  --GLAPI void APIENTRY glGenProgramsNV (GLsizei, GLuint *);
  --GLAPI void APIENTRY glGetProgramParameterdvNV (GLenum, GLuint, GLenum, GLdouble *);
  --GLAPI void APIENTRY glGetProgramParameterfvNV (GLenum, GLuint, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetProgramivNV (GLuint, GLenum, GLint *);
  --GLAPI void APIENTRY glGetProgramStringNV (GLuint, GLenum, GLubyte *);
  --GLAPI void APIENTRY glGetTrackMatrixivNV (GLenum, GLuint, GLenum, GLint *);
  --GLAPI void APIENTRY glGetVertexAttribdvNV (GLuint, GLenum, GLdouble *);
  --GLAPI void APIENTRY glGetVertexAttribfvNV (GLuint, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetVertexAttribivNV (GLuint, GLenum, GLint *);
  --GLAPI void APIENTRY glGetVertexAttribPointervNV (GLuint, GLenum, GLvoid* *);
  --GLAPI GLboolean APIENTRY glIsProgramNV (GLuint);
  --GLAPI void APIENTRY glLoadProgramNV (GLenum, GLuint, GLsizei, const GLubyte *);
  --GLAPI void APIENTRY glProgramParameter4dNV (GLenum, GLuint, GLdouble, GLdouble, GLdouble, GLdouble);
  --GLAPI void APIENTRY glProgramParameter4dvNV (GLenum, GLuint, const GLdouble *);
  --GLAPI void APIENTRY glProgramParameter4fNV (GLenum, GLuint, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glProgramParameter4fvNV (GLenum, GLuint, const GLfloat *);
  --GLAPI void APIENTRY glProgramParameters4dvNV (GLenum, GLuint, GLuint, const GLdouble *);
  --GLAPI void APIENTRY glProgramParameters4fvNV (GLenum, GLuint, GLuint, const GLfloat *);
  --GLAPI void APIENTRY glRequestResidentProgramsNV (GLsizei, const GLuint *);
  --GLAPI void APIENTRY glTrackMatrixNV (GLenum, GLuint, GLenum, GLenum);
  --GLAPI void APIENTRY glVertexAttribPointerNV (GLuint, GLint, GLenum, GLsizei, const GLvoid *);
  --GLAPI void APIENTRY glVertexAttrib1dNV (GLuint, GLdouble);
  --GLAPI void APIENTRY glVertexAttrib1dvNV (GLuint, const GLdouble *);
  --GLAPI void APIENTRY glVertexAttrib1fNV (GLuint, GLfloat);
  --GLAPI void APIENTRY glVertexAttrib1fvNV (GLuint, const GLfloat *);
  --GLAPI void APIENTRY glVertexAttrib1sNV (GLuint, GLshort);
  --GLAPI void APIENTRY glVertexAttrib1svNV (GLuint, const GLshort *);
  --GLAPI void APIENTRY glVertexAttrib2dNV (GLuint, GLdouble, GLdouble);
  --GLAPI void APIENTRY glVertexAttrib2dvNV (GLuint, const GLdouble *);
  --GLAPI void APIENTRY glVertexAttrib2fNV (GLuint, GLfloat, GLfloat);
  --GLAPI void APIENTRY glVertexAttrib2fvNV (GLuint, const GLfloat *);
  --GLAPI void APIENTRY glVertexAttrib2sNV (GLuint, GLshort, GLshort);
  --GLAPI void APIENTRY glVertexAttrib2svNV (GLuint, const GLshort *);
  --GLAPI void APIENTRY glVertexAttrib3dNV (GLuint, GLdouble, GLdouble, GLdouble);
  --GLAPI void APIENTRY glVertexAttrib3dvNV (GLuint, const GLdouble *);
  --GLAPI void APIENTRY glVertexAttrib3fNV (GLuint, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glVertexAttrib3fvNV (GLuint, const GLfloat *);
  --GLAPI void APIENTRY glVertexAttrib3sNV (GLuint, GLshort, GLshort, GLshort);
  --GLAPI void APIENTRY glVertexAttrib3svNV (GLuint, const GLshort *);
  --GLAPI void APIENTRY glVertexAttrib4dNV (GLuint, GLdouble, GLdouble, GLdouble, GLdouble);
  --GLAPI void APIENTRY glVertexAttrib4dvNV (GLuint, const GLdouble *);
  --GLAPI void APIENTRY glVertexAttrib4fNV (GLuint, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glVertexAttrib4fvNV (GLuint, const GLfloat *);
  --GLAPI void APIENTRY glVertexAttrib4sNV (GLuint, GLshort, GLshort, GLshort, GLshort);
  --GLAPI void APIENTRY glVertexAttrib4svNV (GLuint, const GLshort *);
  --GLAPI void APIENTRY glVertexAttrib4ubNV (GLuint, GLubyte, GLubyte, GLubyte, GLubyte);
  --GLAPI void APIENTRY glVertexAttrib4ubvNV (GLuint, const GLubyte *);
  --GLAPI void APIENTRY glVertexAttribs1dvNV (GLuint, GLsizei, const GLdouble *);
  --GLAPI void APIENTRY glVertexAttribs1fvNV (GLuint, GLsizei, const GLfloat *);
  --GLAPI void APIENTRY glVertexAttribs1svNV (GLuint, GLsizei, const GLshort *);
  --GLAPI void APIENTRY glVertexAttribs2dvNV (GLuint, GLsizei, const GLdouble *);
  --GLAPI void APIENTRY glVertexAttribs2fvNV (GLuint, GLsizei, const GLfloat *);
  --GLAPI void APIENTRY glVertexAttribs2svNV (GLuint, GLsizei, const GLshort *);
  --GLAPI void APIENTRY glVertexAttribs3dvNV (GLuint, GLsizei, const GLdouble *);
  --GLAPI void APIENTRY glVertexAttribs3fvNV (GLuint, GLsizei, const GLfloat *);
  --GLAPI void APIENTRY glVertexAttribs3svNV (GLuint, GLsizei, const GLshort *);
  --GLAPI void APIENTRY glVertexAttribs4dvNV (GLuint, GLsizei, const GLdouble *);
  --GLAPI void APIENTRY glVertexAttribs4fvNV (GLuint, GLsizei, const GLfloat *);
  --GLAPI void APIENTRY glVertexAttribs4svNV (GLuint, GLsizei, const GLshort *);
  --GLAPI void APIENTRY glVertexAttribs4ubvNV (GLuint, GLsizei, const GLubyte *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef GLboolean (APIENTRYP PFNGLAREPROGRAMSRESIDENTNVPROC) (GLsizei n, const GLuint *programs, GLboolean *residences);
  --typedef void (APIENTRYP PFNGLBINDPROGRAMNVPROC) (GLenum target, GLuint id);
  --typedef void (APIENTRYP PFNGLDELETEPROGRAMSNVPROC) (GLsizei n, const GLuint *programs);
  --typedef void (APIENTRYP PFNGLEXECUTEPROGRAMNVPROC) (GLenum target, GLuint id, const GLfloat *params);
  --typedef void (APIENTRYP PFNGLGENPROGRAMSNVPROC) (GLsizei n, GLuint *programs);
  --typedef void (APIENTRYP PFNGLGETPROGRAMPARAMETERDVNVPROC) (GLenum target, GLuint index, GLenum pname, GLdouble *params);
  --typedef void (APIENTRYP PFNGLGETPROGRAMPARAMETERFVNVPROC) (GLenum target, GLuint index, GLenum pname, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETPROGRAMIVNVPROC) (GLuint id, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETPROGRAMSTRINGNVPROC) (GLuint id, GLenum pname, GLubyte *program);
  --typedef void (APIENTRYP PFNGLGETTRACKMATRIXIVNVPROC) (GLenum target, GLuint address, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETVERTEXATTRIBDVNVPROC) (GLuint index, GLenum pname, GLdouble *params);
  --typedef void (APIENTRYP PFNGLGETVERTEXATTRIBFVNVPROC) (GLuint index, GLenum pname, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETVERTEXATTRIBIVNVPROC) (GLuint index, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETVERTEXATTRIBPOINTERVNVPROC) (GLuint index, GLenum pname, GLvoid* *pointer);
  --typedef GLboolean (APIENTRYP PFNGLISPROGRAMNVPROC) (GLuint id);
  --typedef void (APIENTRYP PFNGLLOADPROGRAMNVPROC) (GLenum target, GLuint id, GLsizei len, const GLubyte *program);
  --typedef void (APIENTRYP PFNGLPROGRAMPARAMETER4DNVPROC) (GLenum target, GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
  --typedef void (APIENTRYP PFNGLPROGRAMPARAMETER4DVNVPROC) (GLenum target, GLuint index, const GLdouble *v);
  --typedef void (APIENTRYP PFNGLPROGRAMPARAMETER4FNVPROC) (GLenum target, GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
  --typedef void (APIENTRYP PFNGLPROGRAMPARAMETER4FVNVPROC) (GLenum target, GLuint index, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLPROGRAMPARAMETERS4DVNVPROC) (GLenum target, GLuint index, GLuint count, const GLdouble *v);
  --typedef void (APIENTRYP PFNGLPROGRAMPARAMETERS4FVNVPROC) (GLenum target, GLuint index, GLuint count, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLREQUESTRESIDENTPROGRAMSNVPROC) (GLsizei n, const GLuint *programs);
  --typedef void (APIENTRYP PFNGLTRACKMATRIXNVPROC) (GLenum target, GLuint address, GLenum matrix, GLenum transform);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIBPOINTERNVPROC) (GLuint index, GLint fsize, GLenum type, GLsizei stride, const GLvoid *pointer);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB1DNVPROC) (GLuint index, GLdouble x);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB1DVNVPROC) (GLuint index, const GLdouble *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB1FNVPROC) (GLuint index, GLfloat x);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB1FVNVPROC) (GLuint index, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB1SNVPROC) (GLuint index, GLshort x);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB1SVNVPROC) (GLuint index, const GLshort *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB2DNVPROC) (GLuint index, GLdouble x, GLdouble y);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB2DVNVPROC) (GLuint index, const GLdouble *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB2FNVPROC) (GLuint index, GLfloat x, GLfloat y);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB2FVNVPROC) (GLuint index, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB2SNVPROC) (GLuint index, GLshort x, GLshort y);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB2SVNVPROC) (GLuint index, const GLshort *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB3DNVPROC) (GLuint index, GLdouble x, GLdouble y, GLdouble z);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB3DVNVPROC) (GLuint index, const GLdouble *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB3FNVPROC) (GLuint index, GLfloat x, GLfloat y, GLfloat z);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB3FVNVPROC) (GLuint index, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB3SNVPROC) (GLuint index, GLshort x, GLshort y, GLshort z);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB3SVNVPROC) (GLuint index, const GLshort *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4DNVPROC) (GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4DVNVPROC) (GLuint index, const GLdouble *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4FNVPROC) (GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4FVNVPROC) (GLuint index, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4SNVPROC) (GLuint index, GLshort x, GLshort y, GLshort z, GLshort w);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4SVNVPROC) (GLuint index, const GLshort *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4UBNVPROC) (GLuint index, GLubyte x, GLubyte y, GLubyte z, GLubyte w);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4UBVNVPROC) (GLuint index, const GLubyte *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIBS1DVNVPROC) (GLuint index, GLsizei count, const GLdouble *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIBS1FVNVPROC) (GLuint index, GLsizei count, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIBS1SVNVPROC) (GLuint index, GLsizei count, const GLshort *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIBS2DVNVPROC) (GLuint index, GLsizei count, const GLdouble *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIBS2FVNVPROC) (GLuint index, GLsizei count, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIBS2SVNVPROC) (GLuint index, GLsizei count, const GLshort *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIBS3DVNVPROC) (GLuint index, GLsizei count, const GLdouble *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIBS3FVNVPROC) (GLuint index, GLsizei count, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIBS3SVNVPROC) (GLuint index, GLsizei count, const GLshort *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIBS4DVNVPROC) (GLuint index, GLsizei count, const GLdouble *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIBS4FVNVPROC) (GLuint index, GLsizei count, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIBS4SVNVPROC) (GLuint index, GLsizei count, const GLshort *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIBS4UBVNVPROC) (GLuint index, GLsizei count, const GLubyte *v);
  --#endif

  --#ifndef GL_SGIX_texture_coordinate_clamp
  --#define GL_SGIX_texture_coordinate_clamp 1
  --#endif

  --#ifndef GL_SGIX_scalebias_hint
  --#define GL_SGIX_scalebias_hint 1
  --#endif

  --#ifndef GL_OML_interlace
  --#define GL_OML_interlace 1
  --#endif

  --#ifndef GL_OML_subsample
  --#define GL_OML_subsample 1
  --#endif

  --#ifndef GL_OML_resample
  --#define GL_OML_resample 1
  --#endif

  --#ifndef GL_NV_copy_depth_to_color
  --#define GL_NV_copy_depth_to_color 1
  --#endif

  --#ifndef GL_ATI_envmap_bumpmap
  --#define GL_ATI_envmap_bumpmap 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glTexBumpParameterivATI (GLenum, const GLint *);
  --GLAPI void APIENTRY glTexBumpParameterfvATI (GLenum, const GLfloat *);
  --GLAPI void APIENTRY glGetTexBumpParameterivATI (GLenum, GLint *);
  --GLAPI void APIENTRY glGetTexBumpParameterfvATI (GLenum, GLfloat *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLTEXBUMPPARAMETERIVATIPROC) (GLenum pname, const GLint *param);
  --typedef void (APIENTRYP PFNGLTEXBUMPPARAMETERFVATIPROC) (GLenum pname, const GLfloat *param);
  --typedef void (APIENTRYP PFNGLGETTEXBUMPPARAMETERIVATIPROC) (GLenum pname, GLint *param);
  --typedef void (APIENTRYP PFNGLGETTEXBUMPPARAMETERFVATIPROC) (GLenum pname, GLfloat *param);
  --#endif

  --#ifndef GL_ATI_fragment_shader
  --#define GL_ATI_fragment_shader 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI GLuint APIENTRY glGenFragmentShadersATI (GLuint);
  --GLAPI void APIENTRY glBindFragmentShaderATI (GLuint);
  --GLAPI void APIENTRY glDeleteFragmentShaderATI (GLuint);
  --GLAPI void APIENTRY glBeginFragmentShaderATI (void);
  --GLAPI void APIENTRY glEndFragmentShaderATI (void);
  --GLAPI void APIENTRY glPassTexCoordATI (GLuint, GLuint, GLenum);
  --GLAPI void APIENTRY glSampleMapATI (GLuint, GLuint, GLenum);
  --GLAPI void APIENTRY glColorFragmentOp1ATI (GLenum, GLuint, GLuint, GLuint, GLuint, GLuint, GLuint);
  --GLAPI void APIENTRY glColorFragmentOp2ATI (GLenum, GLuint, GLuint, GLuint, GLuint, GLuint, GLuint, GLuint, GLuint, GLuint);
  --GLAPI void APIENTRY glColorFragmentOp3ATI (GLenum, GLuint, GLuint, GLuint, GLuint, GLuint, GLuint, GLuint, GLuint, GLuint, GLuint, GLuint, GLuint);
  --GLAPI void APIENTRY glAlphaFragmentOp1ATI (GLenum, GLuint, GLuint, GLuint, GLuint, GLuint);
  --GLAPI void APIENTRY glAlphaFragmentOp2ATI (GLenum, GLuint, GLuint, GLuint, GLuint, GLuint, GLuint, GLuint, GLuint);
  --GLAPI void APIENTRY glAlphaFragmentOp3ATI (GLenum, GLuint, GLuint, GLuint, GLuint, GLuint, GLuint, GLuint, GLuint, GLuint, GLuint, GLuint);
  --GLAPI void APIENTRY glSetFragmentShaderConstantATI (GLuint, const GLfloat *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef GLuint (APIENTRYP PFNGLGENFRAGMENTSHADERSATIPROC) (GLuint range);
  --typedef void (APIENTRYP PFNGLBINDFRAGMENTSHADERATIPROC) (GLuint id);
  --typedef void (APIENTRYP PFNGLDELETEFRAGMENTSHADERATIPROC) (GLuint id);
  --typedef void (APIENTRYP PFNGLBEGINFRAGMENTSHADERATIPROC) (void);
  --typedef void (APIENTRYP PFNGLENDFRAGMENTSHADERATIPROC) (void);
  --typedef void (APIENTRYP PFNGLPASSTEXCOORDATIPROC) (GLuint dst, GLuint coord, GLenum swizzle);
  --typedef void (APIENTRYP PFNGLSAMPLEMAPATIPROC) (GLuint dst, GLuint interp, GLenum swizzle);
  --typedef void (APIENTRYP PFNGLCOLORFRAGMENTOP1ATIPROC) (GLenum op, GLuint dst, GLuint dstMask, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod);
  --typedef void (APIENTRYP PFNGLCOLORFRAGMENTOP2ATIPROC) (GLenum op, GLuint dst, GLuint dstMask, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod, GLuint arg2, GLuint arg2Rep, GLuint arg2Mod);
  --typedef void (APIENTRYP PFNGLCOLORFRAGMENTOP3ATIPROC) (GLenum op, GLuint dst, GLuint dstMask, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod, GLuint arg2, GLuint arg2Rep, GLuint arg2Mod, GLuint arg3, GLuint arg3Rep, GLuint arg3Mod);
  --typedef void (APIENTRYP PFNGLALPHAFRAGMENTOP1ATIPROC) (GLenum op, GLuint dst, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod);
  --typedef void (APIENTRYP PFNGLALPHAFRAGMENTOP2ATIPROC) (GLenum op, GLuint dst, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod, GLuint arg2, GLuint arg2Rep, GLuint arg2Mod);
  --typedef void (APIENTRYP PFNGLALPHAFRAGMENTOP3ATIPROC) (GLenum op, GLuint dst, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod, GLuint arg2, GLuint arg2Rep, GLuint arg2Mod, GLuint arg3, GLuint arg3Rep, GLuint arg3Mod);
  --typedef void (APIENTRYP PFNGLSETFRAGMENTSHADERCONSTANTATIPROC) (GLuint dst, const GLfloat *value);
  --#endif

  --#ifndef GL_ATI_pn_triangles
  --#define GL_ATI_pn_triangles 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glPNTrianglesiATI (GLenum, GLint);
  --GLAPI void APIENTRY glPNTrianglesfATI (GLenum, GLfloat);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLPNTRIANGLESIATIPROC) (GLenum pname, GLint param);
  --typedef void (APIENTRYP PFNGLPNTRIANGLESFATIPROC) (GLenum pname, GLfloat param);
  --#endif

  --#ifndef GL_ATI_vertex_array_object
  --#define GL_ATI_vertex_array_object 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI GLuint APIENTRY glNewObjectBufferATI (GLsizei, const GLvoid *, GLenum);
  --GLAPI GLboolean APIENTRY glIsObjectBufferATI (GLuint);
  --GLAPI void APIENTRY glUpdateObjectBufferATI (GLuint, GLuint, GLsizei, const GLvoid *, GLenum);
  --GLAPI void APIENTRY glGetObjectBufferfvATI (GLuint, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetObjectBufferivATI (GLuint, GLenum, GLint *);
  --GLAPI void APIENTRY glFreeObjectBufferATI (GLuint);
  --GLAPI void APIENTRY glArrayObjectATI (GLenum, GLint, GLenum, GLsizei, GLuint, GLuint);
  --GLAPI void APIENTRY glGetArrayObjectfvATI (GLenum, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetArrayObjectivATI (GLenum, GLenum, GLint *);
  --GLAPI void APIENTRY glVariantArrayObjectATI (GLuint, GLenum, GLsizei, GLuint, GLuint);
  --GLAPI void APIENTRY glGetVariantArrayObjectfvATI (GLuint, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetVariantArrayObjectivATI (GLuint, GLenum, GLint *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef GLuint (APIENTRYP PFNGLNEWOBJECTBUFFERATIPROC) (GLsizei size, const GLvoid *pointer, GLenum usage);
  --typedef GLboolean (APIENTRYP PFNGLISOBJECTBUFFERATIPROC) (GLuint buffer);
  --typedef void (APIENTRYP PFNGLUPDATEOBJECTBUFFERATIPROC) (GLuint buffer, GLuint offset, GLsizei size, const GLvoid *pointer, GLenum preserve);
  --typedef void (APIENTRYP PFNGLGETOBJECTBUFFERFVATIPROC) (GLuint buffer, GLenum pname, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETOBJECTBUFFERIVATIPROC) (GLuint buffer, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLFREEOBJECTBUFFERATIPROC) (GLuint buffer);
  --typedef void (APIENTRYP PFNGLARRAYOBJECTATIPROC) (GLenum array, GLint size, GLenum type, GLsizei stride, GLuint buffer, GLuint offset);
  --typedef void (APIENTRYP PFNGLGETARRAYOBJECTFVATIPROC) (GLenum array, GLenum pname, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETARRAYOBJECTIVATIPROC) (GLenum array, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLVARIANTARRAYOBJECTATIPROC) (GLuint id, GLenum type, GLsizei stride, GLuint buffer, GLuint offset);
  --typedef void (APIENTRYP PFNGLGETVARIANTARRAYOBJECTFVATIPROC) (GLuint id, GLenum pname, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETVARIANTARRAYOBJECTIVATIPROC) (GLuint id, GLenum pname, GLint *params);
  --#endif

  --#ifndef GL_EXT_vertex_shader
  --#define GL_EXT_vertex_shader 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glBeginVertexShaderEXT (void);
  --GLAPI void APIENTRY glEndVertexShaderEXT (void);
  --GLAPI void APIENTRY glBindVertexShaderEXT (GLuint);
  --GLAPI GLuint APIENTRY glGenVertexShadersEXT (GLuint);
  --GLAPI void APIENTRY glDeleteVertexShaderEXT (GLuint);
  --GLAPI void APIENTRY glShaderOp1EXT (GLenum, GLuint, GLuint);
  --GLAPI void APIENTRY glShaderOp2EXT (GLenum, GLuint, GLuint, GLuint);
  --GLAPI void APIENTRY glShaderOp3EXT (GLenum, GLuint, GLuint, GLuint, GLuint);
  --GLAPI void APIENTRY glSwizzleEXT (GLuint, GLuint, GLenum, GLenum, GLenum, GLenum);
  --GLAPI void APIENTRY glWriteMaskEXT (GLuint, GLuint, GLenum, GLenum, GLenum, GLenum);
  --GLAPI void APIENTRY glInsertComponentEXT (GLuint, GLuint, GLuint);
  --GLAPI void APIENTRY glExtractComponentEXT (GLuint, GLuint, GLuint);
  --GLAPI GLuint APIENTRY glGenSymbolsEXT (GLenum, GLenum, GLenum, GLuint);
  --GLAPI void APIENTRY glSetInvariantEXT (GLuint, GLenum, const GLvoid *);
  --GLAPI void APIENTRY glSetLocalConstantEXT (GLuint, GLenum, const GLvoid *);
  --GLAPI void APIENTRY glVariantbvEXT (GLuint, const GLbyte *);
  --GLAPI void APIENTRY glVariantsvEXT (GLuint, const GLshort *);
  --GLAPI void APIENTRY glVariantivEXT (GLuint, const GLint *);
  --GLAPI void APIENTRY glVariantfvEXT (GLuint, const GLfloat *);
  --GLAPI void APIENTRY glVariantdvEXT (GLuint, const GLdouble *);
  --GLAPI void APIENTRY glVariantubvEXT (GLuint, const GLubyte *);
  --GLAPI void APIENTRY glVariantusvEXT (GLuint, const GLushort *);
  --GLAPI void APIENTRY glVariantuivEXT (GLuint, const GLuint *);
  --GLAPI void APIENTRY glVariantPointerEXT (GLuint, GLenum, GLuint, const GLvoid *);
  --GLAPI void APIENTRY glEnableVariantClientStateEXT (GLuint);
  --GLAPI void APIENTRY glDisableVariantClientStateEXT (GLuint);
  --GLAPI GLuint APIENTRY glBindLightParameterEXT (GLenum, GLenum);
  --GLAPI GLuint APIENTRY glBindMaterialParameterEXT (GLenum, GLenum);
  --GLAPI GLuint APIENTRY glBindTexGenParameterEXT (GLenum, GLenum, GLenum);
  --GLAPI GLuint APIENTRY glBindTextureUnitParameterEXT (GLenum, GLenum);
  --GLAPI GLuint APIENTRY glBindParameterEXT (GLenum);
  --GLAPI GLboolean APIENTRY glIsVariantEnabledEXT (GLuint, GLenum);
  --GLAPI void APIENTRY glGetVariantBooleanvEXT (GLuint, GLenum, GLboolean *);
  --GLAPI void APIENTRY glGetVariantIntegervEXT (GLuint, GLenum, GLint *);
  --GLAPI void APIENTRY glGetVariantFloatvEXT (GLuint, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetVariantPointervEXT (GLuint, GLenum, GLvoid* *);
  --GLAPI void APIENTRY glGetInvariantBooleanvEXT (GLuint, GLenum, GLboolean *);
  --GLAPI void APIENTRY glGetInvariantIntegervEXT (GLuint, GLenum, GLint *);
  --GLAPI void APIENTRY glGetInvariantFloatvEXT (GLuint, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetLocalConstantBooleanvEXT (GLuint, GLenum, GLboolean *);
  --GLAPI void APIENTRY glGetLocalConstantIntegervEXT (GLuint, GLenum, GLint *);
  --GLAPI void APIENTRY glGetLocalConstantFloatvEXT (GLuint, GLenum, GLfloat *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLBEGINVERTEXSHADEREXTPROC) (void);
  --typedef void (APIENTRYP PFNGLENDVERTEXSHADEREXTPROC) (void);
  --typedef void (APIENTRYP PFNGLBINDVERTEXSHADEREXTPROC) (GLuint id);
  --typedef GLuint (APIENTRYP PFNGLGENVERTEXSHADERSEXTPROC) (GLuint range);
  --typedef void (APIENTRYP PFNGLDELETEVERTEXSHADEREXTPROC) (GLuint id);
  --typedef void (APIENTRYP PFNGLSHADEROP1EXTPROC) (GLenum op, GLuint res, GLuint arg1);
  --typedef void (APIENTRYP PFNGLSHADEROP2EXTPROC) (GLenum op, GLuint res, GLuint arg1, GLuint arg2);
  --typedef void (APIENTRYP PFNGLSHADEROP3EXTPROC) (GLenum op, GLuint res, GLuint arg1, GLuint arg2, GLuint arg3);
  --typedef void (APIENTRYP PFNGLSWIZZLEEXTPROC) (GLuint res, GLuint in, GLenum outX, GLenum outY, GLenum outZ, GLenum outW);
  --typedef void (APIENTRYP PFNGLWRITEMASKEXTPROC) (GLuint res, GLuint in, GLenum outX, GLenum outY, GLenum outZ, GLenum outW);
  --typedef void (APIENTRYP PFNGLINSERTCOMPONENTEXTPROC) (GLuint res, GLuint src, GLuint num);
  --typedef void (APIENTRYP PFNGLEXTRACTCOMPONENTEXTPROC) (GLuint res, GLuint src, GLuint num);
  --typedef GLuint (APIENTRYP PFNGLGENSYMBOLSEXTPROC) (GLenum datatype, GLenum storagetype, GLenum range, GLuint components);
  --typedef void (APIENTRYP PFNGLSETINVARIANTEXTPROC) (GLuint id, GLenum type, const GLvoid *addr);
  --typedef void (APIENTRYP PFNGLSETLOCALCONSTANTEXTPROC) (GLuint id, GLenum type, const GLvoid *addr);
  --typedef void (APIENTRYP PFNGLVARIANTBVEXTPROC) (GLuint id, const GLbyte *addr);
  --typedef void (APIENTRYP PFNGLVARIANTSVEXTPROC) (GLuint id, const GLshort *addr);
  --typedef void (APIENTRYP PFNGLVARIANTIVEXTPROC) (GLuint id, const GLint *addr);
  --typedef void (APIENTRYP PFNGLVARIANTFVEXTPROC) (GLuint id, const GLfloat *addr);
  --typedef void (APIENTRYP PFNGLVARIANTDVEXTPROC) (GLuint id, const GLdouble *addr);
  --typedef void (APIENTRYP PFNGLVARIANTUBVEXTPROC) (GLuint id, const GLubyte *addr);
  --typedef void (APIENTRYP PFNGLVARIANTUSVEXTPROC) (GLuint id, const GLushort *addr);
  --typedef void (APIENTRYP PFNGLVARIANTUIVEXTPROC) (GLuint id, const GLuint *addr);
  --typedef void (APIENTRYP PFNGLVARIANTPOINTEREXTPROC) (GLuint id, GLenum type, GLuint stride, const GLvoid *addr);
  --typedef void (APIENTRYP PFNGLENABLEVARIANTCLIENTSTATEEXTPROC) (GLuint id);
  --typedef void (APIENTRYP PFNGLDISABLEVARIANTCLIENTSTATEEXTPROC) (GLuint id);
  --typedef GLuint (APIENTRYP PFNGLBINDLIGHTPARAMETEREXTPROC) (GLenum light, GLenum value);
  --typedef GLuint (APIENTRYP PFNGLBINDMATERIALPARAMETEREXTPROC) (GLenum face, GLenum value);
  --typedef GLuint (APIENTRYP PFNGLBINDTEXGENPARAMETEREXTPROC) (GLenum unit, GLenum coord, GLenum value);
  --typedef GLuint (APIENTRYP PFNGLBINDTEXTUREUNITPARAMETEREXTPROC) (GLenum unit, GLenum value);
  --typedef GLuint (APIENTRYP PFNGLBINDPARAMETEREXTPROC) (GLenum value);
  --typedef GLboolean (APIENTRYP PFNGLISVARIANTENABLEDEXTPROC) (GLuint id, GLenum cap);
  --typedef void (APIENTRYP PFNGLGETVARIANTBOOLEANVEXTPROC) (GLuint id, GLenum value, GLboolean *data);
  --typedef void (APIENTRYP PFNGLGETVARIANTINTEGERVEXTPROC) (GLuint id, GLenum value, GLint *data);
  --typedef void (APIENTRYP PFNGLGETVARIANTFLOATVEXTPROC) (GLuint id, GLenum value, GLfloat *data);
  --typedef void (APIENTRYP PFNGLGETVARIANTPOINTERVEXTPROC) (GLuint id, GLenum value, GLvoid* *data);
  --typedef void (APIENTRYP PFNGLGETINVARIANTBOOLEANVEXTPROC) (GLuint id, GLenum value, GLboolean *data);
  --typedef void (APIENTRYP PFNGLGETINVARIANTINTEGERVEXTPROC) (GLuint id, GLenum value, GLint *data);
  --typedef void (APIENTRYP PFNGLGETINVARIANTFLOATVEXTPROC) (GLuint id, GLenum value, GLfloat *data);
  --typedef void (APIENTRYP PFNGLGETLOCALCONSTANTBOOLEANVEXTPROC) (GLuint id, GLenum value, GLboolean *data);
  --typedef void (APIENTRYP PFNGLGETLOCALCONSTANTINTEGERVEXTPROC) (GLuint id, GLenum value, GLint *data);
  --typedef void (APIENTRYP PFNGLGETLOCALCONSTANTFLOATVEXTPROC) (GLuint id, GLenum value, GLfloat *data);
  --#endif

  --#ifndef GL_ATI_vertex_streams
  --#define GL_ATI_vertex_streams 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glVertexStream1sATI (GLenum, GLshort);
  --GLAPI void APIENTRY glVertexStream1svATI (GLenum, const GLshort *);
  --GLAPI void APIENTRY glVertexStream1iATI (GLenum, GLint);
  --GLAPI void APIENTRY glVertexStream1ivATI (GLenum, const GLint *);
  --GLAPI void APIENTRY glVertexStream1fATI (GLenum, GLfloat);
  --GLAPI void APIENTRY glVertexStream1fvATI (GLenum, const GLfloat *);
  --GLAPI void APIENTRY glVertexStream1dATI (GLenum, GLdouble);
  --GLAPI void APIENTRY glVertexStream1dvATI (GLenum, const GLdouble *);
  --GLAPI void APIENTRY glVertexStream2sATI (GLenum, GLshort, GLshort);
  --GLAPI void APIENTRY glVertexStream2svATI (GLenum, const GLshort *);
  --GLAPI void APIENTRY glVertexStream2iATI (GLenum, GLint, GLint);
  --GLAPI void APIENTRY glVertexStream2ivATI (GLenum, const GLint *);
  --GLAPI void APIENTRY glVertexStream2fATI (GLenum, GLfloat, GLfloat);
  --GLAPI void APIENTRY glVertexStream2fvATI (GLenum, const GLfloat *);
  --GLAPI void APIENTRY glVertexStream2dATI (GLenum, GLdouble, GLdouble);
  --GLAPI void APIENTRY glVertexStream2dvATI (GLenum, const GLdouble *);
  --GLAPI void APIENTRY glVertexStream3sATI (GLenum, GLshort, GLshort, GLshort);
  --GLAPI void APIENTRY glVertexStream3svATI (GLenum, const GLshort *);
  --GLAPI void APIENTRY glVertexStream3iATI (GLenum, GLint, GLint, GLint);
  --GLAPI void APIENTRY glVertexStream3ivATI (GLenum, const GLint *);
  --GLAPI void APIENTRY glVertexStream3fATI (GLenum, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glVertexStream3fvATI (GLenum, const GLfloat *);
  --GLAPI void APIENTRY glVertexStream3dATI (GLenum, GLdouble, GLdouble, GLdouble);
  --GLAPI void APIENTRY glVertexStream3dvATI (GLenum, const GLdouble *);
  --GLAPI void APIENTRY glVertexStream4sATI (GLenum, GLshort, GLshort, GLshort, GLshort);
  --GLAPI void APIENTRY glVertexStream4svATI (GLenum, const GLshort *);
  --GLAPI void APIENTRY glVertexStream4iATI (GLenum, GLint, GLint, GLint, GLint);
  --GLAPI void APIENTRY glVertexStream4ivATI (GLenum, const GLint *);
  --GLAPI void APIENTRY glVertexStream4fATI (GLenum, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glVertexStream4fvATI (GLenum, const GLfloat *);
  --GLAPI void APIENTRY glVertexStream4dATI (GLenum, GLdouble, GLdouble, GLdouble, GLdouble);
  --GLAPI void APIENTRY glVertexStream4dvATI (GLenum, const GLdouble *);
  --GLAPI void APIENTRY glNormalStream3bATI (GLenum, GLbyte, GLbyte, GLbyte);
  --GLAPI void APIENTRY glNormalStream3bvATI (GLenum, const GLbyte *);
  --GLAPI void APIENTRY glNormalStream3sATI (GLenum, GLshort, GLshort, GLshort);
  --GLAPI void APIENTRY glNormalStream3svATI (GLenum, const GLshort *);
  --GLAPI void APIENTRY glNormalStream3iATI (GLenum, GLint, GLint, GLint);
  --GLAPI void APIENTRY glNormalStream3ivATI (GLenum, const GLint *);
  --GLAPI void APIENTRY glNormalStream3fATI (GLenum, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glNormalStream3fvATI (GLenum, const GLfloat *);
  --GLAPI void APIENTRY glNormalStream3dATI (GLenum, GLdouble, GLdouble, GLdouble);
  --GLAPI void APIENTRY glNormalStream3dvATI (GLenum, const GLdouble *);
  --GLAPI void APIENTRY glClientActiveVertexStreamATI (GLenum);
  --GLAPI void APIENTRY glVertexBlendEnviATI (GLenum, GLint);
  --GLAPI void APIENTRY glVertexBlendEnvfATI (GLenum, GLfloat);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM1SATIPROC) (GLenum stream, GLshort x);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM1SVATIPROC) (GLenum stream, const GLshort *coords);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM1IATIPROC) (GLenum stream, GLint x);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM1IVATIPROC) (GLenum stream, const GLint *coords);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM1FATIPROC) (GLenum stream, GLfloat x);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM1FVATIPROC) (GLenum stream, const GLfloat *coords);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM1DATIPROC) (GLenum stream, GLdouble x);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM1DVATIPROC) (GLenum stream, const GLdouble *coords);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM2SATIPROC) (GLenum stream, GLshort x, GLshort y);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM2SVATIPROC) (GLenum stream, const GLshort *coords);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM2IATIPROC) (GLenum stream, GLint x, GLint y);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM2IVATIPROC) (GLenum stream, const GLint *coords);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM2FATIPROC) (GLenum stream, GLfloat x, GLfloat y);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM2FVATIPROC) (GLenum stream, const GLfloat *coords);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM2DATIPROC) (GLenum stream, GLdouble x, GLdouble y);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM2DVATIPROC) (GLenum stream, const GLdouble *coords);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM3SATIPROC) (GLenum stream, GLshort x, GLshort y, GLshort z);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM3SVATIPROC) (GLenum stream, const GLshort *coords);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM3IATIPROC) (GLenum stream, GLint x, GLint y, GLint z);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM3IVATIPROC) (GLenum stream, const GLint *coords);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM3FATIPROC) (GLenum stream, GLfloat x, GLfloat y, GLfloat z);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM3FVATIPROC) (GLenum stream, const GLfloat *coords);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM3DATIPROC) (GLenum stream, GLdouble x, GLdouble y, GLdouble z);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM3DVATIPROC) (GLenum stream, const GLdouble *coords);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM4SATIPROC) (GLenum stream, GLshort x, GLshort y, GLshort z, GLshort w);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM4SVATIPROC) (GLenum stream, const GLshort *coords);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM4IATIPROC) (GLenum stream, GLint x, GLint y, GLint z, GLint w);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM4IVATIPROC) (GLenum stream, const GLint *coords);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM4FATIPROC) (GLenum stream, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM4FVATIPROC) (GLenum stream, const GLfloat *coords);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM4DATIPROC) (GLenum stream, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
  --typedef void (APIENTRYP PFNGLVERTEXSTREAM4DVATIPROC) (GLenum stream, const GLdouble *coords);
  --typedef void (APIENTRYP PFNGLNORMALSTREAM3BATIPROC) (GLenum stream, GLbyte nx, GLbyte ny, GLbyte nz);
  --typedef void (APIENTRYP PFNGLNORMALSTREAM3BVATIPROC) (GLenum stream, const GLbyte *coords);
  --typedef void (APIENTRYP PFNGLNORMALSTREAM3SATIPROC) (GLenum stream, GLshort nx, GLshort ny, GLshort nz);
  --typedef void (APIENTRYP PFNGLNORMALSTREAM3SVATIPROC) (GLenum stream, const GLshort *coords);
  --typedef void (APIENTRYP PFNGLNORMALSTREAM3IATIPROC) (GLenum stream, GLint nx, GLint ny, GLint nz);
  --typedef void (APIENTRYP PFNGLNORMALSTREAM3IVATIPROC) (GLenum stream, const GLint *coords);
  --typedef void (APIENTRYP PFNGLNORMALSTREAM3FATIPROC) (GLenum stream, GLfloat nx, GLfloat ny, GLfloat nz);
  --typedef void (APIENTRYP PFNGLNORMALSTREAM3FVATIPROC) (GLenum stream, const GLfloat *coords);
  --typedef void (APIENTRYP PFNGLNORMALSTREAM3DATIPROC) (GLenum stream, GLdouble nx, GLdouble ny, GLdouble nz);
  --typedef void (APIENTRYP PFNGLNORMALSTREAM3DVATIPROC) (GLenum stream, const GLdouble *coords);
  --typedef void (APIENTRYP PFNGLCLIENTACTIVEVERTEXSTREAMATIPROC) (GLenum stream);
  --typedef void (APIENTRYP PFNGLVERTEXBLENDENVIATIPROC) (GLenum pname, GLint param);
  --typedef void (APIENTRYP PFNGLVERTEXBLENDENVFATIPROC) (GLenum pname, GLfloat param);
  --#endif

  --#ifndef GL_ATI_element_array
  --#define GL_ATI_element_array 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glElementPointerATI (GLenum, const GLvoid *);
  --GLAPI void APIENTRY glDrawElementArrayATI (GLenum, GLsizei);
  --GLAPI void APIENTRY glDrawRangeElementArrayATI (GLenum, GLuint, GLuint, GLsizei);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLELEMENTPOINTERATIPROC) (GLenum type, const GLvoid *pointer);
  --typedef void (APIENTRYP PFNGLDRAWELEMENTARRAYATIPROC) (GLenum mode, GLsizei count);
  --typedef void (APIENTRYP PFNGLDRAWRANGEELEMENTARRAYATIPROC) (GLenum mode, GLuint start, GLuint end, GLsizei count);
  --#endif

  --#ifndef GL_SUN_mesh_array
  --#define GL_SUN_mesh_array 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glDrawMeshArraysSUN (GLenum, GLint, GLsizei, GLsizei);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLDRAWMESHARRAYSSUNPROC) (GLenum mode, GLint first, GLsizei count, GLsizei width);
  --#endif

  --#ifndef GL_SUN_slice_accum
  --#define GL_SUN_slice_accum 1
  --#endif

  --#ifndef GL_NV_multisample_filter_hint
  --#define GL_NV_multisample_filter_hint 1
  --#endif

  --#ifndef GL_NV_depth_clamp
  --#define GL_NV_depth_clamp 1
  --#endif

  --#ifndef GL_NV_occlusion_query
  --#define GL_NV_occlusion_query 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glGenOcclusionQueriesNV (GLsizei, GLuint *);
  --GLAPI void APIENTRY glDeleteOcclusionQueriesNV (GLsizei, const GLuint *);
  --GLAPI GLboolean APIENTRY glIsOcclusionQueryNV (GLuint);
  --GLAPI void APIENTRY glBeginOcclusionQueryNV (GLuint);
  --GLAPI void APIENTRY glEndOcclusionQueryNV (void);
  --GLAPI void APIENTRY glGetOcclusionQueryivNV (GLuint, GLenum, GLint *);
  --GLAPI void APIENTRY glGetOcclusionQueryuivNV (GLuint, GLenum, GLuint *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLGENOCCLUSIONQUERIESNVPROC) (GLsizei n, GLuint *ids);
  --typedef void (APIENTRYP PFNGLDELETEOCCLUSIONQUERIESNVPROC) (GLsizei n, const GLuint *ids);
  --typedef GLboolean (APIENTRYP PFNGLISOCCLUSIONQUERYNVPROC) (GLuint id);
  --typedef void (APIENTRYP PFNGLBEGINOCCLUSIONQUERYNVPROC) (GLuint id);
  --typedef void (APIENTRYP PFNGLENDOCCLUSIONQUERYNVPROC) (void);
  --typedef void (APIENTRYP PFNGLGETOCCLUSIONQUERYIVNVPROC) (GLuint id, GLenum pname, GLint *params);
  --typedef void (APIENTRYP PFNGLGETOCCLUSIONQUERYUIVNVPROC) (GLuint id, GLenum pname, GLuint *params);
  --#endif

  --#ifndef GL_NV_point_sprite
  --#define GL_NV_point_sprite 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glPointParameteriNV (GLenum, GLint);
  --GLAPI void APIENTRY glPointParameterivNV (GLenum, const GLint *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLPOINTPARAMETERINVPROC) (GLenum pname, GLint param);
  --typedef void (APIENTRYP PFNGLPOINTPARAMETERIVNVPROC) (GLenum pname, const GLint *params);
  --#endif

  --#ifndef GL_NV_texture_shader3
  --#define GL_NV_texture_shader3 1
  --#endif

  --#ifndef GL_NV_vertex_program1_1
  --#define GL_NV_vertex_program1_1 1
  --#endif

  --#ifndef GL_EXT_shadow_funcs
  --#define GL_EXT_shadow_funcs 1
  --#endif

  --#ifndef GL_EXT_stencil_two_side
  --#define GL_EXT_stencil_two_side 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glActiveStencilFaceEXT (GLenum);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLACTIVESTENCILFACEEXTPROC) (GLenum face);
  --#endif

  --#ifndef GL_ATI_text_fragment_shader
  --#define GL_ATI_text_fragment_shader 1
  --#endif

  --#ifndef GL_APPLE_client_storage
  --#define GL_APPLE_client_storage 1
  --#endif

  --#ifndef GL_APPLE_element_array
  --#define GL_APPLE_element_array 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glElementPointerAPPLE (GLenum, const GLvoid *);
  --GLAPI void APIENTRY glDrawElementArrayAPPLE (GLenum, GLint, GLsizei);
  --GLAPI void APIENTRY glDrawRangeElementArrayAPPLE (GLenum, GLuint, GLuint, GLint, GLsizei);
  --GLAPI void APIENTRY glMultiDrawElementArrayAPPLE (GLenum, const GLint *, const GLsizei *, GLsizei);
  --GLAPI void APIENTRY glMultiDrawRangeElementArrayAPPLE (GLenum, GLuint, GLuint, const GLint *, const GLsizei *, GLsizei);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLELEMENTPOINTERAPPLEPROC) (GLenum type, const GLvoid *pointer);
  --typedef void (APIENTRYP PFNGLDRAWELEMENTARRAYAPPLEPROC) (GLenum mode, GLint first, GLsizei count);
  --typedef void (APIENTRYP PFNGLDRAWRANGEELEMENTARRAYAPPLEPROC) (GLenum mode, GLuint start, GLuint end, GLint first, GLsizei count);
  --typedef void (APIENTRYP PFNGLMULTIDRAWELEMENTARRAYAPPLEPROC) (GLenum mode, const GLint *first, const GLsizei *count, GLsizei primcount);
  --typedef void (APIENTRYP PFNGLMULTIDRAWRANGEELEMENTARRAYAPPLEPROC) (GLenum mode, GLuint start, GLuint end, const GLint *first, const GLsizei *count, GLsizei primcount);
  --#endif

  --#ifndef GL_APPLE_fence
  --#define GL_APPLE_fence 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glGenFencesAPPLE (GLsizei, GLuint *);
  --GLAPI void APIENTRY glDeleteFencesAPPLE (GLsizei, const GLuint *);
  --GLAPI void APIENTRY glSetFenceAPPLE (GLuint);
  --GLAPI GLboolean APIENTRY glIsFenceAPPLE (GLuint);
  --GLAPI GLboolean APIENTRY glTestFenceAPPLE (GLuint);
  --GLAPI void APIENTRY glFinishFenceAPPLE (GLuint);
  --GLAPI GLboolean APIENTRY glTestObjectAPPLE (GLenum, GLuint);
  --GLAPI void APIENTRY glFinishObjectAPPLE (GLenum, GLint);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLGENFENCESAPPLEPROC) (GLsizei n, GLuint *fences);
  --typedef void (APIENTRYP PFNGLDELETEFENCESAPPLEPROC) (GLsizei n, const GLuint *fences);
  --typedef void (APIENTRYP PFNGLSETFENCEAPPLEPROC) (GLuint fence);
  --typedef GLboolean (APIENTRYP PFNGLISFENCEAPPLEPROC) (GLuint fence);
  --typedef GLboolean (APIENTRYP PFNGLTESTFENCEAPPLEPROC) (GLuint fence);
  --typedef void (APIENTRYP PFNGLFINISHFENCEAPPLEPROC) (GLuint fence);
  --typedef GLboolean (APIENTRYP PFNGLTESTOBJECTAPPLEPROC) (GLenum object, GLuint name);
  --typedef void (APIENTRYP PFNGLFINISHOBJECTAPPLEPROC) (GLenum object, GLint name);
  --#endif

  --#ifndef GL_APPLE_vertex_array_object
  --#define GL_APPLE_vertex_array_object 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glBindVertexArrayAPPLE (GLuint);
  --GLAPI void APIENTRY glDeleteVertexArraysAPPLE (GLsizei, const GLuint *);
  --GLAPI void APIENTRY glGenVertexArraysAPPLE (GLsizei, const GLuint *);
  --GLAPI GLboolean APIENTRY glIsVertexArrayAPPLE (GLuint);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLBINDVERTEXARRAYAPPLEPROC) (GLuint array);
  --typedef void (APIENTRYP PFNGLDELETEVERTEXARRAYSAPPLEPROC) (GLsizei n, const GLuint *arrays);
  --typedef void (APIENTRYP PFNGLGENVERTEXARRAYSAPPLEPROC) (GLsizei n, const GLuint *arrays);
  --typedef GLboolean (APIENTRYP PFNGLISVERTEXARRAYAPPLEPROC) (GLuint array);
  --#endif

  --#ifndef GL_APPLE_vertex_array_range
  --#define GL_APPLE_vertex_array_range 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glVertexArrayRangeAPPLE (GLsizei, GLvoid *);
  --GLAPI void APIENTRY glFlushVertexArrayRangeAPPLE (GLsizei, GLvoid *);
  --GLAPI void APIENTRY glVertexArrayParameteriAPPLE (GLenum, GLint);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLVERTEXARRAYRANGEAPPLEPROC) (GLsizei length, GLvoid *pointer);
  --typedef void (APIENTRYP PFNGLFLUSHVERTEXARRAYRANGEAPPLEPROC) (GLsizei length, GLvoid *pointer);
  --typedef void (APIENTRYP PFNGLVERTEXARRAYPARAMETERIAPPLEPROC) (GLenum pname, GLint param);
  --#endif

  --#ifndef GL_APPLE_ycbcr_422
  --#define GL_APPLE_ycbcr_422 1
  --#endif

  --#ifndef GL_S3_s3tc
  --#define GL_S3_s3tc 1
  --#endif

  --#ifndef GL_ATI_draw_buffers
  --#define GL_ATI_draw_buffers 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glDrawBuffersATI (GLsizei, const GLenum *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLDRAWBUFFERSATIPROC) (GLsizei n, const GLenum *bufs);
  --#endif

  --#ifndef GL_ATI_texture_env_combine3
  --#define GL_ATI_texture_env_combine3 1
  --#endif

  --#ifndef GL_ATI_texture_float
  --#define GL_ATI_texture_float 1
  --#endif

  --#ifndef GL_NV_float_buffer
  --#define GL_NV_float_buffer 1
  --#endif

  --#ifndef GL_NV_fragment_program
  --#define GL_NV_fragment_program 1
  -- Some NV_fragment_program entry points are shared with ARB_vertex_program.
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glProgramNamedParameter4fNV (GLuint, GLsizei, const GLubyte *, GLfloat, GLfloat, GLfloat, GLfloat);
  --GLAPI void APIENTRY glProgramNamedParameter4dNV (GLuint, GLsizei, const GLubyte *, GLdouble, GLdouble, GLdouble, GLdouble);
  --GLAPI void APIENTRY glProgramNamedParameter4fvNV (GLuint, GLsizei, const GLubyte *, const GLfloat *);
  --GLAPI void APIENTRY glProgramNamedParameter4dvNV (GLuint, GLsizei, const GLubyte *, const GLdouble *);
  --GLAPI void APIENTRY glGetProgramNamedParameterfvNV (GLuint, GLsizei, const GLubyte *, GLfloat *);
  --GLAPI void APIENTRY glGetProgramNamedParameterdvNV (GLuint, GLsizei, const GLubyte *, GLdouble *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLPROGRAMNAMEDPARAMETER4FNVPROC) (GLuint id, GLsizei len, const GLubyte *name, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
  --typedef void (APIENTRYP PFNGLPROGRAMNAMEDPARAMETER4DNVPROC) (GLuint id, GLsizei len, const GLubyte *name, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
  --typedef void (APIENTRYP PFNGLPROGRAMNAMEDPARAMETER4FVNVPROC) (GLuint id, GLsizei len, const GLubyte *name, const GLfloat *v);
  --typedef void (APIENTRYP PFNGLPROGRAMNAMEDPARAMETER4DVNVPROC) (GLuint id, GLsizei len, const GLubyte *name, const GLdouble *v);
  --typedef void (APIENTRYP PFNGLGETPROGRAMNAMEDPARAMETERFVNVPROC) (GLuint id, GLsizei len, const GLubyte *name, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETPROGRAMNAMEDPARAMETERDVNVPROC) (GLuint id, GLsizei len, const GLubyte *name, GLdouble *params);
  --#endif

  --#ifndef GL_NV_half_float
  --#define GL_NV_half_float 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glVertex2hNV (GLhalfNV, GLhalfNV);
  --GLAPI void APIENTRY glVertex2hvNV (const GLhalfNV *);
  --GLAPI void APIENTRY glVertex3hNV (GLhalfNV, GLhalfNV, GLhalfNV);
  --GLAPI void APIENTRY glVertex3hvNV (const GLhalfNV *);
  --GLAPI void APIENTRY glVertex4hNV (GLhalfNV, GLhalfNV, GLhalfNV, GLhalfNV);
  --GLAPI void APIENTRY glVertex4hvNV (const GLhalfNV *);
  --GLAPI void APIENTRY glNormal3hNV (GLhalfNV, GLhalfNV, GLhalfNV);
  --GLAPI void APIENTRY glNormal3hvNV (const GLhalfNV *);
  --GLAPI void APIENTRY glColor3hNV (GLhalfNV, GLhalfNV, GLhalfNV);
  --GLAPI void APIENTRY glColor3hvNV (const GLhalfNV *);
  --GLAPI void APIENTRY glColor4hNV (GLhalfNV, GLhalfNV, GLhalfNV, GLhalfNV);
  --GLAPI void APIENTRY glColor4hvNV (const GLhalfNV *);
  --GLAPI void APIENTRY glTexCoord1hNV (GLhalfNV);
  --GLAPI void APIENTRY glTexCoord1hvNV (const GLhalfNV *);
  --GLAPI void APIENTRY glTexCoord2hNV (GLhalfNV, GLhalfNV);
  --GLAPI void APIENTRY glTexCoord2hvNV (const GLhalfNV *);
  --GLAPI void APIENTRY glTexCoord3hNV (GLhalfNV, GLhalfNV, GLhalfNV);
  --GLAPI void APIENTRY glTexCoord3hvNV (const GLhalfNV *);
  --GLAPI void APIENTRY glTexCoord4hNV (GLhalfNV, GLhalfNV, GLhalfNV, GLhalfNV);
  --GLAPI void APIENTRY glTexCoord4hvNV (const GLhalfNV *);
  --GLAPI void APIENTRY glMultiTexCoord1hNV (GLenum, GLhalfNV);
  --GLAPI void APIENTRY glMultiTexCoord1hvNV (GLenum, const GLhalfNV *);
  --GLAPI void APIENTRY glMultiTexCoord2hNV (GLenum, GLhalfNV, GLhalfNV);
  --GLAPI void APIENTRY glMultiTexCoord2hvNV (GLenum, const GLhalfNV *);
  --GLAPI void APIENTRY glMultiTexCoord3hNV (GLenum, GLhalfNV, GLhalfNV, GLhalfNV);
  --GLAPI void APIENTRY glMultiTexCoord3hvNV (GLenum, const GLhalfNV *);
  --GLAPI void APIENTRY glMultiTexCoord4hNV (GLenum, GLhalfNV, GLhalfNV, GLhalfNV, GLhalfNV);
  --GLAPI void APIENTRY glMultiTexCoord4hvNV (GLenum, const GLhalfNV *);
  --GLAPI void APIENTRY glFogCoordhNV (GLhalfNV);
  --GLAPI void APIENTRY glFogCoordhvNV (const GLhalfNV *);
  --GLAPI void APIENTRY glSecondaryColor3hNV (GLhalfNV, GLhalfNV, GLhalfNV);
  --GLAPI void APIENTRY glSecondaryColor3hvNV (const GLhalfNV *);
  --GLAPI void APIENTRY glVertexWeighthNV (GLhalfNV);
  --GLAPI void APIENTRY glVertexWeighthvNV (const GLhalfNV *);
  --GLAPI void APIENTRY glVertexAttrib1hNV (GLuint, GLhalfNV);
  --GLAPI void APIENTRY glVertexAttrib1hvNV (GLuint, const GLhalfNV *);
  --GLAPI void APIENTRY glVertexAttrib2hNV (GLuint, GLhalfNV, GLhalfNV);
  --GLAPI void APIENTRY glVertexAttrib2hvNV (GLuint, const GLhalfNV *);
  --GLAPI void APIENTRY glVertexAttrib3hNV (GLuint, GLhalfNV, GLhalfNV, GLhalfNV);
  --GLAPI void APIENTRY glVertexAttrib3hvNV (GLuint, const GLhalfNV *);
  --GLAPI void APIENTRY glVertexAttrib4hNV (GLuint, GLhalfNV, GLhalfNV, GLhalfNV, GLhalfNV);
  --GLAPI void APIENTRY glVertexAttrib4hvNV (GLuint, const GLhalfNV *);
  --GLAPI void APIENTRY glVertexAttribs1hvNV (GLuint, GLsizei, const GLhalfNV *);
  --GLAPI void APIENTRY glVertexAttribs2hvNV (GLuint, GLsizei, const GLhalfNV *);
  --GLAPI void APIENTRY glVertexAttribs3hvNV (GLuint, GLsizei, const GLhalfNV *);
  --GLAPI void APIENTRY glVertexAttribs4hvNV (GLuint, GLsizei, const GLhalfNV *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLVERTEX2HNVPROC) (GLhalfNV x, GLhalfNV y);
  --typedef void (APIENTRYP PFNGLVERTEX2HVNVPROC) (const GLhalfNV *v);
  --typedef void (APIENTRYP PFNGLVERTEX3HNVPROC) (GLhalfNV x, GLhalfNV y, GLhalfNV z);
  --typedef void (APIENTRYP PFNGLVERTEX3HVNVPROC) (const GLhalfNV *v);
  --typedef void (APIENTRYP PFNGLVERTEX4HNVPROC) (GLhalfNV x, GLhalfNV y, GLhalfNV z, GLhalfNV w);
  --typedef void (APIENTRYP PFNGLVERTEX4HVNVPROC) (const GLhalfNV *v);
  --typedef void (APIENTRYP PFNGLNORMAL3HNVPROC) (GLhalfNV nx, GLhalfNV ny, GLhalfNV nz);
  --typedef void (APIENTRYP PFNGLNORMAL3HVNVPROC) (const GLhalfNV *v);
  --typedef void (APIENTRYP PFNGLCOLOR3HNVPROC) (GLhalfNV red, GLhalfNV green, GLhalfNV blue);
  --typedef void (APIENTRYP PFNGLCOLOR3HVNVPROC) (const GLhalfNV *v);
  --typedef void (APIENTRYP PFNGLCOLOR4HNVPROC) (GLhalfNV red, GLhalfNV green, GLhalfNV blue, GLhalfNV alpha);
  --typedef void (APIENTRYP PFNGLCOLOR4HVNVPROC) (const GLhalfNV *v);
  --typedef void (APIENTRYP PFNGLTEXCOORD1HNVPROC) (GLhalfNV s);
  --typedef void (APIENTRYP PFNGLTEXCOORD1HVNVPROC) (const GLhalfNV *v);
  --typedef void (APIENTRYP PFNGLTEXCOORD2HNVPROC) (GLhalfNV s, GLhalfNV t);
  --typedef void (APIENTRYP PFNGLTEXCOORD2HVNVPROC) (const GLhalfNV *v);
  --typedef void (APIENTRYP PFNGLTEXCOORD3HNVPROC) (GLhalfNV s, GLhalfNV t, GLhalfNV r);
  --typedef void (APIENTRYP PFNGLTEXCOORD3HVNVPROC) (const GLhalfNV *v);
  --typedef void (APIENTRYP PFNGLTEXCOORD4HNVPROC) (GLhalfNV s, GLhalfNV t, GLhalfNV r, GLhalfNV q);
  --typedef void (APIENTRYP PFNGLTEXCOORD4HVNVPROC) (const GLhalfNV *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD1HNVPROC) (GLenum target, GLhalfNV s);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD1HVNVPROC) (GLenum target, const GLhalfNV *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD2HNVPROC) (GLenum target, GLhalfNV s, GLhalfNV t);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD2HVNVPROC) (GLenum target, const GLhalfNV *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD3HNVPROC) (GLenum target, GLhalfNV s, GLhalfNV t, GLhalfNV r);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD3HVNVPROC) (GLenum target, const GLhalfNV *v);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD4HNVPROC) (GLenum target, GLhalfNV s, GLhalfNV t, GLhalfNV r, GLhalfNV q);
  --typedef void (APIENTRYP PFNGLMULTITEXCOORD4HVNVPROC) (GLenum target, const GLhalfNV *v);
  --typedef void (APIENTRYP PFNGLFOGCOORDHNVPROC) (GLhalfNV fog);
  --typedef void (APIENTRYP PFNGLFOGCOORDHVNVPROC) (const GLhalfNV *fog);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3HNVPROC) (GLhalfNV red, GLhalfNV green, GLhalfNV blue);
  --typedef void (APIENTRYP PFNGLSECONDARYCOLOR3HVNVPROC) (const GLhalfNV *v);
  --typedef void (APIENTRYP PFNGLVERTEXWEIGHTHNVPROC) (GLhalfNV weight);
  --typedef void (APIENTRYP PFNGLVERTEXWEIGHTHVNVPROC) (const GLhalfNV *weight);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB1HNVPROC) (GLuint index, GLhalfNV x);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB1HVNVPROC) (GLuint index, const GLhalfNV *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB2HNVPROC) (GLuint index, GLhalfNV x, GLhalfNV y);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB2HVNVPROC) (GLuint index, const GLhalfNV *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB3HNVPROC) (GLuint index, GLhalfNV x, GLhalfNV y, GLhalfNV z);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB3HVNVPROC) (GLuint index, const GLhalfNV *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4HNVPROC) (GLuint index, GLhalfNV x, GLhalfNV y, GLhalfNV z, GLhalfNV w);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIB4HVNVPROC) (GLuint index, const GLhalfNV *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIBS1HVNVPROC) (GLuint index, GLsizei n, const GLhalfNV *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIBS2HVNVPROC) (GLuint index, GLsizei n, const GLhalfNV *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIBS3HVNVPROC) (GLuint index, GLsizei n, const GLhalfNV *v);
  --typedef void (APIENTRYP PFNGLVERTEXATTRIBS4HVNVPROC) (GLuint index, GLsizei n, const GLhalfNV *v);
  --#endif

  --#ifndef GL_NV_pixel_data_range
  --#define GL_NV_pixel_data_range 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glPixelDataRangeNV (GLenum, GLsizei, GLvoid *);
  --GLAPI void APIENTRY glFlushPixelDataRangeNV (GLenum);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLPIXELDATARANGENVPROC) (GLenum target, GLsizei length, GLvoid *pointer);
  --typedef void (APIENTRYP PFNGLFLUSHPIXELDATARANGENVPROC) (GLenum target);
  --#endif

  --#ifndef GL_NV_primitive_restart
  --#define GL_NV_primitive_restart 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glPrimitiveRestartNV (void);
  --GLAPI void APIENTRY glPrimitiveRestartIndexNV (GLuint);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLPRIMITIVERESTARTNVPROC) (void);
  --typedef void (APIENTRYP PFNGLPRIMITIVERESTARTINDEXNVPROC) (GLuint index);
  --#endif

  --#ifndef GL_NV_texture_expand_normal
  --#define GL_NV_texture_expand_normal 1
  --#endif

  --#ifndef GL_NV_vertex_program2
  --#define GL_NV_vertex_program2 1
  --#endif

  --#ifndef GL_ATI_map_object_buffer
  --#define GL_ATI_map_object_buffer 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI GLvoid* APIENTRY glMapObjectBufferATI (GLuint);
  --GLAPI void APIENTRY glUnmapObjectBufferATI (GLuint);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef GLvoid* (APIENTRYP PFNGLMAPOBJECTBUFFERATIPROC) (GLuint buffer);
  --typedef void (APIENTRYP PFNGLUNMAPOBJECTBUFFERATIPROC) (GLuint buffer);
  --#endif

  --#ifndef GL_ATI_separate_stencil
  --#define GL_ATI_separate_stencil 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glStencilOpSeparateATI (GLenum, GLenum, GLenum, GLenum);
  --GLAPI void APIENTRY glStencilFuncSeparateATI (GLenum, GLenum, GLint, GLuint);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLSTENCILOPSEPARATEATIPROC) (GLenum face, GLenum sfail, GLenum dpfail, GLenum dppass);
  --typedef void (APIENTRYP PFNGLSTENCILFUNCSEPARATEATIPROC) (GLenum frontfunc, GLenum backfunc, GLint ref, GLuint mask);
  --#endif

  --#ifndef GL_ATI_vertex_attrib_array_object
  --#define GL_ATI_vertex_attrib_array_object 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glVertexAttribArrayObjectATI (GLuint, GLint, GLenum, GLboolean, GLsizei, GLuint, GLuint);
  --GLAPI void APIENTRY glGetVertexAttribArrayObjectfvATI (GLuint, GLenum, GLfloat *);
  --GLAPI void APIENTRY glGetVertexAttribArrayObjectivATI (GLuint, GLenum, GLint *);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLVERTEXATTRIBARRAYOBJECTATIPROC) (GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, GLuint buffer, GLuint offset);
  --typedef void (APIENTRYP PFNGLGETVERTEXATTRIBARRAYOBJECTFVATIPROC) (GLuint index, GLenum pname, GLfloat *params);
  --typedef void (APIENTRYP PFNGLGETVERTEXATTRIBARRAYOBJECTIVATIPROC) (GLuint index, GLenum pname, GLint *params);
  --#endif

  --#ifndef GL_EXT_depth_bounds_test
  --#define GL_EXT_depth_bounds_test 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glDepthBoundsEXT (GLclampd, GLclampd);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLDEPTHBOUNDSEXTPROC) (GLclampd zmin, GLclampd zmax);
  --#endif

  --#ifndef GL_EXT_texture_mirror_clamp
  --#define GL_EXT_texture_mirror_clamp 1
  --#endif

  --#ifndef GL_EXT_blend_equation_separate
  --#define GL_EXT_blend_equation_separate 1
  --#ifdef GL_GLEXT_PROTOTYPES
  --GLAPI void APIENTRY glBlendEquationSeparateEXT (GLenum, GLenum);
  --#endif /* GL_GLEXT_PROTOTYPES */
  --typedef void (APIENTRYP PFNGLBLENDEQUATIONSEPARATEEXTPROC) (GLenum modeRGB, GLenum modeAlpha);
  --#endif

  --#ifndef GL_MESA_pack_invert
  --#define GL_MESA_pack_invert 1
  --#endif

  --#ifndef GL_MESA_ycbcr_texture
  --#define GL_MESA_ycbcr_texture 1
  --#endif

  --#ifndef GL_EXT_pixel_buffer_object
  --#define GL_EXT_pixel_buffer_object 1
  --#endif

  --#ifndef GL_NV_fragment_program_option
  --#define GL_NV_fragment_program_option 1
  --#endif

  --#ifndef GL_NV_fragment_program2
  --#define GL_NV_fragment_program2 1
  --#endif

  --#ifndef GL_NV_vertex_program2_option
  --#define GL_NV_vertex_program2_option 1
  --#endif

  --#ifndef GL_NV_vertex_program3
  --#define GL_NV_vertex_program3 1
  --#endif

end GL.EXT;
