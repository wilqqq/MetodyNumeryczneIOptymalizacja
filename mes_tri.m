classdef mes_tri
    %MES_TRI it's a class for interpolating values for delaunay
    %triangualted set of data
    %tri - triangulation object
    %X - matrix of known dependent variables
    %y - vector of known independent variables
    %Coeffs - matrix of coefficients for relevant triads
    
    properties (Access = private)
        tri
        y
        Coeffs
    end
    
    methods
        function obj = mes_tri(tri_obj,y_values)
            %MES_TRI Construct an instance of this class
            %   tri_obj - Triangulation object made for X and y _values
            %   X_values - matrix of independent variables (rows sorted)
            %   y_values - vector of dependent variables
            obj.tri = tri_obj;
            obj.y = y_values;
            obj.Coeffs = [];
            for tr=obj.tri.ConnectivityList' %for each triad
                obj.Coeffs = [
                    obj.Coeffs; 
                    multi_lin_inter(obj.tri.Points(tr,:),obj.y(tr))'
                    ];
            end
        end
        
        function inout = insideTri(obj, p2chk, p1, p2, p3)
            %INSIDETRI takes a matrix of points [x1 y1; x2 y2; ...]
            %and check if each one of them is inside triangle described
            %with vertecies(xs) p1,p2,p3 - same format as p2chk 
            as = p2chk-p1;
            s_ab = ((p2(:,1)-p1(:,1)).*as(:,2)-(p2(:,2)-p1(:,2)).*as(:,1)) >0;
            s_ac = ((p3(:,1)-p1(:,1)).*as(:,2)-(p3(:,2)-p1(:,2)).*as(:,1)) >0;
            s_bc = ((p3(:,1)-p2(:,1)).*(p2chk(:,2)-p2(:,2))-(p3(:,2)-p2(:,2)).*(p2chk(:,1)-p2(:,1))) >0;
            inout = (s_ab ~= s_ac) == s_bc;
        end
        
        function inout = inTri(obj, p2chk, ps)
            inout = insideTri(obj, p2chk', ps(:,1)', ps(:,2)', ps(:,3)');
        end
        
        function output = get_coefficients(obj)
            output = obj.Coeffs;
        end
        
        function tri_num = search_tri(obj,point)
            %not optimal ! ! ! ! for regular - find pos with: floor(10*x) floor(10*y)
            tri_num = [];
%             num = 1;
%             for tr=obj.tri.ConnectivityList'
%                 if inTri(obj, point, obj.tri.Points(tr,:)' ) == 1
%                     tri_num = num;
%                     break
%                 end
%                 num = num +1;
%             end
            tri_num = pointLocation(obj.tri, point); %== num
        end
        
        function y_pred = predict(obj, X)
            %PREDICT 
            si = size(X);
            p = ones(si(1),si(2)+1);
            i = 2;
            for x=X %matrix of variables
                p(:,i) = x; 
                i = i+1;
            end
            %calculate
            %1 - choose rigth triad
%             triplot(obj.tri)
%             hold on;
%             plot(X(1),X(2),'ro')
%             grid on;     
%             obj.tri.ConnectivityList
%             obj.Coeffs
%             num = []
%             for x=X'
                num = search_tri(obj,X); %TODO fix to work with matrix
%             end
%             num
%             for x=obj.tri.Points(obj.tri.ConnectivityList(num,:)',:)'
%                 hold on
%                 plot(x(1),x(2),'bo')
%             end
            %2 - takeout relevant coeeficients
            %3 - predict
            y_pred = [];
            for i=1:length(num)
                y_pred=[y_pred; obj.Coeffs(num(i),:)*p(i,:)'];
                %y_pred = [y_pred; p(i,:)*(M)];
            end
            %x - make it work with matrixes!
        end
    end
end

