MACHINE ExerciceMathDiscrete_1

SETS	

 Personne={h1,h2,h3,h4,h5,f1,f2,f3,f4,f5,f6}

CONSTANTS

  NombrePair
, Homme
, Femme
, Pere
, Mere
, Facteur
, Premier
, Premier2 
, s
, FacteurPremier
, Papa
, Papa2
, Fils
, Fils2
, Filles
, Parent
, GrandParent
, GrandParent2
, Conjoint
, Conjoint2
, Fraterie 
, Fraterie2
, Cousin
, Cousin2
, Ancetre

PROPERTIES

  NombrePair = {x | x ∈ 1..12 ∧ x mod 2 = 0}
∧ Homme={h1,h2,h3,h4,h5}
∧ Femme={f1,f2,f3,f4,f5,f6}
∧ Pere={h1↦h2,h1↦f2,h2↦h3}
∧ Mere={f1↦h2,f1↦f2,f2↦h4,f4↦f6,f5↦f6}
∧ Facteur = { x | x ∈ 1..12 ∧ ∃y.(12 = x*y) }
∧ Premier = { x | x ∈ 2..12 ∧ ¬ (∃y.(y ∈ 2..x-1 ∧ x mod y = 0) )}
∧ Premier2 = { x | x ∈ 2..12 ∧ ¬ (∃(y,z).(y ∈ 2..x-1 ∧ z ∈ 2..x-1 ∧ x = y*z) )}
∧ s = SIGMA(y).(y ∈ Premier | y)
∧ FacteurPremier = Facteur ∩ Premier
∧ Papa = { x | ∃y.( x↦ y ∈ Pere) }
∧ Papa2 = dom(Pere)
∧ Fils = { x | x ∈ Homme ∧ ∃y.( y ∈ Personne ∧ (y ↦ x ∈ Pere ∨ y↦x ∈ Mere)) }
∧ Fils2 = ran(Pere ∪ Mere) ∩ Homme
∧ Filles = ran(Pere ∪ Mere) ∩ Femme
∧ Parent = Pere ∪ Mere
∧ GrandParent = (Parent ; Parent)
∧ GrandParent2 = { x,y |∃z.(z ∈ Personne ∧ (x,z) ∈ Parent ∧ (z,y) ∈ Parent) }
∧ Conjoint = { x,y | x ≠ y ∧ ∃z.( (x,z) ∈ Parent ∧ (y,z) ∈ Parent ) }
∧ Conjoint2 = (Parent ; Parent⁻¹) - id(Personne)
∧ Fraterie = { x,y | x ≠ y ∧ ∃z.(z ∈ Personne ∧ (z,x) ∈ Parent ∧ (z,y) ∈ Parent) }
∧ Fraterie2 = (Parent⁻¹ ; Parent) - id(Personne)
∧ Cousin = (Parent⁻¹ ; ((Parent⁻¹ ; Parent)-id(Personne)) ; Parent)
∧ Cousin2 = { x,y |∃(z1,z2,z3).( z1 ≠ z3 ∧ (z1,x) ∈ Parent ∧ (z2,z1) ∈ Parent ∧ (z2,z3) ∈ Parent ∧ (z3,y) ∈ Parent  ) }
∧ Ancetre = closure1(Parent)
END






