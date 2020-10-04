with GAda.Core ;
with Gada.Text_IO ;

package body Etudiants is

   package Txt renames GAda.Text_IO ;

   -- Compte les appels pour prévenir les boucles infinies.
   Nb_Appels : Integer := 0 ;

   Max_Appels : constant Integer := 10000 ;

   procedure Compte_Appel is
   begin
      Nb_Appels := Nb_Appels + 1 ;
      if Nb_Appels > Max_Appels then
         raise Gada.Core.Boucle_Infinie ;
      end if ;
   end Compte_Appel ;

   type T_Info is record
      V1 : access String ;
      V2 : Integer ;
   end record ;

   type T_Objects is array(Integer range 1..153) of T_Info ;

   Objects : T_Objects :=
     ((new String'("Ana"), 159),
      (new String'("Florian"), 183),
      (new String'("Marie"), 171),
      (new String'("Paul"), 180),
      (new String'("Marina"), 169),
      (new String'("Damien"), 170),
      (new String'("Baptiste"), 203),
      (new String'("Laly"), 154),
      (new String'("Ghislain"), 154),
      (new String'("Sebastien"), 171),
      (new String'("Louis"), 156),
      (new String'("Justine"), 168),
      (new String'("Dayana"), 162),
      (new String'("Kévin"), 167),
      (new String'("Paul"), 179),
      (new String'("Quentin"), 192),
      (new String'("Adrien"), 195),
      (new String'("Alan"), 168),
      (new String'("Valentin"), 158),
      (new String'("Jon"), 193),
      (new String'("Luk"), 171),
      (new String'("Merlin"), 194),
      (new String'("Pablo"), 203),
      (new String'("Nicolas"), 187),
      (new String'("Zoe"), 195),
      (new String'("Jade"), 153),
      (new String'("Gaelle"), 184),
      (new String'("Clara"), 160),
      (new String'("Pauline"), 184),
      (new String'("Margot"), 167),
      (new String'("Keija"), 175),
      (new String'("Gwenael"), 171),
      (new String'("Nathan"), 154),
      (new String'("Thomas"), 156),
      (new String'("Elaine"), 178),
      (new String'("Boyu"), 202),
      (new String'("Anais"), 181),
      (new String'("Lea"), 170),
      (new String'("Theo"), 175),
      (new String'("Alejandra"), 168),
      (new String'("Nolwenn"), 195),
      (new String'("Kelian"), 199),
      (new String'("Alicia"), 184),
      (new String'("Clemence"), 198),
      (new String'("Mathilde"), 192),
      (new String'("Paul"), 151),
      (new String'("Sandra"), 160),
      (new String'("Ayoub"), 163),
      (new String'("Ulrich"), 166),
      (new String'("Mohammad"), 192),
      (new String'("Evan"), 189),
      (new String'("Johannes"), 172),
      (new String'("Tristan"), 158),
      (new String'("Jeremy"), 179),
      (new String'("Albin"), 177),
      (new String'("Meric"), 172),
      (new String'("Yohan"), 169),
      (new String'("Marie"), 191),
      (new String'("Lou"), 168),
      (new String'("Matthis"), 157),
      (new String'("Pierre"), 188),
      (new String'("Lorie"), 203),
      (new String'("Justine"), 173),
      (new String'("Melis"), 175),
      (new String'("Valentina"), 154),
      (new String'("Henry"), 184),
      (new String'("Victoria"), 163),
      (new String'("Maina"), 167),
      (new String'("Alban"), 194),
      (new String'("Cherine"), 161),
      (new String'("Alexandre"), 181),
      (new String'("Clement"), 171),
      (new String'("Tanguy"), 187),
      (new String'("Filip"), 167),
      (new String'("Emma"), 172),
      (new String'("Kilian"), 173),
      (new String'("Clement"), 167),
      (new String'("Asmun"), 176),
      (new String'("Laurane"), 187),
      (new String'("Laura"), 167),
      (new String'("Lou"), 178),
      (new String'("Hugo"), 168),
      (new String'("Tessa"), 203),
      (new String'("Pascal"), 172),
      (new String'("Quentin"), 171),
      (new String'("Tom"), 181),
      (new String'("Jonathan"), 174),
      (new String'("Remi"), 189),
      (new String'("Alexandre"), 173),
      (new String'("Aisha"), 164),
      (new String'("Raphael"), 163),
      (new String'("Margot"), 197),
      (new String'("Hugo"), 159),
      (new String'("Titouan"), 176),
      (new String'("Leandre"), 172),
      (new String'("Yanina"), 185),
      (new String'("Thomas"), 171),
      (new String'("Lauriane"), 189),
      (new String'("Lakshitaa"), 160),
      (new String'("Maeva"), 167),
      (new String'("Justin"), 162),
      (new String'("Eliot"), 170),
      (new String'("Angel"), 169),
      (new String'("Thomas"), 172),
      (new String'("Joris"), 174),
      (new String'("Emily"), 204),
      (new String'("Eloise"), 152),
      (new String'("Laurine"), 181),
      (new String'("Romain"), 187),
      (new String'("Remi"), 169),
      (new String'("Elsa"), 152),
      (new String'("Nathan"), 153),
      (new String'("Sandra"), 185),
      (new String'("Emma"), 151),
      (new String'("Maxime"), 158),
      (new String'("Benjamin"), 164),
      (new String'("Matthieu"), 170),
      (new String'("Valentine"), 157),
      (new String'("Dorian"), 166),
      (new String'("Junlin"), 196),
      (new String'("Manon"), 164),
      (new String'("Lucas"), 195),
      (new String'("Titouan"), 160),
      (new String'("Nathan"), 203),
      (new String'("Elsa"), 186),
      (new String'("Hiba"), 152),
      (new String'("Yannis"), 166),
      (new String'("Heloise"), 197),
      (new String'("Emile"), 194),
      (new String'("Gabriel"), 154),
      (new String'("Emilie"), 181),
      (new String'("Marie"), 156),
      (new String'("Pablo"), 170),
      (new String'("Romain"), 181),
      (new String'("Leo"), 172),
      (new String'("Maxime"), 199),
      (new String'("Valentin"), 155),
      (new String'("Sylvain"), 160),
      (new String'("Florian"), 200),
      (new String'("Sami"), 163),
      (new String'("Paul"), 175),
      (new String'("Moad"), 153),
      (new String'("Antonin"), 204),
      (new String'("Aya"), 182),
      (new String'("Celia"), 153),
      (new String'("Paul"), 187),
      (new String'("Karine"), 156),
      (new String'("Alexandra"), 169),
      (new String'("Perrine"), 200),
      (new String'("Mathias"), 187),
      (new String'("Matthieu"), 166),
      (new String'("Maixent"), 190),
      (new String'("Emma"), 183)
     ) ;
   
   function Nb_Objects return Integer is
   begin
      Compte_Appel ;
      return Objects'Length ;
   end Nb_Objects ;

   function Cardinal return Integer renames Nb_Objects ;

   procedure Check_Range (No : Integer ; Msg : String) is
   begin
      Compte_Appel ;
      if No not in Objects'Range then
         -- CHANGE (message d'erreur)
         GAda.Core.Put_Err("ERREUR : Appel de " & Msg & " avec un numéro d'étudiant égal à " & Integer'Image(No) &
			     " alors que les étudiants sont numérotés de 1 à " & Integer'Image(Nb_Objects)) ;
         raise Program_Error ;
      end if ;
   end Check_Range ;

   function Taille (No : Integer) return Integer is
   begin
      Check_Range(No, "Taille") ;
      return Objects(No).V2 ;
   end Taille ;
   
   function Prenom (No : Integer) return String is
   begin
      Check_Range(No, "Prenom") ;
      return " " & Objects(No).V1.all & " " ;
   end Prenom ;

end Etudiants ;

