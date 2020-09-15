with Passimu ;
with Gada.Text_IO ;
with Gada.Core ;
with Ada.Characters.Handling ;

package body Simulation is

   package Txt renames GAda.Text_IO ;

   --
   -- Le codage s'appuie sur un automate
   --

   Fatal_Error : exception ;

   procedure Failwith(Msg : String) is
   begin
      GAda.Core.Put_Err ("  " & Msg & " Arrêt immédiat de la simulation.") ;
      raise Fatal_Error ;
   end Failwith ;

   procedure Temporisation(N : Integer ; T : Duration := 0.1) is
   begin
      for I in 1..N loop
         Txt.Put(".") ;
         delay(T) ;
      end loop ;
   end Temporisation ;

   Position : Character := 'K' ;
   Autorisation_Roulage : Boolean := False ;
   Autorisation_Decollage : Boolean := False ;

   Piste_Traversee : Boolean := False ;

   procedure Deplacement (Dest : Character ; Tempo : Integer := 0) is
      TempoD : Integer := 3 + (Character'Pos(Dest) mod 3) ;
   begin
      Passimu.Simu ;
      Txt.Put ("Déplacement vers le point " & Dest) ;
      if Tempo = 0 then Temporisation (TempoD) ;
      else Temporisation (Tempo) ;
      end if ;
      Position := Dest ;
      Txt.Put_Line ("ok") ;
   end Deplacement ;

   procedure Sortie_De_Route (Dest : Character) is
   begin
      Txt.Put ("Déplacement vers le point " & Dest) ;
      Temporisation (6) ;
      Failwith ("L'avion est sorti de la route prévue.") ;
   end Sortie_De_Route ;

   procedure Attendre_Autorisation_Roulage is
   begin
      Passimu.Simu ;
      Txt.Put ("Demande d'autorisation de roulage") ;
      if Autorisation_Roulage then
         Failwith ("Autorisation de roulage déjà accordée.") ;
      else
         case Position is
            when 'K' =>
               Temporisation (5) ;
               Txt.Put_Line ("accordée.") ;
               Autorisation_Roulage := True ;
            when others => Failwith ("Où est Charlie ?") ;
         end case ;
      end if ;
   end Attendre_Autorisation_Roulage ;


   procedure Parcourir_Piste is
   begin
      Passimu.Simu ;
      if Autorisation_Decollage then
         case Position is
            when 'A' =>
               Txt.Put ("Début du parcours complet de la piste 14R") ;
               Temporisation (3) ;
               Txt.New_Line ;
               Txt.Put ("Accélération") ;
               Temporisation (32, 0.05) ;
               Txt.New_Line ;
               Txt.Put ("Freinage") ;
               Temporisation (4) ;
               Txt.New_Line ;
               Txt.Put ("Arrivée en fin de piste : point D") ;
               Position := 'D' ;
               Txt.New_Line ;
               Autorisation_Decollage := False ;
               Piste_Traversee := True ;
            when others => Failwith ("Impossible de parcourir la piste : l'avion n'est pas en début de piste.") ;
         end case ;
      else
         Failwith ("Impossible de parcourir la piste : L'autorisation de décollage n'a pas été demandée.") ;
      end if ;
   end Parcourir_Piste ;

   procedure Rouler_Vers (Dest : Character) is
      CDest : Character := Ada.Characters.Handling.To_Upper (Dest) ;
   begin
      Passimu.Simu ;
      if CDest = Position then Deplacement (CDest, 1) ;
      else
         case Position is
            when 'K' =>
               if Autorisation_Roulage then
                  case CDest is
                     when 'L' => Deplacement (CDest) ;
                     when others => Sortie_De_Route (CDest) ;
                  end case ;
               else
                  Failwith ("Déplacement vers le point " & CDest &
                            " interdit : l'autorisation de roulage n'a pas été demandée.") ;
               end if ;

            when 'L' =>
               case CDest is
                  when 'M' => Deplacement (CDest) ;
                  when 'K' =>
                     Deplacement (CDest) ;
                     Autorisation_Roulage := False ;
                     if Piste_Traversee then
                        Txt.New_Line ;
                        Txt.Put_Line ("Le test s'est déroulé avec succès.") ;
                     end if ;
                  when others => Sortie_De_Route (CDest) ;
               end case ;

            when 'M' =>
               case CDest is
                  when 'H'|'G'|'F'|'E'|'L' => Deplacement (CDest) ;
                  when others => Sortie_De_Route (CDest) ;
               end case ;

            when 'H' =>
               case CDest is
                  when 'G'|'F'|'E' => Deplacement (CDest) ;
                  when others => Sortie_De_Route (CDest) ;
               end case ;

            when 'G' =>
               case CDest is
                  when 'F'|'E' => Deplacement (CDest) ;
                  when others => Sortie_De_Route (CDest) ;
               end case ;

            when 'F' =>               case CDest is
                  when 'E' => Deplacement (CDest) ;
                  when others => Sortie_De_Route (CDest) ;
               end case ;

            when 'E' =>
               case CDest is
                  when 'A' => Deplacement (CDest) ;
                  when others => Sortie_De_Route (CDest) ;
               end case ;

            when 'A' =>
               case CDest is
                  when 'D' =>
                     if Autorisation_Decollage then
                        Deplacement (CDest, 44) ;
                        Autorisation_Decollage := False ;
                        Piste_Traversee := True ;
                     else
                        Failwith ("Impossible d'avancer sur la piste : l'autorisation de décollage n'a pas été demandée.") ;
                     end if ;
                  when others => Sortie_De_Route (CDest) ;
               end case ;

            when 'D' =>
               case CDest is
                  when 'N' => Deplacement (CDest) ;
                  when others => Sortie_De_Route (CDest) ;
               end case ;

            when 'N' =>
               case CDest is
                  when 'P'|'R'|'S'|'T'|'M'|'H'|'G'|'F'|'E' => Deplacement (CDest) ;
                  when others => Sortie_De_Route (CDest) ;
               end case ;

            when 'P' =>
               case CDest is
                  when 'R'|'S'|'T'|'M'|'H'|'G'|'F'|'E' => Deplacement (CDest) ;
                  when others => Sortie_De_Route (CDest) ;
               end case ;

            when 'R' =>
               case CDest is
                  when 'S'|'T'|'M'|'H'|'G'|'F'|'E' => Deplacement (CDest) ;
                  when others => Sortie_De_Route (CDest) ;
               end case ;

            when 'S' =>
               case CDest is
                  when 'T'|'M'|'H'|'G'|'F'|'E' => Deplacement (CDest) ;
                  when others => Sortie_De_Route (CDest) ;
               end case ;

            when 'T' =>
               case CDest is
                  when 'M'|'H'|'G'|'F'|'E' => Deplacement (CDest) ;
                  when others => Sortie_De_Route (CDest) ;
               end case ;

            when others => Failwith ("Mais où donc est Charlie ???") ;

         end case ;
      end if ;
   end Rouler_Vers ;


   procedure Attendre_Autorisation_Decollage is
   begin
      Passimu.Simu ;
      Txt.Put ("Demande d'autorisation de décollage") ;
      case Position is
         when 'A' =>
            if Autorisation_Decollage then
               Failwith ("Autorisation de décollage déjà accordée") ;
            else
               Temporisation (8) ;
               Txt.Put_Line ("accordée.") ;
               Autorisation_Decollage := True ;
            end if ;
         when others => Failwith ("L'avion n'est pas en position pour demander l'autorisation de décollage (point A).") ;
      end case ;
   end Attendre_Autorisation_Decollage ;


end Simulation ;
