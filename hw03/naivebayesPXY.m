function [posprob,negprob] = naivebayesPXY(x,y)
% function [posprob,negprob] = naivebayesPXY(x,y);
%
% Computation of P(X|Y)
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1) (1xn)
%
% Output:
% posprob: probability vector of p(x|y=1) (dx1)
% negprob: probability vector of p(x|y=-1) (dx1)
%

% add one all-ones positive and negative example
[d,n]=size(x);
x=[x ones(d,2)];
y=[y -1 1];

[d,n] = size(x);
%% fill in code here
totalP = 0;
featureP = zeros(d, 1);
totalN = 0;
featureN = zeros(d, 1);
for i = 1:n
    if (y(1,i) == 1)
        for j = 1:d
            totalP = totalP + x(j, i);    
        end
         featureP(:, 1) = featureP(:, 1) + x(:, i);
    else
        for j = 1:d
            totalN = totalN + x(j, i);    
        end
         featureN(:, 1) = featureN(:, 1) + x(:, i);
    end
end

posprob = featureP / totalP;
negprob = featureN / totalN;

