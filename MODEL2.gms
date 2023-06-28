*___________________________________original model - no changes________________________________*

Set
mat  set of materials                      /1*5/
p  set of plants                         /1*3/
prd set of products                         /X,Y/
elem set of elements                     /A,B,C/;

Parameter cap(p) 
                   /    1   13000
                        2   13000
                        3   13000/;


Parameter profit(mat) / 1  350
                         2  450
                         3  500
                         4 650
                         5 500/;

Parameter demand(prd) / X  10000
                         Y 8000/;

Parameter avail(mat) 
                   /    1   6000
                        2   5000
                        3   7000
                        4   8000
                        5   5000/  ;

Table comp(mat, elem) 
        A       B       C
1       0.10    0.30    0.60
2       0.30    0.50    0.20
3       0.60    0.20    0.20
4       0.40    0.10    0.50
5       0.25    0.35    0.40;

Table Dist(prd, elem) 
        A       B       C
X       0.40    0.10    0.70
Y       0.60    0.90    0.30;

Table prod_spec_min(prd, elem) 
        A       B       C
X       0.05    0       0
Y       0       0.05    0;

Table prod_spec_max(prd, elem) 
        A       B       C
X       0.35    1       1
Y       1       0.5     1;

Table Metal_Loss(prd, elem) 
        A       B       C
X       0       0.1     0.15
Y       0.2     0       0.25;

Table Treatment_cost(mat, p) 
        1       2       3
1       30      50      60
2       50      70      30
3       80      20      40
4       60      30      50
5       45      35      60;


Variable z;

Positive Variables
f1(mat,p)  flow of materials to the plants
f2(p,prd,elem) flow of products
s1(mat,p)
g1(p,prd)
Prof
TC
ML;

Equations obj,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25;

obj.. z =e= sum((mat), profit(mat)*sum((p),f1(mat,p))) - sum((mat,p),Treatment_cost(mat,p)*f1(mat,p)) - sum((p,prd,elem,mat),f2(p,prd,elem)*Metal_Loss(prd,elem)*profit(mat));

*Material Balance
c1(p,elem).. sum((mat), f1(mat,p)*comp(mat,elem)) =e= sum((prd),f2(p,prd,elem));
*Dist_Coeff
c2(p,prd,elem).. Dist(prd,elem)*sum((mat), f1(mat,p)*comp(mat,elem)) =e= f2(p,prd,elem);
*Product Spec Constraint
c3(p,prd,elem).. g1(p,prd) * prod_spec_min(prd,elem) =l= f2(p,prd,elem);
c4(p,prd,elem).. g1(p,prd) * prod_spec_max(prd,elem) =g= f2(p,prd,elem);
*Demand constraint
c5(prd).. sum((p,elem),f2(p,prd,elem)) =g= demand(prd);
*Availability constraint
c6(mat).. sum(p,f1(mat,p)) =l= avail(mat);
*Inlet Constraint
c7.. sum(mat,f1(mat,'1')*comp(mat,'A')) =l= 5*sum(mat,f1(mat,'1')*comp(mat,'B'));
c8.. sum(mat,f1(mat,'1')*comp(mat,'A')) =g= 2*sum(mat,f1(mat,'1')*comp(mat,'B'));
c9.. sum(mat,f1(mat,'2')*comp(mat,'B')) =l= 3*sum(mat,f1(mat,'2')*comp(mat,'C'));
c10.. sum(mat,f1(mat,'2')*comp(mat,'B')) =g= 1*sum(mat,f1(mat,'2')*comp(mat,'C'));
c11.. sum(mat,f1(mat,'3')*comp(mat,'C')) =l= 4*sum(mat,f1(mat,'3')*comp(mat,'A'));
c12.. sum(mat,f1(mat,'3')*comp(mat,'C')) =g= 2*sum(mat,f1(mat,'3')*comp(mat,'A'));
*Flow Positive constraint with slack
c13(mat,p).. -f1(mat,p) + s1(mat,p) =e= 0;
*Product constraint
c14(p,prd).. sum(elem, f2(p,prd,elem)) =e= g1(p,prd);
c15(p).. sum(mat,f1(mat,p)) =l= cap(p);
c16(prd).. sum((p,elem),f2(p,prd,elem)) =l= 1.5*demand(prd);
c17..Prof =e= sum((mat), profit(mat)*sum((p),f1(mat,p)));
c18.. TC =e= sum((mat,p),Treatment_cost(mat,p)*f1(mat,p));
c19.. ML =e= sum((p,prd,elem,mat),f2(p,prd,elem)*Metal_Loss(prd,elem)*profit(mat));
c20.. s1('1','2') =e= 0;
c21.. s1('2','1') =e= 0;
c22.. s1('3','1') =e= 0;
c23.. s1('3','3') =e= 0;
c24.. s1('5','1') =e= 0;
c25.. s1('5','3') =e= 0;

Model supply1 /obj,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25/;
Solve supply1 using LP maximising z;

Model supply2 /obj,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19/;
Solve supply2 using LP maximising z;