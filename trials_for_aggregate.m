% The code below will help to compare different models
% by creating histograms of how much wait time each has
% and by comparing their means

% each trial array will hold trials from a different model
trial1 = [];
trial2 = [];
trial3 = [];
trial4 = [];

totalw1 = [];
totalw2 = [];
totalw3 = [];
totalw4 = [];
totall1 = [];
totall2 = [];
totall3 = [];
totall4 = [];

% set the number of trials to average on each run
numtrials = 100;

% set some universal parameters for use in the trials
width = 10;
length = 10;
width_t = 30;
length_t = 30;
light_time = 30;

% set the bias and skew
bias = 4.4;
skew = 54.5;

% run a bunch of trials on each model
for i=1:numtrials
    [t1,d1,w1,l1] = naivewalker_mod(width,length,width_t,length_t,light_time);
    totalw1 = [totalw1 w1 0];
    totall1 = [totall1 l1 0];
    [t2,d2,w2,l2] = biasedwalker_mod(bias,width,length,width_t,length_t,light_time);
    totalw2 = [totalw2 w2 0];
    totall2 = [totall2 l2 0];
    [t3,d3,w3,l3] = varbiasedwalker_mod(skew,width,length,width_t,length_t,light_time);
    totalw3 = [totalw3 w3 0];
    totall3 = [totall3 l3 0];
    [t4,d4,w4,l4] = basicwalker_mod(width,length,width_t,length_t,light_time);
    totalw4 = [totalw4 w4 0];
    totall4 = [totall4 l4 0];
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
