MACHINE Q
SETS
  E = {e1,e2,e3}
; F = {f1,f2,f3}
CONSTANTS a,b,c,d,q4a,q4b,q4c
PROPERTIES
  a = card(E → F)
∧ b = card(E ⇸ F)
∧ c = card(E -->> F)
∧ d = card(E >->> F)
& q4a = bool(!x.(x : POW(E) => ((x -->> x) ⊆ (x >+>> x))))
& q4b = bool(!x.(x : POW(E) => (((x >-> x) /\ (x -->> x)) = {})))
& q4c = bool(!x.(x : POW(E) => ({} : (x +->> x))))
END


