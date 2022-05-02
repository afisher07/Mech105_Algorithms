function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination
n = size(x,2);
m = size(y,2);
if n~=m
    error('x and y have to be the same size')
end

[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);
Q1 = floor((n+1)/4);
Q3 = floor((3*n + 3)/4);
IQR = sortedY(Q3) - sortedY(Q1);
tracker = zeros(1,n);

upper = sortedY(Q3) + 1.5*IQR;
lower = sortedY(Q1) - 1.5*IQR;
for i = 1:n
    if sortedY(i) <= upper && sortedY(i) >= lower
        tracker(i) = 1;
    end
end
fX = sortedX(logical(tracker));
fY = sortedY(logical(tracker));
n = size(fX,2);

slope = (n*sum(fX.*fY) - sum(fX)*sum(fY))/(n*sum(fX.^2) - (sum(fX))^2);
intercept = mean(fY) - slope*mean(fX);

St = sum((fY - mean(fY)).^2);
Sr = sum((fY - (slope*fX + intercept)).^2);
Rsquared = (St - Sr)/St;





