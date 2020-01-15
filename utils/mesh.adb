---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
with Unchecked_Conversion;
with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Numerics;
with Sphere;
with Vector3;

use type Vector3.Object;

package body Mesh is

  package Trig is new Ada.Numerics.Generic_Elementary_Functions(Float);

  function Degrees_To_Radians(Angle : in Float) return Float is
  
  begin
  
    return Angle * (Ada.Numerics.PI / 180.0);
    
  end Degrees_To_Radians;

  
  function Radians_To_Degrees(Angle : in Float) return Float is
  
  begin
  
    return Angle * (180.0 / Ada.Numerics.PI);
    
  end Radians_To_Degrees;
  

  function To_GLpointer is new Unchecked_Conversion(Source => VectorArrayPtr, Target => GL.GLpointer);
  function To_GLpointer is new Unchecked_Conversion(Source => ColourArrayPtr, Target => GL.GLpointer);
  function To_GLpointer is new Unchecked_Conversion(Source => IntegerPtr, Target => GL.GLpointer);
  function To_GLpointer is new Unchecked_Conversion(Source => TCArrayPtr, Target => GL.GLpointer);
  
  function GetVertices(MeshData : in Object) return GL.GLpointer is

  begin
  
    return To_GLpointer(MeshData.Vertices.all(MeshData.Vertices.all'First)'Access);
  
  end GetVertices;
  
  
  function GetNormals(MeshData : in Object) return GL.GLpointer is
  
  begin
  
    return To_GLpointer(MeshData.Normals.all(MeshData.Normals.all'First)'Access);
    
  end GetNormals;


  function GetIndices(MeshData : in Object) return GL.GLpointer is
  
  begin
  
    return To_GLpointer(MeshData.Indices.all(MeshData.Indices.all'First)'Access);
  
  end GetIndices;


  function GetTextureCoords(MeshData : in Object) return GL.GLpointer is
  
  begin
  
    return To_GLpointer(MeshData.TexCoords.all(MeshData.TexCoords.all'First)'Access);
    
  end GetTextureCoords;
  

  -- Create a torus mesh around the origin in the XZ plane.
  function Create(Data : in Torus.Object) return Object is
  
    Total_Vertices     : Integer := Data.Sections * Data.Tube_Sections;
    Section_Angle      : Float   := 360.0 / Float(Data.Sections);
    Tube_Section_Angle : Float   := 360.0 / Float(Data.Tube_Sections);
    Current_Vertex     : Integer := 1;
    Current_Index      : Integer := 1;

    -- x := cos tube_section_theta
    -- y := sin tube_section_theta
    -- z := sin section_theta
    
    Torus_Mesh         : Object;
    Vertex             : VectorArray;
    Angle              : Float;
    
  begin
  
    Torus_Mesh.Primitive:= GL.GL_LINE_STRIP;
    Torus_Mesh.Vertices := new VertexArray(1 .. Total_Vertices);
    Torus_Mesh.Indices  := new IndexArray(1 .. Total_Vertices);
    
    for Section in 0 .. Data.Sections loop
    
      Angle                             := Degrees_To_Radians(Section_Angle * Float(Section));
      Torus_Mesh.Indices(Current_Index) := Current_Index;
      Vertex(3)                         := GL.GLfloat(Data.Radius * Trig.Sin(Angle));  -- Z
      
      for Tube_Section in 0 .. Data.Tube_Sections loop
      
        -- Generate the vertex.
        Angle     := Degrees_To_Radians(Tube_Section_Angle * Float(Tube_Section));
        Vertex(1) := GL.GLfloat(Data.Radius + (Data.Section_Radius * Trig.Cos(Angle)));  -- X
        Vertex(2) := GL.GLfloat(Data.Radius + (Data.Section_Radius * Trig.Sin(Angle)));  -- Y
        
      end loop;
        
      Torus_Mesh.Vertices(Current_Vertex) := Vertex;
      Current_Index                       := Current_Index + 1;
      Current_Vertex                      := Current_Vertex + 1;
      
    end loop;
    
    return Torus_Mesh;
    
  end Create;
  

  -- Create a cylinder which is centred at the origin.
  function Create(Data : in Cylinder.Object) return Object is
  
    -- x := cos tube_section_theta
    -- y := sin tube_section_theta
    -- z := sin section_theta
    TOTAL_VERTICES     : constant Integer := ((Data.Sections + 1) * 2);
    TOTAL_INDICES      : constant Integer := Total_Vertices;
    Section_Angle      : Float   := Degrees_To_Radians(360.0 / Float(Data.Sections));
    Current_Vertex     : Integer := 1;
    Current_Index      : Integer := 1;
    Cylinder_Mesh      : Object;

    procedure CreateVertex(Height, Section : in Float) is
    
      function Generate(Angle, Height : in Float) return VectorArray is
    
        Vertex : VectorArray;
      
      begin
    
        Vertex(1) := GL.GLfloat(Data.Radius * Trig.Cos(Angle));  -- X
        Vertex(2) := GL.GLfloat(Data.Radius * Trig.Sin(Angle));  -- Y
        Vertex(3) := GL.GLfloat(Height);  -- Z
        
        return Vertex;
      
      end Generate;
    
      Angle : Float := -Section_Angle * Section;
      
    begin
    
      Cylinder_Mesh.Vertices(Current_Vertex) := Generate(Angle, Height);
      Cylinder_Mesh.Indices(Current_Index)   := Current_Index;
      
      Current_Vertex := Current_Vertex + 1;
      Current_Index  := Current_Index + 1;
      
    end CreateVertex;
    
  begin
  
    Cylinder_Mesh.Primitive:= GL.GL_TRIANGLE_STRIP;
    Cylinder_Mesh.Vertices := new VertexArray(Current_Vertex .. TOTAL_VERTICES);
    Cylinder_Mesh.Indices  := new IndexArray(Current_Index .. TOTAL_INDICES);
    
    -- Generate a vertex for the bottom end of the cylinder. Copy this and modify the Y co-ord to make the opposite vertex for the top end
    -- of the cylinder.
    for Section in 0 .. Data.Sections loop
      
      CreateVertex(-(Float(Data.Height) / 2.0), Float(Section));
      CreateVertex(Float(Data.Height) / 2.0, Float(Section));
      
    end loop;
    
    AABB.Empty(Cylinder_Mesh.AABB_Bounds);
    OBB.Empty(Cylinder_Mesh.OBB_Bounds);
    
    return Cylinder_Mesh;
    
  end Create;
  

  -- Update the Asix-Aligned Bounding Box by using the 8 vertices defined by the Oriented Bounding Box.
  procedure Update_AABB(Self : in out Object) is
    
  begin
  
    AABB.Empty(Self.AABB_Bounds);
    
    AABB.Add(Self.AABB_Bounds, Self.Transform, Vector3.Object'(Self.OBB_Bounds.Min.X, Self.OBB_Bounds.Min.Y, Self.OBB_Bounds.Min.Z));
    AaBB.Add(Self.AABB_Bounds, Self.Transform, Vector3.Object'(Self.OBB_Bounds.Min.X, Self.OBB_Bounds.Max.Y, Self.OBB_Bounds.Min.Z));
    AABB.Add(Self.AABB_Bounds, Self.Transform, Vector3.Object'(Self.OBB_Bounds.Max.X, Self.OBB_Bounds.Max.Y, Self.OBB_Bounds.Min.Z));
    AABB.Add(Self.AABB_Bounds, Self.Transform, Vector3.Object'(Self.OBB_Bounds.Max.X, Self.OBB_Bounds.Min.Y, Self.OBB_Bounds.Min.Z));
      
    AABB.Add(Self.AABB_Bounds, Self.Transform, Vector3.Object'(Self.OBB_Bounds.Min.X, Self.OBB_Bounds.Min.Y, Self.OBB_Bounds.Max.Z));
    AABB.Add(Self.AABB_Bounds, Self.Transform, Vector3.Object'(Self.OBB_Bounds.Min.X, Self.OBB_Bounds.Max.Y, Self.OBB_Bounds.Max.Z));
    AABB.Add(Self.AABB_Bounds, Self.Transform, Vector3.Object'(Self.OBB_Bounds.Max.X, Self.OBB_Bounds.Max.Y, Self.OBB_Bounds.Max.Z));
    AABB.Add(Self.AABB_Bounds, Self.Transform, Vector3.Object'(Self.OBB_Bounds.Max.X, Self.OBB_Bounds.Min.Y, Self.OBB_Bounds.Max.Z));
    
  end Update_AABB;
  
  
  -- This procedure is slow. As the total number of vertices in a mesh increase the total number of matrix transformations
  -- inside the OBB.Add will increase, thus slowing down the whole calculation. This should be generated inside the modelling
  -- package (Maya, 3DS Max, etc.) and exported with the mesh data!
  procedure Update_OBB(Self : in out Object) is
  
    V : Vector3.Object;
    
  begin
  
    OBB.Empty(Self.OBB_Bounds);
    
    for Vertex in Self.Vertices'Range loop
    
      V := Vector3.Object'(Float(Self.Vertices(Vertex)(1)), Float(Self.Vertices(Vertex)(2)), Float(Self.Vertices(Vertex)(3)));
      
      OBB.Add(Self.OBB_Bounds, V);
      
    end loop;
    
  end Update_OBB;
  

  procedure Update_Sphere(Self : in out Object) is
  
    Box_Length : Vector3.Object := Self.AABB_Bounds.Max - Self.AABB_Bounds.Min;
    
  begin
  
    Self.Sphere_Bounds.Centre := Box_Length / 2.0;
    Self.Sphere_Bounds.Radius := Vector3.Length(Box_Length - Self.Sphere_Bounds.Centre);
  
  end Update_Sphere;
  
end Mesh;
