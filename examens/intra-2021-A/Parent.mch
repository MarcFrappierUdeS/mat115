MACHINE Intra

/* Voici un commentaire */

SETS

  Personne={p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11}

CONSTANTS

/* Constantes initiales */

    Homme         /* Ensemble des personnes qui sont des hommes */
  , Femme         /* Ensemble des personnes qui sont des femmes */
  , Parent        /* (x,y) ∈ Parent ssi x est un parent de y */

/* Constantes à définir dans le devoir */

  , GrandPere         
  , GrandPere_alt     
  , PetitFilsCommun   
  , PetitFilsCommun_alt

PROPERTIES

/* Définition des constantes initiales */

  Homme={p0, p1, p4}
& Femme=Personne-Homme
& Parent={
           (p0,p1)
          ,(p0,p2)
          ,(p1,p3)
          ,(p1,p4)
          ,(p2,p5)
          ,(p2,p6)
          ,(p7,p3)
          ,(p7,p4)
          ,(p6,p8)
          ,(p4,p9)
          ,(p10,p7)
          ,(p11,p7)
         }

/* Définitions des constantes à compléter */

& GrandPere = ...

& GrandPere_alt = ...

& PetitFilsCommun = ...

& PetitFilsCommun_alt = ...

END
	