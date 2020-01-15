
with Ada.Text_IO; use Ada.Text_IO;
with SDL_Ada_Sizes; use SDL_Ada_Sizes;
with SDL.Types;
with SDL.Cdrom;
with SDL.Events;

with Interfaces.C;
procedure Verify_Ada_Sizes is

   package C renames Interfaces.C;
   package AI is new Ada.Text_IO.Integer_IO (Integer);
   package CI is new Ada.Text_IO.Integer_IO (C.int);
   use type C.int;
   
   No_Failure : Boolean := True;
   
   --  =============================================
   procedure Comparison (
      name : String;
      A_Size : Integer;
      C_Size : C.int)
   is
      A_Size_Bytes : integer := A_Size / C.CHAR_BIT;
   begin
      Put ("Testing "); Put_Line(name);
      if Integer (C_Size) /= A_Size_Bytes then
         Put ("Incompatibility in byte sizes of type : ");
         Put (name);
         Put (";      Ada size = ");
         AI.Put (A_Size_Bytes, 4);
         Put (";     C size = ");
         CI.Put (C_Size, 4);
         New_line;
         No_Failure := No_Failure and False;
      end if;
      No_Failure := No_Failure and True;
   end;
   
   --  =============================================


begin
  
   Put_Line ("************* STARTING TYPES COMPARISON ******************");
      Comparison ("Uint8", SDL.Types.Uint8'size, Uint8_Size);  
      Comparison ("CDtrack", SDL.Cdrom.CDtrack'size, SDL_CDtrack_Size);
      comparison ("CD", SDL.Cdrom.CD'size, SDL_CD_Size);
      comparison ("JoyAxisEvent", SDL.Events.JoyAxisEvent'Size, SDL_JoyAxisEvent_Size);
      comparison ("JoyBallEvent", SDL.Events.JoyBallEvent'Size, SDL_JoyBallEvent_Size);
      comparison ("JoyHatEvent", SDL.Events.JoyHatEvent'Size, SDL_JoyHatEvent_Size);
      comparison ("JoyButtonEvent", SDL.Events.JoyButtonEvent'Size, SDL_JoyButtonEvent_Size);
      comparison ("Event", SDL.Events.Event'Size, SDL_Event_Size);

   if  No_Failure then
      Put_Line ("The tested sizes are all correct");
   else
      Put_Line ("Some sizes are not correct");
   end if;  
   Put_Line ("************** END OF  TYPES COMPARISON ******************");
 
end Verify_Ada_Sizes;
