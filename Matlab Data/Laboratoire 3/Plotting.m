close all;
for essay = keys(dicOfTry)
    f = figure('Name',essay{1});
    p = uipanel('Parent',f,'BorderType','none'); 
    p.Title = essay; 
    p.TitlePosition = 'centertop'; 
    p.FontSize = 12;
    p.FontWeight = 'bold';
    p.BackgroundColor = [1 1 1];
    first=dicOfTry(essay{1}).time(1);
    last=dicOfTry(essay{1}).time(end);
    subplot(1,2,1,'Parent',p)
    title('Sortie du syt�me')
    xlabel('Temps[sec]');
    ylabel('Temperature[%]');
    hold on
    plot(dicOfTry(essay{1}).out)
    plot(dicOfTry(essay{1}).sp,'Color','r')
    legend('Sortie','Consigne','Location','SouthWest')
    xlim([0 last-first])
    ylim([36 54])
    grid on
    subplot(1,2,2,'Parent',p)
    title('Consigne de courant');
    xlabel('Temps[sec]');
    ylabel('Courant[%]');
    hold on
    plot(dicOfTry(essay{1}).cons)
    yL = get(gca,'YLim');
    line([10 10],yL,'Color','r');
    legend('Consigne',"D�but de l'�chelon",'Location','SouthWest')
    xlim([0 last-first])
    grid on
    savefig(strcat(essay{1},'.fig'))
    set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 28 10])
    saveas(gcf,strcat(essay{1},'.png'))
end