function D=l2distance(X,Z)
% function D=l2distance(X,Z)
%	
% Computes the Euclidean distance matrix. 
% Syntax:
% D=l2distance(X,Z)
% Input:
% X: dxn data matrix with n vectors (columns) of dimensionality d
% Z: dxm data matrix with m vectors (columns) of dimensionality d
%
% Output:
% Matrix D of size nxm 
% D(i,j) is the Euclidean distance of X(:,i) and Z(:,j)
%
% call with only one input:
% l2distance(X)=l2distance(X,X)
%

if (nargin==1) % case when there is only one input (X)
	%% fill in code here
    [d,n]=size(X); % dimension of X
    XT = X';
    U = sum(XT .* XT, 2);
    U2 = repmat(U, [1, n]);
    %V = sum(X' .* X', 2);
    V2 = repmat(U', [n, 1]);
    M = XT * X;
    D = U2 + V2 - 2 * M;
    
else  % case when there are two inputs (X,Z)
	%% fill in code here
    [d,n]=size(X); % dimension of X
    [~,m]=size(Z); % number of input vectors in Z
    XT = X';
    U = sum(XT .* XT, 2);
    U2 = repmat(U, [1, m]);
    ZT = Z';
    V = sum(ZT .* ZT, 2);
    V2 = repmat(V', [n, 1]);
    M = XT * Z;
    D = U2 + V2 - 2 * M;
end;
%



