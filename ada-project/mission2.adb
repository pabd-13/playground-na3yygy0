with Gada.Text_IO ;
with Gada.Core ;

procedure Mission3 is

   package Txt renames GAda.Text_IO ;

begin

   Txt.Put_Line("Line 1") ;
   Txt.Put("Line 2") ;
   Txt.Replace("Bla bla 2") ;
   Gada.core.Put_Err("Line 3") ;

end Mission3 ;
