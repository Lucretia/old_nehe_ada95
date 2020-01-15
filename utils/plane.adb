---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
package body Plane is

  function CreateX return Object is
  
  begin

    return Object'(Vector3.Object'(1.0, 0.0, 0.0), 0.0);
    
  end CreateX;
  

  function CreateY return Object is
  
  begin

    return Object'(Vector3.Object'(0.0, 1.0, 0.0), 0.0);
    
  end CreateY;
  

  function CreateZ return Object is
  
  begin

    return Object'(Vector3.Object'(0.0, 0.0, 1.0), 0.0);
    
  end CreateZ;
  

  function Create(V : in Vector3.Object; D : in Float) return Object is
  
  begin
  
    return Object'(V, D);
    
  end Create;

end Plane;
