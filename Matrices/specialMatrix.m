function [A] = specialMatrix(n,m)
% returns an nxm matrix
%inputs n is the number of rows and m the number of columns
%   return a matrix A with each element in the first row as the number of the
%   column, the value of each element in the first column as the number of
%   the row, and the rest of the elements has a value equal to the sum of the
%   element above it and to the left. 
A = zeros(n,m);
if nargin ~= 2
    error('Error: invalid number of input arguments')
end
for i = 1:m
    for j = 1:n
        A(1,i) = i; % makes elements in the first row the column number
        A(j,1) = j; % makes elements in the first column the row number
    end
end 
for i = 2:m
    for j = 2:n
        A(j,i) = A(j,i-1) + A(j-1,i);
    end
end



