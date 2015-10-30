function labels = merging(X,labels,M1)
% MERGING - The simple cluster merging procedure of Fu 93 
%   
% Inputs: 
%   X : [ number_of_samples x number_of_features ] matrix of feature vectors
%   labels : a cluster label for each point in the data set X indexed from 1 
%          (0 would means that this point is not a member of any cluster)
%   M1: specifies the closeness of two clusters (in units of physical distance)
% 
% Notes: 
%   For this scheme one needs to define the distance between two clusters C_i and C_j.
%   This implementation uses a cluster representative given by the mean of the points 
%   in the cluster and the distance between two clusters C_i and C_j is then taken to be
%    the Euclidean distance between the two cluster reprentatives.
% 
% Written by:
% -- 
% John L. Weatherwax                2010-04-13
% 
% email: wax@alum.mit.edu
% 
% Please send comments and especially bug reports to the
% above email address.
% 
%-----

N = size(X,1);
nFeatures = size(X,2); 

while 1
  % find the two closest clusters C_i and C_j: 
  % 
  uLabels  = unique(labels); 
  nULabels = length(uLabels); 
  closestClusters = []; % will hold the index of the two closest clusters i.e. closestClusters = [ 1, 5 ] 
  minDist         = Inf; 
  for ii=1:nULabels,
    inds_ii = find( labels==uLabels(ii) );
    cRep_ii = getClusterRepresentative(inds_ii, X);
    for jj=ii+1:nULabels,
      inds_jj = find( labels==uLabels(jj) );
      cRep_jj = getClusterRepresentative(inds_jj, X); 
      dij = norm( cRep_ii - cRep_jj ); 
      if( dij<minDist ) 
	closestClusters = [ ii, jj ];
	minDist         = dij; 
      end
    end
  end

  % We now have the two clusters (ii,jj) that are the closest in distance from each other
  % 
  % - If the closest two clusters are actually far appart ... we are done
  if( minDist>M1 ) 
    break; 
  end
  % - Otherwise we merge clusters C_ii and C_jj
  % 
  ii = closestClusters(1); 
  jj = closestClusters(2); 
  inds_jj = find( labels==uLabels(jj) );
  labels(inds_jj) = uLabels(ii); 
end



