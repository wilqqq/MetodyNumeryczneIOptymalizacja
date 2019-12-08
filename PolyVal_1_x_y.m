function out = PolyVal_1_x_y(f1,f2)
%POLYVAL_1_X_Y returns function handle
%   in form of: a+b*x+c*x^2+d*y+e*y^2+f*xy
%     f1*(f1');
    v1 = f1(1:2,1);
    v2 = flipud(f2(1:2,1));
    u1 = [f1(1,1); f1(3,1)];
    u2 = [f2(3,1); f2(1,1)];
    w1 = f1(2:3,1);
    w2 = flipud(f2(2:3,1));
    coe = [f1(1,1)*f2(1,1) dot(v1,v2) f1(2,1)*f2(2,1) dot(u1,u2) f1(3,1)*f2(3,1) dot(w1,w2)];
    out = @(x, y) coe(1)+coe(2).*x+coe(3).*x.^2+coe(4).*y+coe(5).*y.^2+coe(6).*x.*y;
%     out = @(x, y) f1(1,1)*f2(1,1)+dot(v1,v2).*x+f1(2,1)*f2(2,1).*x.^2+dot(u1,u2).*y+f1(3,1)*f2(3,1).*y.^2+dot(w1,w2).*x.*y
%     out = [f1(1,1)*f2(1,1) dot(v1,v2) f1(2,1)*f2(2,1) dot(u1,u2) f1(3,1)*f2(3,1) dot(w1,w2)]
%     out = [f1(1,1)*f2(1,1), (v1*v2), f1(2,1)*f2(2,1), (u1*u2), f1(3,1)*f2(3,1), (w1*w2)]
end

