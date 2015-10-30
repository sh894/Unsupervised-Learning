function rep = getClusterRepresentative(inds, X)
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

rep = mean( X(inds,:), 1 )';

