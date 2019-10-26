% zad 1 - budowa generatora siatki i jej wizualizacja
% oceniamy wzrokowo czy spełnia kryteria
% zad 2 - jak wygląda interpolacja dowolnej funkcji na przygotowanej
% przestrzeni - przyjąć funkcję 2 zmiennych (trygonometryczne - nie pasują 
% klasowo dofunkcji kształtu poly).
% Przedstawić interpolacje na tej siatce (interpolowana i interpolująca
% muszą mieć te same wartości)
% mając informacje o topologi i funcji kształtu obliczyć wartości punktów
% za pomocą ginput urzytkownik wybiera punkt i dowie się jaka jest tam
% wartość funkcji oraz interpolowana wartość funkcji w tym punkcie (wybrać
% el skończony i na jego podstawie wyznaczyć wartość punktu)
%% zad 1
% losowo
pointsl = rand(100,2);
dtl = delaunayTriangulation(pointsl);
% plot(Xl,Yl,'o')
figure(1)
triplot(dtl,pointsl(:,1),pointsl(:,2))
title('losowe')
% regularnie
t = 0:0.1:1;
pointsr=[];
for i=1:length(t)
    pointsr = [pointsr ;[ones(length(t),1).*t(i) t']];
end
dtr = delaunayTriangulation(pointsr);
figure(2)
triplot(dtr, pointsr(:,1), pointsr(:,2))
title('regularne');
% semi-regularnie
pointssr=[];
for i=1:length(t)
    pointssr = [pointssr ;[ones(length(t),1).*t(i) rand(length(t),1)]];
end
dtsr = delaunayTriangulation(pointssr);
figure(3)
triplot(dtsr, pointssr(:,1), pointssr(:,2))
title('semi-regularne');