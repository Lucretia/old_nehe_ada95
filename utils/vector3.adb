---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
with Ada.Numerics.Generic_Elementary_Functions;

package body Vector3 is

  package Trig is new Ada.Numerics.Generic_Elementary_Functions(Float);

  -- ||V|| = Sqrt(V.V)
  function Length(Self : in Object) return Float is
  
  begin
  
    return Trig.Sqrt((Self.X * Self.X) + (Self.Y * Self.Y) + (Self.Z * Self.Z));
    
  end Length;
  

  --             V
  -- Norm(V) = -----
  --           ||V||  
  procedure Normalise(Self : in out Object) is
  
    L : Float := Length(Self);
    
  begin
  
    Self.X := Self.X / L;
    Self.Y := Self.Y / L;
    Self.Z := Self.Z / L;
    
  end Normalise;
  
  
  -- Dot product.
  function Dot(Self, Operand : in Object) return Float is
  
  begin
  
    return (Self.X * Operand.X) + (Self.Y * Operand.Y) + (Self.Z * Operand.Z);
    
  end Dot;


  -- Cross product.
  function Cross(Self, Operand : in Object) return Object is
  
  begin
  
    return Object'((Self.Y * Operand.Z) - (Self.Z * Operand.Y), (Self.Z * Operand.X) - (Self.X * Operand.Z), (Self.X * Operand.Y) - (Self.Y * Operand.X));
    
  end Cross;


  function "+"(Left, Right : in Object) return Object is
  
  begin
  
    return Object'(Left.X + Right.X, Left.Y + Right.Y, Left.Z + Right.Z);
  
  end "+";
  
  
  function "-"(Left, Right : in Object) return Object is
  
  begin
  
    return Object'(Left.X - Right.X, Left.Y - Right.Y, Left.Z - Right.Z);
  
  end "-";
  
  
  function "-"(Left : in Object) return Object is
  
  begin
  
    return Object'(-Left.X, -Left.Y, -Left.Z);
  
  end "-";
  
  
  function "*"(Left : in Object; Right : in Float) return Object is
  
  begin
  
    return Object'(Left.X * Right, Left.Y * Right, Left.Z * Right);

  end "*";
  
  
  function "/"(Left : in Object; Right : in Float) return Object is
  
  begin
  
    return Object'(Left.X / Right, Left.Y / Right, Left.Z / Right);

  end "/";
  
  
  function Output(Self : in Object) return String is
  
  begin
  
    return "X: " & Float'Image(Self.X) & "   Y: " & Float'Image(Self.Y) & "   Z: " & Float'Image(Self.Z);
  
  end Output;

end Vector3;
