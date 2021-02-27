with Ada.Text_IO ;
with Ada.Strings.Fixed ;
with Dfloat ;
use Dfloat ;

package body Meteo is
   
   package Txt renames Ada.Text_Io ;
   
   type T_Names is array(Integer range <>) of access String ;
   
   function Normalise (X : String ; N : Integer) return String is
      Result : String(1..N) ;
   begin
      Ada.Strings.Fixed.Move(Source => X,
                             Target => Result,
                             Drop => Ada.Strings.Right,
                             Justify => Ada.Strings.Left) ;
      return Result ;
   end Normalise ;

   
   function Get_Seed(S : String) return Integer is
      X : Integer := 0 ;
   begin
      for I in S'Range loop
	 X := ((X + 17) * Character'Pos(S(I))) mod 1000000 ;
      end loop ;

      return X ;
   end Get_Seed ;
   
   function Random(Seed : Integer ; Min, Max : Integer) return Integer is
      W : Integer := Max - Min + 1 ;
      X : Integer := ((Seed + W) * 17 mod 1000) * Seed ;
   begin
      return Min + (X mod W) ;
   end Random ;
   
   function Get_Mois(Seed,I: Integer) return T_Mois is
      Seed2: Integer := (Seed * 31 + I * 976) mod 1000000 ;
      T: Float := Float(Random(Seed2,-100,390)) * 0.1 ;
      P: Float := Float(Random(Seed2+1,0,1500)) * 0.1 ;
      J: Integer := Random(Seed2+2,0,28) ;
   begin      
      return (T,P,J) ;      
   end Get_Mois ;
   
   procedure Show(S : String ; I : Integer ; Mois : T_Mois) is
      
      T : String := Image ( Mois.Temperature ) ;
      P : String := Image ( Mois.Pluvio_Cumulee ) ;
      J : String := Integer'Image( Mois.Jours_Soleil ) ;
      
   begin
      Txt.Put_Line(S & "   " & Integer'Image(I) & " => (" & T & ", " & P & ", " & J & ")") ;
   end Show ;
   
   function Map_Name(Name : String) return T_Donnees_Ville is
      Seed : Integer := Get_Seed(Name) ;
      Fullname : String := Normalise(Name, 15) ;
      Annee : T_Des_Mois(1..12) ;
   begin
      -- Txt.Put_Line(Fullname & " : seed = " & Integer'Image(Seed)) ;      
      
      for I in Annee'Range loop
	 Annee(I) := Get_Mois(Seed,I) ;
      end loop ;
      
      -- Transforme en cumul
      for I in Annee'First+1 .. Annee'Last loop
	 Annee(I).Pluvio_Cumulee := Annee(I).Pluvio_Cumulee + Annee(I-1).Pluvio_Cumulee ;
	 
	 -- Show(Fullname, I,Annee(I)) ;
      end loop ;     
      
      return ( Nom_Ville => Fullname, Annee => Annee) ;
   end Map_Name ;
   
   function Lire_Donnees return T_Donnees is
      Names : T_Names := ( new String'("Toulouse"),
			   new String'("Strasbourg"),
			   new String'("Marseille"),
			   new String'("Toulon"),
			   new String'("Brest"),
			   new String'("Rennes"),
			   new String'("Reims"),
			   new String'("Nice"),
			   new String'("Paris"),
			   new String'("Lille"),
			   new String'("Dunkerque"),
			   new String'("Le Mans"),
			   new String'("Bordeaux"),
			   new String'("Agen"),
			   new String'("Albi"),
			   new String'("Rodez"),
			   new String'("Limoges")
			 ) ;
      
      Res : T_Donnees(1..Names'Length) ;
   begin
      for I in Res'Range loop
	 Res(I) := Map_Name(Names(Names'First + I - 1).all) ;
      end loop ;
      
      return Res ;
   end Lire_Donnees ;
   
end Meteo ;
