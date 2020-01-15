with Ada.Unchecked_Conversion;
with Interfaces.C;

package body SDL is
   function Init(Flags : in Capabilities) return Boolean is
      use type Interfaces.C.Int;
      
      function Convert is new Ada.Unchecked_Conversion(Source => Capabilities, Target => Interfaces.C.Unsigned);
      
      function SDL_Init(Flags : in Interfaces.C.Unsigned) return Interfaces.C.Int;
      pragma Import(C, SDL_Init, "SDL_Init");
   begin
      if SDL_Init(Convert(Flags)) = -1 then
	 return False;
      end if;
      
      return True;
   end Init;
   
   
   procedure Quit is
      procedure SDL_Quit;
      pragma Import(C, SDL_Quit, "SDL_Quit");
   begin
      SDL_Quit;
   end Quit;
end SDL;
