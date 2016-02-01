function w=perceptron(x,y);
% function w=perceptron(x,y);
%
% Implementation of a Perceptron classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
%
% Output:
% w : weight vector
%

[d,n]=size(x);
w=zeros(d,1);

%% fill in code here

for j = 1:100
    for i = 1:n
        if (w' * x(:, i) * y(1, i) <= 0)
             w = perceptronUpdate(x(:,i), y(1, i), w);
        end
    end
end

