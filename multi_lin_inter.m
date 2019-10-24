function [poly_coeffs] = multi_lin_inter(X_values,y_values)
%POLY_INTER Shape functions
%   Calculates multivariable interpolating polynomial
%   X_values - matrix with columns representing different variables (x, y,
%   etc.) each row represents a single observation. Order of the (cw/ ccw)
%   observations is important!
%   points(x,y,z) = {(0,0,0),(1,0,1),(0,1,1)}
%   plane: 0 = x + y - z, let's make z a dependent variable
%   X_values = [0 0;0 1;1 0]
%   y_values = [0 1 1]
%% polynomial interpolation
degree = size(X_values);

Me = ones(degree(1),1);

for i=X_values %matrix of powers of x_values
    Me = [Me i]; 
end

Me
%% interpolating polynominal coefficients
poly_coeffs = inv(Me)*y_values';
end

