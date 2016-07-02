function [totalcrosstime, dif]=varbiasedwalker(s, num_widths, num_lengths, wt, lt, light_time) 
%calculates total time waiting at crosslights when you vary your bias
%based on the ratio of widths to lengths left to travel
%
% PARAMETERS:
% s = skew to adjust importance of ratio of vertical vs horizontal
%   distances to walk
% num_widths = number of width segments in the grid
% num_lengths = number of length segments in the grid
% wt = time to walk a width
% lt = time to walk a length
% light_time = maximum length of a light

    widths = num_widths;
    lengths = num_lengths;

    widthtime = wt;
    lengthtime = lt;

    totalwidthtime = widths * widthtime;
    totallengthtime = lengths * lengthtime;

    totalcrosstime = 0;

    maxwait = light_time;

    skew = s;

    while (lengths > 0) || (widths > 0) %while there are still block lengths and widths to travel
        % ONLY WIDTHS REMAINING
        if (lengths == 0)
            if rand(1) < .5 
                totalcrosstime = totalcrosstime + rand(1)*maxwait;
            end
                widths = widths - 1;
        % ONLY LENGTHS REMAINING
        elseif (widths == 0)
            if rand(1) < .5 
                totalcrosstime = totalcrosstime + rand(1)*maxwait;
            end
                lengths = lengths -1;    
        % MORE LENGTHS THAN WIDTHS, length crossing preferred
        elseif lengths > widths
            bias = (lengths/(lengths+widths)-.5)*skew;
            randwait = rand(1);
            if  randwait <.5
                lengths = lengths - 1;
            elseif randwait < (.5 + bias/(2*maxwait))
                lengths = lengths - 1;
                totalcrosstime = totalcrosstime + rand(1)*bias;
            else 
                widths = widths - 1;
            end
        % MORE WIDTHS THAN LENGTHS, width crossing preferred
        elseif lengths < widths
            bias = (widths/(lengths+widths)-.5)*skew;
            randwait = rand(1);
            if  randwait <.5
                widths = widths - 1;
            elseif randwait < (.5 + bias/(2*maxwait))
                widths = widths - 1;
                totalcrosstime = totalcrosstime + rand(1)*bias;
            else 
                lengths = lengths - 1;
            end
        % SAME LENGTHS AS WIDTHS
        else 
            if rand(1) <.5
                widths = widths - 1;
            else
                lengths = lengths - 1;
            end
        end
    end
    
    dif = totalcrosstime;
    totalcrosstime = totalcrosstime + totallengthtime + totalwidthtime;
    
end

