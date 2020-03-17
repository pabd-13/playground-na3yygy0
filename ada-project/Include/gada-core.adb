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
   
   procedure Put_Err (Item : in String) is
   begin
      Txt.New_Line ;
      Txt.Put_Line(" -~-~-~-~-~-~-~- ERREUR ~-~-~-~-~-~-~-~-~ ") ;
      Txt.Put_Line(Item) ;
      Txt.Put_Line(" -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~ ") ;
      Txt.New_Line ;
   end Put_Err ;
      
   
   function FGet return String is
   begin
      Put_Err("Attention, appel à la fonction FGET, qui n'est pas disponible ici, sur tech.io.") ;
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
      Put_Err("Attention, appel à la fonction FGET, qui n'est pas disponible ici, sur tech.io.") ;
      raise Program_Error ;
      return 0 ;
   end FIGet ;

   procedure FPut (Item : in Float) is
   begin
      Txt.Put(Ada.Strings.Fixed.Trim(Float'Image(Item), Ada.Strings.Left)) ;
   end FPut ;
   
   
   function FFGet return Float is
   begin
      Put_Err("Attention, appel à la fonction FGET, qui n'est pas disponible ici, sur tech.io.") ;
      raise Program_Error ;
      return 0.0 ;
   end FFGet ;

   procedure Replace (Item : in String) is
   begin
      Txt.Put(Character'Val(13) & Item) ;
   end Replace ;

end GAda.Core ;
