

package body SDL_Image is

   --  =================================================
   function Load (file : String) return V.Surface_ptr is
   begin
      return Load (CS.New_String (file));
   end Load;

   --  =================================================
   function LoadTyped_RW (src : RW.RWops_ptr;
                          freesrc : C.int;
                          the_type : String)
                          return V.Surface_ptr is
   begin
      return LoadTyped_RW (src, freesrc, CS.New_String (the_type));
   end LoadTyped_RW;

   --  =================================================
end SDL_Image;
