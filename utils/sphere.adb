---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
with Ada.Numerics;
with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Unchecked_Conversion;
with GL;

package body Sphere is

  package Trig is new Ada.Numerics.Generic_Elementary_Functions(Float);

  procedure Render(Self : in Object) is
  
    function GLint_To_GLenum is new Ada.Unchecked_Conversion(Source => GL.GLint, Target => GL.GLenum);
    
    type GLintArray is array (0 .. 1) of GL.GLint;
    type GLintArray_Ptr is access all GLintArray;

    function GLintArray_Ptr_To_GLintPtr is new Ada.Unchecked_Conversion(Source => GLintArray_Ptr, Target => GL.GLintPtr);
    
    TOTAL_SECTIONS       : constant := 20;
    ANGLE_DELTA          : Float := (2.0 * Ada.Numerics.PI) / Float(TOTAL_SECTIONS);
    Old_Polygon_Mode     : aliased GLintArray;
    Old_Polygon_Mode_Ptr : GLintArray_Ptr := Old_Polygon_Mode'Unchecked_Access;
    Angle                : Float := 0.0;
    
  begin

    -- Get the polygon mode.
    GL.glGetIntegerv(GL.GL_POLYGON_MODE, GLintArray_Ptr_To_GLintPtr(Old_Polygon_Mode_Ptr));
    
    GL.glPolygonMode(GL.GL_FRONT_AND_BACK, GL.GL_LINE);
    
    GL.glDisable(GL.GL_LIGHTING);
    GL.glColor3f(1.0, 1.0, 0.0);
    
    -- Draw the circle in the XY plane.
    GL.glBegin(GL.GL_LINE_STRIP);
    
      for Section in 1 .. TOTAL_SECTIONS + 1 loop
      
        Angle := Float(Section) * ANGLE_DELTA;
      
        GL.glVertex3f(GL.GLfloat(Self.Radius * Trig.Cos(Angle)), GL.GLfloat(Self.Radius * Trig.Sin(Angle)), 0.0);
      
      end loop;
      
    GL.glEnd;
    
    -- Draw the circle in the XZ plane.
    GL.glBegin(GL.GL_LINE_STRIP);
    
      for Section in 1 .. TOTAL_SECTIONS + 1 loop
      
        Angle := Float(Section) * ANGLE_DELTA;
      
        GL.glVertex3f(GL.GLfloat(Self.Radius * Trig.Cos(Angle)), 0.0, GL.GLfloat(Self.Radius * Trig.Sin(Angle)));
      
      end loop;
      
    GL.glEnd;
    
    -- Draw the circle in the YZ plane.
    GL.glBegin(GL.GL_LINE_STRIP);
    
      for Section in 1 .. TOTAL_SECTIONS + 1 loop
      
        Angle := Float(Section) * ANGLE_DELTA;
      
        GL.glVertex3f(0.0, GL.GLfloat(Self.Radius * Trig.Cos(Angle)), GL.GLfloat(Self.Radius * Trig.Sin(Angle)));
      
      end loop;
      
    GL.glEnd;
    
    -- Restore the polygon mode.
    GL.glPolygonMode(GL.GL_FRONT, GLint_To_GLenum(Old_Polygon_Mode(0)));
    GL.glPolygonMode(GL.GL_BACK, GLint_To_GLenum(Old_Polygon_Mode(1)));
    GL.glEnable(GL.GL_LIGHTING);
    
  end Render;
    
end Sphere;
