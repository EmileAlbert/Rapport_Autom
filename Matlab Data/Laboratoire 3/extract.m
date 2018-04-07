%open('tuning.fig');
h1 = findobj(gca,'Type','line');
%consigne = get(h1,'ydata');
%time = get(h1,'xdata');
y  = get(h1,'ydata');
setpoint = y{1};
output = y{2};