package DFloat is
   
   -- Convertit un float en chaîne de caractères, comme Float'Image, mais en notation décimale sans exposant.
   -- Decimales indique le nombre de chiffres après la virgule. C'est 3 par défaut.
   --
   -- Utilisation : DFloat.Image(X)          -- 3 décimales
   --
   --          ou : DFloat.Image(X, 2)       -- 2 décimales
   --
   function Image ( Aff : Float ; Decimales : Positive := 3) return String ;
   
   
   -- Merci à Maître Pinel.
   
end DFloat ;

