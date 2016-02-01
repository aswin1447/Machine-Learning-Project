function preds=evalboost(BDT,xTe)
% function preds=evalboost(BDT,xTe);
%
% Evaluates a boosted decision tree on a test set xTe.
%
% input:
% BDT | Boosted Decision Trees
% xTe | matrix of m input vectors (matrix size dxm)
%
% output:
%
% preds | predictions of labels for xTe
%

%% fill in code here

[temValue,treeNum] = size(BDT);

#use for to judge every xTe value
[m,n]= size(xTe);

ypredict = zeros(1,n);

for i = 1:n
    xTeOne = xTe(:,i);
    temValueList = zeros(1,treeNum);
    for j = 1: treeNum
        tree = BDT{1,j};
        [temValue,treeLength] = size(tree);
        k = 1;
        number = 1;
        while k <= treeLength && number < 500
          judge = tree(:,k);
          if  judge(4) ==0 && judge(5) == 0            %here is to say that if the node is the leaf node, then make the value to the predicted value
             temValueList(j) = judge(1);
             temValueList(j) = temValueList(j) * BDT{2,j};
             break
          end
          indexFeature = judge(2);
          valueCut = judge(3);
          value = xTeOne(indexFeature);
          
          if value < valueCut
            k = judge(4);
          else
            k = judge(5);
          end
          number = number + 1;
        end
    end  
    %set the value to 1 or 2
    TemValue = sum(temValueList);
    if(abs(TemValue-1)<0.25)
       ypredict(i) = 1;
    else
       ypredict(i) = 2;
    end
end
preds = ypredict;

#then do the value evaluation according to the left and right tree, Here is very important to
#recursivly evaluate the tree

%if the prediction is not

