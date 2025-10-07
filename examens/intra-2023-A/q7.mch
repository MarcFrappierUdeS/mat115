MACHINE Q7
SETS	

  Livre = {l1,l2,l3,l4}
; Membre = {m1,m2,m3,m4}
; Personne = {p1,p2,p3,p4} 

CONSTANTS

  Auteur /* x ↦ y ∈ Auteur ⇔ la personne y est l'auteur du livre x  */
, Pret   /* x ↦ y ∈ Pret   ⇔ le membre y a emprunté le livre x  */
, q1     /* x ↦ y ∈ q1     ⇔ les livres distincts x et y ont au moins un auteur en commun */
, q1_alt
, q2     /* x ∈ q2         ⇔ x est un livre que personne n'a lu  */
, q2_alt
, q3     /* x ↦ y ∈ q3     ⇔ les livres x et y ont exactement les mêmes auteurs  */
, q4     /* x ↦ y ∈ q4     ⇔ il existe au moins un auteur que les membres x et y ont lu  */
, q4_alt

PROPERTIES

  Auteur = { l1 ↦ p2, l2 ↦ p1, l2 ↦ p2, l3 ↦ p1, l3 ↦ p2, l4 ↦ p1 }

∧ Pret =   { l1 ↦ m1, l2 ↦ m1, l3 ↦ m1, l3 ↦ m2, l2 ↦ m2, l3 ↦ m4 }

/* Valeur de q1, q2, q3 et q4 pour ces valeurs de Auteur et Pret */
∧ q1 = {l1↦l2, l1↦l3, l2↦l1, l2↦l3, l2↦l4, l3↦l1, l3↦l2, l3↦l4, l4↦l2, l4↦l3}

∧ q2 = {l4}

∧ q3 = {l2↦l3, l3↦l2}

∧ q4 = {m1↦m2, m1↦m4, m2↦m1, m2↦m4, m4↦m1, m4↦m2}

∧ q1 = { x,y |      x ≠ y
                ∧
                    ∃(z).
                     (
                        x ↦ z  ∈ Auteur
                     ∧  y ↦ z  ∈ Auteur
                     )
       }
∧ q1_alt = ( Auteur ; Auteur⁻¹ ) - id(Livre)
∧ q1 = q1_alt
∧ q2 = { x |    x ∈ Livre
              ∧
                ¬ (∃y.(x ↦ y ∈ Pret))
       }
∧ q2_alt = Livre - dom(Pret)
∧ q2 = q2_alt
∧ q3 = { x,y |   x ≠ y
               ∧ 
                 Auteur[{x}] = Auteur[{y}]
       }
∧ q4 = { x,y |   x ≠ y
               ∧ ∃(z1,z2,z3).
                   (
                      z1 ↦ y ∈ Pret
                   ∧  z1 ↦ z2 ∈ Auteur
                   ∧  z3 ↦ z2 ∈ Auteur
                   ∧  z3 ↦ x ∈ Pret
                   )
       }
∧ q4_alt = ( Pret⁻¹ ; Auteur ; Auteur⁻¹ ; Pret ) - id(Membre)

END



