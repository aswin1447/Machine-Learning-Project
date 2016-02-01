function [H,q,A,b,lb,ub]=generateQP(K,yTr,C);
% function [H,q,A,b,lb,ub]=generateQP(K,yTr,C);
%
% INPUT:	
% K : nxn kernel matrix
% yTr : 1xn input labels
% C : regularization constant
% 
% Output:
% H,q,A,b,lb,ub as defined in the Octave function 'qp'
%
% A call of qp(alpha0, H, q, A, b, lb, ub); should return the solution of the SVM specified by K,yTr,C
% for any valid alpha0 initialization.
%

[d,n]=size(K);
assert(d==n);

% YOUR CODE

H = yTr * yTr' .* K;
q = zeros(n, 1) - ones(n, 1); % q = [-1 -1 -1 ... -1]' (nx1)
A = yTr';
b = 0;
lb = zeros(n, 1);
ub = C * ones(n, 1);




