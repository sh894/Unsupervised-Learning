function h = plot_labeled(xdata,ydata,labels)
% PLOT_LABELED - Plots the samples with colored symbols depending on the class label
%   
% Written by:
% -- 
% John L. Weatherwax                2008-11-05
% 
% email: wax@alum.mit.edu
% 
% Please send comments and especially bug reports to the
% above email address.
% 
%-----

color_choice   = 'bgrcmykw'; 
symbols_choice = 'ox+*sdv.';
n_choices      = length(color_choice); 

labels_u = unique(labels); 
n_labels = length(labels_u); 
h = figure; hold on; 
for li=1:n_labels,
  currentLabel = labels_u(li); 
  ci   = mod(li-1,n_choices)+1;
  inds = find( labels==currentLabel ); 
  plot( xdata(inds), ydata(inds), [color_choice(ci),symbols_choice(ci)], 'MarkerSize', 12, 'MarkerFaceColor', color_choice(ci) ); 
end



