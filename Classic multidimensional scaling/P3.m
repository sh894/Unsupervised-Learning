clc;
clear all;
close all;

 d=[0,1,sqrt(5),sqrt(5),2;...
    1,0,sqrt(2),2,sqrt(5);...
    sqrt(5),sqrt(2),0,sqrt(2),sqrt(5);...
    sqrt(5),2,sqrt(2),0,1;...
    2,sqrt(5),sqrt(5),1,0];
 
D = d.^2;
J = eye(5)-(1/5)*ones(5,5);
B =(-0.5)*J*D*J;
[eigenvectors,eigenvalues] = eig(B);
% eigenvectors_t = eigenvectors.';
% B_1 =  eigenvectors*eigenvalues*eigenvectors_t;
 
[Y,eigv]=cmdscale(D);

figure,plot(Y(:,1), Y(:,2),'r+'),title('Estimated Data Points'); 
