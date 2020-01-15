---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
with Unchecked_Conversion;
with GL;
with Text_IO;

package body Camera is

  -- In the standard gluLookAt function:
  --  LookAt   = Eye or where the camera is looking.
  --  Position = Centre or the camera's position.
  function Create(Eye_X, Eye_Y, Eye_Z, Centre_X, Centre_Y, Centre_Z, Up_X, Up_Y, Up_Z : in Float) return Object is
  
  begin
  
    return Object'(
      Eye    => Vector3.Object'(Eye_X, Eye_Y, Eye_Z),
      Centre => Vector3.Object'(Centre_X, Centre_Y, Centre_Z),
      Up     => Vector3.Object'(Up_X, Up_Y, Up_Z));
    
  end Create;
  
  
  -- This function creates a 4x4 matrix from the camera object.
  -- This matrix has already been inverted ready for concatenation with the model's matrices.
  function GetMatrix(ActiveCamera : in Object) return Matrix4x4.Object is
  
    Forward : Vector3.Object   := ActiveCamera.Centre - ActiveCamera.Eye;
    Side    : Vector3.Object   := Vector3.ZERO;
    New_Up  : Vector3.Object   := Vector3.ZERO;
    M       : Matrix4x4.Object := Matrix4x4.Identity;
    T       : Matrix4x4.Object := Matrix4x4.Identity;
    
  begin
  
    Vector3.Normalise(Forward);
    
    Side := Vector3.Cross(Forward, ActiveCamera.Up);

    Vector3.Normalise(Side);
    
    New_Up := Vector3.Cross(Side, Forward);
  
    Matrix4x4.Translate(T, -ActiveCamera.Eye.X, -ActiveCamera.Eye.Y, -ActiveCamera.Eye.Z);

    M(Matrix4x4.XAxis_X) := Side.X;
    M(Matrix4x4.YAxis_X) := Side.Y;
    M(Matrix4x4.ZAxis_X) := Side.Z;
    
    M(Matrix4x4.XAxis_Y) := New_Up.X;
    M(Matrix4x4.YAxis_Y) := New_Up.Y;
    M(Matrix4x4.ZAxis_Y) := New_Up.Z;

    M(Matrix4x4.XAxis_Z) := -Forward.X;
    M(Matrix4x4.YAxis_Z) := -Forward.Y;
    M(Matrix4x4.ZAxis_Z) := -Forward.Z;
    
    return T*M;
    
  end GetMatrix;
  
  
  procedure Set(ActiveCamera : in Object) is

    function Matrix4x4_To_GLfloat is new Unchecked_Conversion(Source => Matrix4x4.View, Target => GL.GLfloatPtr);

    CameraTransform : aliased Matrix4x4.Object := GetMatrix(ActiveCamera);
   
  begin
  
    GL.glLoadMatrixf(Matrix4x4_To_GLfloat(CameraTransform'Unchecked_Access));

  end Set;
  
end Camera;
