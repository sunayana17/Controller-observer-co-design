A=[1 0 -2 2 0 0 -8 -6 -2;0 -1 3 18 41 -10 -19 -28 4; 1 2 3 4 4 0 -8 -8 4; 1 0 0 1 0 0 0 -1 1;2 1 0 0 -2 3 2 0 1;-3 1 0 0 1 0 -1 0 0; -1 0 -1 1 3 0 -1 1 1; 0 0 1 2 1 0 4 -5 1; 1 1 0 1 0 1 -2 -3 0];
B=[1;2;3;4;5;6;7;8;9];
C=[1 0 0 0 0 0 0 0 0;0 1 0 0 0 0 0 0 0; 0 0 1 0 0 0 0 0 0];
e=[-2 -3 -4 -5 -6 -7 -8 -9 -9.2]
 %e=[-0.1 -0.2 -0.3 -0.4 -0.5 -0.6 -0.7 -0.8 -0.9];
eb=[-10 -11 -12 -13 -14 -15 -16 -17 -18];
R=rank(ctrb(A,B))
R1=rank(obsv(A,C))
P=[pinv(C) null(C)]
Abar=inv(P)*A*P
Bbar= inv(P)*B
A11=Abar(1:3,1:3)
A12=Abar(1:3,4:9)
A21=Abar(4:9,1:3)
A22=Abar(4:9,4:9)
B1=Bbar(1:3)
B2=Bbar(4:9)
Cbar=C*P
ebdash=eb(4:9)
L=place(A22',A12',ebdash')
L=L'
k=place(A,B,e)

F=A22-L*A12
G=A21-L*A11+F*L
H=B2-L*B1
