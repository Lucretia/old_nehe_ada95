
package body Double_Sprogs is

   --  ===================================================================
   procedure Spin_Display is
   begin
      spin := spin + 2.0;
      if spin > 360.0 then
         spin := spin - 360.0;
      end if;
   end Spin_Display;

   --  ===================================================================
   procedure Null_Spin is
   begin
      null;
   end Null_Spin;


end Double_Sprogs;
