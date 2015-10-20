# Unsupervised-Learning
Assign1.m:
Implement the EM algorithm for Gaussian mixture density (GMD) parameter estimation by using MATLAB.
Estimate the GMD parameters for the dataset GMD based on the assumption that the GMD has four component Gaussian pdfs, with each having a full covariance matrix. Terminate your EM estimation at the 100th iteration, i.e., use
theta(100) as the estimate for the model. The following two initialization methods are to be used in your experiments:
a) Specified theta(0) and termination:
a1(0) = a2(0) = a3(0) = a4(0) = 1/4,
mu1(0)=[10 2]T ,mu2(0)=[5 6]T ,mu3(0)=[0 1]T ,mu4(0)=[4 3]T ,
sigma1(0) = sigma2(0) = sigma3(0) = sigma4(0) = [1 0;0 1];

The estimated model parameters (mean vectors, covariance matrices, and mixture weights) produced in the final iteration for the initializations.

For the specified initialization, compute the log likelihood scores of the observed data log p(X |  (t) ) for t=1,2,...,100, and show in a plot the function values vs. t for the specified range of iterations .

For the specified initialization, use the maximum posterior probability rule to assign each data sample xn to one of the four clusters k =1,2,3,4:
