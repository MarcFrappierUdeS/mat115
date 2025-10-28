MACHINE pharmacie_test
EXTENDS pharmacie

PROPERTIES

  incompatibilite = {(m1,m2)}
& prescription = {(p1,m1)}
& allergie = {(p1,m2)}
& age = {(p1,2)}
& ageMin = {(m1,1)}
& sexe = {(p1,masculin)}
& restriction = {(m1, masculin)}


END