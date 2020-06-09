clear all; close all; clc

% Sloving Ax = b by Jacobi iterative method
% 2020/03/31

A = [4 -1 1;4 -8 1;-2 1 5];
b = [7; -21; 15];
xsol = A\b                       % solution by mldivide as the benchmark

% Jacobi iterative method
% x_(k+1) = M*x_k + b0

M = [0 1/4 -1/4; 1/2 0 1/8; 2/5 -1/5 0];
b0 = [7/4; 21/8; 15/5];

x0 = [1; 2; 2];             % initial guess
x(:,1) = x0;                % first column of matrix x is x0

tol = 1.e-6;                % keep iteration until error converges to <= tol (tolerance)
error = 2*tol;              % initial error set to larger than tol 
iteration_num = 1;          % while needs to initialize the loop variables: error, iteration_num

while( (error > tol) && (iteration_num < 100) )
    iteration_num = iteration_num +1;          % matlab list index starting from 1
    x(:,iteration_num)= M*x(:,iteration_num-1)+ b0;
    error = norm(x(:,iteration_num)-x(:,iteration_num-1),inf);  
end

true_iteration_num = iteration_num - 1

plot(x')
xlabel('iteration number')                            % matlab list index starting from 1
ylabel('solution')                                        % so the true_iteration_num = iteration_num - 1  
text(iteration_num, 2.1,'x_1')
text(iteration_num, 4.1,'x_2')
text(iteration_num, 3.1,'x_3')

% convergence analysis
% A = D + T

D = diag(A).*eye(3);
T = A - D;
[V,eigv] = eigs(-inv(D)*T)
diag(abs(eigv))