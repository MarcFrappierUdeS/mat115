MACHINE q6
SETS	
  Personne={h1,h2,h3,h4,h5,h6,h7,f0,f1,f2}

CONSTANTS
  Homme,Femme,Parent,DemiFrere,GrandOncle

PROPERTIES
  Homme={h1,h2,h3,h4,h5,h6,h7}
& Femme=Personne-Homme
& Parent = {(f0,h2), (f0,f1), (h1,h2), (h1,f1), (h3,h5),
            (f1,h5), (f1,h6), (f1,f2), (h4,h6), (h4,f2), (h5,h7)}
& DemiFrere =
    { (x,y) |
          x : Homme
        & x /= y
        & #z1.
            (
              (z1,x) : Parent
            & (z1,y) : Parent
            & not(
                #z2.(
                      z1 /= z2
                    & (z2,x) : Parent
                    & (z2,y) : Parent
                    )
                 )
            )
    }
& GrandOncle = Homme <| (((Parent~;Parent)-id(Personne));Parent;Parent)
END

