function  gradient = backprop(W, as,zs, yTr,  der_trans_func)
% function [gradient] = backprop(W, as, zs, yTr,  der_trans_func)
%
% INPUT:
% W weights (cell array)
% as output of forward pass (cell array)
% zs output of forward pass (cell array)
% yTr 1xn matrix (each entry is a label)
% der_trans_func derivative of transition function to apply for inner layers
%
% OUTPUTS:
% 
% gradient = the gradient at w as a cell array of matrices
%

n = length(yTr);
sigma = (zs{1} - yTr)/n;
gradient = cell(size(W));
lengthW = length(W);
for i = 1:lengthW,
  temMat = zs{i+1};
  gradient{i} = sigma * temMat';
  [m,TemValue] = size(as{i + 1});
  sigma = der_trans_func(as{i+1}).*((W{i}(:,1:m))' * sigma);
end,

%n=length(yTr);
%delta=zs{1}-yTr;
% compute gradient with back-prop
%gradient = cell(size(W));

%temLength = size(as{2},1)

%deltaMatrix = repmat(delta,temLength,1)
%gradientOfa = der_trans_func(as{2})
%δ = deltaMatrix .* gradientOfa 
% here first I need to compute the first layer grediscent

%aMiddle = as{3}
%temLengthMiddle =  size(as{3},1)
%I need to get a temLengthMiddle * temLength matrix
%δMiddle = zeros(1,temLengthMiddle)
%for i = 1:temLengthMiddle 
%  temValue = δ(i,:)
%  w = w{2}
%  wTem = w(i,:)
%  aMiddleOne = aMiddle(:,i)
%  TemValue = der_trans_func(aMiddleOne)
%  δMiddle(i) = sum(wTem.*aMiddleOne.*TemValue)
  
%δnextLayer = 
% for i=1:length(W)

	% INSERT CODE HERE:
	
%then compute the gradient for the weight 
%make sure that it is right for the backpropation
%end; 


%here you need to derive the first layer of the function

%loss function get the loss value, then compute the gradient descent.
%assume that there is just one layer.
%for the last layer
%length = length(W)
%because now I assume there is no transition function in the last layer:
%TrDataNum = length(yTr)
%descentLToz = zs{1} - yTr   %assume that the length is 1
%descentzToa = ones(1,TrDataNum)
%δ = descentLToz .* descentzToa

%above is to compute the descent matrix for the last layer of weight
%descentaTozSec = zs{2}                  %assume that the length is m
%LengthzSec = size(descentaTozSec,1)
%descentaTozSecMat = repmat(descentaTozSec,1,TrDataNum)
%δMat = repmat(δ,LengthzSec,1)
%descentwij = descentaTozSecMat * δMat

#now get the middle layer of output
%aSec = as{2}

%descentZSecToaSec = der_trans_func(aSec)
%descentZSecToaSecMat = repmat(descentZSecToaSec,1,TrDataNum)

#some problem about the dimension for the matrix
%this is the matrix of j * 1
%δsec = sume(δMat.* descentaTozSecMat.* descentZSecToaSecMat,2)

#there seems problem about the dimension about the matix that needed to compute
%zThr = zs{3}
%lengthOfzThr = length(zThr)
%δsecMat = repmat(δsec,1,lengthOfzThr)
%lengthOfδsec = length(δsec)
%zThrMat = repmat(zThr',lengthOfδsec,1)
%descentwijsec = δsecMat.*zThrMat
#here is to consider how to write it in multiple layer

#this is the thrid version of the computation
%[temValue,lengthW] = size(W);
%n = length(yTr);
%descentLToz = (zs{1} - yTr)/n;
%descentzToa = ones(1,n);
%descentLToa = descentLToz .* descentzToa;
%sigma = descentLToa;

%descentaTozSec = zs{2};
%[Wlength,temvalue] = size(zs{2});
%descentLToaMat = repmat(descentLToa,Wlength,1);
%gradient={};
%Tem = descentLToaMat.* descentaTozSec;
%gradient{1} = sum(Tem,2);


%gradientZsecToasec = der_trans_func(as{2});
%gradientaTozsec = W{2-1};
%[sizeofa,temValue] = size(as{2});
%gradientaTozsecMat = repmat(gradientaTozsec',1,n);
%lengthTem = length(gradientaTozsec);
%sigmaNext = repmat(sigma,sizeofa,1).*gradientaTozsecMat(1:(lengthTem-1),:).*gradientZsecToasec;
%c= sum(sigmaNext,2);
%gradient{2} = repmat(c,1,n).*zs{3};

%for i = 3:lengthW
%  sigma = repmat(sigma,1,n).*w{i}.* der_trans_func(as{i});
%  sigma = sum(sigma,2);
%  zTem = zs{i+1};
%  gradient{2} = repmat(sigma,1,n).*zTem;
%end

