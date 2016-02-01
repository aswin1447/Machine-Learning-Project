function [ypredict]=evaltree(T,xTe)
% function [ypredict]=evaltree(T,xTe);
%
% input:
% T0  | tree structure
% xTe | Test data (dxn matrix)
%
% output:
%
% ypredict : predictions of labels for xTe
%

%% fill in code here

%based on the tree structure;

% I can implement evaluate the tree:



[temValue, treelength] = size(T);

#use for to judge every xTe value
[m,n]= size(xTe);


ypredict = zeros(1,n);

for i = 1:n
    xTeOne = xTe(:,i);
    j = 1;
    while j <= treelength
        judge = T(:,j);
        if  judge(4) ==0 && judge(5) == 0            %here is to say that if the node is the leaf node, then make the value to the predicted value
            ypredict(i) = judge(1);
            break
        end
        indexFeature = judge(2);
        valueCut = judge(3);
        value = xTeOne(indexFeature);
        if value < valueCut
          j = judge(4);
        else
          j = judge(5);
        end
    end
end


#then do the value evaluation according to the left and right tree, Here is very important to
#recursivly evaluate the tree

%if the prediction is not

