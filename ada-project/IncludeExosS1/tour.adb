with Simulation ;
with Gada.Text_Io ;

package body Tour is
   
   procedure Attendre_Autorisation_Roulage renames Simulation.Attendre_Autorisation_Roulage ;

   procedure Attendre_Autorisation_Decollage renames Simulation.Attendre_Autorisation_Decollage ;

   procedure Attendre_Autorisation_Atterrissage is
   begin
      Gada.Text_IO.Put_Line ("Autorisation Atterrissage : ne pas utiliser sur tech-io.") ;
   end Attendre_Autorisation_Atterrissage ;

   
end Tour ;
