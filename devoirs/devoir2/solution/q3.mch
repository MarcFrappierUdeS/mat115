MACHINE FNC

CONSTANTS

/* Constantes initiales */

    VA,VB,VC
//,VD

PROPERTIES
VA : BOOL & VB : BOOL & VC : BOOL
//& VD : BOOL
 &

  (not (A & B) => C)
& (not (A) or B)
& (not (C))

DEFINITIONS

  A == (VA = TRUE)
; B == (VB = TRUE)
; C == (VC = TRUE)
//; D == (VD = TRUE)
; TRUEK == ((0=0))

END
	