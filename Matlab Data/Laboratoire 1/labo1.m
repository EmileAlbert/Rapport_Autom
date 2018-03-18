%Broida : broida(k,t1,t2)
%VanderGrinten : vander(k,tu,tg,a)
%Strejc : function hv = strejc(k,tu,tg,a)
load('data01.mat')
yb = step(10*broida(0.97,58.33,75),tm);
yv = step(10*vander(0.97,20.83,145.83,0.20),tm);
ys = step(10*strejc(0.97,20.83,145.83,0.20),tm);
figure
hold on
plot(tm,ym)
%plot(yb)
%plot(yv)
plot(ys)
%legend('Réponse réelle', 'Modèle de Broïda', 'Modèle de Vandergrinten', 'Modèle de Strejc')
xlabel('Temps [s]')
ylabel('[%]')
grid