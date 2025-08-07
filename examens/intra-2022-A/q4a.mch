MACHINE FNC

CONSTANTS

/* Constantes initiales */

    VA,VB,VC

PROPERTIES
VA : BOOL & VB : BOOL & VC : BOOL &

not(
(¬(A ⇔ B) ⇒ ¬(B ∨ C))
<=>
((A ∧ B) ∨ (¬(A) ∧ ¬(B)) ∨ (¬(B) ∧ ¬(C)))
)

DEFINITIONS

  A == (VA = TRUE)
; B == (VB = TRUE)
; C == (VC = TRUE)
; TRUEK == ((0=0))

END
	