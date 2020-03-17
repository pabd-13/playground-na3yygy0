package GAda.Core is

   -- Affiche le message sans passer à la ligne
   procedure Put (Item : in String) ;

   -- Affiche le message et passe à la ligne
   procedure Put_Line (Item : in String) ;

   -- Passe à la ligne
   procedure New_Line ;

   -- Lit et retourne une chaîne
   function FGet return String ;

   -- Lit une chaîne (version originale)
   procedure Get (Item : out String) ;

   -- Pour les caractères
   procedure Put (Aff : in Character) ;
   procedure Put_Line(Aff : in Character) ;

   -- Pour les entiers
   procedure IPut (Item : in Integer) ;
   function FIGet return Integer ;

   -- Pour les réels
   procedure FPut (Item : in Float) ;
   function FFGet return Float ;

   -- Pour les erreurs
   procedure Put_Err (Item : in String) ;

   procedure Replace (Item : in String) ;

end GAda.Core ;

