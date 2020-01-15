---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
with Interfaces.C;
with Interfaces.C.Strings;
with Unchecked_Conversion;
with Ada.Strings.Fixed;
with GL;
with GLU;
with SDL.Video;
with System;

package body GLUtils is

  package C renames Interfaces.C;

  function To_chars_ptr is new Unchecked_Conversion(Source => GL.GLubytePtr, Target => C.Strings.chars_ptr);
  
  function GL_Vendor return String is
  
  begin
  
    return C.Strings.Value(To_chars_ptr(GL.glGetString(GL.GL_VENDOR)));
    
  end GL_Vendor;
  
  
  function GL_Version return String is
  
  begin
  
    return C.Strings.Value(To_chars_ptr(GL.glGetString(GL.GL_VERSION)));
    
  end GL_Version;
  
  
  function GL_Renderer return String is
  
  begin
  
    return C.Strings.Value(To_chars_ptr(GL.glGetString(GL.GL_RENDERER)));
    
  end GL_Renderer;
  
  
  function GL_Extensions return String is
  
  begin
  
    return C.Strings.Value(To_chars_ptr(GL.glGetString(GL.GL_EXTENSIONS)));
    
  end GL_Extensions;
  
  
  function GLU_Version return String is
  
  begin
  
    return C.Strings.Value(To_chars_ptr(GLU.gluGetString(GLU.GLU_VERSION)));
     
  end GLU_Version;
  
  
  function GLU_Extensions return String is
  
  begin
  
    return C.Strings.Value(To_chars_ptr(GLU.gluGetString(GLU.GLU_EXTENSIONS)));
    
  end GLU_Extensions;
  

  function IsExtensionAvailable(ExtensionToFind : in String) return Boolean is
  
    Extensions : String  := GL_Extensions;
    Start      : Integer := Ada.Strings.Fixed.Index(Extensions, ExtensionToFind);
    Finish     : Integer := Start + ExtensionToFind'Length - 1;

  begin

    if ExtensionToFind = Extensions(Start .. Finish) then
    
      return True;
      
    end if;
    
    return False;

  end IsExtensionAvailable;


  function GetProc(Name : in String) return ELEMENT is
  
    function To_EXT is new Unchecked_Conversion(Source => System.Address, Target => ELEMENT);

  begin

    return To_EXT(SDL.Video.GL_GetProcAddress(Interfaces.C.Strings.New_String(Name)));

  end GetProc;

end GLUtils;
