with Ada.Text_IO; use Ada.Text_IO;
--with Ada.Integer_Text_IO; use Ada.Integer_Text_IO; -- décommenter si nécessaire pour les affichages de mise au point
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package body DFloat is
   
   function Image ( Aff : Float ; Decimales : Positive := 3) return String is
          function signe_moins_eventuel (flottant_a_traiter : float) return natural is
      begin
	 if flottant_a_traiter < 0.0
	 then return 1;
	 else return 0;
	 end if;
      end signe_moins_eventuel;


      function nb_chiffres_partie_entiere (flottant_positif_a_traiter : float) return positive is
      begin
	 if flottant_positif_a_traiter < 10.0
	 then return 1;
	 else return 1 + nb_chiffres_partie_entiere (flottant_positif_a_traiter / 10.0);
	 end if;
      end nb_chiffres_partie_entiere;

      espace_initial : constant := 1; -- pour éviter un LAYOUT_ERROR lors de l'élaboration de la chaîne
				      -- correspondant à un nombre du type 9999.9999.... (-> "10000.0000")
      point_decimal : constant := 1;  -- le point décimal occupe un espace dans la chaîne renvoyée

      longueur_chaine : constant integer
	:= espace_initial
	+ signe_moins_eventuel (Aff)
	+ nb_chiffres_partie_entiere (abs(Aff))
	+ point_decimal
	+ Decimales;
      
      chaine_resultante : string (1..longueur_chaine);
      error_string : string (1..longueur_chaine) := (others => '*');
   begin
      -- Décommenter les deux lignes suivantes si nécessaire pour mise au point
      -- put_line ("nb_chiffres_partie_entiere =" & integer'image (nb_chiffres_partie_entiere (flottant_a_traiter)));
      -- put_line ("longueur_chaine =" & integer'image (longueur_chaine));
      
      put (to => chaine_resultante, item => Aff, aft => decimales, exp => 0);
      return chaine_resultante;
      
   exception  -- Au cas où quelque chose se passerait mal
      when LAYOUT_ERROR => return error_string;
      when others => return ("Erreur inattendue dans float_image, à signaler à l'enseignant !!!");
   end Image ;
   
end DFloat ;
