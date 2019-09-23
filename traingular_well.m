%Traingular potential well using FD method

%Range of domain
y=[0:0.04:2]';
x=y;%potential profile
xa=-10;
xb=10;
Nx=51;%number of points
dx=(xb-xa)/(Nx-1);%step size
%kinetic term
z= sparse(Nx,Nx);
d= ones(Nx,1);
A=spdiags(-d,-1,z);
A=spdiags(-d,+1,A);
A=spdiags(2*d,0,A);
K=(A)/(dx^2);
%potential term
P=spdiags(x,0,z);
%hamiltonian
H=K+P;
%calculating eigen values and eigen vector
[c,D] = eig(full(H));
DD=diag(D);
[E,I]=sort(DD);%sorting of eigen values
%energy states
ground_state_wavefunction = c(:,1) + D(1,1)*d;
first_excited_state = c(:,2) + D(2,2)*d;
second_excited_state = c(:,3) + D(3,3)*d;
third_excited_state = c(:,4) + D(4,4)*d;
fourth_excited_state = c(:,5) + D(5,5)*d;
fifth_excited_state = c(:,6) + D(6,6)*d;
E_Harmonic_oscillator=E(1:min(Nx,6))%display energy levels
plot(y,x,'k','LineWidth', 4)%plot potential graph
hold on
plot(x,ground_state_wavefunction, 'g', 'LineWidth', 2)%ground
state
hold on

plot(x, first_excited_state, 'c', 'LineWidth', 2)%first excited
state
hold on
plot(x, second_excited_state, 'r', 'LineWidth', 2)%second
excited state
hold on
plot(x, third_excited_state,'m', 'LineWidth', 2)%third excited
state
hold on
plot(x, fourth_excited_state,'b', 'LineWidth', 2)%fourth excited
state
hold on
plot(y, fifth_excited_state,'k', 'LineWidth', 2)%fifth excited
state
hold on
plot([0 2],[E(1:min(Nx,6)) E(1:min(Nx,6))],'m','linewidth',2);
%plot red energy levels
legend('Potential Energy', 'Ground State', 'First Excited
State', 'Second Excited State','Third excited state','Fourth
excited state','Fifth excited state')
xlabel('Position')
ylabel('Energy')
title('Wavefunction vs. Position for the First Three Energy
Levels')
