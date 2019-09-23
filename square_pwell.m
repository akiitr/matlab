clc;
clear all;
close all;
%taking some variable constant
hbar=1;
mass=1;
xa=input('enter the starting point for draw ');
xb=input('enter the ending point of the draw ');
nx=input('enter the no of samples ');
nx=nx+1;
%step size
ss=((xb-xa)/(nx-1));
%vector
x=xa:ss:xb;
%constant multiplier
h=hbar^2/(mass);
%matrix for d^2psi/dx^2 usinf finite difference method
z=zeros(nx,nx);
d=ones(nx,1);
dx2=spdiags(-d,-1,z );
dx2=spdiags(-d,+1,dx2);
dx2=spdiags(2*d,0,dx2);
dx2=(1/(2*(ss^2)))*dx2;
%first term of the schrodinger equation
((h^2/2m)*d2psi/dx2)
a = h*dx2;
%second term is potential term v*psi
v(1:nx)=0;
v_depth=input('enter the potential depth ');
v_depth=-(v_depth);
w=input('enter the potential width ');
%for creating potential profile
for i=1:nx
if abs(x(i))<(w/2)
v(i)=v_depth;
end
end
%transposing for matrix dimesion match
p=v';
% potential
b= spdiags(p,0,z);
%final energy function E*psi
e=a+b;
%caluculating eigen vectors and values
[evector ,evalue] = eig(full(e));
%first eigen value and function

f1=evector(:,1)+evalue(1,1)*d;
'FIRST EIGEN VALUE IS: '
evalue(1,1)
%second eigen value and function
f2=evector(:,2)+evalue(2,2)*d;
'second EIGEN VALUE IS: '
evalue(2,2)
%third eigen value and function
f3=evector(:,3)+evalue(3,3)*d;
'third EIGEN VALUE IS: '
evalue(3,3)
plot(x,v);
hold on;
plot(x,f1);
hold on
plot(x,f2);
hold on
plot(x,f3);
