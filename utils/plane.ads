---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
with Vector3;

package Plane is

  type Object is
    record
      Normal   : Vector3.Object;
      Distance : Float;
    end record;
  
  function CreateX return Object;
  function CreateY return Object;
  function CreateZ return Object;

end Plane;
