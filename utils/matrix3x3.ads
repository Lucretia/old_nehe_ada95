---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
with Vector3;

package Matrix3x3 is

  ORDER : constant Integer := 3;    -- 3 - 1 => The width of the matrix = 3!

  -- OpenGL Matrices:
  -- Array        Matrix          Axes
  --                              X Y Z
  -- m0 m3 m6     m11 m12 m13     x x x
  -- m1 m4 m7 :-> m21 m22 m23 :-> y y y
  -- m2 m5 m8     m31 m32 m33     z z z
  type Matrix_Elements is (XAxis_X, XAxis_Y, XAxis_Z, YAxis_X, YAxis_Y, YAxis_Z, ZAxis_X, ZAxis_Y, ZAxis_Z);
  type Object is array(Matrix_Elements'Range) of Float;
  
  function Identity return Object;
  procedure Identity(Self : in out Object);
  
  procedure FromAngleAxis(Result : out Object; Angle : in Float; UnitAxis : in Vector3.Object);
  procedure Transpose(Self : in out Object);

  procedure Scale(Result : out Object; X, Y, Z : in Float := 1.0);
  
  function "-"(Self : in Object) return Object;
  function "*"(Left, Right : in Object) return Object;
  function "*"(Left : in Object; Right : in Vector3.Object) return Vector3.Object;
  
end Matrix3x3;
