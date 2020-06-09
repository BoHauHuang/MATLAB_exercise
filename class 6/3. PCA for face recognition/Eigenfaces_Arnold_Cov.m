clear all
close all
clc

% Size of each picture
m = 200;
n = 175;

% Number of sample pictures
N = 20;

avg = zeros(m*n,1);  % the average face
A = [];

%% Load Arnold Schwarzenegger
count = 0;
for j = 1:N
    figure(1)
    ff = ['faces/arnold',num2str(j,'%02d'),'.jpg'];
    u = imread(ff);                                      % Read the image into a matrix
    imshow(u)
    if(size(u,3)==1)
        M = double(u);
    else
        M = double(rgb2gray(u));                     % Change color to grey 
    end
    pause(0.1);
    R = reshape(M,m*n,1);                            % Reshape the image from M (array form) 
    A = [A,R];                                               %  to (m*n,1) vector form 
    avg = avg + R;
    count = count + 1;
end

%% Calculate the "averaged" face 
avgTS = uint8(reshape(avg,m,n));                  % Reshape the vector form back to 
figure(1), imshow(avgTS);                              % image array form (m = 200, n = 175)

%% Center the sample pictures at the "origin"

for j = 1:N
    A(:,j) = A(:,j) - avg;
    R = reshape(A(:,j),m,n);
    imshow(R);
    pause(.1);
end

%%  Computing the Eigenfaces C = A*A'
C = A*A';
[V,D] = eigs(C,10)

figure(2)
subplot(2,3,1), face1 =reshape(V(:,1), 200,175); pcolor(flipud(face1)), shading interp, colormap(gray) 
subplot(2,3,2), face2 =reshape(V(:,2), 200,175); pcolor(flipud(face2)), shading interp, colormap(gray) 
subplot(2,3,3), face3 =reshape(V(:,3), 200,175); pcolor(flipud(face3)), shading interp, colormap(gray) 
subplot(2,3,4), face4 =reshape(V(:,4), 200,175); pcolor(flipud(face4)), shading interp, colormap(gray) 
subplot(2,3,5), face5 =reshape(V(:,5), 200,175); pcolor(flipud(face5)), shading interp, colormap(gray) 
subplot(2,3,6), semilogy(diag(D))

%% project each image onto Eigenfaces (basis) 
proj_a = V'*A;
figure(3),subplot(2,2,1)
ARNOLD_1 = proj_a(:,1);                
bar(ARNOLD_1(2:9));
legend('ARNOLD_1')

hold on, subplot(2,2,2)
ARNOLD_2 = proj_a(:,2);
bar(ARNOLD_2(2:9));
legend('ARNOLD_2')

%% add some unexpected pics with Terminators
u = imread('faces/teststallone1.jpg');        
u = double(rgb2gray(u));
ustal = reshape(u,m*n,1)-avg;
stalpts = ustal'*V;
figure(3), subplot(2,2,3)
bar(stalpts(2:9));
legend('teststallone1')

v = imread('faces/testterminator8.jpg');
v = double(rgb2gray(v));
vterm = reshape(v,m*n,1)-avg;
termpts = vterm'*V;
figure(3), subplot(2,2,4)
bar(termpts(2:9))
legend('testterminator')
