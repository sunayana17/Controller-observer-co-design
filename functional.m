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
n=5
M=cell(n,1)
 ;
i=1;
while (i<n)
   M{i}=C*A^(i-1) 
   
    Q=cell2mat(M)
    if rank(Q)==n
    break
else i=i+1
    end
end
oi=i
v=oi


n=5
p=2
M=cell(n-p,1)
 ;
i=1;
while (i<n-p)
   M{i}=A12*(A22^(i-1))
   
    Q=cell2mat(M)
    if rank(Q)==n-p
    break
else i=i+1
    end
end
x=i;
l1=0;
l=0;
while(x>0)
    
    g(l1+1)=x-l
    x=x-1;
    l1=l1+1;
end


[Y,Z]=size(A12)
k=cell(Y,1)
for i=1:Y
    k{i}=A12(i,:)
end

theta=cell(l1,1)


    for i=1:l1
        m=cell(g(i),1)
    theta{i}=cell(g(i),1)
    j=1
    while(j<=g(i))
         m{j}=k{i}*A22^(j-1) 
   j=j+1;
    
    end
    theta{i}=cell2mat(m)
    phi=cell2mat(theta)
    i=i+1;
    end
    
   b1=inv(phi)*[[0;1];0]
   b2=inv(phi)*[[0;0];1]
   b=cell(1,2)
   b{1}=b1;b{2}=b2;
    
G=0
for i=1:l1
    G=G+g(i)
    i=i+1;
end


   for i=1:l1
        m=cell(1,g(i))
    v1{i}=cell(1,(g(i)))
    j=1
    while(j<=g(i))
         m{j}=A22^(j-1)*b{i} 
   j=j+1;
    
    end
    v1{i}=cell2mat(m)
    V=cell2mat(v1)
    i=i+1;
   end

    A12til=[0 1 0;0 0 1];
    A22til=[0 0 0;1 0 0;0 0 0];
    S=A12*V*pinv(A12til)
    O=inv(V)*A22*V
   
    X=[O(:,g(1)) O(:,g(1)+g(2))]
    A12til=inv(S)*A12*V
    A22til=inv(V)*A22*V-X*A12til
    F2til=F2*V
    syms s
    Ztil=adjoint(s*eye(n-p)-A22til)*transpose(A12til)
    Util=det(s*eye(n-p)-A22til)*eye(p)
    