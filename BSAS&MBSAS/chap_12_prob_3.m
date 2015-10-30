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

addpath('/Users/huangsiman/Desktop/Assignment2/untitled folder/wax/img'); 

X = [ 1, 1 ; 
      1, 2 ; 
      2, 2 ; 
      2, 3 ; 
      3, 3 ; 
      3, 4 ; 
      4, 4 ; 
      4, 5 ; 
      5, 5 ; 
      5, 6 ; 
      -4, 5 ; 
      -3, 5 ; 
      -4, 4 ; 
      -3, 4 ];

% Part (a):
% 
%labels1 = BSAS( X, sqrt(2), 14 ); 

% plot these points and their labels 
%plot_labeled( X(:,1), X(:,2), labels1 );
%if( 1 ) saveas( gcf, '/Users/huangsiman/Desktop/Assignment2/untitled folder/wax/img/img', 'jpg' ); end

%labels2 = MBSAS( X, sqrt(2), 14 ); 

% plot these points and their labels 
%plot_labeled( X(:,1), X(:,2), labels2 );
%if( 1 ) saveas( gcf, '/Users/huangsiman/Desktop/Assignment2/untitled folder/wax/img', 'jpg' ); end


% Part (b) change the order of the points: 
% 
inds = [ 1, 10, 2 ,3, 4 ,11, 12, 5 ,6 ,7, 13 ,8 ,14, 9 ];

%labels3 = BSAS( X(inds,:), sqrt(2), 14 ); 

% plot these points and their labels 
%plot_labeled( X(inds,1), X(inds,2), labels3 );
%if( 1 ) saveas( gcf, '/Users/huangsiman/Desktop/Assignment2/untitled folder/wax/img', 'jpg' ); end

%labels4 = MBSAS( X(inds,:), sqrt(2), 14 ); 

% plot these points and their labels 
%plot_labeled( X(inds,1), X(inds,2), labels4 );
%if( 1 ) saveas( gcf, '/Users/huangsiman/Desktop/Assignment2/untitled folder/wax/img', 'jpg' ); end



% Part (c) change the order of the points again: 
% 
%inds = [ 1, 10, 5, 2, 3, 11, 12, 4, 6, 7, 13, 14, 8, 9 ];

%labels5 = BSAS( X(inds,:), sqrt(2), 14 ); 

% plot these points and their labels 
%plot_labeled( X(inds,1), X(inds,2), labels5 );
%if( 1 ) saveas( gcf, '/Users/huangsiman/Desktop/Assignment2/untitled folder/wax/img', 'jpg' ); end


labels6 = MBSAS( X(inds,:), sqrt(2), 14 ); 

% plot these points and their labels 
plot_labeled( X(inds,1), X(inds,2), labels6 );
if( 1 ) saveas( gcf, '/Users/huangsiman/Desktop/Assignment2/untitled folder/wax/img', 'jpg' ); end


