function ybar=computeybar(xTe)
% function [ybar]=ybar(xTe);
% 
% computes the expected label 'ybar' for a set of inputs x
% generated from two standard Normal distributions (one offset by OFFSET in
% both dimensions.)
%
% INPUT:
% xTe | a 2xn matrix of column input vectors
% 
% OUTPUT:
% ybar | a 1xn vector of the expected label ybare(x)
%

global OFFSET;

[~,n]=size(xTe);
ybar=zeros(1,n);

% Feel free to use the following function to compute p(x|y)
normpdf=@(x,mu,sigma)   exp(-0.5 * ((x - mu)./sigma).^2) ./ (sqrt(2*pi) .* sigma);

%set the u matrix for y equals 1 and y equals 2
muGyE1 = zeros(2,n);
muGyE2 = 2* ones(2,n);

sigma = ones(2,n);

%this is to compute the probility of y = 0;
PxgivenyE1 = normpdf(xTe,0,sigma);
%multiply the firs row and the second row of the probility
pxgivenyE1 = PxgivenyE1(1,:).* PxgivenyE1(2,:);

%the same process as above, compute for y = 2
PxgivenyE2 = normpdf(xTe,OFFSET,sigma);
pxgivenyE2 = PxgivenyE2(1,:).* PxgivenyE2(2,:);

%for those position where probility 
pre = pxgivenyE2 > pxgivenyE1;
pre = pre + 1;
A1 = pxgivenyE1 ./ (pxgivenyE1 + pxgivenyE2);
A2 = pxgivenyE2 ./ (pxgivenyE1 + pxgivenyE2);
ybar = A1 + 2 * A2;
