%agregation

P1 = [
    0 0;
    0 1;
    1 0
];

P2 = [
    0 1;
    1 1;
    1 0
];

%% 1-D agregation
KK = [
    [2 2; 2 2];
    [3 3; 3 3];
    [1.5 1.5; 1.5 1.5];
];

K = zeros(4,4);
for i=1:3
    K(i:i+1,i:i+1) =K(i:i+1,i:i+1)+ KK(i*2-1:i*2,:);
end
%% 2-D agregation
