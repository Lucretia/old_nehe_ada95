---------------------------------------------------------------------------------
-- Copyright 2004-2005 © Luke A. Guest
--
-- This code is to be used for tutorial purposes only.
-- You may not redistribute this code in any form without my express permission.
---------------------------------------------------------------------------------
package GLUtils is

  function GL_Vendor return String;
  function GL_Version return String;
  function GL_Renderer return String;
  function GL_Extensions return String;
  function GLU_Version return String;
  function GLU_Extensions return String;

  function IsExtensionAvailable(ExtensionToFind : in String) return Boolean;
  
  generic
    type ELEMENT is private;
  function GetProc(Name : in String) return ELEMENT;

end GLUtils;
