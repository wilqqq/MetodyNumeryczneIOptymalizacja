X = [0 1 2]
Y = [0 1 4]

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

ae = inv(Me)*Y'