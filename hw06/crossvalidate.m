function [bestC,bestP,bestval,allvalerrs]=crossvalidate(xTr,yTr,ktype,Cs,paras)
% function [bestC,bestP,bestval,allvalerrs]=crossvalidate(xTr,yTr,ktype,Cs,paras)
%
% INPUT:	
% xTr : dxn input vectors
% yTr : 1xn input labels
% ktype : (linear, rbf, polynomial)
% Cs   : interval of regularization constant that should be tried out
% paras: interval of kernel parameters that should be tried out
% 
% Output:
% bestC: best performing constant C
% bestP: best performing kernel parameter
% bestval: best performing validation error
% allvalerrs: a matrix where allvalerrs(i,j) is the validation error with parameters Cs(i) and paras(j)
%
% Trains an SVM classifier for all possible parameter settings in Cs and paras and identifies the best setting on a
% validation split. 
%


%% Split off validation data set
% YOUR CODE
[d n] = size(xTr);
p = 0.2;
if p * n == floor(p * n)
	xTrain = xTr(:, 1 : p * n);
	yTrain = yTr(:, 1 : p * n);
	xValida = xTr(:, p * n + 1 : n);
	yValida = yTr(:, p * n + 1 : n);
else
	xTrain = xTr(:, 1 : floor(p * n));
	yTrain = yTr(:, 1 : floor(p * n));
	xValida = xTr(:, ceil(p * n) : n);
	yValida = xTr(:, ceil(p * n) : n);
end;


%% Evaluate all parameter settings
% YOUR CODE

lenC = length(Cs);
lenP = length(paras);
allvalerrs = zeros(lenC, lenP);
min = 1000;
for i = 1 : lenC
	for j = 1 : lenP
		[svmclassify,sv_i,alpha]=trainsvm(xTrain,yTrain,Cs(i),'rbf',paras(j));
		allvalerrs(i, j) = sum(sign(svmclassify(xValida))~=yValida(:))/length(yValida);
		if (min > allvalerrs(i, j))
			bestC = Cs(i);
			bestP = paras(j);
			bestval = allvalerrs(i, j);
			min = allvalerrs(i, j);
		end;
	end;
end;


%% Identify best setting
% YOUR CODE


