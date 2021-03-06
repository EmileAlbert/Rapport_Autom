close all;

%ParseData
changedIndexesFW = diff(FW.sp)~=0;
changedIndexesNoFW = diff(NoFW.sp)~=0;
indexFW = find(changedIndexesFW == 1);
indexNoFW = find(changedIndexesNoFW == 1);
FWFalling = FW.out(indexFW(1)-20:indexFW(2)-1);
NoFWFalling = NoFW.out(indexNoFW(1)-20:indexNoFW(2)-1);
FWRising = FW.out(indexFW(2):end);
NoFWRising = NoFW.out(indexNoFW(2):end);

%Extract Min and Max
FWmin = find(min(FWFalling) == FWFalling); 
ymin = FWFalling(FWmin);
NoFWmax = find(max(NoFWFalling) == NoFWFalling);
ymax = NoFWFalling(NoFWmax);
NoFWmin2 = find(min(NoFWRising) == NoFWRising); 
ymin2 = NoFWRising(NoFWmin2);
FWmax2 = find(max(FWRising) == FWRising);
ymax2 = FWRising(FWmax2);

%Falling Data Plotting
figure('Name','Falling');
title('Diminution de la vitesse du Ventilateur de 60 � 50%');
hold on
plot(FWFalling);
plot(NoFWFalling);
line([0 250],[50 50],'Color','[0 0.6 0]');
line([20 20],[49 51],'Color','[1 0 0]');
text(FWmin,ymin,num2str(ymin),'HorizontalAlignment','left');
text(NoFWmax,ymax,num2str(ymax),'HorizontalAlignment','left');
legend('Sortie avec FeedForward',"Sortie sans FeedForward",'Consigne','D�but de la perturbation')
xlabel('Temps[sec]');
ylabel('Temperature[%]');
ylim([49 51])
xlim([0 250])
grid on
savefig('Falling.fig')
saveas(gcf,'Falling.png')

%Rising Data Plotting
figure('Name','Rising');
title('Augmentation de la vitesse du Ventilateur de 50 � 60%');
hold on
plot(FWRising);
plot(NoFWRising);
line([0 250],[50 50],'Color','[0 0.6 0]');
line([20 20],[49 51],'Color','[1 0 0]');
text(NoFWmin2,ymin2,num2str(ymin2),'HorizontalAlignment','left');
text(FWmax2,ymax2,num2str(ymax2),'HorizontalAlignment','left');
legend('Sortie avec FeedForward',"Sortie sans FeedForward",'Consigne','D�but de la perturbation')
xlabel('Temps[sec]');
ylabel('Temperature[%]');
ylim([49 51])
xlim([0 250])
grid on
savefig('Rising.fig')
saveas(gcf,'Rising.png')