with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO ;
with Ada.Strings.Fixed ;

package body GAda.Core is
   
   package Txt renames Ada.Text_IO ;
      
   procedure Put (Item : in String) is
   begin
      Txt.Put(Item) ;
   end Put ;
	
   procedure Put_Line (Item : in String) is
   begin
      Txt.Put_Line(Item) ;
   end Put_Line ;
   
   procedure New_Line is
   begin
      Txt.Put_Line("") ;
   end New_Line ;
   
   Esc : Character := Character'Val(27) ;
   BRed : String := Esc & "[31m" & Esc & "[1m";
   Std : String := Esc & "[0m" ;
   
   procedure Put_Errn (Item1, Item2, Item3 : in String) is
   begin
      Txt.New_Line ;
      Txt.New_Line ;
      Txt.Put_Line(BRed & " -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~  ERREUR  ~-~-~-~-~-~-~-~-~~-~-~-~-~-~-~-~-~--~-~-~-~-~ ") ;
      Txt.Put_Line(BRed & "    " & Item1) ;
      if Item2'Length > 0 then Txt.Put_Line(BRed & "    " & Item2) ; end if ;
      if Item3'Length > 0 then Txt.Put_Line(BRed & "    " & Item3) ; end if ;
      Txt.Put_Line(BRed & " -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~ " & Std) ;
      Txt.New_Line ;
      Txt.New_Line ;
   end Put_Errn ;
   
   procedure Put_Err (Item : in String) is
   begin
      Put_Errn(Item, "", "") ;
   end Put_Err ;

   
   function FGet return String is
   begin
      Put_Errn("Attention, appel à la fonction FGET, qui n'est pas disponible ici, sur tech.io.",
	       "Remplacez l'appel à FGET par une valeur,  par exemple ""John"".", "") ;
      raise Program_Error ;
      return "" ;
   end FGet ;

   procedure Get (Item : out String) is
   begin      
      Put_Err("Attention, appel à la procédure GET, qui n'est pas disponible ici, sur tech.io.") ;
      if False then Item := "" ; end if ;
      raise Program_Error ;
   end Get ;

   procedure Put (Aff : in Character) is
   begin
      Txt.Put("" & Aff) ;
   end Put ;
   
   procedure Put_Line(Aff : in Character) is
   begin
      Txt.Put_Line("" & Aff) ;
   end Put_Line ;

   procedure IPut(Item : Integer) is
   begin
      Txt.Put(Ada.Strings.Fixed.Trim(Integer'Image(Item), Ada.Strings.Left)) ;
   end IPut ;

   function FIGet return Integer is
   begin
      Put_Errn("Attention, appel à la fonction FGET, qui n'est pas disponible ici, sur tech.io.",
	       "Remplacez l'appel à FGET par une valeur,  par exemple 12.", "") ;
      raise Program_Error ;
      return 0 ;
   end FIGet ;

   procedure FPut (Item : in Float) is
   begin
      Txt.Put(Ada.Strings.Fixed.Trim(Float'Image(Item), Ada.Strings.Left)) ;
   end FPut ;
   
   
   function FFGet return Float is
   begin
      Put_Errn("Attention, appel à la fonction FGET, qui n'est pas disponible ici, sur tech.io.",
	       "Remplacez l'appel à FGET par une valeur,  par exemple 4.35", "") ;
      raise Program_Error ;
      return 0.0 ;
   end FFGet ;

   procedure Replace (Item : in String) is
   begin
      Txt.Put(Character'Val(13) & Item) ;
   end Replace ;

end GAda.Core ;
