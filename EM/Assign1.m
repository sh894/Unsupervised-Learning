clc;
clear;
M=4;%number of clusters
N=1000;%data set
k=2;%2 dimision
load GMD.dat;
x=GMD';%input data

%initiate
%pai
%a=[1/4;1/4;1/4;1/4]';
a = [2/5;1/5;1/5;1/5];
%mu
%mu=[10,5,0,4;2,6,1,3];
mu = [9,5,1,5;3,5,1,4];
%sigma
cov(:,:,1)=[1 0;0 1];
cov(:,:,2)=[1 0;0 1];
cov(:,:,3)=[1 0;0 1];
cov(:,:,4)=[1 0;0 1];
figure(1),hold on;


%EM algorithm
count=0;%Iteration
 
interation=10;
%fvalue=zeros(1,interation);
while 1
    %posterior probability density 
    Znk_p=zeros(M,N);%posterior
     for i=1:M
         mu_i=mu(:,i);
         cov_i=cov(:,:,i);
         for j=1:N
             p_i=exp(-0.5*(x(:,j)-mu_i)'/cov_i*(x(:,j)-mu_i));%gaussian distribution
             Znk_p(i,j)=p_i;
         end
         Znk_p(i,:)=Znk_p(i,:)/sqrt(det(cov_i)); 
     end
     Znk_p=Znk_p*(2*pi)^(-k/2);
     
    %E step
    Znk=zeros(M,N);%probability
    an=zeros(1,M);%Gaussian function value 
    an_sum=0;
    for j=1:N
        for i=1:M
            an(1,i)=a(i)*Znk_p(i,j);
            an_sum=an_sum+an(1,i);
        end
        for i=1:M
            Znk(i,j)=an(1,i)/an_sum;
        end
        an_sum=0;
    end
    
    
    %M step
    %update posterior
    nk=zeros(1,M);
    for i=1:M
        for j=1:N
            nk(1,i)=nk(1,i)+Znk(i,j);
        end
    end
    a=nk/N;
    Znk_sum_mu=zeros(M,1);

    
    %update mu
    for i=1:M
        Znk_sum_mu=0;
        for j=1:N
            Znk_sum_mu=Znk_sum_mu+Znk(i,j)*x(:,j);
        end
        mu(:,i)=Znk_sum_mu/nk(i);
    end
    
    
    %update sigma
    for i=1:M
        Znk_sum_cov=zeros(k,k,M);
        for j=1:N
            Znk_sum_cov(:,:,i)=Znk_sum_cov(:,:,i)+Znk(i,j)*(x(:,j)-mu(:,i))*(x(:,j)-mu(:,i))';
        end
        cov(:,:,i)=Znk_sum_cov(:,:,i)/nk(i);
    end
    
    %log likelihood 
    tempf=sum(log(sum(Znk_p)));
    count=count+1;%iteriation time 
    plot(count,tempf,'r.'),title('Likelihood');
    
    %set iteration time 10,50,100
    if count>=interation
        break;
    end    
end

%take the result to find maximum posterior probability for each point 
a_final=a; 
mu_final=mu;
cov_final=cov;


% caculate maximum probability to each point 
% density function 
Znk_pd=zeros(M,N);
 for i=1:M
        mu_m=mu_final(:,i);
        cov_m=cov_final(:,:,i);
        for j=1:N
            p_m=exp(-0.5*(x(:,j)-mu_m)'/cov_m*(x(:,j)-mu_m));
            Znk_pd(i,j)=p_m;
        end
        Znk_pd(i,:)=Znk_pd(i,:)/sqrt(det(cov_m));
 end
 
 %posterior probability 
 Znk_new=zeros(M,N);
 m=zeros(1,M);
 m_sum=0;
 for j=1:N
     for i=1:M
         m(1,i)=a_final(i)*Znk_pd(i,j);
         m_sum=m_sum+m(1,i);
     end
     for i=1:M
         Znk_new(i,j)=m(1,i)/sum(m);
     end
 end
 cluster=zeros(1,N);
 
 %use the maximum posterior probability for each data to assign cluster
 for a=1:N
     ss=Znk_new(:,a);
   [s,b]=max(ss);
   cluster(1,a)=b;
 end
 
 %assign different color to each cluster
 figure(2),hold on
 for p=1:N
    if cluster(1,p)==1
        plot(x(1,p),x(2,p),'b.'),title('clusters');
    elseif cluster(1,p)==2
        plot(x(1,p),x(2,p),'g.'),title('clusters');
    elseif cluster(1,p)==3
        plot(x(1,p),x(2,p),'r.'),title('clusters');
    elseif cluster(1,p)==4
        plot(x(1,p),x(2,p),'m.'),title('clusters');
    end
        
 end
 hold off
 
 %show results 
disp('a_final=');  disp(a_final);
disp('mu_final='); disp(mu_final);
disp('cov_final=');disp(cov_final);


