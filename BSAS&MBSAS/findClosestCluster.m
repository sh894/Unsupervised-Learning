function [d_x_i_C_k,k] = findClosestCluster( ii, labels, X )
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
  
ulabels = unique(labels);
if( ulabels(1)==0 ) 
  ulabels = ulabels(2:end); % drop the value of 0 which indicates this point has not been labeled
end
x_ii_to_cluster = [];
for lab = ulabels,
  inds = find( labels==lab );
  rep  = getClusterRepresentative( inds, X ); 
  d = sqrt( ( X(ii,:)' - rep )' * ( X(ii,:)' - rep ) ); 
  x_ii_to_cluster = [ x_ii_to_cluster, d ]; 
end
[d_x_i_C_k,mind] = min(x_ii_to_cluster); 
k = ulabels(mind); % the cluster index to which x_i is closest 


