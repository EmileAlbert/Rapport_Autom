function [step, pert_up, pert_down] = split_data(u, y, ysp, start, i_pert_up, i_pert_down)
    step = struct( ...
        't', (start-30:i_pert_up)', ...
        'u', u(start-30:i_pert_up), ...
        'y', y(start-30:i_pert_up), ...
        'ysp', ysp(start-30:i_pert_up) ...
    );
    pert_up = struct( ...
        't', (i_pert_up:i_pert_down)', ...
        'u', u(i_pert_up:i_pert_down), ...
        'y', y(i_pert_up:i_pert_down), ...
        'ysp', ysp(i_pert_up:i_pert_down) ...
    );
    pert_down = struct( ...
        't', (i_pert_down:length(u))', ...
        'u', u(i_pert_down:end), ...
        'y', y(i_pert_down:end), ...
        'ysp', ysp(i_pert_down:end) ...
    );
end
