function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

Cpos = [0.01 0.03 0.1 0.3 1 3 10 30]' ;
sigmapos =  Cpos ;

min_error =  Inf ;
%total = mat2str(length(Cpos) * length(sigmapos)) ;

for i = 1:length(Cpos)
  for j = 1:length(sigmapos)
     %disp(strcat(mat2str((i-1)*length(Cpos)+j),"/" ,total)); 
     C_test = Cpos(i) ;
     sigma_test = sigmapos(j) ;
     model = svmTrain(X, y, C_test, @(x1, x2) gaussianKernel(x1, x2, sigma_test)) ;
     predictions = svmPredict(model, Xval);
     current_error = mean(double(predictions ~= yval)) ;
     
     if min_error > current_error
        min_error = current_error ;
        C = C_test ;
        sigma = sigma_test ;
     endif 
  endfor
endfor

% =========================================================================

end
