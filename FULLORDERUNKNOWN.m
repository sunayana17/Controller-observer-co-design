A=[-1 -1 0;-1 0 0;0 -1 -1];
B=[1;2;3];
C=[1 0 0;0 0 1];
W=[-1;0;0];
e=[-1 -2 -3]
eb=[-4 -5 -6];
R1=rank(C*W);
R2=rank(W);
Z=zeros(3,2)
E=W*pinv(C*W)+Z*(eye(2)-(C*W)*(pinv(C*W)))

Y=eye(3)-E*C
L=place((Y*A)',C',eb)

L=L'
N=Y*A-L*C
H=Y*B
J=L+N*E
k=place(A,B,e)

    
    