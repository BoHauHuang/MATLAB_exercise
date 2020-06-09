clear all; close all; clc

% Sloving Ax = b by Jacobi iterative method
% 2020/03/31

A = [4 -1 1;4 -8 1;-2 1 5];
b = [7; -21; 15];
A([1 3], :) = A([3 1], :);      % swap row 1 and 3  
b([1 3], :) = b([3 1], :);
xsol = A\b                       % solution by mldivide as the benchmark

% Jacobi iterative method
% x_(k+1) = M*x_k + b1

M = [0 1/2 5/2; 4/8 0 1/8; -4 1 0];
b0 = [-15/2; 21/8; 7];

x0 = [1; 2; 2];                  % initial guess
tol = 1.e-6;                      % keep iteration until error converges to <= tol (tolerance)
error = 2*tol;                    % initial error set to larger than tol 
x(:,1) = x0;                      % first column of matrix x is tr[1 2 2]
iteration_num = 1;

while( (error > tol) && (iteration_num < 100) )
    iteration_num = iteration_num +1;          % matlab list index starting from 1
    x(:,iteration_num)= M*x(:,iteration_num-1)+ b0;
    error = norm(x(:,iteration_num)-x(:,iteration_num-1),inf);  
end

true_iteration_num = iteration_num - 1

plot(x')
xlabel('iteration number')                            % matlab list index starting from 1
ylabel('solution')                                        % so the true_iteration_num = iteration_num - 1  

% convergence analysis
% A = D + T

%D = diag(A).*eye(3);
%T = A - D;
%[V,eigv] = eigs(-inv(D)*T)
%diag(abs(eigv))

