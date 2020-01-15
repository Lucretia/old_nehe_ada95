---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
with Vector3;

package Sphere is

  type Object is
    record
      Centre : Vector3.Object;
      Radius : Float;
    end record;
    
  procedure Render(Self : in Object);
  
end Sphere;
