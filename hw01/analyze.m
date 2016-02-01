function output=analyze(kind,truth,preds)	
% function output=analyze(kind,truth,preds)		
%
% Analyses the accuracy of a prediction
% Input:
% kind='acc' classification error
% kind='abs' absolute loss
% (other values of 'kind' will follow later)
% 
[d,n]=size(truth);
switch kind
	case 'abs'
		% compute the absolute difference between truth and predictions
		%fill in the code here
		diff = truth - preds;
        output = sum(abs(diff), 2) / n;
	case 'acc' 
		%% fill in code here
		 diff = truth - preds;
         m = find(diff ~= 0);
         [a, b] = size(m);
        output = 1 - b / n;	
end;

