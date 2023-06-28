Variable z, alpha;

NonNegative Variables x1,x2,x3,l1,l2,l3,l4,l5,l6,l7,s1,s2,s3,s4,s5,s6,s7,mu1,y1,y2,y3;

Binary Variables z1,z2,z3,z4,z5,z6,z7;

Equations obj,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29;

obj.. z =e= alpha;
c1.. alpha =e= 1.1*x1 + 1.6*x2 + 2.2*x3;
c2.. 5*l2 + mu1 =e= 0;
c3.. 5*l3 + mu1 =e= 0;
c4.. 5*l4 + mu1 =e= 0;
c5.. y1+y2+y3 =e= 1;
c6.. 1.1 - l1 + l2 - l5 =e= 0;
c7.. 1.6 - l1 + l3 - l6 =e= 0;
c8.. 2.2 - l1 + l4 - l7 =e= 0;
c9.. 5*(1-y1) - x1 =e= s2;
c10.. 5*(1-y2) - x2 =e= s3;
c11.. 5*(1-y3) - x3 =e= s4;
c12.. x1 + x2 + x3 - 7 =e= s1;
c13.. s5 =e= x1;
c14.. s6 =e= x2;
c15.. s7 =e= x3;
c16.. s1  =l= 20*(1-z1);
c17.. s2  =l= 20*(1-z2);
c18.. s3  =l= 20*(1-z3);
c19.. s4  =l= 20*(1-z4);
c20.. s5  =l= 20*(1-z5);
c21.. s6  =l= 20*(1-z6);
c22.. s7  =l= 20*(1-z7);
c23.. l1  =l= 20*z1;
c24.. l2  =l= 20*z2;
c25.. l3  =l= 20*z3;
c26.. l4  =l= 20*z4;
c27.. l5  =l= 20*z5;
c28.. l6  =l= 20*z6;
c29.. l7  =l= 20*z7;


Model supply /obj,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29/;
Solve supply using rMIP maximising z;

