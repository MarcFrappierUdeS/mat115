MACHINE closure_exemples
SETS S = {s1,s2,s3,s4,s5,s6,s7,s8}
CONSTANTS r, r2, r3, r4, r5, r6, ft, frt
PROPERTIES
 r = {
        (s1,s2), (s2,s3), (s3,s4), (s5,s6),(s6,s7),(s7,s8),(s8,s5)
     }
& r2 = (r;r)
& r3 = (r;r;r)
& r4 = (r3;r)
& r5 = iterate(r,5)
& r6 = (r;r5)
& ft = closure1(r)
& frt = closure(r)
& r5 = {s5,s6,s7,s8} <| r
& r6 = {s5,s6,s7,s8} <| r2
END

