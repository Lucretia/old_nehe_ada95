---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
with Vector3;
with Matrix3x3;

use type Matrix3x3.Object;

package Matrix4x4 is

  ORDER : constant Integer := 4;    -- 4 - 1 => The width of the matrix = 4!

  -- OpenGL Matrices:
  -- Array             Matrix              Axes
  --                                       X Y Z P
  -- m0 m4 m8  m12     m11 m12 m13 m14     x x x x
  -- m1 m5 m9  m13 :-> m21 m22 m23 m24 :-> y y y y
  -- m2 m6 m10 m14     m31 m32 m33 m34     z z z z
  -- m3 m7 m11 m15     m41 m42 m43 m44     0 0 0 1
  type Matrix_Elements is (XAxis_X, XAxis_Y, XAxis_Z, XAxis_W, YAxis_X, YAxis_Y, YAxis_Z, YAxis_W, ZAxis_X, ZAxis_Y, ZAxis_Z, ZAxis_W, Pos_X, Pos_Y, Pos_Z, Pos_W);
  type Object is array(Matrix_Elements'Range) of Float;
  type Reference is access all Object;
  type View is access constant Object;
  
  function Identity return Object;
  procedure Identity(Self : in out Object);
  
  function Compose(R : in Matrix3x3.Object; P : in Vector3.Object) return Object;
  
  procedure FromAngleAxis(Result : out Object; Angle : in Float; UnitAxis : in Vector3.Object);
  procedure Translate(Result : out Object; X, Y, Z : in Float);
  
  procedure Transpose(Self : in out Object);
  procedure Inverse(Self : in out Object);
  
  function "*"(Left, Right : in Object) return Object;
  
end Matrix4x4;
