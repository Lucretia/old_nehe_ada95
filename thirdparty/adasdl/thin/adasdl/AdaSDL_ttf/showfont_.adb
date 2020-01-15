
with Ada.Command_Line;
with Ada.Characters.Handling;
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with GNAT.OS_Lib;
with SDL.Types;
with SDL.Video;
with SDL.Events;
with SDL.Error;
with SDL.Quit;
with SDL_ttf; use SDL_ttf;
with Interfaces.C.Strings;

procedure showfont is

   package CL renames Ada.Command_Line;
   package CH renames Ada.Characters.Handling;
   package Text_IO renames Ada.Text_IO;
   package US renames Ada.Strings.Unbounded;
   package  C renames Interfaces.C;
   use type C.int;
   use type C.size_t;
   package CS renames Interfaces.C.Strings;
   package  V renames SDL.Video;
   use type V.Surface_ptr;
   use type V.Surface_Flags;
   package Ev renames SDL.Events;
   package Er renames SDL.Error;
   package Ty renames SDL.Types;
   use type Ty.Uint16;
   use type Ty.Uint8;

   screen : V.Surface_ptr;
   font : Font_ptr;
   text, temp : V.Surface_ptr;
   ptsize : C.int;
   Argument_Index : Integer;
   done : boolean;
   rdiff, gdiff, bdiff : C.size_t;

   DEFAULT_PTSIZE : constant := 18;
   DEFAULT_TEXT : constant string :=
      "A raposa rápida e castanha saltou sobre o cão preguiçoso";
   NUM_COLORS : constant := 256;
   usage : constant string :=
                   "[-utf8|-unicode] [-b] [-i] [-u] [-fgcol r g b] " &
                   "[-bgcol r g b]  <font>.ttf [ptsize] [text]";
   colors : V.Colors_Array (0 .. NUM_COLORS - 1);
   white : constant V.Color_ptr := new V.Color'(16#FF#, 16#FF#, 16#FF#, 0);
   black : constant V.Color_ptr := new V.Color'(16#00#, 16#00#, 16#00#, 0);
   forecol : V.Color_ptr := white;
   backcol : V.Color_ptr := black;
   dstrect : V.Rect;
   event : Ev.Event;
   --  Look for special rendering types
   rendersolid : boolean := false;
   renderstyle : TTF_STYLE := TTF_STYLE_NORMAL;
   --  Look for special execution mode
   dump : boolean := false;
   type Render_Type is  (RENDER_LATIN1, RENDER_UTF8, RENDER_UNICODE);
   rendertype : Render_Type := RENDER_LATIN1;
   the_string : string (1 .. 127);
   type string_access is access string;
   message : string_access;
