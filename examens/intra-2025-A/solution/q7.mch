MACHINE Q7
SETS	

  Livre =  {c1,c2,c3,c4,c5}
; Membre = {m1,m2,m3,m4,m5}

CONSTANTS

  Pret        /* x ↦ y ∈ Pret ⇔ le livre x est prêté au membre y */
, Reservation /* x ↦ y ∈ Reservation ⇔ le livre x est réservé par
                 le membre y */
, Priorite    /* x ↦ y ∈ Priorite ⇔ le membre x a priorité sur le 
                 membre y quand ils réservent le même livre  */

/* Pour déterminer si le membre x est la première personne servie parmi
   les membres réservant un livre, on considère la fermeture transitive de
   la relation Priorite et si x ↦ y appartient a cette fermeture
   transitive,alors on dit que x empruntera le livre avant y */

, q1     /* x ∈ q1 ⇔ Le livre x n'est pas emprunté */
, q1_alt /* q1_alt = q1 */
, q2     /* x ↦ y ∈ q2 ⇔ Le livre x est emprunté et il est réservé par y */
, q2_alt /* q2_alt = q2 */
, q3_mix /* x ↦ y ∈ q3 ⇔ x est un livre réservé et y est le membre est
                le plus prioritaire parmi les membres qui ont réservé x */

PROPERTIES

/* Voici un exemple de valeurs pour Pret, Reservation et Priorite */ 

  Pret = { c1↦m1, c2↦m1, c3↦m2, c4↦m3 }
∧ Reservation = {c1↦m3, c1↦m4, c2↦m2, c2↦m5, c5↦m5}
∧ Priorite = { m1↦m2, m2↦m3, m3↦m4, m4↦m5 }

/* Voici un exemple de valeurs des constantes à définir pour
   les valeurs de Pret, Reservation et Priorite données ci-dessus */ 

∧ q1 = {c5}
∧ q1_alt = {c5}
∧ q2 = {(c1↦m3),(c1↦m4),(c2↦m2),(c2↦m5)}
∧ q2_alt = {(c1↦m3),(c1↦m4),(c2↦m2),(c2↦m5)}
∧ q3_mix = {c1↦m3,c2↦m2,c5↦m5}

/* solution */

∧ q1 = { x | x ∈ Livre ∧ ¬ (∃y.( x ↦ y ∈ Pret)) }
∧ q1_alt =  Livre - dom(Pret)
∧ q2 = { x,y |   x ∈ Livre ∧ y ∈ Membre
               ∧ ∃y.(x↦y ∈ Pret) ∧ x↦y ∈ Reservation } 
∧ q2_alt = dom(Pret) ◁ Reservation
∧ q3_mix = { x,y |  x ↦ y ∈ Reservation
                  ∧ ∀z.(  z ≠ y ∧ x ↦ z ∈ Reservation
                        ⇒
                          y ↦ z ∈ closure1(Priorite)) }
END