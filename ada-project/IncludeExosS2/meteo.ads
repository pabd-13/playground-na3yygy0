
package Meteo is
   
   -- Données méteo pour un mois.
   type T_Mois is record
      
      -- Temperature moyenne du mois en °C
      Temperature: Float ;
      
      -- Pluviométrie cumulée depuis le début de l'année, en mm.
      Pluvio_Cumulee: Float ;
	
      -- Nombre de jours de soleil pendant le mois
      Jours_Soleil: Integer ;
      
   end record ;
     
   -- Un tableau de plusieurs mois
   type T_Des_Mois is array(Integer range <>) of T_Mois ;
   
   type T_Donnees_Ville is record
      
      -- Le nom de la ville concernée, sur 15 caractères.
      Nom_Ville: String(1..15) ;
      
      -- Les données enregistrées sur une année.
      Annee: T_Des_Mois(1..12) ;      
      
   end record ;
   
   -- Type tableau pour conserver les données de plusieurs villes
   type T_Donnees is array(Integer range <>) of T_Donnees_Ville ;
   
   -- Cette fonction renvoie les données de quelques villes.
   --
   -- Les données sont fantaisistes. 
   -- Ne vous étonnez pas s'il fait 32 degrés en décembre ou -4 en août.
   function Lire_Donnees return T_Donnees ;
   
end Meteo ;

