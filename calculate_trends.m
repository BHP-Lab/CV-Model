vec=find(NewBeat==1);
step=diff(tout);

for i=1:length(vec)-1
    st=vec(i);
    en=vec(i+1);
    
    %Arterial Pressures
    MAP(i)=sum(P1(st:en-1).*step(st:en-1))/(tout(en)-tout(st)); %MAP from integration
    DBP(i)=min(P1(st:en-1)); %DBP
    SBP(i)=max(P1(st:en-1)); %SBP
    PP(i)= SBP(i) - DBP(i); %PP
    MAP1(i) = DBP(i)+(1/3).*(SBP(i)-DBP(i)); %MAP from SBP and DBP
    CVP(i)=sum(P15(st:en-1).*step(st:en-1))/(tout(en)-tout(st)); %MAP from integration

    %Average Transmural Right-Atrial Pressure
    dPra=Pra-Pth;
    Avg_dPra(i)=sum(dPra(st:en-1).*step(st:en-1))/(tout(en)-tout(st));

    %CO
    CO(i)=(sum(qlvo(st:en-1).*step(st:en-1))/(tout(en)-tout(st)))*(6/100); %l/min

    % Stroke Volume
    SV(i) = max(Vlv(st:en-1))- min(Vlv(st:en-1)); %Stroke Volume from change in ventricular volume
    SVV(i)= (sum(qlvo(st:en-1).*step(st:en-1))/(tout(en)-tout(st)))*((tout(en)-tout(st))); %Stroke volume from integration of out flow

    %Average Total Leg Volume
    AvgTotalLegVol(i)=sum(TotalLegVol(st:en-1).*step(st:en-1))/(tout(en)-tout(st));

    %Average Total Ab Volume
    AvgTotalAbVol(i)=sum(TotalAbVol(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    
    %Average Compartmental Volumes
    AvgV1(i)=sum(V1(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgV2(i)=sum(V2(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgV3(i)=sum(V3(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgV4(i)=sum(V4(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgV5(i)=sum(V5(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgV6(i)=sum(V6(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgV7(i)=sum(V7(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgV8(i)=sum(V8(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgV9(i)=sum(V9(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgV10(i)=sum(V10(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgV11(i)=sum(V11(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgV12(i)=sum(V12(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgV13(i)=sum(V13(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgV14(i)=sum(V14(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgV15(i)=sum(V15(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgVH1(i)=sum(VH1(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgVH2(i)=sum(VH2(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgVH3(i)=sum(VH3(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgVH4(i)=sum(VH4(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgVra(i)=sum(Vra(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgVrv(i)=sum(Vrv(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgVpa(i)=sum(Vpa(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgVpv(i)=sum(Vpv(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgVla(i)=sum(Vla(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgVlv(i)=sum(Vlv(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    AvgVtot(i)=sum(Vtot(st:en-1).*step(st:en-1))/(tout(en)-tout(st));
    times(i)=(tout(st)+tout(en))/2;
end








