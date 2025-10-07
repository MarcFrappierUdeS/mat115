MACHINE Q6
SETS	
  Livre = {l1,l2,l3,l4}
; Membre = {m1,m2,m3,m4}
; Personne = {p1,p2,p3,p4} 
CONSTANTS
  Auteur /* x ↦ y ∈ Auteur ⇔ la personne y est l'auteur du livre x  */
, Pret   /* x ↦ y ∈ Pret   ⇔ le membre y a emprunté le livre x  */
, q1     /* x ↦ y ∈ q1     ⇔ le membre x a lu un livre de l'auteur y  */
, q1_alt
, q2     /* x ∈ q2         ⇔ x est un livre que le membre m1 a lu,
                             mais que le membre m2 n'a pas lu  */
, q2_alt
, q3     /* x ↦ y ∈ q3     ⇔ le membre x a lu tous les livres que le membre y a lu  */
, q4     /* x ↦ y ∈ q4     ⇔ les auteurs x et y ont au moins un lecteur en commun  */
, q4_alt
PROPERTIES
  Auteur = { l1 ↦ p1, l1 ↦ p2, l2 ↦ p2, l3 ↦ p3, l4 ↦ p4 }
∧ Pret =   { l1 ↦ m1, l2 ↦ m1, l3 ↦ m1, l3 ↦ m2, l2 ↦ m2, l4 ↦ m4 }

∧ q1 = { x,y |
                 ∃(z).
                   (
                      z ↦ x  ∈ Pret
                   ∧  z ↦ y  ∈ Auteur
                   )
       }
∧ q1_alt = ( Pret⁻¹ ; Auteur )
∧ q2 = { x |
                x ↦ m1  ∈ Pret
             ∧  x ↦ m2  ∉ Pret
       }
∧ q2_alt = Pret⁻¹[{m1}] - Pret⁻¹[{m2}]
∧ q3 = { x,y |   x ≠ y
               ∧ 
                 ∀(z).
                   (
                     z ↦ y  ∈ Pret
                   ⇒ z ↦ x  ∈ Pret
                   )
       }
∧ q4 = { x,y |   x ≠ y
               ∧ ∃(z1,z2,z3).
                   (
                      z1 ↦ y  ∈ Auteur
                   ∧  z1 ↦ z2 ∈ Pret
                   ∧  z3 ↦ z2 ∈ Pret
                   ∧  z3 ↦ x ∈ Auteur
                   )
       }
∧ q4_alt = ( Auteur⁻¹ ; Pret ; Pret⁻¹ ; Auteur ) - id(Personne)
END

q1 = {m1↦p1,m1↦p2,m1↦p3,m2↦p2,m2↦p3,m4↦p4}
  
q2 = {l1}

q3 = {m1↦m2,m1↦m3,m2↦m3,m4↦m3}

q4 = {p1↦p2,p1↦p3,p2↦p1,p2↦p3,p3↦p1,p3↦p2}

