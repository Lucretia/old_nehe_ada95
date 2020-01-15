
--  ---------------------------------------------------------------- --
--  This file contains some improvements to the gl Ada binding       --
--  in order to allow a better programming style.                    --
--  The prototypes below follow the Implementation advice from       --
--  ARM Annex B (B.3).                                               --
--  ---------------------------------------------------------------- --

-- ----------------------------------------------------------------- --
--                Copyright (C) 2001 A.M.F.Vargas                    --
--                Antonio M. F. Vargas                               --
--                Ponta Delgada - Azores - Portugal                  --
--                http://www.adapower.net/~avargas                   --
--                E-mail: avargas@adapower.net                       --
-- ----------------------------------------------------------------- --
--                                                                   --
-- This library is free software; you can redistribute it and/or     --
-- modify it under the terms of the GNU General Public               --
-- License as published by the Free Software Foundation; either      --
-- version 2 of the License, or (at your option) any later version.  --
--                                                                   --
-- This library is distributed in the hope that it will be useful,   --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of    --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU --
-- General Public License for more details.                          --
--                                                                   --
-- You should have received a copy of the GNU General Public         --
-- License along with this library; if not, write to the             --
-- Free Software Foundation, Inc., 59 Temple Place - Suite 330,      --
-- Boston, MA 02111-1307, USA.                                       --
--                                                                   --
-- As a special exception, if other files instantiate generics from  --
-- this unit, or you link this unit with other files to produce an   --
-- executable, this  unit  does not  by itself cause  the resulting  --
-- executable to be covered by the GNU General Public License. This  --
-- exception does not however invalidate any other reasons why the   --
-- executable file  might be covered by the  GNU Public License.     --
-- ----------------------------------------------------------------- --

with gl_h; use gl_h;

