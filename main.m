clear; close all;
load input_reflex_filters.mat
sim cv_model_M50
process_output
calculate_trends
%plot_graphs_debug
plot_graphs
save(strcat('Parabola_M'));
save(strcat('Parabola_M_small'),"HR","SV","CO","SBP","DBP","TPR","QH3i","CVP","JVP","tout","times")

% clear; close all;
% load input_reflex_filters.mat
% sim cv_model_F50
% process_output
% calculate_trends
% %plot_graphs_debug
% plot_graphs
% %save(strcat('1-Tilt_F_New'));
% save(strcat('1c-Tilt_F'),"HR","SV","CO","SBP","DBP","TPR","QH3i","CVP","JVP","tout","times")

