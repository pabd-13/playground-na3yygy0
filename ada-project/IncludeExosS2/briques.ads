--
-- Structures imbriquées plus ou moins arbitraires.
--
package Briques is   
--!hide!--
   -- Ignorez cette ligne.
   pragma Elaborate_Body ;
--!e!--
   
   --
   -- Des types imbriqués
   --
   type T_Indication is (Ailleurs, Ici, Autour, Cette_Colonne, Cette_Ligne) ;
   
   type T_Tab is array(Integer range <>) of Integer ;
   
   type T_Rec is record
      Alpha : Integer ;
      Beta  : Integer ;
      Gamma : T_Indication ;
      Mu    : Boolean ;	
      Sigma : T_Tab (1..20) ;
   end record ;
   
   type T_Mat is array(Integer range <>, Integer range <>) of T_Rec ;
   
   type T_Zok is record
      Phi: T_Mat(1..12, 1..8) ;
      Psi: T_Rec ;
      Eta: T_Tab(1..15) ;
   end record ;
   
   type T_Tik is array(Integer range <>) of T_Zok ;
   
   type T_Muk is array(Integer range <>) of T_Tik(1..8) ;
   
      
   -- Quelques variables
   -- Elles sont initialisées dans l'acteur (le code n'apparaît pas ici).
   
   Rek : T_Rec ;
   
   Zuk : T_Zok ;
   
   Bat : T_Muk(1..14) ;
          
end Briques ;
