MACHINE q6
SETS	
  Personne={h1,h2,h3,h4,f1,f2,f3,f4}
CONSTANTS
  Homme,Femme,Parent,petitNeveu,petitNeveu_alt
PROPERTIES
  Homme={h1,h2,h3,h4}
∧ Femme=Personne-Homme
∧ Parent = {(f1,h1),(f2,f1),(h2,f2),(h2,f3),(f3,h3),(h3,f4),(h3,h4)}
∧ petitNeveu = { x,y |
     x ∈ Homme
   ∧ ∃(z,w1,w2).
       (
          z ↦ x  ∈ Parent
       ∧ w1 ↦ z  ∈ Parent
       ∧ w2 ↦ w1 ∈ Parent
       ∧ w2 ↦ y  ∈ Parent
       ∧ w1 ≠ y 
       )
  }
∧ petitNeveu_alt = Homme ◁ ((Parent⁻¹ ; Parent⁻¹) ; ((Parent⁻¹ ; Parent) - id(Personne)))
END