begin
   Argument_Index := 1;
   while (Argument_Index <= CL.Argument_Count)
         and then (CL.Argument (Argument_Index) (1) = '-') loop
      if CL.Argument (Argument_Index) = "-solid" then
         rendersolid := true;
      elsif CL.Argument (Argument_Index) = "-utf8" then
         rendertype := RENDER_UTF8;
      elsif CL.Argument (Argument_Index) = "-unicode" then
         rendertype := RENDER_UNICODE;
      elsif CL.Argument (Argument_Index) = "-b" then
         renderstyle := TTF_STYLE_BOLD;
      elsif CL.Argument (Argument_Index) = "-i" then
         renderstyle := TTF_STYLE_ITALIC;
      elsif CL.Argument (Argument_Index) = "-u" then
         renderstyle := TTF_STYLE_UNDERLINE;
      elsif CL.Argument (Argument_Index) = "-dump" then
         dump := true;
      elsif CL.Argument (Argument_Index) = "-fgcol" then
         if CL.Argument_Count >= Argument_Index + 3
               and then CH.Is_Digit (CL.Argument (Argument_Index + 1) (1))
               and then CH.Is_Digit (CL.Argument (Argument_Index + 2) (1))
               and then CH.Is_Digit (CL.Argument (Argument_Index + 3) (1)) then
            declare
               last : positive;
               package Uint8_IO is new Ada.Text_IO.Modular_IO (SDL.Types.Uint8);
            begin
               Argument_Index := Argument_Index + 1;
               Uint8_IO.Get (CL.Argument (Argument_Index), forecol.r, last);
               Argument_Index := Argument_Index + 1;
               Uint8_IO.Get (CL.Argument (Argument_Index), forecol.g, last);
               Argument_Index := Argument_Index + 1;
               Uint8_IO.Get (CL.Argument (Argument_Index), forecol.b, last);
            end;
         else
            Text_IO.Put_Line ("Usage: " & CL.Command_Name & " " & usage);
            GNAT.OS_Lib.OS_Exit (1);
         end if;
      elsif CL.Argument (Argument_Index) = "-bgcol" then
         if CL.Argument_Count >= Argument_Index + 3
               and then CH.Is_Digit (CL.Argument (Argument_Index + 1) (1))
               and then CH.Is_Digit (CL.Argument (Argument_Index + 2) (1))
               and then CH.Is_Digit (CL.Argument (Argument_Index + 3) (1)) then
            declare
               last : positive;
               package Uint8_IO is new Ada.Text_IO.Modular_IO (SDL.Types.Uint8);
            begin
               Argument_Index := Argument_Index + 1;
               Uint8_IO.Get (CL.Argument (Argument_Index), backcol.r, last);
               Argument_Index := Argument_Index + 1;
               Uint8_IO.Get (CL.Argument (Argument_Index), backcol.g, last);
               Argument_Index := Argument_Index + 1;
               Uint8_IO.Get (CL.Argument (Argument_Index), backcol.b, last);
            end;
         else
            Text_IO.Put_Line ("Usage: " & CL.Command_Name & " " & usage);
            GNAT.OS_Lib.OS_Exit (1);
         end if;
      end if;
      Argument_Index := Argument_Index + 1;
   end loop;

   --  Check usage
   if Argument_Index > CL.Argument_Count then
         Text_IO.Put_Line ("Usage: " & CL.Command_Name & " " & usage);
         --  Text_IO.Put_Line ("Argument_Index: " & Integer'image (Argument_Index));
         GNAT.OS_Lib.OS_Exit (1);
   end if;

   --  Initialize SDL
   if SDL.Init (SDL.INIT_VIDEO) < 0 then
      Text_IO.Put_Line ("Couldn't initialize SDL: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (2);
   end if;

   SDL.Quit.atexit (SDL.SDL_Quit'Access);

   --  Initialize the TTF library
   if Init < 0 then
      Text_IO.Put_Line ("Couldn't initialize TTF: " & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (2);
   end if;

   SDL.Quit.atexit (TTF_Quit'Access);

   --  Open the font file with the requested point size
   ptsize := 0;
   if Argument_Index + 1 <= CL.Argument_Count then
      declare
         last : positive;
         package int_IO is new Ada.Text_IO.Integer_IO (C.int);
      begin
         if CH.Is_Digit (CL.Argument (Argument_Index + 1) (1)) then
            int_IO.Get (CL.Argument (Argument_Index + 1), ptsize, last);
         else
            ptsize := DEFAULT_PTSIZE;
         end if;
      end;
   end if;

   if Argument_Index <= CL.Argument_Count then
      declare
         filename : US.Unbounded_String;
      begin
         filename := US.To_Unbounded_String (CL.Argument (Argument_Index));
         font := Open_Font (US.To_String (filename), ptsize);

         if font = null_Font_ptr then
            Text_IO.Put_Line ("Couldn't load " & C.int'Image (ptsize) &
                              " pt font from " & US.To_String (filename) &
                              ": " & Er.Get_Error);
            GNAT.OS_Lib.OS_Exit (2);
         end if;
      end;
   end if;

   Set_Font_Style (font, renderstyle);

   if dump then
      for i in Ty.Uint16 range 48 .. 122 loop
         declare
            glyph : V.Surface_ptr := V.null_Surface_ptr;
            type outname_Type is access string;
            outname : string := "glyph-" & Ty.Uint16'Image (i) & ".bmp";
         begin
            glyph := RenderGlyph_Shaded (font, i, forecol.all, backcol.all);
            if glyph /= null then
               V.Save_BMP (glyph, outname);
            end if;
         end;
      end loop;
      GNAT.OS_Lib.OS_Exit (0);
   end if;

   --  Set a 640x480x8 video mode
   screen := V.SetVideoMode (1024, 768, 32, V.SWSURFACE or V.FULLSCREEN);
   if screen = V.null_Surface_ptr then
      Text_IO.Put_Line ("Couldn't set : 1024x768x32" & Er.Get_Error);
      GNAT.OS_Lib.OS_Exit (2);
   end if;

   --  Set a palette thar is good for the foreground colored text
   rdiff := C.size_t (backcol.r - forecol.r);
   gdiff := C.size_t (backcol.g - forecol.g);
   bdiff := C.size_t (backcol.b - forecol.b);
   for i in C.size_t range 0 .. NUM_COLORS - 1 loop
      colors (i).r := forecol.r + Ty.Uint8 ((i * rdiff) / 4);
      colors (i).g := forecol.g + Ty.Uint8 ((i * gdiff) / 4);
      colors (i).b := forecol.b + Ty.Uint8 ((i * bdiff) / 4);
   end loop;
   V.Set_Colors (screen, colors);

   --  Clear de background to background color
   V.FillRect (screen, null,
              V.MapRGB (screen.format, backcol.r, backcol.g, backcol.b));
   V.UpdateRect (screen, 0, 0, 0, 0);

   --  Show which font file wr're looking at
   the_string := "Font file:" & CL.Command_Name;
   if rendersolid then
      text := Render_Text_Solid (font, the_string, forecol.all);
   else
      text := Render_Text_Shaded (font, the_string, forecol.all, backcol.all);
   end if;

   if text /= V.null_Surface_ptr then
      dstrect := (x => 4, y => 4,
                  w => Ty.Uint16 (text.w), h => Ty.Uint16 (text.h));
      V.BlitSurface (text, null, screen, dstrect);
      V.FreeSurface (text);
   end if;
end showfont;
