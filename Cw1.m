%% vectors of known values
X = [0 1 2 3];
% Y = [0 1 4 9] % y(x) = x^2;
Y = [-1 -2 -3 -4]; % y(x) = 1 + x;
%% polynomial interpolation
degree = length(X);
pn = X;

% for i = 1:degree % WHY? 
%     pn(i) = pn(i)^(i-1); %power each x to its degree 
% end

% Me = ones(degree,degree);
Me = ones(degree,1);

for i=2:degree
%    Me(i,:) = (X).^(i-1);
    Me = [Me ((X).^(i-1))'];
end

% Me = Me';
%% interpolating polynominal coefficients
ae = inv(Me)*Y'