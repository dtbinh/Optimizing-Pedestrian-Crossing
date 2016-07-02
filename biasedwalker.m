function [totalcrosstime, dif]=biasedwalker(in_bias, num_widths, num_lengths, wt, lt, light_time)
% calculates total time waiting at crosslights wit bias when
% you have more widths than lengths or vise versa. For example
% if you have a bias of 1 and more lengths than widths left to
% travel, you would wait up to 1 second to cross horizontally 
% versus vertically
%
% PARAMETERS:
% in_bias = bias for willingness to wait at light
% num_widths = number of width segments in the grid
% num_lengths = number of length segments in the grid
% wt = time to walk a width
% lt = time to walk a length
% light_time = maximum length of a light

    % set the dimensions of the grid
    widths = num_widths;
    lengths = num_lengths;

    % set the time needed to cross a lenght or a width
    widthtime = wt;
    lengthtime = lt;

    totalwidthtime = widths * widthtime;
    totallengthtime = lengths * lengthtime;
    
    % set the bias (seconds a person would be willing to wait at a light)
    bias = in_bias;
    
    % maximum time (seconds) one could possibly wait a light
    maxwait = light_time;
    
    % set the time counter to 0
    totalcrosstime = 0;
    
    while (lengths > 0) || (widths > 0) %while there are still block lengths and widths to travel
        % ONLY WIDTHS REMAIN
        if (lengths == 0)
            % red light wait
            if rand(1) < .5 
                totalcrosstime = totalcrosstime + rand(1)*maxwait;
            end
            widths = widths - 1;
            totalcrosstime = totalcrosstime + widthtime;
        % ONLY LENGTHS REMAIN
        elseif (widths == 0)
            % red light wait
            if rand(1) < .5 
                totalcrosstime = totalcrosstime + rand(1)*maxwait;
            end
            lengths = lengths - 1;
            totalcrosstime = totalcrosstime + lengthtime;
        % MORE LENGTHS THAN WIDTHS, prefer length crossing
        elseif lengths > widths
            randwait = rand(1);
            % green light to cross for a length
            if  randwait < .5
                lengths = lengths - 1;
                totalcrosstime = totalcrosstime + lengthtime;
            % small wait for green light for a length
            elseif randwait < (.5 + bias/(2*maxwait))
                lengths = lengths - 1;
                totalcrosstime = totalcrosstime + rand(1)*bias;
                totalcrosstime = totalcrosstime + lengthtime;
            else 
                widths = widths - 1;
                totalcrosstime = totalcrosstime + widthtime;
            end
        % MORE WIDTHS THAN LENGTHS, width crossing preferred
        elseif lengths < widths
            randwait = rand(1);
            % chance of green light to cross for a width
            if  randwait <.5
                widths = widths - 1;
                totalcrosstime = totalcrosstime + widthtime;
            % small wait for green light for a width
            elseif randwait < (.5 + bias/(2*maxwait))
                widths = widths - 1;
                totalcrosstime = totalcrosstime + rand(1)*bias;
                totalcrosstime = totalcrosstime + widthtime;
            else 
                lengths = lengths - 1;
                totalcrosstime = totalcrosstime + lengthtime;
            end
        % SAME WIDTHS AS LENGTHS
        else 
            if rand(1) < .5
                widths = widths - 1;
                totalcrosstime = totalcrosstime + widthtime;
            else
                lengths = lengths - 1;
                totalcrosstime = totalcrosstime + lengthtime;
            end
        end
    end
    
    % final variable with total time spent traversing
    %totaltime = totalcrosstime + totallengthtime + totalwidthtime;
    dif = totalcrosstime - totallengthtime - totalwidthtime;
end

