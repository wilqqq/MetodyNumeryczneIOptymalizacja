function [poly_coeffs] = poly_inter(x_values,y_values)
%POLY_INTER Calculates interpolating polynomial
%   May result in error if cannot inverse the Me matrix
%% polynomial interpolation
degree = length(x_values);
% pn = x_values;
% for i = 1:degree % WHY? 
%     pn(i) = pn(i)^(i-1); %power each x to its degree 
% end

% Me = ones(degree,degree);
Me = ones(degree,1);

for i=1:degree-1 %matrix of powers of x_values
%    Me(i,:) = (X).^(i-1);
    Me = [Me ((x_values).^(i))']; 
end

% Me = Me';
%% interpolating polynominal coefficients
poly_coeffs = inv(Me)*y_values';
end

