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

scatter( X(:,1), X(:,2), 30, ones(N,1), 'filled' ); axis([0,7,0,6] ); 

theta = 2.5; 
%theta = 3; 
q     = 5; 
labs = MBSAS( X, theta, q );

scatter( X(:,1), X(:,2), 25, labs, 'filled' ); axis([0,7,0,6] ); 
if( 1 ) saveas( gcf, '../../WriteUp/Graphics/Chapter12/dup_fig_12_3_MBSAS', 'eps' ); end

theta1 = 2.2; 
theta2 = 4; 

labs = TTSAS( X, theta1, theta2 ); 

scatter( X(:,1), X(:,2), 25, labs, 'filled' ); axis([0,7,0,6] ); 
if( 1 ) saveas( gcf, '../../WriteUp/Graphics/Chapter12/dup_fig_12_3_TTSAS', 'eps' ); end

return 

