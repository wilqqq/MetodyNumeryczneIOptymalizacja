classdef mes_tri
    %MES_TRI it's a class for interpolating values for delaunay
    %triangualted set of data
    %tri - triangulation object
    %X - matrix of known dependent variables
    %y - vector of known independent variables
    %Coeffs - matrix of coefficients for relevant triads
    
    properties (Access = private)
        tri
        X
        y
        Coeffs
    end
    
    methods
        function obj = mes_tri(tri_obj,X_values,y_values)
            %MES_TRI Construct an instance of this class
            %   tri_obj - Triangulation object
            %   X_values - matrix of independent variables
            %   y_values - vector of dependent variables
            obj.tri = tri_obj;
            obj.X = X_values;
            obj.y = y_values;
            obj.Coeffs = [];
            for tr=obj.tri.ConnectivityList' %for each triad
                obj.Coeffs = [
                    obj.Coeffs; 
                    multi_lin_inter(obj.X(tr,:),obj.y(tr))
                    ];
            end
        end
        
        function output = get_coefficients(obj)
            output = obj.Coeffs;
        end
        
        function y_pred = predict(obj, X)
            %PREDICT 
            si = size(X);
            p = ones(si(1),si(2)+1);
            i = 1;
            for x=X %matrix of variables
                p(:,i) = x; 
                i = i+1;
            end
            %calculate
            %1 - choose rigth triad
            %2 - takeout relevant coeeficients
            %3 - predict
            %x - make it work with matrixes!
            y_pred = 0;
        end
    end
end

