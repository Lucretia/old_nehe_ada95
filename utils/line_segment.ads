---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
with Vector3;

package Line_Segment is

  type Object is
    record
      StartPoint, EndPoint : Vector3.Object;
    end record;

  function Create(StartPoint, EndPoint : Vector3.Object) return Object;

end Line_Segment;
