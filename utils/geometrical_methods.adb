---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
package body Geometrical_Methods is

  function CollisionDetected(P : in Plane.Object; V : in Vector3.Object) return Boolean is
  
  begin

    -- Equation of a plane in vector notation:
    --   Pn . V = d
    -- Where:
    --   Pn = Plane normal
    --   V  = Vector to test against
    --   d  = Distance of the plane from the origin along the plane's normal.
    if Vector3.Dot(V, P.Normal) - P.Distance = 0.0 then
    
      return True;
    
    end if;

    return False;
    
  end CollisionDetected;


  function CollisionDetected(P : in Plane.Object; L : in Line_Segment.Object) return Boolean is
  
    -- Equation of a plane in vector notation:
    --   Pn . V = d
    -- Where:
    --   Pn = Plane normal
    --   V  = Vector to test against
    --   d  = Distance of the plane from the origin along the plane's normal.
    -- This seems to work no matter if PlaneD is added or subtracted from the dot products.
    EndPoint1 : Float := Vector3.Dot(L.StartPoint, P.Normal) - P.Distance;
    EndPoint2 : Float := Vector3.Dot(L.EndPoint, P.Normal) - P.Distance;
    
  begin
  
    --Put_Line("EndPoint1: " & Float'Image(EndPoint1) & "   EndPoint2: " & Float'Image(EndPoint2));

    if EndPoint1 * EndPoint2 < 0.0 then
    
      return True;
    
    end if;

    return False;
  
  end CollisionDetected;


  -- This is the same equation as the closest point on a line.
  -- q' = q + (distance - q.n)n
  function ClosestPoint(V : in Vector3.Object; P : in Plane.Object) return Vector3.Object is
  
    Temp : Float          := P.Distance - Vector3.Dot(V, P.Normal);
    Prod : Vector3.Object := P.Normal * Temp;
    
  begin
  
    return V + Prod;
  
  end ClosestPoint;
  
end Geometrical_Methods;
