% The code below iterates over a set of skew values
% and plots the wait time for each in comparison to the 
% naive and basic models

% set the number of trials to average
numtrials = 10000;

% store the means for all trials
naive_means = [];
skew_means = [];
basic_means = [];

skews = [];

% set some universal parameters for use in the trials
width = 30;
length = 30;
width_t = 30;
length_t = 30;
light_time = 30;

% iterate over skews
for j=0:0.5:180
    trial1 = [];
    trial3 = [];
    skews(end+1) = j;
    for i=1:numtrials
        [t1,d1] = naivewalker(width,length,width_t,length_t,light_time);
        [t2,d2] = basicwalker(width,length,width_t,length_t,light_time);
        [t3,d3] = varbiasedwalker(j,width,length,width_t,length_t,light_time);
        trial1(i) = d1;
        trial2(i) = d2;
        trial3(i) = d3;
    end
    naive_means(end+1) = mean(trial1);
    skew_means(end+1) = mean(trial3);
    basic_means(end+1) = mean(trial2);
end

naive = mean(naive_means);
basic = mean(basic_means);
skew = min(skew_means);
a = find(skew_means == skew);
k = skews(a);

temp = ['Naive avg: ', num2str(naive)];
disp(temp);
temp = ['Basic avg: ', num2str(basic)];
disp(temp);
temp = ['Skew minimum: ', num2str(skew), ' where skew is ', num2str(k)];
disp(temp);

figure()
plot(skews, naive_means)
hold on 
plot(skews, skew_means)
hold on
plot(skews, basic_means)
hold on
title('Calculating Optimal Skew');
legend('Naive', 'Skew', 'Basic');
xlabel('Skew');
ylabel('Wait Time');

