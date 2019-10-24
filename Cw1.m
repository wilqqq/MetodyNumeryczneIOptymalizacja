%% vectors of known values
X = [0 1 2 3]
Y = [0 1 4 9]
%% polynomial interpolation
stopien = length(X);
pn = X;

for i = 1:stopien
    pn(i) = pn(i)^(i-1);
end

Me = ones(stopien,stopien);
for i=2:stopien
   Me(i,:) = (X).^(i-1);
end

Me = Me';
%% interpolating polynominal coefficients
ae = inv(Me)*Y';