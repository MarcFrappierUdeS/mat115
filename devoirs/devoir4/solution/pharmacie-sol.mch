MACHINE pharmacie

SETS

  PATIENT = {p1,p2,p3}
; MEDICAMENT = {m1,m2,m3}
; SEXE = {masculin,feminin} // Sexe biologique
; DESCRIPTION = {d1,d2,d3,d4}

CONSTANTS

    /* attributs */
    idPatient, idRAMQ, age,
    idMedic, DIN, description, ageMin,

    /* associations */
    incompatibilite, allergie, prescription, sexe, restriction,

    /* constantes pour tester facilement la valeur des contraintes sur les associations */

    c1, c2, c3, c4, c5

PROPERTIES

/* Attributs des entités */

    idPatient ∈ PATIENT >-> NAT
  ∧ idRAMQ ∈ PATIENT >-> NAT
  ∧ age ∈ PATIENT ⇸ NAT
  ∧ idMedic ∈ MEDICAMENT >-> NAT
  ∧ DIN ∈ MEDICAMENT >+> NAT
  ∧ description ∈ MEDICAMENT >-> DESCRIPTION
  ∧ ageMin ∈ MEDICAMENT ⇸ NAT

/* Associations entre les entités */

  ∧ allergie ∈ PATIENT ↔ MEDICAMENT
  ∧ incompatibilite ∈ MEDICAMENT ↔ MEDICAMENT
  ∧ prescription ∈ PATIENT ↔ MEDICAMENT
  ∧ sexe ∈ PATIENT ↔ SEXE
  ∧ restriction ∈ MEDICAMENT ⇸ SEXE

/* Contraintes sur les associations */

/* Un médicament n'est pas incompatible avec lui-même */

  ∧ c1 = bool(id(MEDICAMENT) ∩ incompatibilite = ∅)

/* One ne prescrit pas à un PATIENT deux médicaments qui sont incompatibles */

  ∧ c2 = bool((prescription⁻¹ ; prescription) ∩ incompatibilite = ∅)

/* On ne prescrit pas à un PATIENT un médicament auquel il est allergique */

  ∧ c3 = bool(allergie ∩ prescription = ∅)

/* Un medicament restreint à un sexe ne peut être prescrit qu'à des patients qui ont seulement ce sexe */


  ∧ c4 = bool
    (
      ∀(p,m,s).
        (
             (p,m) ∈ prescription
           ∧ (m,s) ∈ restriction
        ⇒
            sexe[{p}] = {s}
        )
    )
/* Si un medicament a un age minimal pour être prescrit, alors le patient doit avoir cet age minimal */

  ∧ c5 = bool
    (∀(p,m,n).
      (
            (p,m) ∈ prescription
          ∧ (m,n) ∈ ageMin
      ⇒
          ∃k.( (p,k) ∈ age ∧ k ≥ n )
      )
    )

END

