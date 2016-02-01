function [ as,zs ] = forward_pass(W, xTr, trans_func )
% function [as,zs]=forward_pass(W,xTr,trans_func)
%
% INPUT:
% W weights (cell array)
% xTr dxn matrix (each column is an input vector)
% trans_func transition function to apply for inner layers
%
% OUTPUTS:
%
% as = result of forward pass 
% zs = result of forward pass (zs{1} output layer of the forward pass) 


n=size(xTr, 2);

% first, we add the constant weight
zs{length(W)+1}=[xTr;ones(1,n)];
as{length(W)+1}=xTr;
% Do the forward process here:

for i=length(W):-1:2
	% INSERT CODE:
  wTem = W{i};
  as{i} = wTem * zs{i + 1};
  
  %here is to add the unlinear function to convert the function here.
  zs{i} = trans_func(as{i});
  %for the result of as, we need to add the constant value for for the input so it can get the different 
	zs{i}=[zs{i};ones(1,n)];
end;
% INSERT CODE: (last one is special, no transition function)

   %there is no need to add the constants in the end of each matrix.
   wTem = W{1};
   as{1} = wTem * zs{2};
   zs{1} = as{1};   %so if there is no transaction function, so the zs{1} would be equal to as{1}, is this right or not?
end

