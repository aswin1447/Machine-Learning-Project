function preds=knnclassifier(xTr,yTr,xTe,k);
% function preds=knnclassifier(xTr,yTr,xTe,k);
%
% k-nn classifier 
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
% k = number of nearest neighbors to be found
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%


% output random result as default (you can erase this code)
if (k <= 0)
   return;
end
[d,n]=size(xTe);
[d,ntr]=size(xTr);
[indices,dists] = findknn(xTr,xTe,k);

A = yTr(indices);
if (length(indices(1, :)) == 1)
    A = A';
end
%[B, C] = mode(A);
B = mode(A);
C = mode(-1 * A);
if (B ~= (-1 *C))
    if (k > 1)
        preds = knnclassifier(xTr,yTr,xTe,k - 1);
    else
        preds = A;
    end
elseif (length(A(:, 1)) == 1)
    preds = A;  
else
    preds = mode(A);
end
 



