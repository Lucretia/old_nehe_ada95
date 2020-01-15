
with Ada.Text_IO; use Ada.Text_IO;

procedure test_endianess is

begin
   if Standard'Default_Bit_Order = 1 then
      Put_Line ("This is a litle-endian machine. " &
                " (Standard'Default_Bit_Order = " &
                Integer'Image (Standard'Default_Bit_Order) &
                ")");
   else
      Put_Line ("This is a big-endian machine. " &
                " (Standard'Default_Bit_Order = " &
                 Integer'Image (Standard'Default_Bit_Order) &
                 ")");
   end if;
end test_endianess;
