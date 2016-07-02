function [totalcrosstime, dif]=basicwalker(num_widths, num_lengths, wt, lt, light_time)
% calculates total amount of time waiting at crosslights using a basic
% algorithm where the walker walks all lengths first and then widths
%
% PARAMETERS:
% num_widths = number of width segments in the grid
% num_lengths = number of length segments in the grid
% wt = time to walk a width
% lt = time to walk a length
% light_time = maximum length of a light

lengths = num_lengths;
widths = num_widths;

totalcrosstime = 0;

while (lengths > 0) || (widths > 0)
    % ONLY WIDTHS REMAIN
    if (widths > 0)
        % red light wait
        if rand(1) < .5 
            totalcrosstime = totalcrosstime + rand(1)*light_time;
        end
        widths = widths - 1;
        totalcrosstime = totalcrosstime + wt;
    % ONLY LENGTHS REMAIN
    elseif (widths == 0)
        % red light wait
        if rand(1) < .5 
            totalcrosstime = totalcrosstime + rand(1)*light_time;
        end
        lengths = lengths - 1;
        totalcrosstime = totalcrosstime + lt;
    end
end

% dif = (light_time.*(num_widths + num_lengths))*rand(1);

dif = totalcrosstime - lt.*num_lengths - wt.*num_widths;

end

