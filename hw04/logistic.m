function [loss,gradient]=logistic(w,xTr,yTr)
% function w=logistic(w,xTr,yTr)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% w weight vector (default w=0)
%
% OUTPUTS:
% 
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

[d,n]=size(xTr);

A = log(1 + exp((-1) * (w' * xTr) .* yTr));
loss = sum(A, 2);

%B = repmat(yTr, d, 1) .* xTr;
%C = 1 + exp(yTr .* (w' * xTr));

%gradient = sum((-1) * B ./ (repmat(C, d, 1)), 2);

B = 1 + exp(yTr .* (w' * xTr));

C = yTr ./ B;

gradient = (-1) * xTr * C'; 


