function BDT=boosttree(x,y,nt,maxdepth)
% function BDT=boosttree(x,y,nt,maxdepth)
%
% Learns a boosted decision tree on data x with labels y.
% It performs at most nt boosting iterations. Each decision tree has maximum depth "maxdepth".
%
% INPUT:
% x  | input vectors dxn
% y  | input labels 1xn
% nt | number of trees (default = 100)
% maxdepth | depth of each tree (default = 3)
%
% OUTPUT:
% BDT | Boosted DTree
%


%% fill in code here



%here is to build the boost tree.

#first build the trees that use the forest method. and limit the maxdepth for each tree

#if nt is not set 
[m,n] = size(x);

WeakEps=sqrt(eps)*100

if nargin < 3,
  nt = 100;
  maxdepth = 3;
end 

if nargin < 4,
  maxdepth = 3;
end


%build the forest with limited depth
BDT = {};

%assign the initialied classfier
H = zeros(1,nt);

w = ones(1,n)*1/n;


for i = 1:nt
  tree = id3tree(x,y,maxdepth,w);
  BDT{1,i} = tree;
  yPredition = evaltree(tree,x);
  errorOne = sum((yPredition ~= y).*w);
  if(errorOne > 1/2)
     break;
  end
  
  if(abs(errorOne-0) < WeakEps)
     break;
  end
  a = 1/2 * log((1-errorOne)/errorOne);
  H(i) = a + H(i);
  for k = 1:n
    hxi = evaltree(tree,x(:,k));
    yi = y(k);
    wi = exp(-a*(hxi)*yi);
    wi = w(k) * wi;
    tem = 2*(sqrt(errorOne*(1-errorOne)));
    wi = wi/tem;
    w(k) = wi;
  end
  wSum = sum(w);
  w = w/wSum;
end

Hsum = sum(H);
H = H/Hsum;
for i = 1:nt
  BDT{2,i} = H(i);
end
