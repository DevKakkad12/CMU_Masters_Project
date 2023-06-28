Set
i  set of plants                      /1*3/
j  set of cust                         /1*3/;

Parameter dem(j) 
                   /    1   80
                        2   60
                        3   100/;
Table comp(i,j) 
        1       2       3
1       2       4       5
2       3       1.6     4
3       2.5     3       2.5;

Variable z;

Positive Variables
f(i,j)  flow of materials to the plants
s(i,j)
output(i);
Binary Variables
y(i,j);

Equations obj,c1,c2,c3,c4,c5;

obj.. z =e= sum((i,j), comp(i,j)*f(i,j));
c1(i,j)..output(i) - 100 + s(i,j)=e= 0;
c2(j)..sum(i,f(i,j)) =e= dem(j);
c3(i)..output(i) =e= sum(j,f(i,j));
c4(i,j)..s(i,j) =l= 100*(1-y(i,j));
c5..y('1','1')+y('1','2')+y('1','3')+y('2','1')+y('2','2')+y('2','3') =e= 1;

Model supply /all/;
Solve supply using MIP minimising z;