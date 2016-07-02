function [totalcrosstime, dif, wlist, llist]=naivewalker_mod(num_widths, num_lengths, wt, lt, light_time)
% calculates total amount of time waiting at crosslights using a naive
% algorithm where the walker always crosses when a crossing is available
% in the direction that he or she is traveling. Functionally, this means
% that he or she should never have to wait at a stoplight until there
% are no more widths or lengths left to travel.
%
% PARAMETERS:
% num_widths = number of width segments in the grid
% num_lengths = number of length segments in the grid
% wt = time to walk a width
% lt = time to walk a length
% light_time = maximum length of a light
    wlist = [];
    llist = [];
    total = num_widths + num_lengths;
    
    widths = num_widths;
    lengths = num_lengths;

    widthtime = wt;
    lengthtime = lt;

    totalwidthtime = widths * widthtime;
    totallengthtime = lengths * lengthtime;

    totalcrosstime = 0;

    maxwait = light_time;

    % while there are still block lengths and widths to travel
    while (lengths > 0) || (widths > 0)
        llist(total-lengths-widths+1) = lengths;
        wlist(total-lengths-widths+1) = widths;
        % ONLY WIDTHS REMAINING
        if (lengths == 0)
            if rand(1) < .5 
                totalcrosstime = totalcrosstime + rand(1)*maxwait;
            end
            widths = widths - 1;
            totalcrosstime = totalcrosstime + widthtime;
        % ONLY LENGTHS REMAINING
        elseif (widths == 0)
            if rand(1) < .5 
                totalcrosstime = totalcrosstime + rand(1)*maxwait;
            end
            lengths = lengths -1;
            totalcrosstime = totalcrosstime + lengthtime;
        % NUMBER OF LENGTHS EQUALS WIDTHS
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

    % totaltime = totalcrosstime + totallengthtime + totalwidthtime;
    dif = totalcrosstime - totallengthtime - totalwidthtime;
end

