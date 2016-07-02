figure(1);
hist3(transpose([totalw1;totall1]),[11 11]);
xlabel('lengths');
ylabel('widths');
title('Aggregate paths for naive walker');

figure(2);
hist3(transpose([totalw2;totall2]),[11 11]);
xlabel('lengths');
ylabel('widths');
title('Aggregate paths for biased walker');

figure(3);
hist3(transpose([totalw3;totall3]),[11 11]);
xlabel('lengths');
ylabel('widths');
title('Aggregate paths for variable biased walker');

figure(4);
hist3(transpose([totalw4;totall4]),[11 11]);
xlabel('lengths');
ylabel('widths');
title('Aggregate paths for basic walker');
