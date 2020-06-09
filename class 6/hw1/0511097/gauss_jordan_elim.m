function [x,err]=gauss_jordan_elim(A,b)
[n,m]=size(A); % finding the size of matrix A 
err =0; % calculation of error 
x=zeros(n,1); % calling fuction zero
if n ~= m 
    disp('error: n~=m'); % displaying error if found 
    err = 1;
end % end of the scope of if 
if length(b) ~= n  % finding the legth of matrix B
    disp('error: wrong size of b'); % displaying error, if found
    err = 2;
else
    if size(b,2) ~= 1 
        b=b';
    end % end of the scope of if-else
    if size(b,2) ~= 1
        disp('error: b is a matrix'); % displaying erron in matrix B
        err = 3;
    end
end
if err == 0
    Aa=[A,b]; 
    for i=1:n 
        [Aa(i:n,i:n+1),err]=gauss_pivot(Aa(i:n,i:n+1));
        if err == 0
            Aa(1:n,i:n+1)=gauss_jordan_step(Aa(1:n,i:n+1),i);
        end
    end
    x=Aa(:,n+1);
end
A=0;
function A1=gauss_jordan_step(A,i) % calling of fuction function 
 
[n,~]=size(A); % determination of size of matrix A 
A1=A; % assigning A to A1 
s=A1(i,1);
A1(i,:) = A(i,:)/s;
k=[[1:i-1],[i+1:n]];
for j=k
    s=A1(j,1);
    A1(j,:)=A1(j,:)-A1(i,:)*s;
end % end of for loop 
function [A1,err]=gauss_pivot(A) % calling of fucntion 
[n,m]=size(A); % finding the size of matrix A
A1=A; % process of assigning 
err = 0; % error flag
if A1(1,1) == 0
    check = TRUE; % logical(1) - TRUE
    i = 1;
    while check
        i = i + 1;
        if i > n  
            disp('error: matrix is singular');
            err = 1;
            check = FALSE;
        else
            if A(i,1) ~= 0 && check
                check = FALSE;
                b=A1(i,:);      % process to change row 1 to i 
                A1(i,:)=A1(1,:);
                A1(1,:)=b;
            end
        end
    end
end