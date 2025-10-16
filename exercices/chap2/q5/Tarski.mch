MACHINE Tarski

CONSTANTS Plan, Square, Small, formule0
PROPERTIES
  Plan = (1..8) * (1..8)
& Square = { (1,1), (2,2) }
//& Triangle = ...
//& Pentagon <: ... & Pentagon = ...
//& Objet = ...
& Small = { (1,1) }
//& Medium = ...
//& Large = ...
// formule0 : Tous les objets sont sur la même ligne
& formule0 = bool(
   !(x1,y1,x2,y2).
         (
           (x1,y1) : Objet & (x2,y2) : Objet
         =>
           y1 = y2
         )
  )
// formule1 : Tous les cubes sont à gauche des triangles
// & formule1 = bool(...)
// formule2 : tous les objets sont dans le plan
// & formule2 = bool(...)
// formule3 : tous les carrés sont petits
// & formule3 = bool(...)

END

