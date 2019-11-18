function out = BtimesB(X, D, limesV)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

b1 = (X(1)-X(2))*(X(1)-X(3));
b2 = (X(2)-X(1))*(X(2)-X(3));
b3 = (X(3)-X(1))*(X(3)-X(2));

B1prev = [ 2/b1,(-X(2)-X(3))/b1];
B2prev = [ 2/b2,(-X(1)-X(3))/b2];
B3prev = [ 2/b3,(-X(1)-X(2))/b3];

% multiplying vectors of coefficients
BxB = [
    conv(B1prev,B1prev), conv(B1prev,B2prev), conv(B1prev,B3prev);
    conv(B2prev,B1prev), conv(B2prev,B2prev), conv(B2prev,B3prev);
    conv(B3prev,B1prev), conv(B3prev,B2prev), conv(B3prev,B3prev)
];

% integrating to get coeffs
BxBint = [
    polyint(BxB(1,1)),  polyint(BxB(1,2)),  polyint(BxB(1,3));
    polyint(BxB(2,1)),  polyint(BxB(2,2)),  polyint(BxB(2,3));
    polyint(BxB(3,1)),  polyint(BxB(3,2)),  polyint(BxB(3,3))
];

% integrating to get value
BxBi = [
    diff(polyval(BxBint(1,1),[limesV]),  polyint(BxB(1,2)),  polyint(BxB(1,3));
    polyint(BxB(2,1)),  polyint(BxB(2,2)),  polyint(BxB(2,3));
    polyint(BxB(3,1)),  polyint(BxB(3,2)),  polyint(BxB(3,3))
];
% I = diff(polyval(q,[a b]))
end

