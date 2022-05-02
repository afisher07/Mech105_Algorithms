function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%Finds the root of a function using the False Position method
%   Inputs:
    % func: function
    % xl: lower bound
    % xu: upper bound
    % es: desired relative error (defult to 0.0001%)
    % maxit: maximum number of iterations (defult to 200)
%   Outputs:
    % root: estimated root
    % fx: function evaluated at the root 
    % ea: approximate relative error (%)
    % iter: how many iterations were performed

if nargin < 3
    error('Not enough input arguments')
end
if nargin < 4
    es = 0.0001;
end
if nargin < 5
    maxit = 200;
end

iter = 0;
bracket_test = func(xu)*func(xl);
if bracket_test > 0
    error('Bounds do not bracket the root')
end
if bracket_test == 0
    if func(xu) == 0
        root = xu;
        fx = func(xu);
        maxit = iter;
        ea = 0;
        return
    end
    if func(xl) == 0
        root = xl;
        fx = func(xl);
        maxit = iter;
        ea = 0;
        return
    end
end

ea = 100;
xr = xl;
while ea > es
    previous_xr = xr;
    xr = xu - (func(xu)*(xl-xu))/(func(xl)-func(xu));
    upper_bound = func(xu)*func(xr);
    lower_bound = func(xl)*func(xr);
    if upper_bound < 0
        xu = xu;
        xl = xr;
        ea = abs((xr-previous_xr)/xr)*100;
        iter = iter + 1;
    elseif lower_bound < 0 
        xu = xr;
        xl = xl;
        ea = abs((xr-previous_xr)/xr)*100;
        iter = iter + 1;
    elseif upper_bound || lower_bound == 0
        root = xr;
        fx = func(xr);
        iter = iter + 1;
        maxit = iter;
        ea = 0;
    end
    if iter >= maxit || ea <= es
        break
    end
end
root = xr;
fx = func(xr);
maxit = iter+1;
ea = ea;
