% % 1-D
% function y=lagrange(x,pointx,pointy)
% %
% %LAGRANGE   approx a point-defined function using the Lagrange polynomial interpolation
% %
% %      LAGRANGE(X,POINTX,POINTY) approx the function definited by the points:
% %      P1=(POINTX(1),POINTY(1)), P2=(POINTX(2),POINTY(2)), ..., PN(POINTX(N),POINTY(N))
% %      and calculate it in each elements of X
% %
% %      If POINTX and POINTY have different number of elements the function will return the NaN value
% %
% %      function wrote by: Calzino
% %      7-oct-2001
% %
% n=size(pointx,2);
% L=ones(n,size(x,2));
% if (size(pointx,2)~=size(pointy,2))
%    fprintf(1,'\nERROR!\nPOINTX and POINTY must have the same number of elements\n');
%    y=NaN;
% else
%    for i=1:n
%       for j=1:n
%          if (i~=j)
%             L(i,:)=L(i,:).*(x-pointx(j))/(pointx(i)-pointx(j));
%          end
%       end
%    end
%    y=0;
%    for i=1:n
%       y=y+pointy(i)*L(i,:);
%    end
% end

% BtimesB([0 0.5 1]);


%% 1-D
l = 0.5;
A = pi*5.^2*10^(-6);
ro = 7800;
E = 210*10^9;
B = [-1/l 1/l];
Ktoint = B'.*A.*E*B;
limes = [0 l];
[nx, ny] = size(Ktoint);
Kel = zeros(nx,ny);
for i=1:ny
    for j=1:nx
        Kel(i,j) = diff(polyval(polyint(Ktoint(i,j)),limes));
    end
end
u = [0; 0.001];
F=Kel(2,2)*u(2)

N = [ [-1/l; 1], [1/l; 0] ];
NxNint = zeros(length(N), length(N));
[nx, ny] = size(NxNint);

for i=1:ny
    for j=1:nx
        NxNint(i,j) = diff(polyval(polyint(conv(N(:,i)',N(:,j)')),limes));
    end
end

Mel = NxNint.*A.*ro;
Mels = [sum(Mel(1,:)), 0; 0, sum(Mel(2,:))];

%% testing N_dv and mli
X = [0 0; 1 0; 0 1];
Xc = [0.25 0; 0.5 0.5; 0 0.5];
y_v = [1; 0.5; 0];
Nxy = N_dv(X); % N(x,y) = [1 x y]*Nxy;
% nabla(Nxy) = [[0; 0; 0], [Nxy(2,2); 0; 0], [Nxy(3,3); 0; 0]] ??? albo
% raczej [ [Nxy(2,1), Nxy(3,1); 0 0; 0 0], [Nxy(2,2), Nxy(3,2); 0 0; 0 0], [Nxy(2,3), Nxy(3,3); 0 0; 0 0]]
[ones(length(X),1) X]*mli(Nxy, y_v)
[ones(length(X),1) X]*multi_lin_inter(X,y_v)
