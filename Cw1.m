%% test polynominal interpolation function
% poly_inter([0,1,2],[0,-1,-4]) % y(x) = -x^2;
poly_inter([0,1,2],[0,1,2]) % y(x) = x;
% poly_inter([0,1,2,3],[1,2,5,10]) % y(x) = 1 + x^2;

%% test multivariable linear interpolation
multi_lin_inter([0 0; 0 -1; -1 0],[0 1 1]) % z -x -y = 0
multi_lin_inter([0 0 0; 0 1 0; 1 1 0; 1 0 1],[0 0 0 1]) % x + y +z -w= 0