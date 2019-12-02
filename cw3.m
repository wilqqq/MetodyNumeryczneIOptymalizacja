%% testing N_dv and mli
X = [0 0; 1 0; 0 1];
Xc = [0.25 0; 0.5 0.5; 0 0.5];
y_v = [1; 0.5; 0];
Nxy = N_dv(X); % N(x,y) = [1 x y]*Nxy;
% nabla(Nxy) = [[0; 0; 0], [Nxy(2,2); 0; 0], [Nxy(3,3); 0; 0]] ??? albo
% raczej [ [Nxy(2,1), Nxy(3,1); 0 0; 0 0], [Nxy(2,2), Nxy(3,2); 0 0; 0 0], [Nxy(2,3), Nxy(3,3); 0 0; 0 0]]
[ones(length(X),1) X]*mli(Nxy, y_v)
[ones(length(X),1) X]*multi_lin_inter(X,y_v)

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

%% 2-D
P = [
    0 0.2 0;
    0 0 0.3
];

%space of a triangle (based on 
%a*b*sin(angle) which is the length of 
% crossproduct of a and b)
Vtr = diff(P'); %matrix of vectors a and b
Vtr(:,1)=-Vtr(:,1);
A2 = sqrt(sum(cross([Vtr(:,1);0],[Vtr(:,2);0]).^2))./2;

% % OTHER METHOD FOR CALCULATING B
% 
% bt1 = P(2,2)-P(2,3);
% bt2 = P(2,3)-P(2,1);
% bt3 = P(2,1)-P(2,2);
% 
% g1 = P(1,3)-P(1,2);
% g2 = P(1,1)-P(1,3);
% g3 = P(1,2)-P(1,1);
% 
% B2 = [
%     bt1 0 bt2 0 bt3 0;
%     0 g1 0 g2 0 g3;
%     g1 bt1 g2 bt2 g3 bt3
% ];
% B2 = B2./A2./2;
% % for faster Kel

%polyder - diff polynomial
N = N_dv(P');
B = [
    N(2,1) 0 N(2,2) 0 N(2,3) 0;
    0 N(3,1) 0 N(3,2) 0 N(3,3);
    flip(N(2:3,1)') flip(N(2:3,2)') flip(N(2:3,3)') 
    % configuration: (why though?)
    %  dn1/dx        0        dn2/dx        0      dn3/dx        0
    %      0        dn1/dy        0       dn2/dy        0       dn3/dy
    %  dn1/dy   dn1/dx   dn2/dy  dn2/dx   dn3/dy   dn3/dx
];

%aprox N itegral
 %[ 1 mean(P')]*N*values


vi = 0.3;
Dv = [% poisona coeffs
    1-vi vi 0;
    vi 1-vi 0;
    0 0 (1-2*vi)/2
];
Dv = Dv.*E./((1+vi)*(1+2*vi));

% integral ohf a constant over a given field has equal
% value to a the area of given field so:
Kel2 = (B'*Dv*B).*A2; %stiffnes matrix

% Am - matrix of crosssections (assuming it is a cuboid )
Am = 0.1;
% Mel2 = (N'*Am*ro*N);%mass matrix NEEDS integrating

NN = zeros(6,6);
Psr = mean(P');
for i = 1:6 %one step approx
    v1 = floor((i+1)/2);
    for j=1:6
        %wiersz parzysty i kolumna nieparzysta ZOPTYMALIZOWAC
        if((mod(i,2)==0 & mod(j,2)==0)|(mod(i,2)~=0 & mod(j,2)~=0))
            v2 = floor((j+1)/2);
            F = PolyVal_1_x_y(N(:,v2),N(:,v1));
            NN(j,i) = F(Psr(1),Psr(2));
        end
    end
end %ma być dwukrotność masy!!!!
Mel2 = NN.*Am.*ro.*A2;

Mels2 = zeros(6,6);
for i=1:6 
    Mels2(i,i) = sum(Mel2(i,:));
end
