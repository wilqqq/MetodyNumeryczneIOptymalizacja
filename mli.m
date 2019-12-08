function out = mli(N_dv,y_values)
%MLI calculates interpolation values for each
%   of X points ([x1 y1; x2 y2; ...])) based on 
%   N_dv - vector of shape functions' 
%   coefficients calculated for points to which
%   y_values where assigned [y1; y2; ...]
out = (N_dv*y_values);
% out = [ones(length(X),1) X]*out;
%  [1 0 0]*N_dv([0 0; 1 0; 0 1])*[1;0.5;0.5]
end

