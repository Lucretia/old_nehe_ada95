---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
with GL;
with Torus;
with Cylinder;
with AABB;
with OBB;
with Sphere;
with Matrix3x3;
with Vector3;

package Mesh is

  subtype ColourRange is Integer range 1 .. 4;
  subtype VectorRange is Integer range 1 .. 3;
  subtype TCRange is Integer range 1 .. 2;

  type ColourArray is array(ColourRange) of aliased GL.GLfloat;
  type VectorArray is array(VectorRange) of aliased GL.GLfloat;
  type TCArray is array(TCRange) of aliased GL.GLfloat;

  type VectorArrayPtr is access all VectorArray;
  type ColourArrayPtr is access all ColourArray;
  type IntegerPtr is access all Integer;
  type TCArrayPtr is access all TCArray;

  type VertexArray is array(Integer range <>) of aliased VectorArray;
  type NormalArray is array(Integer range <>) of aliased VectorArray;
  type IndexArray is array(Integer range <>) of aliased Integer;
  type VertexColourArray is array(Integer range <>) of aliased ColourArray;
  type TexCoordArray is array(Integer range <>) of aliased TCArray;
  
  type VertexArrayPtr is access all VertexArray;
  type NormalArrayPtr is access all NormalArray;
  type IndexArrayPtr is access all IndexArray;
  type VertexColourArrayPtr is access all VertexColourArray;
  type TexCoordArrayPtr is access all TexCoordArray;
  
  type Object is
    record
      Primitive     : GL.PrimitiveType := GL.GL_TRIANGLES;
      Vertices      : VertexArrayPtr   := null;
      Normals       : NormalArrayPtr   := null;
      Indices       : IndexArrayPtr    := null;
      TexCoords     : TexCoordArrayPtr := null;
      AABB_Bounds   : AABB.Object;
      OBB_Bounds    : OBB.Object;
      Sphere_Bounds : Sphere.Object;
      Transform     : Matrix3x3.Object := Matrix3x3.Identity;
      Translation   : Vector3.Object   := Vector3.ZERO;
    end record;
  
  function GetVertices(MeshData : in Object) return GL.GLpointer;
  function GetNormals(MeshData : in Object) return GL.GLpointer;
  function GetIndices(MeshData : in Object) return GL.GLpointer;
  function GetTextureCoords(MeshData : in Object) return GL.GLpointer;
  
  function Create(Data : in Torus.Object) return Object;
  function Create(Data : in Cylinder.Object) return Object;
  
  procedure Update_AABB(Self : in out Object);
  procedure Update_OBB(Self : in out Object);
  procedure Update_Sphere(Self : in out Object);

end Mesh;
