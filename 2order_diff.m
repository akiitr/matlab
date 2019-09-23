%%1] To solve: E*L*(d2Y/dx2) = (W*L*x)/2 + (W *x 2) /2 using Finite difference method using MATLAB Code.
%defining boundary condition
xa=0;
xb=3;
fa=0;
fb=0;
E=200*10^9;
l=3*10^(-4);
w=15*10^3;
L=3;
%Grid
Nx=101;
dx=(xb-xa)/(Nx-1);
%Build matrix operation
%for DX2
z= sparse(Nx,Nx);
d= ones(Nx,1);
A=spdiags(d,-1,z);
A=spdiags(d,+1,A);
A=spdiags(-2*d,0,A);
A=[A]*1/(dx^(2));
Y=[A]*(E*l);
%%solve for b
q=[0:0.03:3]';
r=q.^2;
b=q*(w*L/2)-r*(w/2);
%solve or inverse
f=Y\b;
plot (q,f)
xlabel('Position')
ylabel('Y')
title('Bending moment diagram')
