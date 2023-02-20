clear; close all;
load input_reflex_filters.mat
sim cv_model_50F
process_output
calculate_trends
plot_graphs
save(strcat('Omnibus_50F'));

clear; close all;
load input_reflex_filters.mat
sim cv_model_50M
process_output
calculate_trends
plot_graphs
save(strcat('Omnibus_50M'));

