function y = poEllipsoid_(x)
% Benchmark Function: Ellipsoid.
%
% Input ->
%   x : An individual, specified as a vector.
%       Support both the row and column vector.
%       Not accept as input the population whose size is greater than 1.
% Output <-
%   y : Fitness, specified as a scalar.
if ~isvector(x)
    error('the input should be a vector.');
end
funcDim = numel(x) - 1;
if funcDim < 1
    error('`numel(x)` should be greater than 1.');
end
expo = 10 .^ (6 * (0 : funcDim) / funcDim);
if iscolumn(x)
    y = expo * (x .^ 2);
else
    y = (x .^ 2) * expo';
end
end
