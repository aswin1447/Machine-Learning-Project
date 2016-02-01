function F=forest(x,y,nt)
% function F=forest(x,y,nt)
%
% INPUT:
% x | input vectors dxn
% y | input labels 1xn
%
% OUTPUT:
% F | Forest
%

%% fill in code here

%this is to get the forest of the forest from the label tree.

[m,n] = size(x);

#define the size of radonm tree


%retunr the size of random tree

#here I need to get the array for the 2-demension of integer

%set the depth to 3 or 4, so that achieve a tree that has limited depth for the classfication
%F = zeros(nt,6,n);
F={};

for i = 1:nt

  index = randsample(n,n,1);
  
  xtraining = x(:,index);
  ytraining = y(index);
  %n
  %ize(xtraining)
  
  tree = id3tree(xtraining,ytraining,4);
  %size(tree)
  %size(F)
  F{i}= tree;
  #here is to build decision tree building on forest:
end

