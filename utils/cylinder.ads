---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
package Cylinder is

  type Object is
    record
      Radius   : Float;
      Height   : Float;
      Sections : Integer;
    end record;
   
end Cylinder;
