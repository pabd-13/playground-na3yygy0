--
-- Cet acteur permet d'accéder à une collection d'étudiants de l'INSA.
--
-- (Ne vous inquiétez pas : les données sont aléatoires.) 
--

package Etudiants is

   -- Chaque étudiant est identifié par un numéro entre 1 et N.
   -- N = nombre d'étudiants dans la collection

   -- Cardinal de l'ensemble, i.e. nombre d'étudiants présents dans la collection
   function Cardinal return Integer ;

   -- Renvoie le prénom de l'étudiant dont on fournit le numéro.
   function Prenom (No : Integer) return String ;

   -- Renvoie la taille en cm de l'étudiant
   function Taille (No : Integer) return Integer ;
   
end Etudiants ;

