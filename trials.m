% The code below will help to compare different models
% by creating histograms of how much wait time each has
% and by comparing their means

% each trial array will hold trials from a different model
trial1 = [];
trial2 = [];
trial3 = [];
trial4 = [];

% set the number of trials to average on each run
numtrials = 10000;

% set some universal parameters for use in the trials
width = 30;
length = 30;
width_t = 30;
length_t = 30;
light_time = 30;

% set the bias and skew
bias = 4.4;
skew = 54.5;

% run a bunch of trials on each model
for i=1:numtrials
    [t1,d1] = naivewalker(width,length,width_t,length_t,light_time);
    [t2,d2] = biasedwalker(bias,width,length,width_t,length_t,light_time);
    [t3,d3] = varbiasedwalker(skew,width,length,width_t,length_t,light_time);
    [t4,d4] = basicwalker(width,length,width_t,length_t,light_time);
    trial1(i) = d1;
    trial2(i) = d2;
    trial3(i) = d3;
    trial4(i) = d4;
end

% calculate the means of these trials
m1 = mean(trial1);
m2 = mean(trial2);
m3 = mean(trial3);
m4 = mean(trial4);

% create the edges of the bins in the histogram
edges = 0:1:150;

% BASIC MODEL
figure(1)
histogram(trial4, 'FaceColor','r');
hold on
y1=get(gca,'ylim');
p1(1) = plot([m4,m4],ylim, 'r');
legend('Basic', 'Basic Mean');
title('Basic Performance');
xlabel('Wait Time');
ylabel('Occurences');

% COMPARE BIAS AND NAIVE
figure(2)
histogram(trial1, edges, 'FaceColor','r');
hold on
histogram(trial2, edges, 'FaceColor','b');
hold on
y1=get(gca,'ylim');
p1(1) = plot([m1,m1],ylim, 'r');
hold on
p1(2) = plot([m2,m2],ylim, 'b');
hold on
p1(1).LineWidth = 2;
p1(2).LineWidth = 2;
legend('Naive', 'Bias', 'Naive Mean', 'Bias Mean');
title('Naive and Bias Time');
xlabel('Wait Time');
ylabel('Occurences');
hold off

% COMPARE SKEW AND NAIVE
figure(3)
histogram(trial1, edges, 'FaceColor','r')
hold on
histogram(trial3, edges, 'FaceColor','b')
hold on
y1=get(gca,'ylim');
p2(1) = plot([m1,m1],ylim,'r');
hold on
p2(2) = plot([m3,m3],ylim,'b');
hold on
p2(1).LineWidth = 2;
p2(2).LineWidth = 2;
legend('Naive', 'Skew', 'Naive Mean', 'Skew Mean');
title('Naive and Skew Time');
xlabel('Wait Time');
ylabel('Occurences');
hold off

% COMPARE SKEW AND BIAS
figure(4)
histogram(trial3, edges, 'FaceColor','r')
hold on
histogram(trial2, edges, 'FaceColor','b')
hold on
y1=get(gca,'ylim');
p2(1) = plot([m3,m3],ylim,'r');
hold on
p2(2) = plot([m2,m2],ylim,'b');
hold on
p2(1).LineWidth = 2;
p2(2).LineWidth = 2;
legend('Skew', 'Bias', 'Skew Mean', 'Bias Mean');
title('Bias and Skew Time');
xlabel('Wait Time');
ylabel('Occurences');
hold off

