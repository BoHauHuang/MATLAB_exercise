clear all; close all; clc

% Sloving Ax = b by Gauss-Seidel iterative method
% 2020/03/31

A = [4 -1 1;4 -8 1;-2 1 5];
b = [7; -21; 15];
xsol = A\b                       % solution by mldivide as the benchmark

% Gauss-Seidel iterative method
% x_(k+1) = -L^(-1)*T*x_k + b1

D = diag(diag(A));   % A = L + T 
L = tril(A);              % L: lower triangle 
T = triu(A)-D;          % T: everything else 

x0 = [1; 2; 2];                  % initial guess
tol = 1.e-6;                      % keep iteration until error converges to <= tol (tolerance)
error = 2*tol;                    % initial error set to larger than tol 
x(:,1) = x0;                      % first column of matrix x is tr[1 2 2]
iteration_num = 1;

while( (error > tol) && (iteration_num < 100) )
    iteration_num = iteration_num +1;                       % matlab list index starting from 1
    x(:,iteration_num)= L\(b-T*x(:,iteration_num-1));
    error = norm(x(:,iteration_num)-x(:,iteration_num-1),inf);  
end

true_iteration_num = iteration_num - 1

plot(x')
xlabel('iteration number')                            % matlab list index starting from 1
ylabel('solution')                                        % so the true_iteration_num = iteration_num - 1  
text(iteration_num, 2.1,"x_1")
text(iteration_num, 4.1,"x_2")
text(iteration_num, 3.1,"x_3")

% cinvergence
[V,eigv] = eigs(-inv(L)*T)
diag(abs(eigv))
