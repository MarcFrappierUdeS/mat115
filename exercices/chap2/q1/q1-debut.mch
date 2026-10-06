MACHINE B_1

/* Utilisez l'évaluateur de ProB avec ces définitions pour vérifier vos réponses */

SETS

  ELEMENTS = {a, b, c, d }

CONSTANTS

  A, B, C, D, E, F

PROPERTIES

  A = {0,1}
& B = {a,b}
& C = B \/ {c, d}
& D = { (0,a), (1,b), (2,c), (3,d) }
& E = { (0,c), (1,d)}
& F = { (c,0), (c,1), (d,1)}

END

