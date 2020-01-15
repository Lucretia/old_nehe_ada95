---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
package Torus is

  type Object is
    record
      Radius         : Float;    -- Radius of the inner circle.
      Section_Radius : Float;    -- Radius of the tube.
      Sections       : Integer;  -- Total sections in the torus.
      Tube_Sections  : Integer;  -- Total sections in the tube.
    end record;
   
end Torus;
