MACHINE Q7
SETS	

  Objets = {o1,o2,o3,o4,o5,o6}  // Dénote l'ensemble de tous les objets

CONSTANTS

  Carre    /* x ∈ Carre ⇔ l'objet x est un carré */
, Triangle /* x ∈ Triangle ⇔ l'objet x est un triangle */
, LeftOf   /* x ↦ y ∈ LeftOf ⇔ l'objet x est à la gauche de l'objet y */
, Smaller  /* x ↦ y ∈ Smaller ⇔ l'objet x est plus petit que l'objet y */

, q1     /* Écrivez une formule qui retourne vrai ssi
            les ensembles Carre et Triangle sont disjoints,
            c'est-à-dire qu'un objet appartient à exactement
            un seul de ces ensembles */
, q1_alt /* q1_alt = q1 */
, q2     /* x ↦ y ∈ q2 ⇔ x et y sont à la gauche d'un carré z;
            de plus, x et y sont distincts */
, q2_alt /* q2_alt = q2 */
, q3     /* x ∈ q3 ⇔ il n'existe pas d'objet plus grand que x */
, q3_alt /* q3_alt = q2 */

PROPERTIES

  Carre = {o1,o2,o3}
∧ Triangle = {o4,o5,o6}
∧ LeftOf = {o2↦o6, o3↦o6, o4↦o1, o5↦o1}
∧ Smaller = {o1↦o2, o1↦o3, o1↦o4, o2↦o3, o2↦o4, o3↦o4, o5↦o6}

∧ q1 = TRUE
∧ q2 = { o4↦o5, o5↦o4 }
∧ q3 = { o4, o6 }

∧ q1 = bool(∀(x).(x ∈ Objets ⇒ (x ∈ Objets ⇔ x ∈ Carre ∨ x ∈ Triangle) ∧ ¬(∃(x).(x ∈ Triangle ∧ x ∈ Carre))))
∧ q1_alt = bool(Objets = Triangle ∪ Carre ∧ Triangle ∩ Carre = ∅)
∧ q2 = {x,y | x≠y ∧ ∃z.(z ∈ Carre ∧ (x,z) ∈ LeftOf ∧ (y,z) ∈ LeftOf)}
∧ q2_alt = ((LeftOf ▷ Carre) ; LeftOf⁻¹) - id(Objets)
∧ q3 = { x | ∀y.(y ≠ x ⇒ (x,y) ∉ Smaller)}
∧ q3_alt = ran(Smaller) - dom(Smaller)

END



