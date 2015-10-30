function [thetas,numFoundClusters] = estimateNumberOfClusters(X,s,Nsteps, q)
% ESTIMATENUMBEROFCLUSTERS - Estimates the number of clusters on the given data set using BSAS. 
%   
% Inputs: 
%   X      : [ number_of_samples by number_of_features ] matrix of feature vectors
%   s      : number of monte carlo trials to do for each threshold "theta" in the BSAS algorithm 
%   Nsteps : number of steps to take between the min and max thresholds [a,b]
%   q      : maximum number of clusters used in BSAS 
% 
% Notes: 
%   For this scheme one needs to define the distance between points x_i and x_j.
%   This implementation uses distance between x_i and x_j to be the Euclidean 
%   distance.
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

N         = size(X,1);
nFeatures = size(X,2); 

% Compute the distances between all pairs of points: 
Xd = pdist(X, 'euclidean');

% Compute a/b the minimum/maxium distance between any samples in X: 
% 
a = min(Xd);
b = max(Xd);

thetas           = linspace( a, b, Nsteps );
numFoundClusters = zeros( s, Nsteps ); 
for ti = 1:Nsteps,
  t = thetas(ti); 
  for si = 1:s, 
    labs = BSAS( X(randperm(N),:), t, q ); 
    numFoundClusters(si,ti) = length(unique(labs));
  end
end

