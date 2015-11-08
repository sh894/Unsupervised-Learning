function [weight] = simGaussian(data)
% set the parameters
sigma = 2;
weight = zeros(400,400);
for i=1:400    
    for j=1:400
        dist =sqrt((data(1,i) - data(1,j))^2 + (data(2,i) - data(2,j))^2); 
        
        if dist <1.5
        weight(i,j) = exp(-(dist^2)/(2*sigma));
        end
    end
end