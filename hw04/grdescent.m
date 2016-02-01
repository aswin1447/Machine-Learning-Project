function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
% function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
%
% INPUT:
% func function to minimize
% w0 = initial weight vector 
% stepsize = initial gradient descent stepsize 
% tolerance = if norm(gradient)<tolerance, it quits
%
% OUTPUTS:
% 
% w = final weight vector
%

if nargin<5,tolerance=1e-02;end;

[lossCurr, gradient] = func(w0);

i = 0;
while norm(gradient) > tolerance && maxiter > 0 
	w0 = w0 - stepsize * gradient; 
	lossPrev = lossCurr;
	[lossCurr, gradient] = func(w0);
	maxiter = maxiter - 1;
	if lossCurr > lossPrev
		stepsize = 0.5 * stepsize;
		maxiter = maxiter + 1;
	elseif lossPrev > lossCurr
		stepsize = 1.01 * stepsize;
	end

end

w = w0;


