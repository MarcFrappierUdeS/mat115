MACHINE Tarski

CONSTANTS Plan, Objet, Square, Triangle, Pentagon, Small, Medium, Large, formule0, formule1, formule2, formule3
PROPERTIES
  Plan = (1..8) * (1..8)
& Square = { (1,1), (2,2) }
& Triangle = { (3,2) }
& Objet = (Square \/ Triangle \/ Pentagon)
& Small = { (1,1) }
& Medium = { (2,2) }
& Large = { (3,2) }
& Pentagon <: Plan & Pentagon = {}
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
& formule1 = bool(
    !(x1,y1,x2,y2).
         (
           (x1,y1) : Square & (x2,y2) : Triangle
         =>
           x1 < x2
         )
  )
// formule2 : tous les objets sont dans le plan
& formule2 = bool(
  !(x,y).
     (
       (x,y) : (Square \/ Triangle \/ Pentagon) => (x,y) : Plan
     )
)
// formule3 : tous les carrés sont petits
& formule3 = bool(Square <: Small)

END

