with Interfaces.C.Pointers;
generic
   type The_Element is mod <>;
   type The_Element_Array is
      array (Interfaces.C.size_t range <>) of aliased The_Element;
package UintN_PtrOps is
   package C renames Interfaces.C;

   package Operations is
      new Interfaces.C.Pointers (
         Index              => Interfaces.C.size_t,
         Element            => The_Element,
         Element_Array      => The_Element_Array,
         Default_Terminator => 0);

   subtype Pointer is Operations.Pointer;

   function Value
     (Ref        : in Pointer;
      Terminator : in The_Element)
      return       The_Element_Array renames Operations.Value;

   function Value
     (Ref    : in Pointer;
      Length : in C.ptrdiff_t)
      return   The_Element_Array renames Operations.Value;

   --------------------------------
   -- C-style Pointer Arithmetic --
   --------------------------------

   function "+" (Left : in Pointer;   Right : in C.ptrdiff_t) return Pointer
      renames Operations."+";
   function "+" (Left : in C.ptrdiff_t; Right : in Pointer)   return Pointer
      renames Operations."+";
   function "-" (Left : in Pointer;   Right : in C.ptrdiff_t) return Pointer
      renames Operations."-";
   function "-" (Left : in Pointer;   Right : in Pointer)   return C.ptrdiff_t
      renames Operations."-";

   procedure Increment (Ref : in out Pointer)
      renames Operations.Increment;
   procedure Decrement (Ref : in out Pointer)
      renames Operations.Increment;

   function Virtual_Length
     (Ref        : in Pointer;
      Terminator : in The_Element := 0)
      return       C.ptrdiff_t renames Operations.Virtual_Length;

   procedure Copy_Terminated_Array
     (Source     : in Pointer;
      Target     : in Pointer;
      Limit      : in C.ptrdiff_t := C.ptrdiff_t'Last;
      Terminator : in The_Element := 0)
   renames Operations.Copy_Terminated_Array;

   procedure Copy_Array
     (Source  : in Pointer;
      Target  : in Pointer;
      Length  : in C.ptrdiff_t)
   renames Operations.Copy_Array;

end UintN_PtrOps;

