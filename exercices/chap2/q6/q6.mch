MACHINE Tarski
SETS
    Objects = {s1,s2,t1}
;   ObjectSizes = {small, medium, large}
;   ObjectTypes = {triangle, square, pentagon}
 
DEFINITIONS

// Dans une définition, toujours mettres des parenthèses autour de la définition, c'est-à -dire écrire 
// def1(x1,...,xn) = ( ... )

    LeftOf(o1,o2) == (x_pos(o1) < x_pos(o2))
;   SameRow(o1,o2) == (y_pos(o1) = y_pos(o2))
;   Square(o) == (type(o) = square)
;   Plan == (dimension * dimension)
;   dimension == (1..8)
// Ajoutez les definitions des autres prédicat de Tarski (Small, Medium, Large, Smaller, SameSize, SameCol, Pentagon, Triangle, Between)

CONSTANTS

    x_pos           // fonction qui retourne la positon d'un objet sur l'axe des x
,   y_pos           // fonction qui retourne la positon d'un objet sur l'axe des y
,   oSize           // fonction qui retourne la taille d'un objet
,   type            // fonction qui retourne le type d'un objet
,   formule0        // booléen qui contient la valeur de vérité de la formule 0

PROPERTIES

  x_pos ∈ Objects → dimension
∧ y_pos ∈ Objects → dimension
∧ x_pos ⊗ y_pos ∈ Objects ↣ Plan // Un seul objet par position
∧ oSize ∈ Objects → ObjectSizes
∧ type ∈ Objects → ObjectTypes
// objet s1
∧ x_pos(s1) = 1 ∧ y_pos(s1) = 1 ∧ type(s1) = square ∧ oSize(s1) = small
// objet s2
∧ x_pos(s2) = 2 ∧ y_pos(s2) = 2 ∧ type(s2) = square ∧ oSize(s2) = medium
// objet t1
∧ x_pos(t1) = 3 ∧ y_pos(t1) = 2 ∧ type(t1) = triangle ∧ oSize(t1) = large
// formule0 : tous les carrés sont sur la même ligne
∧ formule0 = bool(∀(x1,x2).(Square(x1) ∧ Square(x2) ⇒ SameRow(x1,x2)))
END


