---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
with Vector3;
with Plane;
with Line_Segment;

use type Vector3.Object;

package Geometrical_Methods is

  function CollisionDetected(P : in Plane.Object; V : in Vector3.Object) return Boolean;
  function CollisionDetected(P : in Plane.Object; L : in Line_Segment.Object) return Boolean;

  function ClosestPoint(V : in Vector3.Object; P : in Plane.Object) return Vector3.Object;
  
end Geometrical_Methods;
