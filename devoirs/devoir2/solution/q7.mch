MACHINE FNC

CONSTANTS

/* Constantes initiales */

    VA,VB,VC,VD

PROPERTIES
VA : BOOL & VB : BOOL & VC : BOOL
& VD : BOOL
&

not
(
    (((A ∨ B ∨ C) ∧ ¬(¬(A) ∧ ¬(B))) ⇔ (A ∨ B))
)

DEFINITIONS

  A == (VA = TRUE)
; B == (VB = TRUE)
; C == (VC = TRUE)
; D == (VD = TRUE)
; X1 == (VA = TRUE)
; X2 == (VB = TRUE)
; X3 == (VC = TRUE)
; X4 == (VD = TRUE)
; TRUEK == ((0=0))

END
	
