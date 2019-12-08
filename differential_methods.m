clc;
clear all;
close all;

% T,t = alfa^2 grad^2(T)    alfa^2 = p/c/ro 
% (przewodnosc/pojemnosc cieplna/gestosc)

% wariant statyczny
% alfa^2(T,xx + T,yy) = 0   <==> T,xx == -T,yy <- dla t->inf n/zal od typu
% 1) zastąpic równania różniczkowe na formuły różnicowe


%% definicja obszaru
dx = 0.01;
dx2 = dx.^2;
dy = 0.01;
dy2 = dy.^2;
x_size = 0.1;
y_size = 0.1;
x = -dx:dx:x_size+dx;
y = -dy:dy:y_size+dy;
x_len = length(x);
y_len = length(y);
field = zeros(y_len, x_len);
T0ampl = 50; %stopni celcjusza
field(y_len,:) = sin(x.*10+pi/2)*T0ampl;
% field

%% obliczenia iteracji 
F = @(T_xb,T_xa,T_yb,T_ya) (T_xa.*dy2+T_xb.*dy2+T_ya.*dx2+T_yb.*dx2)./(2*(dx2+dy2));

f = field; %kopia
err = f;
it=0;
% for it=1:y_len*2 %ilość iteracji
while 1 % do momentu kiedy największy błąd między iteracjami nie jest <0.01
    f_src = f;
    for iy=y_len-1:-1:2
       for ix=2:x_len-1  
           f(iy,ix) = F(f(iy,ix-1),f_src(iy,ix+1),f_src(iy-1,ix),f(iy+1,ix));
       end
    end
    err = f - f_src;
    it = it + 1;
    if max(err(1:y_len-1,1:x_len-1),[],'all')<0.01
        break;
    end
end
err