MACHINE q5
SETS S={s1,s2,s3} ; T={t1,t2,t3} ; U={u1,u2,u3}
CONSTANTS r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,S1,T1,T2
PROPERTIES
  r1 = {(s1,t1), (s1,t2), (s2,t1), (s3,t2), (s3,t3)}
∧ r2 = {(t1,u2), (t1,u3), (t2,u1), (t2,u3), (t3,u2)}
∧ r3 = {(s1,s2), (s1,s3), (s2,s3), (s3,s3), (s3,s1)}
∧ r4 = (r1;r2)
∧ r5 = {s1} ◁ r1
∧ r6 = r1 ▷ {t1}
∧ r7 = r1 ⩥ {t1}
∧ r8 = closure1(r3) ▷ {s3}
∧ r9 = (r1⁻¹;r3)
∧ r10 = r1 <+ {s1↦t3}
∧ r11 = iterate(r3,2)
∧ S1 = T - dom(r1⁻¹)
∧ T1 = ran(r1⁻¹) ∩ S 
∧ T2 = r3[{s1,s2}]

/* solution */
∧ r4  = {s1↦u1,s1↦u2,s1↦u3,s2↦u2,s2↦u3,s3↦u1,s3↦u2,s3↦u3}
∧ r5 = {s1↦t1,s1↦t2}
∧ r6 = {s1↦t1,s2↦t1}
∧ r7 = {s1↦t2,s3↦t2,s3↦t3}
∧ r8 = {s1↦s3,s2↦s3,s3↦s3}
∧ r9 = {t1↦s2,t1↦s3,t2↦s1,t2↦s2,t2↦s3,t3↦s1,t3↦s3}
∧ r10 = {s1↦t3,s2↦t1,s3↦t2,s3↦t3}
∧ r11 = {s1↦s1,s1↦s3,s2↦s1,s2↦s3,s3↦s1,s3↦s2,s3↦s3}
∧ S1 = ∅
∧ T1 = {s1,s2,s3}
∧ T2 = {s2,s3}

END


