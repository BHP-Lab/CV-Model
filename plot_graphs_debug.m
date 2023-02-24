%% Graphs

%Vtot
figure;
plot(tout,Vtot)
title('Vtot')

%Vhead
Vhead1 = VH1+VH2+VH3+VH4;
figure;
plot(tout,Vhead1)
title('Head Volume')

%Vbody
Vbody1=V1+V2+V3+V4+V5+V6+V7+V8+V9+V10+V11...
    +V12+V13+V14+V15...
    +Vra+Vrv+Vpa+Vpv+Vla+Vlv+Vint;
figure;
plot(tout,Vbody1)
title('Body Volume')

