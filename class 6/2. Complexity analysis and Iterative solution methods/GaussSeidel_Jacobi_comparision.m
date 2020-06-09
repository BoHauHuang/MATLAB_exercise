% Solving Ax=b using Gauss-Seidel and Jacobi Method in comparision
% Initialize 'A' 'b' & intial guess 'x'
% 2020/03/31

close all; clear all; clc
A = [ 5 -2 3 0 6; -3 9 1 -2 7.4; 2 -1 -7 1 6.7; 4 3 -5 7 9; 2 3.5 6.1 -4 -8.1 ];  % A is 5 by 5 matrix
b = [ -1 2 3 0.5 3.1]';
x0  = rand(5,1);        % initial guess
xsol = A\b

% Tolerance
tol = 1.e-6;                      % keep iteration until error converges to <= tol (tolerance)
error = 2*tol;                    % initial error set to larger than tol 

% Gauss-Seidel Method 
D = diag(diag(A));   % A = L + T 
L = tril(A);              % L: lower triangle 
T = triu(A)-D;          % T: everything else 
plotGauss(:,1) = x0;                      % first column of matrix x is tr[1 2 2]
GaussItr_num  = 1;

while( (error > tol) && (GaussItr_num < 100) )
    GaussItr_num = GaussItr_num +1;                       % matlab list index starting from 1
    plotGauss(:,GaussItr_num)= L\(b-T*plotGauss(:,GaussItr_num-1));
    error = norm(plotGauss(:,GaussItr_num)-plotGauss(:,GaussItr_num-1),inf);  
end

true_GaussItr_num = GaussItr_num - 1;
fprintf('Solution of the Gauss-Seidel is : \n%f \n%f \n%f \n%f \n%f in %d iterations',plotGauss(:,GaussItr_num),true_GaussItr_num);
figure(1);
plot(plotGauss')
xlabel('iteration number')                            % matlab list index starting from 1
ylabel('solution')           

% Jacobi Method
% x_(k+1) = M*x_k + b1

R = A-diag(diag(A));
dummy = diag(A);
for i = 1:5
    M(i,:) = -R(i,:)/dummy(i);
    b0(i) = b(i)/dummy(i);
end
b0 = b0';

plotJacob(:,1) = x0;                      % first column of matrix is x0 
JocobItr_num = 1;

while((error > tol) && (JocobItr_num < 100))
   JocobItr_num = JocobItr_num +1;          % matlab list index starting from 1
   plotJacob(:,JocobItr_num)= M*plotJacob(:,JocobItr_num-1)+ b0;
   error = norm(plotJacob(:,JocobItr_num)-plotJacob(:,JocobItr_num-1),inf);  
end

true_JocobItr_num = JocobItr_num - 1;
fprintf('Solution of the Jacobi is : \n%f \n%f \n%f \n%f \n%f in %d iterations',plotJacob(:,JocobItr_num),true_JocobItr_num);
figure(2);
plot(plotJacob')
xlabel('iteration number')                            % matlab list index starting from 1
ylabel('solution') 




