---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
with Ada.Numerics.Generic_Elementary_Functions;
with Vector3;

package body Matrix3x3 is

  package Trig is new Ada.Numerics.Generic_Elementary_Functions(Float);
  
  -- Create a new matrix which is initialised to the identity.
  function Identity return Object is
  
  begin
  
    return Object'(XAxis_X | YAxis_Y | ZAxis_Z => 1.0, others => 0.0);
  
  end Identity;


  -- Set an existing matrix to the identity.
  procedure Identity(Self : in out Object) is
  
  begin
  
    Self := Object'(XAxis_X | YAxis_Y | ZAxis_Z => 1.0, others => 0.0);
  
  end Identity;


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

    Result(YAxis_X) := (XY * OneMinusCos) - (UnitAxis.Z * Sin);
    Result(YAxis_Y) := YY + (Cos * (1.0 - YY));
    Result(YAxis_Z) := (YZ * OneMinusCos) + (UnitAxis.X * Sin);

    Result(ZAxis_X) := (ZX * OneMinusCos) + (UnitAxis.Y * Sin);
    Result(ZAxis_Y) := (YZ * OneMinusCos) - (UnitAxis.X * Sin);
    Result(ZAxis_Z) := ZZ + (Cos * (1.0 - ZZ));

  end FromAngleAxis;


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
    Swap(Self(YAxis_Z), Self(ZAxis_Y));

  end Transpose;
  

  procedure Scale(Result : out Object; X, Y, Z : in Float := 1.0) is

  begin

    Result := (XAxis_X => X, YAxis_Y => Y, ZAxis_Z => Z, others => 0.0);

  end Scale;


  function "-"(Self : in Object) return Object is
  
    Result : Object := Identity;
    
  begin
  
    for Index in Matrix_Elements'Range loop
    
      Result(Index) := -Self(Index);
      
    end loop;
    
    return Result;
    
  end "-";
  
  
  function "*"(Left, Right : in Object) return Object is
  
    LoopEnd : Constant Integer := (ORDER - 1);
    Result  : Object           := Identity;

  begin
  
    for I in 0 .. LoopEnd loop

      for J in 0 .. LoopEnd loop

        Result(Matrix_Elements'Val((I * ORDER) + J)) := 0.0;

        for K in 0 .. LoopEnd loop

          Result(Matrix_Elements'Val((I * ORDER) + J)) := Result(Matrix_Elements'Val((I * ORDER) + J)) + (Left(Matrix_Elements'Val((I * ORDER) + K)) * Right(Matrix_Elements'Val((K * ORDER) + J)));

        end loop;

      end loop;

    end loop;
    
    return Result;

  end "*";
  

  function "*"(Left : in Object; Right : in Vector3.Object) return Vector3.Object is
  
  begin
  
    return Vector3.Object'(
      (Left(XAxis_X) * Right.X) + (Left(YAxis_X) * Right.Y) + (Left(ZAxis_X) * Right.Z),
      (Left(XAxis_Y) * Right.X) + (Left(YAxis_Y) * Right.Y) + (Left(ZAxis_Y) * Right.Z),
      (Left(XAxis_Z) * Right.X) + (Left(YAxis_Z) * Right.Y) + (Left(ZAxis_Z) * Right.Z));

  end "*";
  
end Matrix3x3;
