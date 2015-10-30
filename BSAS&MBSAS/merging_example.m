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

clc; close all; 

X = [ 2, 5; 
      6, 4; 
      5, 3; 
      2, 2; 
      1, 4; 
      5, 2; 
      3, 3; 
      2, 3; 
    ];

N = size(X,1); 

% lets look at these raw points: 
scatter( X(:,1), X(:,2), 30, ones(N,1), 'filled' ); axis([0,7,0,6] ); 

theta = 1.5; 
q     = 5; 
labs = MBSAS( X, theta, q );

% lets look at the original MBSAS cluster results: 
scatter( X(:,1), X(:,2), 25, labs, 'filled' ); axis([0,7,0,6] ); 
if( 1 ) saveas( gcf, '../../WriteUp/Graphics/Chapter12/merging_ex_plt_1', 'eps' ); end

pause 

% run merging procedure to merge together the closest clusters: 
M1 = 1.9 * theta; % pick something larger than the value of theta used above 
[ new_labs ] = merging( X, labs, M1 ); 

scatter( X(:,1), X(:,2), 25, new_labs, 'filled' ); axis([0,7,0,6] ); 
if( 1 ) saveas( gcf, '../../WriteUp/Graphics/Chapter12/merging_ex_plt_2', 'eps' ); end




