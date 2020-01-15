

with SDL.Keysym; use SDL.Keysym;
with Ada.Text_IO;
with Interfaces.C;
procedure Test_Enumerations is
   package C renames Interfaces.C;
   package Integer_IO is new Ada.Text_IO.Integer_IO (Integer);
   package Text_IO renames Ada.Text_IO;
   Index : Key := Key'First;
begin
   Text_IO.Put_Line ("Identifier name       Position      Representation");
   for Index in Key loop
      Text_IO.Put (Key'Image (Index));
      Integer_IO.Put (Key'Pos (Index), 15);
      Integer_IO.Put (Key'Enum_Rep (Index), 15);
      Text_IO.New_Line;
   end loop;
   Text_IO.New_Line;
   Text_IO.Put ("The size of Key is: ");
   Integer_IO.Put (Key'Size / C.CHAR_BIT);
   Text_IO.Put_Line (" Bytes");
end Test_Enumerations;
