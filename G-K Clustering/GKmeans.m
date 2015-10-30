clc;
clear;
data=load('GKlines.dat');
u=zeros(100,2);
%NUMBER OF CLUSTERS
N=2;
%FUZZIFIER
q=2;
l=2;
%INITIALIZE REPRESNTATIVE
% A(:,j)???A????j?????
%INITIAL CENTER
Center(:,1)=[-1 0]';
Center(:,2)=[0 1]';
sigma1=[1 0;0 1]; 
sigma2=[1 0;0 1];
c11=Center(:,1); 
c12=Center(:,2);
%TOTAL DISTANCE
D_sum=zeros(1,6);
for itera=1:1:6
%CLEAR THE PARAMETER    
    sum1u=0; sum2u=0; sum31u=0; sum32u=0;
    sum1d=0; sum2d=0;
    
%CACULATE THE U FUNTION FOR EACH DATA
for i=1:1:100
   D1=(det(sigma1))^(1/l).*(data(i,:)-c11')/sigma1*(data(i,:)'-c11);
   D2=(det(sigma2))^(1/l).*(data(i,:)-c12')/sigma2*(data(i,:)'-c12);
   %U FUNCTION FOR CLUSTER 1
   u(i,1)=1/(D1/D2+D1/D1);
   %U FUNCTION FOR CLUSTER 2
   u(i,2)=1/(D2/D2+D2/D1);
   %FOR EACH itera,CACULATE THE SUM DISTANCE
    D_sum(1,itera)=D_sum(1,itera)+min([D1,D2]);
    sum1u=sum1u+u(i,1)^2*data(i,:);
    sum1d=sum1d+u(i,1)^2;
    sum2u=sum2u+u(i,2)^2*data(i,:);
    sum2d=sum2d+u(i,2)^2;
    sum31u=sum31u+u(i,1)^2*(data(i,:)'-c11)*(data(i,:)-c11');
    sum32u=sum32u+u(i,2)^2*(data(i,:)'-c12)*(data(i,:)-c12');
end
%UPDATE CLUSTER REPRESENTATIVE
%UPDATE CENTER
c(1,:,itera)=sum1u./sum1d;
c(2,:,itera)=sum2u./sum2d;
%UPDATE COVARIANCE
Sigma(1,:,:,itera)=sum31u./sum1d;
Sigma(2,:,:,itera)=sum32u./sum2d;
sigma1=sum31u./sum1d;
sigma2=sum32u./sum2d;
c11=(sum1u./sum1d)';
c12=(sum2u./sum2d)';
end

%PLOT THE DATA WITH DIFFERENT COLORS
[a,b]=max(u');
figure(1);
for i=1:1:100
    if b(1,i)==1
        plot(data(i,1),data(i,2),'r*');
        hold on;
    end
    if b(1,i)==2
        plot(data(i,1),data(i,2),'g*');
        hold on;
    end
end
hold off

figure(2);
plot(1:6,D_sum);