package AdaGL is
   
   function glGetString (Chars_Ref : GLenum) return String;
   
   type Three_GLfloat_Vector is array (0 .. 2) of GLfloat;
   pragma Convention (C, Three_GLFloat_Vector);
   
   type Four_GLfloat_Vector is array (0 .. 3) of GLfloat;
   pragma Convention (C, Four_GLFloat_Vector);
   
   type Three_GLint_Vector is array (0 .. 2) of GLint;
   pragma Convention (C, Three_GLint_Vector);
   
   type Four_GLint_Vector is array (0 .. 3) of GLint;
   pragma Convention (C, Four_GLint_Vector);
   
   procedure glVertex3fv (v : Three_GLFloat_Vector);
   pragma Import (Stdcall, glVertex3fv, "glVertex3fv"); 
  
   procedure glColor3fv (v : Three_GLFloat_Vector);
   pragma Import (Stdcall, glColor3fv, "glColor3fv");


   --  To be used with pname receiving one of:
   --      GL_AMBIENT, GL_DIFFUSE, GL_SPECULAR, GL_POSITION
   procedure glLightfv (light  : GLenum;
                        pname  : GLenum;
                        params : Three_GLFloat_Vector);

   -- To be used with pname receiving GL_SPOT_DIRECTION:
   procedure glLightfv (light  : GLenum;
                        pname  : GLenum;
                        params : Four_GLFloat_Vector);

   -- To be used with pname receiving:
   --    GL_SPOT_EXPONENT, GL_SPOT_CUTOFF, GL_CONSTANT_ATTENUATION,
   --    GL_LINEAR_ATTENUATION, GL_QUADRATIC_ATTENUATION
   procedure glLightfv (light  : GLenum;
                        pname  : GLenum;
                        params : in out GLFloat); -- pseudo in

   pragma Import (Stdcall, glLightfv, "glLightfv");

   --  To be used with pname receiving one of:
   --      GL_AMBIENT, GL_DIFFUSE, GL_SPECULAR, GL_POSITION
   procedure glLightiv (light  : GLenum;
                        pname  : GLenum;
                        params : Three_GLint_Vector);

   -- To be used with pname receiving GL_SPOT_DIRECTION:
   procedure glLightiv (light  : GLenum;
                        pname  : GLenum;
                        params : Four_GLint_Vector);

   -- To be used with pname receiving:
   --    GL_SPOT_EXPONENT, GL_SPOT_CUTOFF, GL_CONSTANT_ATTENUATION,
   --    GL_LINEAR_ATTENUATION, GL_QUADRATIC_ATTENUATION
   procedure glLightiv (light  : GLenum;
                        pname  : GLenum;
                        params : in out GLint); -- pseudo in
   pragma Import (Stdcall, glLightiv, "glLightiv");

   -- To be used with pname receiving:
   --  GL_AMBIENT, GL_DIFFUSE, GL_SPECULAR, GL_EMISSION
   --  GL_AMBIENT_AND_DIFFUSE
   procedure glMaterialfv (face   : GLenum;
                           pname  : GLenum;
                           params : Four_GLfloat_Vector);
                           
   -- To be used with pname receiving:
   --  GL_COLOR_INDEXES
   procedure glMaterialfv (face   : GLenum;
                           pname  : GLenum;
                           params : Three_GLfloat_Vector);

   -- To be used with pname receiving:
   --  GL_SHININESS
   procedure glMaterialfv (face   : GLenum;
                           pname  : GLenum;
                           params : in out GLfloat); -- pseudo in

   pragma Import (Stdcall, glMaterialfv, "glMaterialfv");
   
   -- To be used with pname receiving:
   --  GL_AMBIENT, GL_DIFFUSE, GL_SPECULAR, GL_EMISSION
   --  GL_AMBIENT_AND_DIFFUSE
   procedure glMaterialiv (face   : GLenum;
                           pname  : GLenum;
                           params : Four_GLint_Vector);
                           
   -- To be used with pname receiving:
   --  GL_COLOR_INDEXES
   procedure glMaterialiv (face   : GLenum;
                           pname  : GLenum;
                           params : Three_GLint_Vector);

   -- To be used with pname receiving:
   --  GL_SHININESS
   procedure glMaterialiv (face   : GLenum;
                           pname  : GLenum;
                           params : in out GLint); -- pseudo in

   pragma Import (Stdcall, glMaterialiv, "glMaterialiv");

   type GLubyte_Array is array (Integer range <>) of GLubyte;

   --  type_Id = GL_UNSIGNED_BYTE
   procedure glTexImage1D (target         : GLenum;
                           level          : GLint;
                           internalFormat : GLint;
                           width          : GLsizei;
                           border         : GLint;
                           format         : GLenum;
                           type_Id        : GLenum;
                           pixels         : GLubyte_Array);
   
   type GLbyte_Array is array (Integer range <>) of GLbyte;
   
   --  type_Id = GL_BYTE
   procedure glTexImage1D (target         : GLenum;
                           level          : GLint;
                           internalFormat : GLint;
                           width          : GLsizei;
                           border         : GLint;
                           format         : GLenum;
                           type_Id        : GLenum;
                           pixels         : GLbyte_Array);
   
   type GLushort_Array is array (Integer range <>) of GLushort;
   
   --  type_Id = GL_UNSIGNED_SHORT
   procedure glTexImage1D (target         : GLenum;
                           level          : GLint;
                           internalFormat : GLint;
                           width          : GLsizei;
                           border         : GLint;
                           format         : GLenum;
                           type_Id        : GLenum;
                           pixels         : GLushort_Array);

   type GLshort_Array is array (Integer range <>) of GLshort;
   
   --  type_Id = GL_SHORT
   procedure glTexImage1D (target         : GLenum;
                           level          : GLint;
                           internalFormat : GLint;
                           width          : GLsizei;
                           border         : GLint;
                           format         : GLenum;
                           type_Id        : GLenum;
                           pixels         : GLshort_Array);

   type GLuint_Array is array (Integer range <>) of GLuint;
   
   --  type_Id = GL_UNSIGNED_INT
   procedure glTexImage1D (target         : GLenum;
                           level          : GLint;
                           internalFormat : GLint;
                           width          : GLsizei;
                           border         : GLint;
                           format         : GLenum;
                           type_Id        : GLenum;
                           pixels         : GLuint_Array);

   type GLint_Array is array (Integer range <>) of GLint;
   
   --  type_Id = GL_INT;
   procedure glTexImage1D (target         : GLenum;
                           level          : GLint;
                           internalFormat : GLint;
                           width          : GLsizei;
                           border         : GLint;
                           format         : GLenum;
                           type_Id        : GLenum;
                           pixels         : GLint_Array);

   type GLfloat_Array is array (Integer range <>) of GLfloat;
  
   --  type_Id = GL_FLOAT
   procedure glTexImage1D (target         : GLenum;
                           level          : GLint;
                           internalFormat : GLint;
                           width          : GLsizei;
                           border         : GLint;
                           format         : GLenum;
                           type_Id        : GLenum;
                           pixels         : GLfloat_Array);

   pragma Import (Stdcall, glTexImage1D, "glTexImage1D");
 
   --  type_Id = GL_UNSIGNED_BYTE
   procedure glTexImage2D (target         : GLenum;
                           level          : GLint;
                           internalFormat : GLint;
                           width          : GLsizei;
                           height         : GLsizei;
                           border         : GLint;
                           format         : GLenum;
                           type_Id        : GLenum;
                           pixels         : GLubyte_Array);
   
   --  type_Id = GL_BYTE
   procedure glTexImage2D (target         : GLenum;
                           level          : GLint;
                           internalFormat : GLint;
                           width          : GLsizei;
                           height         : GLsizei;
                           border         : GLint;
                           format         : GLenum;
                           type_Id        : GLenum;
                           pixels         : GLbyte_Array);
   
   --  type_Id = GL_UNSIGNED_SHORT
   procedure glTexImage2D (target         : GLenum;
                           level          : GLint;
                           internalFormat : GLint;
                           width          : GLsizei;
                           height         : GLsizei;
                           border         : GLint;
                           format         : GLenum;
                           type_Id        : GLenum;
                           pixels         : GLushort_Array);

   --  type_Id = GL_SHORT
   procedure glTexImage2D (target         : GLenum;
                           level          : GLint;
                           internalFormat : GLint;
                           width          : GLsizei;
                           height         : GLsizei;
                           border         : GLint;
                           format         : GLenum;
                           type_Id        : GLenum;
                           pixels         : GLshort_Array);

   --  type_Id = GL_UNSIGNED_INT
   procedure glTexImage2D (target         : GLenum;
                           level          : GLint;
                           internalFormat : GLint;
                           width          : GLsizei;
                           height         : GLsizei;
                           border         : GLint;
                           format         : GLenum;
                           type_Id        : GLenum;
                           pixels         : GLuint_Array);

                           
   --  type_Id = GL_INT
   procedure glTexImage2D (target         : GLenum;
                           level          : GLint;
                           internalFormat : GLint;
                           width          : GLsizei;
                           height         : GLsizei;
                           border         : GLint;
                           format         : GLenum;
                           type_Id        : GLenum;
                           pixels         : GLint_Array);
                           
   --  type_Id = GL_FLOAT
   procedure glTexImage2D (target         : GLenum;
                           level          : GLint;
                           internalFormat : GLint;
                           width          : GLsizei;
                           height         : GLsizei;
                           border         : GLint;
                           format         : GLenum;
                           type_Id        : GLenum;
                           pixels         : GLfloat_Array);
                           
   pragma Import (Stdcall, glTexImage2D, "glTexImage2D");
   
   --  type_Id = GL_UNSIGNED_BYTE
   procedure glDrawPixels (width   : GLsizei;
                           height  : GLsizei;
                           format  : GLenum;
                           type_Id : GLenum;
                           pixels  : GLubyte_Array);

   --  type_Id = GL_BYTE
   procedure glDrawPixels (width   : GLsizei;
                           height  : GLsizei;
                           format  : GLenum;
                           type_Id : GLenum;
                           pixels  : GLbyte_Array);
			   
   --  type_Id = GL_UNSIGNED_SHORT
   procedure glDrawPixels (width   : GLsizei;
                           height  : GLsizei;
                           format  : GLenum;
                           type_Id : GLenum;
                           pixels  : GLushort_Array);
			   
   --  type_Id = GL_SHORT
   procedure glDrawPixels (width   : GLsizei;
                           height  : GLsizei;
                           format  : GLenum;
                           type_Id : GLenum;
                           pixels  : GLshort_Array);
			   
   --  type_Id = GL_UNSIGNED_INT
   procedure glDrawPixels (width   : GLsizei;
                           height  : GLsizei;
                           format  : GLenum;
                           type_Id : GLenum;
                           pixels  : GLuint_Array);
			   
   --  type_Id = GL_INT
   procedure glDrawPixels (width   : GLsizei;
                           height  : GLsizei;
                           format  : GLenum;
                           type_Id : GLenum;
                           pixels  : GLint_Array);
			   
   --  type_Id = GL_FLOAT
   procedure glDrawPixels (width   : GLsizei;
                           height  : GLsizei;
                           format  : GLenum;
                           type_Id : GLenum;
                           pixels  : GLfloat_Array);
			   
   pragma Import (Stdcall, glDrawPixels, "glDrawPixels");

end AdaGL;
