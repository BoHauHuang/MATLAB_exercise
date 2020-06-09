clear all;
close all;
clc;
size=[10, 50, 100, 150, 200, 300];  % Matrix size

for i = 1:length(size)  
    n = size(i);         
    A = rand(n);            
    b = rand(n,1);         
    
    tstart1 = tic;
    x1 = inv(A)*b;
    telapse1 = toc(tstart1);
    soltimes1(i) = telapse1;
    
    tstart2 = tic;
    x2 = gauss_jordan_elim(A,b);
    telapse2 = toc(tstart2);
    soltimes2(i) = telapse2;
          
    tstart3 = tic;
    x3 = (((det(A))^-1)*cofactors(A))*b;
    telapse3 = toc(tstart3);
    soltimes3(i)= telapse3;
end

figure(1);                                 
plot(size,soltimes1,'o');
xlabel('matrix size');
ylabel('time to solve Ax = b(sec)');
hold on;
plot(size,soltimes2,'x');
hold on;
plot(size,soltimes3,'*');

logn = log(size);
logtime1 = log(soltimes1);                                
pvals1 = polyfit(logn,logtime1,1);
ordernInv = pvals1(1); 

logtime2 = log(soltimes2);
pvals2 = polyfit(logn,logtime2,1);
ordernGJ = pvals2(1);

logtime3 = log(soltimes3);
pvals3 = polyfit(logn,logtime3,1);
ordernCofactor = pvals3(1);

h = [0:1:4000];                        
s1 = h.^(ordernInv)*exp(pvals1(2));
s2 = h.^(ordernGJ)*exp(pvals2(2));
s3 = h.^(ordernCofactor)*exp(pvals3(2));   
hold on;
plot(h,s1,'r') 
hold on;
plot(h,s2,'g')
hold on;
plot(h,s3,'b')

legend('Inverse data point','Gauss-Jordan data point','Cofactor method data point', 'Inverse', 'Gauss-Jordan method', 'Cofactor method'); 