Data = load('Circles.dat');
W = simGaussian(Data);

 D = zeros(length(Data),length(Data));
 D = diag(sum(W));
 
 L=D-W;
 L_N = D^(-0.5)*L*D^(-0.5);

[eigenvectors,eigenvalues] = eig(L_N);

eig_vec = eigenvectors(:,2);
y1 = D^(-0.5)*eig_vec;

Media_y = median(y1);


D2=diag(sort(diag(eigenvalues),'ascend'));
[c, ind]=sort(diag(eigenvalues),'ascend');

figure
for i = 1:1:400
    if(y1(i,:)<Media_y)
        plot(Data(1,i), Data(2,i),'r+')
        hold on;
    else
        plot(Data(1,i), Data(2,i),'b+')
        hold on;
    end
end

