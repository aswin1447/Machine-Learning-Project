function [loss,gradient,preds]=hinge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
% w weight vector (default w=0)
%
% OUTPUTS:
%
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

[d,n]=size(xTr);


A = ones(1,n) - yTr .* (w' * xTr);
absA = A + abs(A);
loss = sum(absA / 2) + lambda * w' * w;

yTr(find((yTr .* (w' * xTr)) > 1)) = 0;

gradient = -xTr * yTr' + 2 * w * lambda;


preds = w' * xTr;


