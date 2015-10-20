clc;
clear;
%Initializationn 
thetaA=0.6;
thetaB=0.4;
x=[5,9,8,4,7;5,1,2,6,3];%input data

para=zeros(2,10);
Pa=zeros(2,5); %posterior probability P(A|theta')
Pb=zeros(2,5); %posterior probability P(B|theta')
Px=zeros(1,10);%likelihood

%E step
for i = 1 : 10
    disp(['Iteration:',num2str(i)]);
    likelihood=0; %likelihood
    ra_sum = 0;
    rb_sum = 0;
    ra_sum_h = 0;
    rb_sum_h = 0;
    
    for j=1:5
        %posterior probability P(A|theta')
        ra = 1/(1+thetaB^x(1,j)*(1-thetaB)^x(2,j)/(thetaA^x(1,j)*(1-thetaA)^x(2,j)));
        disp(['ra = ',num2str(ra)]);
        ra_sum = ra_sum + ra;
        
        %posterior probability P(B|theta')
        rb = 1/(1+thetaA^x(1,j)*(1-thetaA)^x(2,j)/(thetaB^x(1,j)*(1-thetaB)^x(2,j)));
        disp(['rb = ',num2str(rb)]);
        rb_sum = rb_sum + rb;
     
        ra_sum_h = ra_sum_h+ra*x(1,j);
        rb_sum_h = rb_sum_h+rb*x(1,j);
        %caculate the likelihood 
        likelihood = likelihood+thetaA^x(1,j)*(1-thetaA)^x(2,j)+thetaB^x(1,j)*(1-thetaB)^x(2,j);
        
    end
    %log likelihood
    Px(1,i) = log(likelihood);
    
    %M step 
    %updata thetaA and thetaB value
    ra = 0.1*(1/ra_sum)*ra_sum_h;
    rb = 0.1*(1/rb_sum)*rb_sum_h;
    thetaA = ra;
    thetaB = rb;
    
    %save the theta value
    para(1,i) = thetaA;
    para(2,i) = thetaB;
    disp(' ');
end
plot(1:10,Px,'r.'),title('likelihood');