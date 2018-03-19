experiments = [ 
    struct('filename', "s2e0.mat", 'i_pert_up', 890, 'i_pert_down', 1670)
    struct('filename', "s2e1.mat", 'i_pert_up', 550, 'i_pert_down', 840)
    struct('filename', "s2e3.mat", 'i_pert_up', 550, 'i_pert_down', 840) % A refaire...
    struct('filename', "s2e4.mat", 'i_pert_up', 1050, 'i_pert_down', 1600)
    struct('filename', "s2e5.mat", 'i_pert_up', 510, 'i_pert_down', 956)
    struct('filename', "s2e6.mat", 'i_pert_up', 1150, 'i_pert_down', 1690)
    struct('filename', "s2e7.mat", 'i_pert_up', 1000, 'i_pert_down', 1510)
    struct('filename', "s2e8.mat", 'i_pert_up', 623, 'i_pert_down', 623)
];

for f = experiments'
    filename = f.filename;
    i_pert_up = f.i_pert_up;
    i_pert_down = f.i_pert_down;
    
    disp( i_pert_up )
    % Load workspace
    load(filename);

    % Do something with the data
    start = find_step_start(ysp);
    [step, pert_up, pert_down] = split_data(u, y, ysp, start, i_pert_up, i_pert_down);
    
    % Y axis limits for the output
    min_y = min([ min(step.y), min(step.ysp), min(pert_up.y), min(pert_up.ysp), min(pert_down.y), min(pert_down.ysp) ]) - 3;
    max_y = max([ max(step.y), max(step.ysp), max(pert_up.y), max(pert_up.ysp), max(pert_down.y), max(pert_down.ysp) ]) + 3;
    
    % Y axis limits for the command
    min_y_c = min([ min(step.u), min(pert_up.u), min(pert_down.u) ]) - 5;
    max_y_c = max([ max(step.u), max(pert_up.u), max(pert_down.u) ]) + 5;
    
    figure('visible','off');;
    plot(step.t, step.y, step.t, step.ysp);
    title('Echelon (sortie & setpoint)');
    xlim([step.t(1) step.t(end)]);
    ylim([min_y, max_y]);
    xlabel('temps [s]');
    ylabel('temperature [%]');
    print(extractBefore(filename, ".mat") + '-step-out', '-dpng');
    
    figure('visible','off');;
    plot(step.t , step.u);
    title('Echelon (commande)');
    xlim([step.t(1) step.t(end)]);
    ylim([min_y_c, max_y_c]);
    xlabel('temps [s]');
    ylabel('courant [%]');
    print(extractBefore(filename, ".mat") + '-step-command', '-dpng');
    
    if pert_up.t(1) <  pert_up.t(end)
        figure('visible','off');;
        plot(pert_up.t, pert_up.y, pert_up.t, pert_up.ysp);
        title('Perturbation 1 (sortie & setpoint)');
        xlim([pert_up.t(1) pert_up.t(end)]);
        ylim([min_y, max_y]);
        xlabel('temps [s]');
        ylabel('temperature [%]');
        print(extractBefore(filename, ".mat") + '-pert-up-out', '-dpng');

        figure('visible','off');;
        plot(pert_up.t , pert_up.u);
        title('Perturbation 1 (commande)');
        xlim([pert_up.t(1) pert_up.t(end)]);
        ylim([min_y_c, max_y_c]);
        xlabel('temps [s]');
        ylabel('courant [%]');
        print(extractBefore(filename, ".mat") + '-pert-up-command', '-dpng');
        
        figure('visible','off');;
        plot(pert_down.t, pert_down.y, pert_down.t, pert_down.ysp);
        title('Perturbation 2 (sortie & setpoint)');
        xlim([pert_down.t(1) pert_down.t(end)]);
        ylim([min_y, max_y]);
        xlabel('temps [s]');
        ylabel('temperature [%]');
        print(extractBefore(filename, ".mat") + '-pert-down-out', '-dpng');
    
        figure('visible','off');;
        plot(pert_down.t , pert_down.u);
        title('Perturbation 2 (commande)');
        xlim([pert_down.t(1) pert_down.t(end)]);
        ylim([min_y_c, max_y_c]);
        xlabel('temps [s]');
        ylabel('courant [%]');
        print(extractBefore(filename, ".mat") + '-pert-down-command', '-dpng');
    end
    
    %savefig(filename + '.fig');
end