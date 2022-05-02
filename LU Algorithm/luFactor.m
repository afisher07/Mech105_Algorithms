function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix
P = eye(size(A));
U = zeros(size(A));
L = eye(size(A));
[m,n] = size(A);
if m ~= n
    error('Matrix must be square')
end
for k = 1:n
    [pivot, location] = max(abs(A(k:n,k)));
    swap = location + k - 1;
    if swap ~= k
        A([k, swap],:) = A([swap, k],:);
        P([k, swap],:) = P([swap, k],:);
    end
    for i = k+1:n
        A(i,k) = A(i,k)/A(k,k);
        for j = k+1:n
        A(i,j) = A(i,j) - A(i,k)*A(k,j);
        end
    end
end
U = triu(A);
L = tril(A,-1) + eye(n,n);
