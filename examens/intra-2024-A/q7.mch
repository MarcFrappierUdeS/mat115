MACHINE Q7
SETS	

  Cours = {c1,c2,c3,c4,c5}
; Etudiant = {e1,e2,e3,e4}
; Salle = {s1,s2,s3,s4}
; Plage = {p1,p2,p3,p4}
; Prof = {m1,m2}


CONSTANTS

  Inscrit    /* x ↦ y ∈ Inscrit ⇔ l'étudiant x est inscrit au cours y  */
, Prealable  /* x ↦ y ∈ Prealable ⇔ le cours x est préalable au cours y */
, Horaire    /* x ↦ (y ↦ z) ∈ Horaire ⇔ le cours x a lieu dans la salle y
                            à la plage horaire z */
, Réussi     /* x ↦ y ∈ Réussi ⇔ l'étudiant x a réussi le cours y */
, Enseigne   /* x ↦ y ∈ Enseigne ⇔ le professeur x enseigne le cours y */

, q1         /* x ↦ y ∈ q1 ⇔ x n'a pas réussi ni n'est inscrit au cours y,
                             et x peut s'inscrire au cours y
                             car il a réussi tous les préalables de y */
, q2         /* x ∈ q2 ⇔ x est un cours que personne n'a réussi et
                         auquel personne n'est inscrit */
, q2_alt
, q3         /* x ↦ y ∈ q3 ⇔ x et y sont inscrits aux mêmes cours  */
, q4_alt     /* x ↦ y ∈ q4 ⇔ x et y sont inscrit à au moins un cours
                             ensemble  */
, q5         /* x ∈ q5 ⇔ x est inscrit à au moins deux cours qui se donnent
                         à la même plage horaire  */
, q6_alt     /* x ↦ y ∈ q6 ⇔ x n'est inscrit à aucun cours donné par
                             le professeur y */

PROPERTIES

  Inscrit = { e1↦c3, e1↦c4, e2↦c3, e2↦c4, e3↦c1, e4↦c2, e4↦ c1 }
∧ Prealable = {c1↦c3, c2↦c3, c3↦c4}
∧ Horaire = { c1↦(s1↦p1), c2↦(s1↦p2), c3↦(s2↦p1), c4↦(s3↦p1) }
∧ Réussi = { e1↦c1, e1↦c2, e2↦c1, e2↦c2, e3↦c3 }
∧ Enseigne = { m1↦c1, m2↦c2, m2↦c3 }

∧ q1 = {e1↦c5, e2↦c5, e3↦c2, e3↦c4, e3↦c5, e4↦c5}
∧ q2 = {c5}
∧ q2_alt = {c5}
∧ q3 = {e1↦e2, e2↦e1}
∧ q4_alt = {e1↦e2, e2↦e1, e3↦e4, e4↦e3}
∧ q5 = {e1, e2}
∧ q6_alt = { e1↦m1, e2↦m1 , e3↦m2 }

∧ q1 = { x,y |   ¬ ((x,y) ∈ Inscrit ∪ Réussi)
               ∧ ∀z.(z∈Cours ∧ (z,y) ∈ Prealable ⇒ (x,z) ∈ Réussi) }
∧ q2 = { x |   x ∈ Cours
             ∧ ¬(∃y.( y ∈ Etudiant ∧ ((y,x) ∈ Réussi ∨ (y,x) ∈ Inscrit ))) }
∧ q2_alt = Cours - ran(Réussi) - ran(Inscrit)
∧ q3 = { x,y | x ≠ y ∧ ∀z.( z ∈ Cours ⇒ ( (x,z) ∈ Inscrit ⇔ (y,z) ∈ Inscrit) ) }
∧ q4_alt = (Inscrit ; Inscrit⁻¹) - id(Etudiant)
∧ q5 = { x | ∃(u1,u2,y1,z1,y2).
              ( u1 ≠ u2 ∧ y1 ≠ y2 ∧ (x,u1) ∈ Inscrit ∧ (x,u2) ∈ Inscrit
              ∧ (u1,(y1,z1)) ∈ Horaire ∧ (u2,(y2,z1)) ∈ Horaire
              ) }
∧ q6_alt = Etudiant * Prof - (Inscrit;Enseigne⁻¹)

END





