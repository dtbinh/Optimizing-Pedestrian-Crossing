# Optimizing Pedestrian Crossing Methods with Individual Agent Model

### Contents
- [Report](https://github.com/geoffstevens8/Optimizing-Pedestrian-Crossing/blob/master/Report.pdf)

### Code Appendix
- [basicwalker.m](https://github.com/geoffstevens8/Optimizing-Pedestrian-Crossing/blob/master/basicwalker.m): implements the Basic Model
- [naivewalker.m](https://github.com/geoffstevens8/Optimizing-Pedestrian-Crossing/blob/master/naivewalker.m): implements the Naive Model
- [biasedwalker.m](https://github.com/geoffstevens8/Optimizing-Pedestrian-Crossing/blob/master/biasedwalker.m): implements the Biased Model
- [varbiasedwalker.m](https://github.com/geoffstevens8/Optimizing-Pedestrian-Crossing/blob/master/varbiasedwalker.m): implements the Skewed Model
- [trials.m](https://github.com/geoffstevens8/Optimizing-Pedestrian-Crossing/blob/master/trials.m): simulates many trials of the models and plots a distribution of the wait times
- [optimal_bias.m](https://github.com/geoffstevens8/Optimizing-Pedestrian-Crossing/blob/master/optimal_bias.m): iterates over possible bias values to ﬁnd the optimal one
- [optimal_skew.m](https://github.com/geoffstevens8/Optimizing-Pedestrian-Crossing/blob/master/optimal_skew.m): iterates over possible skew values to ﬁnd the optimal one
- [bias_light_relationship.m](https://github.com/geoffstevens8/Optimizing-Pedestrian-Crossing/blob/master/bias_light_relationship.m): plots the relationship between bias and the length of a signal
- [skew_light_relationship.m](https://github.com/geoffstevens8/Optimizing-Pedestrian-Crossing/blob/master/skew_light_relationship.m): plots the relationship between skew and the length of a signal
- [aggregatepaths.m](https://github.com/geoffstevens8/Optimizing-Pedestrian-Crossing/blob/master/aggregatepaths.m): plots the aggregate paths taken utilizing diﬀerent strategies (requires modiﬁed code for walkers)
- [trials_for_aggregate.m](https://github.com/geoffstevens8/Optimizing-Pedestrian-Crossing/blob/master/trials_for_aggregate.m): creates aggregate (x,y) locations for each strategy
- [basicwalker_mod.m](https://github.com/geoffstevens8/Optimizing-Pedestrian-Crossing/blob/master/basicwalker_mod.m), [naive_walker_mod.m](https://github.com/geoffstevens8/Optimizing-Pedestrian-Crossing/blob/master/naive_walker_mod.m), [biasedwalker_mod.m](https://github.com/geoffstevens8/Optimizing-Pedestrian-Crossing/blob/master/biasedwalker_mod.m), [varbiasedwalker_mod.m](https://github.com/geoffstevens8/Optimizing-Pedestrian-Crossing/blob/master/varbiasedwalker_mod.m): implements same models, with outputs for aggregatepaths.m
