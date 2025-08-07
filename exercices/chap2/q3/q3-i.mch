MACHINE q3_i
SETS
  S1={a,b,c}

CONSTANTS r1

/* ProB trouve des exemples de relations qui sont ni réflexive, ni irréflexive */
PROPERTIES
    r1 : S1 <-> S1
  & not (reflexive(r1,S1))
  & not (irreflexive(r1,S1))

DEFINITIONS
  SET_PREF_MAX_INITIALISATIONS == 10;
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