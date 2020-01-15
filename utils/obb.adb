---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;
with GL;

use type GL.GLfloat;

package body OBB is

  function Create return Object is
  
    Result : Object;
    
  begin
  
    Empty(Result);
    
    return Result;
    
  end Create;
  
  
  procedure Empty(Self : in out Object) is
  
  begin
  
    Self.Min := Vector3.Object'(Float'Last, Float'Last, Float'Last);
    Self.Max := Vector3.Object'(Float'First, Float'First, Float'First);
    
  end Empty;
  
  
  procedure Add(Self : in out Object; Vertex : in Vector3.Object) is
  
  begin
  
    if Vertex.X < Self.Min.X then
    
      Self.Min.X := Vertex.X;
      
    end if;
    
    if Vertex.Y < Self.Min.Y then
    
      Self.Min.Y := Vertex.Y;
      
    end if;
    
    if Vertex.Z < Self.Min.Z then
    
      Self.Min.Z := Vertex.Z;
      
    end if;
    
    if Vertex.X > Self.Max.X then
    
      Self.Max.X := Vertex.X;
      
    end if;
    
    if Vertex.Y > Self.Max.Y then
    
      Self.Max.Y := Vertex.Y;
      
    end if;
    
    if Vertex.Z > Self.Max.Z then
    
      Self.Max.Z := Vertex.Z;
      
    end if;
    
  end Add;
  

  procedure Render(Self : in Object) is
  
    subtype ColourRange is Integer range 1 .. 4;

    function GLint_To_GLenum is new Ada.Unchecked_Conversion(Source => GL.GLint, Target => GL.GLenum);
    
    type GLintArray is array (0 .. 1) of GL.GLint;
    type GLintArray_Ptr is access all GLintArray;

    function GLintArray_Ptr_To_GLintPtr is new Ada.Unchecked_Conversion(Source => GLintArray_Ptr, Target => GL.GLintPtr);
    
    Old_Polygon_Mode     : aliased GLintArray;
    Old_Polygon_Mode_Ptr : GLintArray_Ptr := Old_Polygon_Mode'Unchecked_Access;
    
  begin

    -- Get the polygon mode.
    GL.glGetIntegerv(GL.GL_POLYGON_MODE, GLintArray_Ptr_To_GLintPtr(Old_Polygon_Mode_Ptr));
    
    GL.glPolygonMode(GL.GL_FRONT_AND_BACK, GL.GL_LINE);
    
    GL.glDisable(GL.GL_LIGHTING);
    GL.glColor3f(0.0, 0.0, 1.0);
    
    GL.glBegin(GL.GL_QUADS);
    
      -- Back.
      GL.glVertex3f(GL.GLfloat(Self.Min.X), GL.GLfloat(Self.Min.Y), GL.GLfloat(Self.Min.Z));
      GL.glVertex3f(GL.GLfloat(Self.Max.X), GL.GLfloat(Self.Min.Y), GL.GLfloat(Self.Min.Z));
      GL.glVertex3f(GL.GLfloat(Self.Max.X), GL.GLfloat(Self.Max.Y), GL.GLfloat(Self.Min.Z));
      GL.glVertex3f(GL.GLfloat(Self.Min.X), GL.GLfloat(Self.Max.Y), GL.GLfloat(Self.Min.Z));

      -- Front.
      GL.glVertex3f(GL.GLfloat(Self.Min.X), GL.GLfloat(Self.Min.Y), GL.GLfloat(Self.Max.Z));
      GL.glVertex3f(GL.GLfloat(Self.Max.X), GL.GLfloat(Self.Min.Y), GL.GLfloat(Self.Max.Z));
      GL.glVertex3f(GL.GLfloat(Self.Max.X), GL.GLfloat(Self.Max.Y), GL.GLfloat(Self.Max.Z));
      GL.glVertex3f(GL.GLfloat(Self.Min.X), GL.GLfloat(Self.Max.Y), GL.GLfloat(Self.Max.Z));

      -- Left.
      GL.glVertex3f(GL.GLfloat(Self.Min.X), GL.GLfloat(Self.Min.Y), GL.GLfloat(Self.Max.Z));
      GL.glVertex3f(GL.GLfloat(Self.Min.X), GL.GLfloat(Self.Max.Y), GL.GLfloat(Self.Max.Z));
      GL.glVertex3f(GL.GLfloat(Self.Min.X), GL.GLfloat(Self.Max.Y), GL.GLfloat(Self.Min.Z));
      GL.glVertex3f(GL.GLfloat(Self.Min.X), GL.GLfloat(Self.Min.Y), GL.GLfloat(Self.Min.Z));

      -- Right.
      GL.glVertex3f(GL.GLfloat(Self.Max.X), GL.GLfloat(Self.Min.Y), GL.GLfloat(Self.Max.Z));
      GL.glVertex3f(GL.GLfloat(Self.Max.X), GL.GLfloat(Self.Max.Y), GL.GLfloat(Self.Max.Z));
      GL.glVertex3f(GL.GLfloat(Self.Max.X), GL.GLfloat(Self.Max.Y), GL.GLfloat(Self.Min.Z));
      GL.glVertex3f(GL.GLfloat(Self.Max.X), GL.GLfloat(Self.Min.Y), GL.GLfloat(Self.Min.Z));

      -- Top.
      GL.glVertex3f(GL.GLfloat(Self.Min.X), GL.GLfloat(Self.Max.Y), GL.GLfloat(Self.Max.Z));
      GL.glVertex3f(GL.GLfloat(Self.Min.X), GL.GLfloat(Self.Max.Y), GL.GLfloat(Self.Min.Z));
      GL.glVertex3f(GL.GLfloat(Self.Max.X), GL.GLfloat(Self.Max.Y), GL.GLfloat(Self.Min.Z));
      GL.glVertex3f(GL.GLfloat(Self.Max.X), GL.GLfloat(Self.Max.Y), GL.GLfloat(Self.Max.Z));

      -- Bottom.
      GL.glVertex3f(GL.GLfloat(Self.Min.X), GL.GLfloat(Self.Min.Y), GL.GLfloat(Self.Max.Z));
      GL.glVertex3f(GL.GLfloat(Self.Min.X), GL.GLfloat(Self.Min.Y), GL.GLfloat(Self.Min.Z));
      GL.glVertex3f(GL.GLfloat(Self.Max.X), GL.GLfloat(Self.Min.Y), GL.GLfloat(Self.Min.Z));
      GL.glVertex3f(GL.GLfloat(Self.Max.X), GL.GLfloat(Self.Min.Y), GL.GLfloat(Self.Max.Z));
      
    GL.glEnd;
    
    -- Restore the polygon mode.
    GL.glPolygonMode(GL.GL_FRONT, GLint_To_GLenum(Old_Polygon_Mode(0)));
    GL.glPolygonMode(GL.GL_BACK, GLint_To_GLenum(Old_Polygon_Mode(1)));
    GL.glEnable(GL.GL_LIGHTING);
    
  end Render;
  
end OBB;
