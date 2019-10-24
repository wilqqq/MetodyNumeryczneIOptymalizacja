function [poly_coeffs] = poly_inter(x_values,y_values)
%POLY_INTER Calculates interpolating polynomial
%   May result in error if cannot inverse the Me matrix
%% vectors of known values
% x_values = [0 1 2 3];
% y_values = [0 1 4 9] % y(x) = x^2;
% y_values = [1 2 3 4]; % y(x) = 1 + x;
%% polynomial interpolation
degree = length(x_values);
% pn = x_values;
% for i = 1:degree % WHY? 
%     pn(i) = pn(i)^(i-1); %power each x to its degree 
% end

% Me = ones(degree,degree);
Me = ones(degree,1);

for i=2:degree %matrix of powers of x_values
%    Me(i,:) = (X).^(i-1);
    Me = [Me ((x_values).^(i-1))']; 
end

% Me = Me';
%% interpolating polynominal coefficients
poly_coeffs = inv(Me)*y_values';
end

