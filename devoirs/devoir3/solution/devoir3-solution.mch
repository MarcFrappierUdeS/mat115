MACHINE devoir3

/* Voici un commentaire */

SETS

  A={a0,a1,a2,a3,a4,a5}
; B={b0,b1,b2,b3,b4,b5}

CONSTANTS

  r1,A1,r2

/* Constantes que vous devez définir pour répondre à cette question */

, q1 /* contient l'ensemble des images de a1 dans r1 - ensemble défini par compréhension */
, q1_alt /* q1, mais défini avec des opérateurs */
, q2 /* (x,y) tels que x /= y et x et y ont une image en commun dans r1 - ensemble défini par compréhension */
, q2_alt /* q2, mais défini avec des opérateurs */
, q3 /* (x,y) tels que x /= y et x et y n'ont pas d'image en commun dans r1 - ensemble défini par compréhension */
, q3_alt /* q3, mais défini avec des opérateurs */
, q4 /* (x,y) tels que x /= y et x et y n'ont pas d'image en commun dans r1,
        et x et y ont chacun au moins une image dans r1 - ensemble défini par compréhension */
, q4_alt /* q3, mais défini avec des opérateurs */
, q5 /* (x,y) tels que x /= y et x et y ont exactement les mêmes images dans r1,
        et x et y ont chacun au moins une image dans r1 - ensemble défini par compréhension */
, q6 /* (x,y) tels que x : A et y : B et y n'est pas une image de x dans r1 - ensemble défini par compréhension */
, q6_alt /* q6, mais défini avec des opérateurs */
, q7 /* y tels que y n'est l'image d'aucun élement de A dans r1 - ensemble défini par compréhension*/
, q7_alt /* q7, mais défini avec des opérateurs */
, q8 /* y tels que y a au moins un antécédent dans r1 qui provient de A1 */
, q8_alt /* q9, mais défini avec des opérateurs */
, q9 /* y tels que tous les antécédents de y dans r1 sont dans A1, et il y a au moins un antécédent de y dans r1 */
, q9_alt /* q9, mais défini avec des opérateurs */
, q10 /* (x,y) tels que (x,y) : r1, mais avec les contraintes suivantes
         si x = a1, alors les images de x sont les images de a2 dans r1 et
         si x = a2, alors les images de x sont les images de a1 dans r1 et
         pour les autres éléments du domaine de r1,leurs images sont les mêmes que celles dans r1 */
, q10_alt /* q10, mais défini avec des opérateurs, et vous pouvez utiliser a1,a2 dans un ensemble défini par extension */

/*
  Supposons que r2 est une représentation des connexions directes entre des points d'un réseau de communication.  Si (x,y) : r2, alors il y a une connexion directe de x vers y.  Ces connexions sont orientées, donc (x,y) : r2 signfie que x peut envoyer un message à y.  Cela ne signifie pas que y peut envoyer un message à x; pour ce faire, il faudrait que (y,x) : r2. On dit que x peut communiquer avec y s'il existe une suite de connexions directes (x,x1),(x1,x2),...,(xn,y).  Quand n=0 (ie, quand il n'y a aucun point intermédiaire xi), il s'agit alors d'une connexion directe entre x et y. Utilisez cette interprétation de r2 pour répondre aux questions suivantes.  Pas de contrainte sur la manière de répondre: vous pouvez utiliser à la fois les ensemble définis par compréhension et les opérateurs, et et même utiliser un ensemble défini dans une question précédente (ex: la réponse à q12 utilise q11).
*/

, q11 /* (x,y) tels que x /= y  et x peut communiquer avec y */
, q12 /* (x,y) tels que x /= y  et x peut communiquer avec y et y peut communiquer avec x */
, q13 /* contient l'ensemble des X tels que X <: A, et soit x un élément de X, alors X doit contenir tous les éléments avec qui x peut communiquer, et seulement les éléments avec qui x peut communiquer. q13 est donc un ensemble d'ensembles. De plus, les éléments de Q13 sont disjoints et doivent contenir plus de un élément. */


PROPERTIES

/* Constantes utilisées pour définir les questions. */

  r1 : A <-> B
& A1 <: A
& r2 : A <-> A

/* Exemples de valeurs pour ces constantes.
   Vos réponses ne doivent pas dépendre de ces valeurs particulières.
   Elles doivent fonctionner peu importe les valeurs que je choisirai. */

& r1 = {(a1,b1),(a1,b2),(a2,b1),(a2,b3),(a3,b4),(a4,b4),(a4,b5),(a5,b4),(a5,b5)}
& A1 = {a0,a1}
& r2 = {(a0,a1),(a0,a2),(a1,a2),(a2,a3),(a4,a5),(a5,a4)}

/* Constantes utilisées pour répondre aux questions */

& q1 = { y | (a1,y) : r1 }
& q1_alt = r1[{a1}]
& q2 = { x,y | x /= y & #z.((x,z) : r1 & (y,z) : r1)}
& q2_alt = (r1 ; r1~) - id(A)
& q3 = { x,y | x /= y & not (#z.((x,z) : r1 & (y,z) : r1))}
& q3_alt = A*A - (r1 ; r1~) - id(A)
& q4 = { x,y | x /= y & #z.((x,z) : r1) & #z.((y,z) : r1) & not (#z.((x,z) : r1 & (y,z) : r1))}
& q4_alt = (dom(r1)*dom(r1)) - (r1 ; r1~) - id(A)
& q5 = { x,y | x /= y & #z.((x,z) : r1) & #z.((y,z) : r1) &  (!z.(z : B => ((x,z) : r1 <=> (y,z) : r1)))}
& q6 = { x,y | x : A & y : B & (x,y) /: r1}
& q6_alt = A*B - r1
& q7 = { y | y : B & not (#x.((x,y) : r1)) }
& q7_alt = B - ran(r1)
& q8 = { y | y : B & #x.(x : A1 & (x,y) : r1) }
& q8_alt = ran(A1 <| r1)
& q9 = { y | y : B & #x.((x,y) : r1) & !x.(x : A & (x,y) : r1 => x : A1)}
& q9_alt = ran(r1) - ran(A1 <<| r1)
& q10 = { x,y | x : A & y : B & (x = a1 => (a2,y) : r1) & (x = a2 => (a1,y) : r1) & (x /= a1 & x/= a2 => (x,y) : r1)}
& q10_alt = r1 <+ (({a1} * r1[{a2}]) \/ ({a2} * r1[{a1}]))
& q11 = closure1(r2) - id(A)
& q12 = { x,y | (x,y) : q11 & (y,x) : q11}
& q13 = { X | X <: A & X /= {} & !(x,y).(x : X & y : A & (x,y) : q12 => y : X) & !(x,y).(x : X & y : X & x /= y => (x,y) : q12 ) & card(X) > 1}

END
	