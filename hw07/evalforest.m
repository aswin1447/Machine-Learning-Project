function preds=evalforest(F,xTe)
% function preds=evalforest(F,xTe);
%
% Evaluates a random forest on a test set xTe.
%
% input:
% F   | Forest of decision trees
% xTe | matrix of m input vectors (matrix size dxm)
%
% output:
%
% preds | predictions of labels for xTe
%

%% fill in code here


%poplular vote
[temValue,treeNum] = size(F);
treeNum;
size(F{1});
#use for to judge every xTe value
[m,n]= size(xTe);


ypredict = zeros(1,n);


for i = 1:n
    xTeOne = xTe(:,i);
    TemValue = zeros(1,treeNum);
    for k = 1:treeNum
      T = F{k};  
      [temValue,treelength] = size(T);
      treelength;
      j = 1;
      num = 1;
      while j <= treelength && num < 100 
          judge = T(:,j);
          if  judge(4) ==0 && judge(5) == 0            %here is to say that if the node is the leaf node, then make the value to the predicted value
              TemValue(k) = judge(1);
              break;
          end
          indexFeature = judge(2);
          valueCut = judge(3);
          value = xTeOne(indexFeature);
          if value < valueCut
            j = judge(4);
          else
            j = judge(5);
          end
          num = num + 1;
      end
    end
    ypredict(i) = mode(TemValue);
end
preds = ypredict;


#then do the value evaluation according to the left and right tree, Here is very important to
#recursivly evaluate the tree

%if the prediction is not


