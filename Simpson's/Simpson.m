function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

[p,m] = size(x);
[q,r] = size(y);

if m ~= r
    error('Imputs are not the same lenth')
end
spacing_test = diff(x);
if all(spacing_test ~= spacing_test(1,1))
    error('x input is not equally spaced')
end
n = m - 1;
odd_test = rem(n,2);
if odd_test ~=0
    warning('Trapazoidal rule will be used on the last interval')
end

b = x(1,m);
a = x(1,1);
h = (b-a)/n;
odd = 0;
even = 0;
if n == 1
    I = (b-a)*((y(1,1) + y(1,m))/2);
elseif n == 2
    I = (b-a)*((y(1,1) + 4*y(1,2) + y(1,m))/6);
elseif odd_test == 0
    for k=2:1 :n
        if rem(k,2) == 1
            odd = odd + y(k);
        else
            even = even + y(k);
        end
    end
    I = (h/3)*(y(1,1)+y(1,m)+4*even+2*odd);
elseif odd_test ~= 0
    odd = 0;
    even = 0;
    h = (x(1,m-1) - a)/(n-1);
    for k = 2:1:n-1
        if rem(k,2) == 1
            odd = odd + y(k);
        else
            even = even + y(k);
        end
    end
    I = (h/3)*(y(1,1)+y(1,m-1)+4*even+2*odd) + (b-x(1,m-1))*((y(1,m-1)+y(1,m))/2);
end




