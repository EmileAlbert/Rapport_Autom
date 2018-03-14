function [index] = find_step_start(y)
    initial_value = y(1);
    % Index of the first value that is different from the first
    index = find(y ~= initial_value, 1); 
end

