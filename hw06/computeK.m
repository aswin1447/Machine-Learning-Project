function K = computeK(kernel_type, X, Z, param)
% function K = computeK(kernel_type, X, Z)
% computes a matrix K such that Kij=g(x,z);
% for three different function linear, rbf or polynomial.
%
% Input:
% kernel_type: either 'linear','polynomial','rbf'
% X: n input vectors of dimension d (dxn);
% Z: m input vectors of dimension d (dxm);
% param: kernel parameter (inverse kernel width gamma in case of RBF, degree in case of polynomial)
%
% OUTPUT:
% K : nxm kernel matrix
%
%

if nargin<2,
	Z=X;
end;

[d1, n1] = size(X);        
[d2, n2] = size(Z);
if d1 ~= d2 || d1 <= 0 || n1 <= 0 || n2 <= 0,
	return;
end;

if strcmp(kernel_type, 'linear') == 1,
	K = X' * Z;


elseif strcmp(kernel_type, 'poly') == 1,
	K = (X' * Z + 1) .^ param;



elseif strcmp(kernel_type, 'rbf') == 1,
	D = l2distance(X, Z);
	K = exp((-1) * param * D);


end;

