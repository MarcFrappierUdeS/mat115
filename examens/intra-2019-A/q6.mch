MACHINE q6
SETS	
  Personne={h1,h2,f1,f2,f3}
CONSTANTS
  Homme,Femme,Parent,BelleMere,BelleMere_alt
PROPERTIES
  Homme={h1,h2}
& Femme=Personne-Homme
& Parent = {(f1,f2),(h1,f2),(h1,h2),(h1,f3)}
& BelleMere = { x,y |
     x : Femme
   & #(z1,z2).
       (
          x |-> z2 : Parent
       & z1 |-> z2 : Parent
       & z1 /= x 
       & z1 |-> y : Parent
       & not(x |-> y : Parent )
       )
  }
& BelleMere_alt = Femme <| ((((Parent ; Parent~) -id(Personne));Parent) - Parent)
END
