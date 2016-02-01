function [loss,gradient]=ridge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% w weight vector (default w=0)
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
%
% OUTPUTS:
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%
[d,n]=size(xTr);
A = w' * xTr - yTr;
lo = A * A';
re = lambda * (w' * w);
loss = lo + re;

gradient = 2 * xTr * (w' * xTr)' - 2 * xTr * yTr' + 2 * lambda * w;
