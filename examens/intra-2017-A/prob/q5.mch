MACHINE q5
SETS
  S={s1,s2,s3,s4}
; T={t1,t2,t3}
; U={u1,u2,u3}

CONSTANTS r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,S1,T1,T2

PROPERTIES

  r1 = {(s1,t2), (s2,t2), (s3,t2), (s4,t2)}
& r2 = {(t1,u3), (t2,u3), (t3,u3)}
& r3 = {(s1,s2), (s2,s3), (s3,s1)}
& r4 = (r1;r2)
& r5 = {s1}<|r1
& r6 = r1|>{t1}
& r7 = r1|>>{t1}
& r8 = closure1(r3) |> {s4}
& r9 = (r1~;r3)
& r10 = r1 <+ {s1|->t3}
& r11 = iterate(r3,3)
& S1 = dom(r1)
& T1 = ran(r1)
& T2 = r1[{s2}]

END

