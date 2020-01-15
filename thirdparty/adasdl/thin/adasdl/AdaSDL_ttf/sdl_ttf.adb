

package body SDL_ttf is

   --  ====================================
   function Open_Font (file : String; ptsize : C.int) return Font_ptr is
   begin
      return OpenFont (CS.New_String (file), ptsize);
   end Open_Font;


   --  ====================================
   function Open_Font_Index (file : String;
                             ptsize : C.int; index : C.long)
                             return Font_ptr is
   begin
      return OpenFontIndex (CS.New_String (file), ptsize, index);
   end Open_Font_Index;

   --  ====================================
   function Font_Face_Family_Name (font : Font_ptr) return String is
   begin
      return CS.Value (FontFaceFamilyName (font));
   end Font_Face_Family_Name;

   --  ====================================
   function Font_Face_Style_Name (font : Font_ptr) return String is
   begin
      return CS.Value (FontFaceStyleName (font));
   end Font_Face_Style_Name;

   --  ====================================
   function Size_Text (font : Font_ptr; text : String;
                       w, h : C.int) return C.int is
   begin
      return (SizeText (font, CS.New_String (text), w, h));
   end Size_Text;

   --  ====================================
   function Size_UTF8 (font : Font_ptr; text : String;
                       w, h : C.int) return C.int is
   begin
      return (SizeUTF8 (font, CS.New_String (text), w, h));
   end Size_UTF8;

   --  ====================================
   function Render_Text_Solid (font : Font_ptr; text : String;
                              fg : V.Color) return V.Surface_ptr is
   begin
      return RenderText_Solid (font, CS.New_String (text), fg);
   end Render_Text_Solid;

   --  ====================================
   function Render_UTF8_Solid (font : Font_ptr; text : String;
                              fg : V.Color) return V.Surface_ptr is
   begin
      return RenderUTF8_Solid (font, CS.New_String (text), fg);
   end Render_UTF8_Solid;

   --  ====================================
   function Render_Text_Shaded (font : Font_ptr; text : String;
                        fg : V.Color; bg : V.Color) return V.Surface_ptr is
   begin
      return RenderText_Shaded (font, CS.New_String (text), fg, bg);
   end Render_Text_Shaded;

   --  ====================================
   function Render_UTF8_Shaded (font : Font_ptr; text : String;
                        fg : V.Color; bg : V.Color) return V.Surface_ptr is
   begin
      return RenderUTF8_Shaded (font, CS.New_String (text), fg, bg);
   end Render_UTF8_Shaded;

   --  ====================================
   function Render_Text_Blended (font : Font_ptr; text : String;
                                fg : V.Color) return V.Surface is
   begin
      return RenderText_Blended (font, CS.New_String (text), fg);
   end Render_Text_Blended;

   --  ====================================
   function Render_UTF8_Blended (font : Font_ptr; text : String;
                                fg : V.Color) return V.Surface is
   begin
      return RenderUTF8_Blended (font, CS.New_String (text), fg);
   end Render_UTF8_Blended;

   --  ====================================
   procedure Set_Font_Style (font : Font_ptr; style : TTF_STYLE) is
   begin
      SetFontStyle (font, style);
   end Set_Font_Style;

end SDL_ttf;
