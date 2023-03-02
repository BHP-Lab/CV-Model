%% Graphs
%TPR

Rtot=1./(1./Rubn+1./Rrcn+1./Rscn+1./Rlcn+1./Rhn);
figure;plot(tout,Rtot)
title('Total Peripheral Resistance')

%HR
figure;plot(tout,HR)
title('Heart Rate')

% %Venous ZPFV
% %TotVenousZPFV= ZV4+ZV9+ZV11+ZV13;
% figure;plot(tout,TotVenousZPFV)
% title('Total Venous Zero-Pressure Filling Volume')
% 
% %Total Leg Volume
% %TotalLegVol=V12+V13;
% figure;plot(tout,TotalLegVol)
% title('Total Volume in Legs')
% 
% %Total Abdominal Volume
% %TotalAbVol=V7+V8+V9+V10+V11+V14;
% figure;plot(tout,TotalAbVol)
% title('Total Volume in Abdomen')

%Blood Pressure
figure;
hold on
plot (times, MAP);
plot(times,DBP);
plot(times,SBP);
title ('Blood Pressure')

% Cardiac Output
figure;
plot(times,CO);
title ('Cardiac Output')

% Pulse Pressure
figure;
plot(times,PP);
title ('Pulse Pressure')

% Stroke Volume
plot(times,SV);
title ('Stroke Volume')

% Interstitial Volume
figure;plot(tout,Vint)
title('Interstitial Volume')

% Total Blood Volume
figure;plot(tout,Vtot)
title('Total Blood Volume')

% Tilt Angle
figure;plot(tout,TiltAngle)
title('Tilt Angle')

% Central Venous Pressure
figure;plot(times,CVP)
title('Central Venous Pressure')

% CBF
figure;plot(tout,QH3i)
title('CBF')

% VP Split
figure;plot(tout,percVP)
title('Proportion through Vertebral Plexus')
