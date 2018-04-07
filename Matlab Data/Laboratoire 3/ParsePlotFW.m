close all;
changedIndexesFW = diff(FW.sp)~=0;
changedIndexesNoFW = diff(NoFW.sp)~=0;
indexFW = find(changedIndexesFW == 1);
indexNoFW = find(changedIndexesNoFW == 1);
FWFalling = FW.out(indexFW(1)-20:indexFW(2)-1);
NoFWFalling = NoFW.out(indexNoFW(1)-20:indexNoFW(2)-1);
FWmin = find(min(FWFalling) == FWFalling); 
ymin = FWFalling(FWmin);
NoFWmax = find(max(NoFWFalling) == NoFWFalling);
ymax = NoFWFalling(NoFWmax);
figure('Name','Falling');
title('Diminution de la vitesse du Ventilateur de 60 à 50%');
hold on
plot(FWFalling);
plot(NoFWFalling);
line([0 250],[50 50],'Color','[0 0.6 0]');
line([20 20],[49.5 51],'Color','[1 0 0]');
text(FWmin,ymin,num2str(ymin),'HorizontalAlignment','left');
text(NoFWmax,ymax,num2str(ymax),'HorizontalAlignment','left');
legend('Sortie avec FeedForward',"Sortie sans FeedForward",'Consigne','Début de la perturbation')
xlabel('Temps[sec]');
ylabel('Temperature[%]');
ylim([49.5 51])
xlim([0 250])
%
FWFalling = FW.out(indexFW(1)-20:indexFW(2)-1);
NoFWFalling = NoFW.out(indexNoFW(1)-20:indexNoFW(2)-1);
FWmin = find(min(FWFalling) == FWFalling); 
ymin = FWFalling(FWmin);
NoFWmax = find(max(NoFWFalling) == NoFWFalling);
ymax = NoFWFalling(NoFWmax);
figure('Name','Falling');
title('Diminution de la vitesse du Ventilateur de 60 à 50%');
hold on
plot(FWFalling);
plot(NoFWFalling);
line([0 250],[50 50],'Color','[0 0.6 0]');
line([20 20],[49.5 51],'Color','[1 0 0]');
text(FWmin,ymin,num2str(ymin),'HorizontalAlignment','left');
text(NoFWmax,ymax,num2str(ymax),'HorizontalAlignment','left');
legend('Sortie avec FeedForward',"Sortie sans FeedForward",'Consigne','Début de la perturbation')
xlabel('Temps[sec]');
ylabel('Temperature[%]');
ylim([49.5 51])
xlim([0 250])