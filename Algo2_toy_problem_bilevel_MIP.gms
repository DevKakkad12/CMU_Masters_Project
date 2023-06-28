Variable z, alpha;

Positive Variables x1,x2,x3,l1,l2,l3,s1,s2,s3,mu1,mu2,mu3;

Binary Variables y1,y2,y3,z1,z2,z3,w1,w2,w3;

Equations obj,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23;

obj.. z =e= alpha;
c1.. alpha =e= 1.1*x1 + 1.6*x2 + 2.2*x3;
c2.. x1 =l= 5*(1-y1);
c3.. x2 =l= 5*(1-y2);
c4.. x3 =l= 5*(1-y3);
c5.. y1+y2+y3 =e= 1;
c6.. 1.1 - 2*l1 - l2 - l3 - mu1 =e= 0;
c7.. 1.6 - l1 - l3 - mu2 =e= 0;
c8.. 2.2 - l2 - l3 - mu3 =e= 0;
c9.. 2*x1 + x2 - 2 =e= s1;
c10.. x1+ x3 - 1.7 =e= s2;
c11.. x1 + x2 + x3 - 7 =e= s3;
c12.. s1  =l= 20*(1-z1);
c13.. s2  =l= 20*(1-z2);
c14.. s3  =l= 20*(1-z3);
c15.. l1  =l= 20*z1;
c16.. l2  =l= 20*z2;
c17.. l3  =l= 20*z3;
c18.. mu1 =l= 20*w1;
c19.. mu2 =l= 20*w2;
c20.. mu3 =l= 20*w3;
c21.. x1  =l= 20*(1-w1);
c22.. x2  =l= 20*(1-w2);
c23.. x3  =l= 20*(1-w3);


Model supply /obj,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23/;
Solve supply using MIP maximising z;

