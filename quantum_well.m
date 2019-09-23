%Quantum well using the finite difference method

hbar = 1;
mass = 1;
%Domain range
xa=-20;
xb=20;
Nx =1201;%number of points
dx=(xb-xa)/(Nx-1);%step size
%for kinetic
z=sparse(Nx,Nx);
d= ones(Nx,1);
A=spdiags(-d,-1,z);
A=spdiags(-d,+1,A);
A=spdiags(2*d,0,A);
kinetic_multiplier = hbar^2/(2*mass*dx^2);
A = A*kinetic_multiplier;
a=5;%for quantum well
L=30;
v=2;
t=0.05;
x=-L:t:L;
s=size(x);
V(1:s(2))=0;
for i=1:s(2)
if abs(x(i))<a
V(i)=-v;
end
end
P=V';
%for potential
B=spdiags(P,0,z);
%the hamiltonian
hamiltonian = A+B;
[eigenvectors, eigenvalues] =
eig(full(hamiltonian));%calculation of eigen values and eigen
vector
x1 = linspace(0,dx*Nx,Nx);%initializing x-axis
ground_state_wavefunction = eigenvectors(:,1) +
eigenvalues(1,1)*d;

first_excited_state = eigenvectors(:,2) + eigenvalues(2,2)*d;
second_excited_state = eigenvectors(:,3) + eigenvalues(3,3)*d;
plot(x1,V,'-k','linewidth',4); %plotting potetntial V
hold on
plot(x1, ground_state_wavefunction, 'g', 'LineWidth', 2)%for
ground state
hold on
plot(x1, first_excited_state, 'c', 'LineWidth', 2)
hold on
plot(x1, second_excited_state, 'r', 'LineWidth', 2)
legend('Potential Energy', 'Ground State', 'First Excited
State', 'Second Excited State')
xlabel('Position')
ylabel('Energy')
title(' Wavefunction vs. Position for the First Three Energy
Levels')
