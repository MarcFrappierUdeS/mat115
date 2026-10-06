MACHINE prop_relation
SETS
  S1={a,b,c}

CONSTANTS r1, r2, b1, b2

/*
   Cette machine vous permet d'explorer les propriétés des relations.
   Ajoutez des constantes et modifiez la clause PROPERTIES pour vérifier ce qui vous intéresse.
   Par exemple, ci-dessous ProB va vous permettre de vérifier
   - si r1 est acyclique (ce qui est vrai, voir la valeur de b1)
   - si r1 est transitive (ce qui est faux, voir la valeur de b2)
   - trouver une relation r2 qui est symétrique et antisymétrique
     - il en proposera 5 avec SETUP_CONSTANTS
*/
PROPERTIES
    r1 : S1 <-> S1
  & r1 = {a|->b,b|->c}
  & b1 = bool(acyclique(r1,S1))
  & b2 = bool(transitive(r1,S1))
  & symetrique(r2,S1)
  & antisymetrique(r2,S1)

DEFINITIONS
  SET_PREF_MAX_INITIALISATIONS == 5;
  SET_PREF_TIME_OUT == 10000;

  reflexive(r,S) ==
    !(x).
      (
        x : S
      =>
        x|->x : r
      );

  irreflexive(r,S) ==
    !(x).
      (
        x : S
      =>
        x|->x /: r
      );

  transitive(r,S) ==
    !(x,y,z).
      (
          x : S
        & y : S
        & z : S
        & x|->y : r
        & y|->z : r
      =>
        x|->z : r
      );

  symetrique(r,S) == 
    !(x,y).
      (
          x : S
        & y : S
        & x|->y : r
      =>
        y|->x : r
      );

  antisymetrique(r,S) == 
    !(x,y).
      (
          x : S
        & y : S
        & x|->y : r
        & y|->x : r
      =>
        x=y
      );

  antisymetrique_forte(r,S) == 
    !(x,y).
      (
          x : S
        & y : S
        & x|->y : r
      =>
        y|->x /: r
      );

  preordre(r,S) == 
      reflexive(r,S)
    & transitive(r,S);

  equivalence(r,S) == 
      preordre(r,S)
    & symetrique(r,S);

  ordre(r,S) == 
      preordre(r,S)
    & antisymetrique(r,S);

  ordre_strict(r,S) == 
      irreflexive(r,S)
    & transitive(r,S);

  minimum(r,S) ==
    {
      x | 
          x : S
        & !(y).
          (
            y : S
          =>
            y|->x /: r
          )
    };

  bien_fondee(r,S) == 
      !(T).(T : POW1(S) => #(x).(x:minimum(r,T)));

  acyclique(r,S) == 
      closure1(r) /\ id(S) = {}
END