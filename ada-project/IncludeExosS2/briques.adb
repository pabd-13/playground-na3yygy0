
package body Briques is
   
   function Build_ITab (N : Integer ; L : Integer) return T_Tab is
      ITab : T_Tab(1..L) ;
   begin
      
      for I in ITab'Range loop
	 ITab(I) := 700 + I * N ;
      end loop ;
      
      return ITab ;
   end Build_Itab ;
   
   
   function Build_Rec (N : Integer) return T_Rec is      
      S : Integer := N mod 197 ;
   begin
      return ( Alpha => (S * S * S) mod 1000,
	       Beta  => (31 + S * S * S * S) mod 2000,
	       Gamma => T_Indication'Val( (11 + S) mod (1 + T_Indication'Pos((T_Indication'Last)))),
	       Mu    => (S mod 2 = 0),
	       Sigma => Build_Itab(S, 20) ) ;
   end Build_Rec ;
   
   function Build_Mat (L,C,N : Integer) return T_Mat is
      Mat : T_Mat(1..L,1..C) ;
   begin
      for Y in Mat'Range(1) loop
	 for X in Mat'Range(2) loop
	    Mat(Y,X) := Build_Rec(X * 51 + Y * 17 + N * 5) ;
	 end loop ;
      end loop ;
      
      return Mat ;
   end Build_Mat ;
   
   function Build_Zok(N : Integer) return T_Zok is
      X : Integer := N mod 103 ;
   begin
      return ( Phi => Build_Mat(12,8,X),
	       Psi => Build_Rec(X*X*X-971),	    
	       Eta => Build_Itab(X*X+31, 15) ) ;
   end Build_Zok ;
   
   function Build_Tik(N,I : Integer) return T_Tik is
      Tab : T_Tik(1..I) ;
   begin
      for X in Tab'Range loop
	 Tab(X) := Build_Zok(X * 3 + N*N-81) ;
      end loop ;
      
      return Tab ;
   end Build_Tik ;
   
   function Build_Muk(N,I : Integer) return T_Muk is
      Muk : T_Muk(1..I) ;
   begin
      for X in Muk'Range loop
	 Muk(X) := Build_Tik(X * N + 18,8) ;
      end loop ;
      
      return Muk ;
   end Build_Muk ;
   
begin
      
   Rek := Build_Rec(51) ;   
   Zuk := Build_Zok(63) ;   
   Bat := Build_Muk(71,14) ;
   
end Briques ;
