with Simulation ;
with Gada.Text_Io ;

package body Avion_Sol is


   procedure Rouler_Vers (Dest : Character) renames Simulation.Rouler_Vers ;

   procedure Parcourir_Piste renames Simulation.Parcourir_Piste ;


   procedure Freiner is
   begin
      Gada.Text_IO.Put_Line ("Freiner : ne pas utiliser sur tech-io.") ;
   end Freiner ;

   procedure Attendre_Entree is
   begin
      Gada.Text_IO.Put_Line ("Attendre_Entree : ne pas utiliser sur tech-io.") ;
   end Attendre_Entree ;


end Avion_Sol ;
