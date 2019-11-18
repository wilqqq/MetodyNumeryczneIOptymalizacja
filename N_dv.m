function N_coeffs = N_dv(X)
%N Function returns a vector of coefficients
%   for each one of shape functions
%   X - point location
[ny, nx] = size(X);
if nx ~= ny -1
    N_coeffs = NaN;
    return
end
Xe = [ones(ny,1), X];
N_coeffs = zeros(ny);
for i=1:ny
    y = zeros(ny,1);
    y(i,1) = 1;
    N_coeffs(:,i) = (inv(Xe)*y);
end
end

