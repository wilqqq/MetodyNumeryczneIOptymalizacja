function I = int_1_x_y(F,P)
%INT_1_X_Y numerically integrates function
%   passed with Function handle F over a tri-
%   angle specified with 3 points in P(vertical)
%   must be possible!

% check if no right angle and perpendicular
% to x by finding vector with 0 x value
hlpr1 = find(~(diff([P(:,1)])));
hlpr2 = find(~(diff([P(:,2)])));
if hlpr1 && hlpr2
    %right angle
    xmin = min(P(:,1));
    xmax = max(P(:,1));
    if hlpr1 > 1
        X=P(1:hlpr1,1);
        Y=P(1:hlpr1,2);
    else
        X=P(hlpr1:2,1);
        Y=P(hlpr1:2,2);
    end
    y=polyfit(X,Y,1); %ymin or ymax
    %jeśli skos dodatni i hlpr1 2 to max
    %jeśli ujemny i hlpr1 to 1 to max
    %:< fix triangle boundaries
else
    ('No')
end

end

