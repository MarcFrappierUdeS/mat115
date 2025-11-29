MACHINE determinisation_automate
				
/* Modifiez l'alphabet pour utiliser le votre */

SETS Symbole={a,b,c,d,e,f,lambda}
	
/* ************** Ne pas modifier ce qui suit ************ */

CONSTANTS Q, Sigma, delta, q0, F, lambda_closure, t

PROPERTIES
    Sigma ⊆ Symbole
  ∧ lambda_closure = closure1({ q1,q2 | (q1,lambda,q2) ∈ delta}) ∪ id(Q)
  ∧ t ⊆ Q * Sigma * Q
  ∧ t = {q1,s,q2 |
            q1 ∈ Q
          ∧ s ∈ Sigma
          ∧ ∃(q3).((q1,q3) ∈ lambda_closure ∧ (q3,s,q2) ∈ (delta;lambda_closure))
        }
  ∧ Q = dom(dom(delta)) ∪ ran(delta)
  ∧ Sigma = ran(dom(delta))  - {lambda}
  ∧ delta ⊆ Q * Symbole * Q  /* ne pas changer */


/* ********* Partie a modifier *************************** */

/* Definition de l'automate a minimiser */
/* Suite se terminant par ab ; figure 4.2 (ii) des notes de cours */
  ∧ delta = {               /* mettre la relation de transition ici */
              (0,lambda,1), (0,a,0), (0,b,0),
              (1,a,2),
              (2,b,3)
            }
  ∧ q0 = 0                  /* etat initial */
  ∧ F = { 3 }               /* ensemble des etats finaux */


/* *********** Fin de la section a modifier ************** */

/* *********** Ne rien changer dans ce qui suit ********** */

DEFINITIONS

  transition_a_definir(X,s) ==
    ( 
      X ∈ Q_D
    ∧ s ∈ Sigma
    ∧ (X,s) ∉ dom(delta_D)
    );
  SET_PREF_MAX_INITIALISATIONS == 1;
  SET_PREF_MAX_OPERATIONS == 1

VARIABLES Q_D, delta_D, q0_D, F_D

INVARIANT

    Q_D ⊆ ℙ(Q)
  ∧ delta_D ⊆ (ℙ(Q) * Sigma) × ℙ(Q)
  ∧ q0_D ∈ Q_D
  ∧ F_D ⊆ Q_D

INITIALISATION

      Q_D := {lambda_closure[{q0}]}
  ||  delta_D := ∅
  ||  q0_D := lambda_closure[{q0}]
  ||  F_D := ∅

OPERATIONS

  /* Cette operation effectue une iteration de la boucle de determinisation */
  
  une_iteration(X,s) =
    PRE
        transition_a_definir(X,s)
    THEN
          Q_D := Q_D ∪ {UNION(q2).(q2∈X | t[{(q2,s)}])}
      ||  delta_D := delta_D ∪ {(X,s,UNION(q2).(q2∈X | t[{(q2,s)}]))} 
    END;

  /* Cette operation calcule les etats finaux de l'automate deterministe */

  calculer_F = F_D := { X | X ∈ Q_D ∧ ∃(q).(q ∈ X ∩ F)};

  /* Cette operation effectue toutes les iterations de la determinisation et calcule F a la fin */

  determiniser =
    BEGIN
      WHILE
        ∃(X, s).(transition_a_definir(X,s))
      DO
        ANY X, s, Y
        WHERE
            transition_a_definir(X,s)
          ∧ Y = UNION(q2).(q2∈X | t[{(q2,s)}])
        THEN
              Q_D := Q_D ∪ {Y}
          ||  delta_D := delta_D ∪ {(X,s,Y)} 
        END	
      INVARIANT 1=1 VARIANT card(ℙ(Q))*card(Sigma)-card(dom(delta_D))
      END;
      F_D := { X | X ∈ Q_D ∧ X ∩ F ≠ ∅ }
    END;

  r <-- M_D_accepte(w_) =
    PRE
      w_ ∈ seq(Sigma)
    THEN
      VAR q,w IN
        w := w_;
        q := q0_D;
        WHILE w ≠ [] DO
          q :∈ delta_D[{(q,first(w))}];
          w := tail(w)
        INVARIANT 1=1 VARIANT card(w)
        END;
        r := bool(q ∈ F_D)
      END
    END

END

















