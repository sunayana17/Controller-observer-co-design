A=[0 20.6;1 0];
B=[0;1];
C=[0 1];
e=[-1.8+2.4i -1.8-2.4i];
eb=[-8 -7];
R=rank(ctrb(A,B))
R1=rank(obsv(A,C))
k=place(A,B,e)
l=place(A',C',eb)
L=l'

