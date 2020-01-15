---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
package Vector3 is

  type Object is
    record
      X, Y, Z : Float;
    end record;
  
  -- The additive identity.
  ZERO : constant Object := Object'(0.0, 0.0, 0.0);

  function Length(Self : in Object) return Float;
  procedure Normalise(Self : in out Object);
  
  function Dot(Self, Operand : in Object) return Float;
  function Cross(Self, Operand : in Object) return Object;

  function "+"(Left, Right : in Object) return Object;
  function "-"(Left, Right : in Object) return Object;
  function "-"(Left : in Object) return Object;
  function "*"(Left : in Object; Right : in Float) return Object;
  function "/"(Left : in Object; Right : in Float) return Object;
    
  function Output(Self : in Object) return String;

end Vector3;
