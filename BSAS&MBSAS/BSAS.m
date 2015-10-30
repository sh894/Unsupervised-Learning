function res = BSAS(X,theta,q)
% BSAS - Basic Sequential Algorithmic Scheme
%   
% Inputs: 
%   X : [ number_of_samples by number_of_features ] matrix of feature vectors
%   theta : threshold of dissimilarty 
%   q : maximum number of clusters 
% 
% Outputs: 
%   res : the resulting point labels with values between [1, number of clusters]
% 
% Notes: 
%   For this scheme one needs to define the distance between a point x_i and a cluster C_j.
%   This implementation uses the cluster represntative is the mean and the distance between 
%   x_i and C_j is the Euclidean distance between x_i and the cluster reprentative.
% 
% Written by:
% -- 
% John L. Weatherwax                2007-07-01
% 
% email: wax@alum.mit.edu
% 
% Please send comments and especially bug reports to the
% above email address.
% 
%-----

N = size(X,1);
nFeatures = size(X,2); 

labels = zeros(1,N); % zero means the point is not yet labeled 

m=1;
labels(1)=1; 
for ii = 2:N, 
  % find C_k : d(x_ii,C_k) = min_{1 <= j <= m} d(x_ii,C_j)
  %
  [ d_x_i_C_k, k ] = findClosestCluster( ii, labels, X ); 

  if( (d_x_i_C_k > theta) && (m<q) )
    m=m+1;
  end
  labels(ii)=m;
end

res = labels; 
