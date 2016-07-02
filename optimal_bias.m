% The code below iterates over a set of biases
% and plots the wait time for each in comparison to the 
% naive and basic models

% set the number of trials to average
numtrials = 10000;

% store the biases we use and the means for each
biases = [];
bias_means = [];

% means for the naive and basic models
naive_means = [];
basic_means = [];

% set some universal parameters for use in the trials
width = 30;
length = 30;
width_t = 30;
length_t = 30;
light_time = 15;

for j=0:0.1:12
    trial1 = [];
    trial2 = [];
    trial3 = [];
    biases(end+1) = j;
    for i=1:numtrials
        [t1,d1] = naivewalker(width,length,width_t,length_t,light_time);
        [t2,d2] = biasedwalker(j,width,length,width_t,length_t,light_time);
        [t3,d3] = basicwalker(width,length,width_t,length_t,light_time);
        trial1(i) = d1;
        trial2(i) = d2;
        trial3(i) = d3;
    end
    naive_means(end+1) = mean(trial1);
    bias_means(end+1) = mean(trial2);
    basic_means(end+1) = mean(trial3);
end

naive = mean(naive_means);
basic = mean(basic_means);
bias = min(bias_means);
a = find(bias_means == bias);
k = biases(a);

temp = ['Naive avg: ', num2str(naive)];
disp(temp);
temp = ['Basic avg: ', num2str(basic)];
disp(temp);
temp = ['Bias minimum: ', num2str(bias), ' where bias is ', num2str(k)];
disp(temp);

figure(1)
plot(biases, bias_means)
hold on
plot(biases, naive_means)
hold on 
plot(biases, basic_means)
hold on
legend('Bias', 'Naive', 'Basic');
% legend('Biased', 'Naive');
title('Calculating Optimal Bias');
xlabel('Bias');
ylabel('Wait Time');
hold off

