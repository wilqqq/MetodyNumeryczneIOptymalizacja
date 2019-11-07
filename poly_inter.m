function [poly_coeffs] = poly_inter(x_values,y_values)
%POLY_INTER Calculates interpolating polynomial
%   May result in error if cannot inverse the Me matrix

%% polynomial interpolation
degree = length(x_values)-1;

p = ones(degree+1,1);

for i = 1:degree %matrix of powers of x_values
    p(:,i+1) = (x_values').^(i);
end

Minv = inv(p);

%% interpolating polynominal coefficients
poly_coeffs = Minv*y_values'; %ae
% y_approx = p*poly_coeffs;

%% check N poly
% t = min(x_values):0.1:max(x_values);
% T = ones(1,length(t));
% for i=1:degree
%     T = [T ;t.^i];
% end

% it works
N = p*Minv;

plot(x_values,N) %alternatively calculate poly_inter([x_values;...],N) and
% draw polynomials with coeffs
grid on;

end

