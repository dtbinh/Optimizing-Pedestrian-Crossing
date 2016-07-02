% The code below iterates over a bunch of different light times 
% and finds the bias that minimizes wait time for each
% so that we can see how bias should change with light length

% set the number of trials to average
numtrials = 1000;

mins = [];
mins2 = [];

% set some universal parameters for use in the trials
width = 30;
length = 30;
width_t = 30;
length_t = 30;
light_time = 0;

for lts=15:1:45
    light_time = lts;
    % means for the naive and basic models
    naive_means = [];
    skew_means = [];
    skews = [];
    for j=10:0.5:200
        trial1 = [];
        trial2 = [];
        trial3 = [];
        skews(end+1) = j;
        for i=1:numtrials
            [t1,d1] = naivewalker(width,length,width_t,length_t,light_time);
            [t2,d2] = varbiasedwalker(j,width,length,width_t,length_t,light_time);
            trial1(i) = d1;
            trial2(i) = d2;
        end
        naive_means(end+1) = mean(trial1);
        skew_means(end+1) = mean(trial2);
    end

naive = mean(naive_means);
skew = min(skew_means);
mins2(end+1) = naive - skew;
a = find(skew_means == skew);
k = skews(a);
mins(end+1) = k;

end


figure(1)
plot(15:1:45, mins)
hold on
plot(15:1:45, mins2)
hold on
title('Skew and Signal Time Relationship');
legend('Minimum Skew', 'Time Saved Over Naive')
xlabel('Signal Time');
ylabel('Minimum Skew / Time');
hold off