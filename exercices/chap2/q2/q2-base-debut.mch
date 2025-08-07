MACHINE ExerciceMathDiscrete_1

SETS	

 Personne={h1,h2,h3,h4,h5,f1,f2,f3,f4,f5,f6}

CONSTANTS

  NombrePair
, Homme
, Femme
, Pere
, Mere

PROPERTIES

  NombrePair = {x | x : 1..12 & x mod 2 = 0}
& Homme={h1,h2,h3,h4,h5}
& Femme={f1,f2,f3,f4,f5}
& Pere={h1|->h2,h1|->	f2,h2|->h3}
& Mere={f1|->h2,f1|->f2,f2|->h4,f4|->f6,f5|->f6}

END

