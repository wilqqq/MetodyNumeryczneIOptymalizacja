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

%% ad 1 - random
pointsl = rand(100,2);
pointsl = sortrows(pointsl);
vall = sin(sum(pointsl,2));
dtl = delaunayTriangulation(pointsl);
% plot(Xl,Yl,'o')
figure(1)
subplot(1,2,1)
stem3(pointsl(:,1),pointsl(:,2),vall,'LineStyle','none');
subplot(1,2,2)
triplot(dtl,pointsl(:,1),pointsl(:,2))
title('Random')

%% ad 1 - regular
t = 0:0.1:1;
pointsr=[];
for i=1:length(t)
    pointsr = [pointsr ;[ones(length(t),1).*t(i) t']];
end
pointsr = sortrows(pointsr);
valr = sin(sum(pointsr,2));
dtr = delaunayTriangulation(pointsr);
figure(2)
subplot(1,2,1)
stem3(pointsr(:,1),pointsr(:,2),valr,'LineStyle','none');
%surf/plot(pointsr(:,1),pointsr(:,2),valr);
subplot(1,2,2)
triplot(dtr, pointsr(:,1), pointsr(:,2))
title('Regular');

%% ad 1 - semi-regular
pointssr=[];
for i=1:length(t)
    pointssr = [pointssr ;[ones(length(t),1).*t(i) rand(length(t),1)]];
end
pointssr = sortrows(pointssr);
valsr = sin(sum(pointssr,2));
dtsr = delaunayTriangulation(pointssr);
figure(3)
subplot(1,2,1)
stem3(pointssr(:,1),pointssr(:,2),valsr,'LineStyle','none');
subplot(1,2,2)
triplot(dtsr, pointssr(:,1), pointssr(:,2))
title('Semi-regular');

%% ad 2
%pkt3 = [pointsr(dtsr.ConnectivityList(1,:),1), pointsr(dtsr.ConnectivityList(1,:),2)];
%pkt3 = pointsr(dtsr.ConnectivityList(1,:),:);
mesl = mes_tri(dtl,vall);
mesr = mes_tri(dtr,valr);
mesr.predict([0.5 0.5;0.75 0.25;0 0]) - sin([1;1;0])
messr = mes_tri(dtsr,valsr);