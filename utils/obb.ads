---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
with Matrix3x3;
with Vector3;

use type Matrix3x3.Object;

package OBB is

  type Object is
    record
      Min, Max : Vector3.Object;
    end record;

  function Create return Object;
  
  procedure Empty(Self : in out Object);
  procedure Add(Self : in out Object; Vertex : in Vector3.Object);
  
  procedure Render(Self : in Object);
    
end OBB;
