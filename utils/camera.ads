---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
with Matrix4x4;
with Matrix3x3;
with Vector3;

use type Vector3.Object;
use type Matrix4x4.Object;

package Camera is

  -- The camera is used to simplify the modelling & viewing process, it should do the following:
  -- + Provide a way to move the camera (viewing).
  -- + Project the world into the window.
  -- Normally, in OpenGL, the camera transforms are applied first, and then each model's transforms are applied, then the model is
  -- rendered. This can be achieved by having the camera set it's position into the modelview matrix first as normal before the model's matrix?
  type Object is
    record
      -- Eye, Centre, Up
      -- Create the forward vector, normalise it
      -- Create the up vector again
      -- Then compose a 3x3 matrix from the 3 axes.
      Eye    : Vector3.Object;  -- Camera position.
      Centre : Vector3.Object;  -- Reference point of where the camera is looking.
      Up     : Vector3.Object;  -- The up vector.
    end record;
  
  function Create(Eye_X, Eye_Y, Eye_Z, Centre_X, Centre_Y, Centre_Z, Up_X, Up_Y, Up_Z : in Float) return Object;
  
  function GetMatrix(ActiveCamera : in Object) return Matrix4x4.Object;
  
  procedure Set(ActiveCamera : in Object);
  
end Camera;
