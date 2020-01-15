---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
package body Line_Segment is

  function Create(StartPoint, EndPoint : Vector3.Object) return Object is
  
  begin
  
    return Object'(StartPoint, EndPoint);
  
  end Create;

end Line_Segment;
