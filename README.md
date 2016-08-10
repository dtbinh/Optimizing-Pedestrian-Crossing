# Pedestrian Behavior
## Optimizing Pedestrian Crossing Methods with the Individual Agent Model

### Summary

Pedestrian crossing patterns in a gridded city, such as New York City, can take on a variety of forms. In the most simple case, a pedestrian may choose to walk a predetermined path in order to reach their destination. In other cases, the road that an individual decides to cross is dramatically inﬂuenced by which road has a cross signal, as well as the general willingness for an individual to wait for a do-not-cross signal to change. Through examining the variety of potential crossing patterns via an Individual Agent Model, we are able to quantify the optimal pedestrian crossing strategies in a gridded system.

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

### Information
All functions are written in MATLAB (R2014b)