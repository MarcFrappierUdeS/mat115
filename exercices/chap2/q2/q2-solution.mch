MACHINE ExerciceMathDiscrete_1
SETS	
 Personne={h1,h2,h3,h4,h5,f1,f2,f3,f4,f5,f6}
CONSTANTS
    NombrePair /* nombre pair entre 2 et 12 */
  , Facteur /* contient les facteurs du nombre 12 */
  , Premier /* contient l’ensemble des nombres premiers entre 2 et 12 */
  , PremierBis  /* définition alternative de Premier */
  , FacteurPremier /* contient les facteurs premiers de 12 */
  , s /* somme des éléments de Premier */
  , Homme /* ensemble des hommes */
  , Femme /* ensemble des femmes */
  , Pere  /* (x,y) : Pere ssi x est le père de y */
  , Mere  /* (x,y) : Mere ssi x est la mère de y */
  , Parent /* (x,y) : Parent ssi x est un parent de y */
  , Fraterie  /* (x,y) : Fraterie ssi x est un frère ou une soeur de y */
  , Fraterie2 /* Définition alternative de Fraterie, utilisant seulemnent des opérateurs sur les relations */
  , Papa  /* contient les personnes qui sont des pères */
  , Papa2 /* définition alternative de Papa */
  , Fils  /* x est un enfant de sexe masculin */
  , Conjoint /* (x,y) : Conjoint ssi x et y ont eu un enfant ensemble */
  , Conjoint2 /* définition alternative de Conjoint */
  , ConjointAsymétrique /* Une paire de personnes x,y n'apparait qu'une seule fois */
  , GrandParent  /* (x,y) : GrandParent ssi x est un grand-parent de y */
  , GrandParent2 /* définition alternative de GrandParent */
  , OrdrePersonne /* relation d'ordre sur les personnes pour éliminer les doublons dans ConjointAsymétrique */

PROPERTIES
    NombrePair = {x | x : 1..12 & x mod 2 = 0}
  & Homme={h1,h2,h3,h4,h5}
  & Femme={f1,f2,f3,f4,f5}
  & Pere={h1|->h2, h1|-> f2, h2|->h3}
  & Mere={f1|->h2, f1|->f2, f2|->h4, f4|->f6, f5|->f6}
  & Facteur =
      { x |
            x : 1..12
          & #(y).
              (
                y : 1..12
              & x*y=12
              )
      }
  & Premier =
      { x |
            x : 2..12
          & not
              (
                #(y).
                  (
                    y : 2..x-1
                  & x mod y = 0
                  )
              )
      }
  & PremierBis =
      { x |
            x : 2..12
          & not
              (
                #(y,z).
                  (
                    y:2..x-1
                  & z:2..x-1
                  & x=y*z
                  )
              )
      }
  & s = SIGMA(x).(x:Premier | x)
  & FacteurPremier = Facteur /\ Premier
  & Parent = Pere \/ Mere
  & Fraterie =
      { x,y |
          #(z).
            (
                z:Personne
              & z|->x : Parent
              & z|->y : Parent
              & x /= y
            )
      }
  & Fraterie2 = (Parent~ ; Parent) - id(Personne)
  & Papa = { x | #(y).( x|->y : Pere ) }
  & Papa2 = dom(Pere)
  & Fils = { x | x : Homme & #(y).(y|->x : (Pere \/ Mere)) }
  & Conjoint =
      { x,y |
          #(z).
            (
              x|->z : Parent
            & y|->z : Parent
            & x /= y
            )
      }
  & OrdrePersonne = {(h1,h2), (h2,h3), (h3,h4), (h4,h5), (h5,f1), (f1,f2), (f2,f3), (f3,f4), (f4,f5)}
  & ConjointAsymétrique = Conjoint /\ closure(OrdrePersonne)
  & Conjoint2 = 	((Parent ; Parent~) - id(Personne))
  & GrandParent =
      { x,y |
            x : Personne
          & y : Personne
          & #(z).
              (
                z : Personne
              & x|->z : Parent
              & z|->y : Parent
              )
      }
  & GrandParent2 = (Parent ; Parent)
  END

