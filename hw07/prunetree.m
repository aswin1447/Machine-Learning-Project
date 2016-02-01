function T=prunetree(T,xTe,y)
% function T=prunetree(T,xTe,y)
%
% Prunes a tree to minimal size such that performance on data xTe,y does not
% suffer.
%
% Input:
% T = tree
% xTe = validation data x (dxn matrix)
% y = labels (1xn matrix)
%
% Output:
% T = pruned tree
%

%% fill in code here

%how many times need to interate

%how many times we need to do prunetree


Tem = T;
[temValue,TreeDepth] = size(Tem);

[temValue,length] = size(y);


for i = 1:TreeDepth
  
  judge = Tem(:,i);
  
  left = judge(4);
  right = judge(5);
  
  if left == 0 && right == 0
  
    parentIndex = judge(6);
    parent = Tem(:,parentIndex);
    parentLeft = parent(4);
    parentRight = parent(5);
    
    yTest = evaltree(Tem,xTe);
    testError = sum(yTest != y)/ length;
    
    %we assume that we can cut some nodes
    Tem(4,parentIndex) = 0;
    Tem(5,parentIndex) = 0;
    yTestAfter = evaltree(Tem,xTe);
    testErrorAfter = sum(yTestAfter != y)/ length;
    threshold = 0;
    %if the error has not changed much
    if(testErrorAfter >= testError - threshold)
      Tem(4,parentIndex) = parentLeft;
      Tem(5,parentIndex) = parentRight;
    end
  end
end 
T = Tem;

  


