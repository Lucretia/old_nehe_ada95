---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
with Ada.Numerics.Generic_Elementary_Functions;

package body Matrix4x4 is

  package Trig is new Ada.Numerics.Generic_Elementary_Functions(Float);
  
  function Identity return Object is
  
  begin
  
    return Object'(XAxis_X | YAxis_Y | ZAxis_Z | Pos_W => 1.0, others => 0.0);
    
  end Identity;
  
  
  procedure Identity(Self : in out Object) is
  
  begin

    Self := Object'(XAxis_X | YAxis_Y | ZAxis_Z | Pos_W => 1.0, others => 0.0);
    
  end Identity;
  
  
  function Compose(R : in Matrix3x3.Object; P : in Vector3.Object) return Object is
  
  begin
  
    return Object'(
      XAxis_X => R(Matrix3x3.XAxis_X), YAxis_X => R(Matrix3x3.YAxis_X), ZAxis_X => R(Matrix3x3.ZAxis_X), Pos_X => P.X,
      XAxis_Y => R(Matrix3x3.XAxis_Y), YAxis_Y => R(Matrix3x3.YAxis_Y), ZAxis_Y => R(Matrix3x3.ZAxis_Y), Pos_Y => P.Y,
      XAxis_Z => R(Matrix3x3.XAxis_Z), YAxis_Z => R(Matrix3x3.YAxis_Z), ZAxis_Z => R(Matrix3x3.ZAxis_Z), Pos_Z => P.Z,
      XAxis_W => 0.0,                  YAxis_W => 0.0,                  ZAxis_W => 0.0,                  Pos_W => 1.0);
    
  end Compose;
  

  -- Create a rotation matrix from an angle and a unit axis.
  --
  -- Let v = (x, y, z)^T, and u = v / |v| = (x', y', z')^T
  --     | 0  -z'  y'|
  -- S = | z'  0  -x'|
  --     |-y'  x'  0 |
  -- M = uu^T + (cos a)(I - uu^T) + (sin a)S
  -- or, from David Eberly's book:
  -- M = I + (sin a)S + (1 - cos a)S^2
  procedure FromAngleAxis(Result : out Object; Angle : in Float; UnitAxis : in Vector3.Object) is

    -- Taken from Foley & Van Dam.
    Cos         : Float := Trig.Cos(Angle);
    Sin         : Float := Trig.Sin(Angle);
    OneMinusCos : Float := 1.0 - Cos;
    XX          : Float := UnitAxis.X * UnitAxis.X;
    YY          : Float := UnitAxis.Y * UnitAxis.Y;
    ZZ          : Float := UnitAxis.Z * UnitAxis.Z;
    XY          : Float := UnitAxis.X * UnitAxis.Y;
    YZ          : Float := UnitAxis.Y * UnitAxis.Z;
    ZX          : Float := UnitAxis.X * UnitAxis.Z;

  begin

    Result(XAxis_X) := XX + (Cos * (1.0 - XX));
    Result(XAxis_Y) := (XY * OneMinusCos) + (UnitAxis.Z * Sin);
    Result(XAxis_Z) := (ZX * OneMinusCos) - (UnitAxis.Y * Sin);
    Result(XAxis_W) := 0.0;

    Result(YAxis_X) := (XY * OneMinusCos) - (UnitAxis.Z * Sin);
    Result(YAxis_Y) := YY + (Cos * (1.0 - YY));
    Result(YAxis_Z) := (YZ * OneMinusCos) + (UnitAxis.X * Sin);
    Result(YAxis_W) := 0.0;

    Result(ZAxis_X) := (ZX * OneMinusCos) + (UnitAxis.Y * Sin);
    Result(ZAxis_Y) := (YZ * OneMinusCos) - (UnitAxis.X * Sin);
    Result(ZAxis_Z) := ZZ + (Cos * (1.0 - ZZ));
    Result(ZAxis_W) := 0.0;

    Result(Pos_X)   := 0.0;
    Result(Pos_Y)   := 0.0;
    Result(Pos_Z)   := 0.0;
    Result(Pos_W)   := 1.0;

  end FromAngleAxis;


  procedure Translate(Result : out Object; X, Y, Z : in Float) is
  
  begin
  
    Result := Object'(XAxis_X | YAxis_Y | ZAxis_Z | Pos_W => 1.0, Pos_X => X, Pos_Y => Y, Pos_Z => Z, others => 0.0);
    
  end Translate;
  
  
  procedure Transpose(Self : in out Object) is

    procedure Swap(A, B : in out Float) is
    
      Temp : Float;
    
    begin
    
      Temp := A;
      A    := B;
      B    := Temp;
    
    end Swap;

  begin

    Swap(Self(XAxis_Y), Self(YAxis_X));
    Swap(Self(XAxis_Z), Self(ZAxis_X));
    Swap(Self(XAxis_W), Self(Pos_X));
    Swap(Self(YAxis_Z), Self(ZAxis_Y));
    Swap(Self(YAxis_W), Self(Pos_Y));
    Swap(Self(ZAxis_W), Self(Pos_Y));

  end Transpose;
  

  procedure Inverse(Self : in out Object) is
  
    M    : Matrix3x3.Object := Matrix3x3.Object'(
      Matrix3x3.XAxis_X => Self(XAxis_X), Matrix3x3.YAxis_X => Self(YAxis_X), Matrix3x3.ZAxis_X => Self(ZAxis_X),
      Matrix3x3.XAxis_Y => Self(XAxis_Y), Matrix3x3.YAxis_Y => Self(YAxis_Y), Matrix3x3.ZAxis_Y => Self(ZAxis_Y),
      Matrix3x3.XAxis_Z => Self(XAxis_Z), Matrix3x3.YAxis_Z => Self(YAxis_Z), Matrix3x3.ZAxis_Z => Self(ZAxis_Z));
    T     : Vector3.Object := Vector3.Object'(Self(Pos_X), Self(Pos_Y), Self(Pos_Z));
    
  begin
  
    Matrix3x3.Transpose(M);
    
    T := (-M) * T;
    
    Self := Compose(M, T);
    
  end Inverse;
  

  function "*"(Left, Right : in Object) return Object is
  
    LOOP_END : constant Integer := (ORDER - 1);
    Result   : Object           := Identity;

  begin
  
    for I in 0 .. LOOP_END loop

      for J in 0 .. LOOP_END loop

        Result(Matrix_Elements'Val((I * 4) + J)) := 0.0;

        for K in 0 .. LOOP_END loop

          Result(Matrix_Elements'Val((I * 4) + J)) := Result(Matrix_Elements'Val((I * 4) + J)) + (Left(Matrix_Elements'Val((I * 4) + K)) * Right(Matrix_Elements'Val((K * 4) + J)));

        end loop;

      end loop;

    end loop;
    
    return Result;

  end "*";
  
end Matrix4x4;
