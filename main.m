clear; close all;
load input_reflex_filters.mat
sim cv_model
process_output
calculate_trends
plot_graphs
%save(strcat('Omnibus'));

