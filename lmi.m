clc
clear
A=[-10 2 0 1 0; 1 -1 0 0 1;1 0 -5 3 4; -3 1 1 -8 3; -2 -4 0 2 -6];
B=[1;2;3;4;5];
C=[1 0 0 0 0;0 1 0 0 0];
F=[1 2 0 0 1];
P=[pinv(C) null(C)]
Abar=inv(P)*A*P
Bbar= inv(P)*B
Fbar= F*P

A11=Abar(1:2,1:2)
A12=Abar(1:2,3:5)
A21=Abar(3:5,1:2)
A22=Abar(3:5,3:5)
F1=Fbar(1:2)
F2=Fbar(3:5)

setlmis([])
N=lmivar(2,[1 1]);
L1=lmivar(2,[1 2]);
L2=lmivar(2,[1 3]);
%D=lmivar(2,[1 1]);
p=lmivar(2,[1 1]);


lmiterm([1 1 1 p],-1,1)
lmiterm([-1 0 0 0],0)

lmiterm([2 1 1 -N],1,p)
lmiterm([2 1 1 N],p,1)
lmiterm([-2 0 0 0],0) 




lmiterm([3 1 1 0],-0.001)  
lmiterm([3 2 1 L2],N,1)   
lmiterm([3 2 1 L1],-1,A12) 
lmiterm([3 2 1 L2],-1,A22)
lmiterm([3 2 2 0],-1)
lmiterm([-3 0 0 0],0)



lmisys = getlmis
%{
ndec=decnbr(lmisys)
decN = decinfo(lmisys,N)
decL1=decinfo(lmisys,L1)
decL2=decinfo(lmisys,L2)
decp=decinfo(lmisys,p)
dvar=[decN decL1 decL2 decp]
N=dec2mat(lmisys,dvar,N)
L1=dec2mat(lmisys,dvar,L1)
L2=dec2mat(lmisys,dvar,L2)
p=dec2mat(lmisys,dvar,p)
}


