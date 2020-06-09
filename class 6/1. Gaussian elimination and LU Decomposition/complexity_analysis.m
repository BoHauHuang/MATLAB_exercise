clear all;close all,clc
size=[500 1000 2000 3000 4000];  % Matrix size

for i = 1:length(size)  
    n = size(i);         
    A = rand(n);            
    b = rand(n,1);         
    
    tstart1 = tic;                            % Gaussian LU decomposition
    x1 = splv(A,b);
    
    telapse1 = toc(tstart1);
    soltimes1(i) = telapse1;
    
    tstart2 = tic;                            % Matlab optimized left devision x = A\b
    x2 = A\b;
    telapse2 = toc(tstart2);
    soltimes2(i) = telapse2;
          
    tstart3 = tic;                             % Inverse Matrix inverse(A)
    x3 = inverse(A)*b;
    telapse3 = toc(tstart3);
    soltimes3(i)= telapse3;
    
end
figure(1);                                      % calculation time soltime1 (Gaussian LU)  
plot(size,soltimes1,'o');                  % soltime2 (A\b), soltime3 (Inverse)
xlabel('matrix size');
ylabel('time to solve Ax = b(sec)');
hold on;
plot(size,soltimes2,'x');
hold on;
plot(size,soltimes3,'*');
legend('LU','mldivide','inverse');

% 
logn = log(size);
logtime1 = log(soltimes1);               % Gaussian Elimination LU                                   
pvals1 = polyfit(logn,logtime1,1);      % soltimes = kn^(B) 
ordernLU = pvals1(1)                       % log(soltimes) = A + Blog(n); pvals = [B A]
                                                     % ordernLU = B

logtime2 = log(soltimes2);                % Left division by Matlab optimization 
pvals2 = polyfit(logn,logtime2,1);       % soltimes = kn^(B)
ordernLEFTDIV = pvals2(1)               % log(soltimes) = A + Blog(n); pvals = [B A]
                                                      % ordernLEFTDIV = B

logtime3 = log(soltimes3);                 % Inverse
pvals3 = polyfit(logn,logtime3,1);        % soltimes = kn^(B)
ordernINVERSE = pvals3(1)               % log(soltimes) = A + Blog(n); pvals = [B A]
                                                       % ordernINVERSE = B


h=[0:1:4000];                         
s1 = h.^(ordernLU)*exp(pvals1(2));            % polynomial fitting to soltimes = kn^(B)
s2 = h.^(ordernLEFTDIV)*exp(pvals2(2));   % log(soltimes) = A + Blog(n); pvals = [B A]
s3 = h.^(ordernINVERSE)*exp(pvals3(2));  % Note: soltimes3./soltimes1   
hold on;
plot(h,s1,'r')
hold on;
plot(h,s2,'g')
hold on;
plot(h,s3,'b')






