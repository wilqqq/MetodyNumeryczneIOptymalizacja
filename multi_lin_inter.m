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

%% multivariable linear interpolation
degree = size(X_values);
dim = degree(2)+1;
if dim ~= degree % must agree
    poly_coeffs = [];
    return;
end

p = ones(degree(1),1);

i=2;
for x=X_values %matrix of variables
    p(:,i)  = x;
    i = i+1;
end

Minv = inv(p);

%% coefficients
poly_coeffs = Minv*y_values;

%% check 
% if dim == 3 
%     N1 = p(1,:)*Minv
%     pe = N*X_values
%     plot3(N);
%     plot(x_values,N)
%     grid on;
% end
   
end