function [xTr,xTe,u,m]=preprocess(xTr,xTe);
% function [xTr,xTe,u,m]=preprocess(xTr,xTe);
%
% Preproces the data to make the training features have zero-mean and
% standard-deviation 1
%
% output:
% xTr - pre-processed training data 
% xTe - pre-processed testing data
% 
% u,m - any other data should be pre-processed by x-> u*(x-m)
%

[d,nTr] = size(xTr);
[d,nTe] = size(xTe);

%here is to get the number of the traning data and testing data.

%now is to normalize the training data.
meanxTr = mean(xTr,2);
standxTr = std(xTr,0,2);
%is to normalize the traning dsta
meanXTrMat = repmat(meanxTr,1,nTr);
%diffMat = xTr - meanXTrMat;
%Tem = diffMat.*diffMat;
%Tem = sum(Tem,2);
%nTrMat = repmat(nTr,d,1);
%variance = Tem./nTrMat;
%standxTr = sqrt(variance);


%now is to normalize the testing data
meanXTeMat = repmat(meanxTr,1,nTe);

%here is to set u anad m
m = meanxTr;
u = ones(d,1)./standxTr;
u = diag(u);
xTr = u*(xTr - meanXTrMat); 
xTe = u*(xTe - meanXTeMat);

