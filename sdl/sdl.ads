package SDL is
   pragma Linker_Options("-lSDL");
   
   type Capabilities is mod 2 ** 31;
   for Capabilities'Size use 32;
   pragma Convention(C, Capabilities);
   
   Timer    : Capabilities := 16#0000_0001#;
   Audio    : Capabilities := 16#0000_0010#;
   Video    : Capabilities := 16#0000_0020#;
   CDROM    : Capabilities := 16#0000_0100#;
   Joystick : Capabilities := 16#0000_0200#;

   function Init(Flags : in Capabilities) return Boolean;
   procedure Quit;
end SDL;
