%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read Initial Condition
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%initcond contains the nominal parameters of the model.
u=initcond;
%initialize parameters
T=u(1)/1000;
Cls=u(2);
Cld=u(3);
Crs=u(4);
Crd=u(5);
R1=u(6);
R2=u(7);
R3=u(8);
R4=u(9);
R5=u(10);
R6=u(11);
R7=u(12);
R8=u(13);
R9=u(14);
R10=u(15);
R11=u(16);
R12=u(17);
R13=u(18);
R14=u(19);
R15=u(20);
RH1=u(21);
RH2=u(22);
RH3=u(23);
RH4=u(24);
Rub=u(25);
Rrc=u(26);
Rsc=u(27);
Rlc=u(28);
Rpa=u(29);
Rpc=u(30);
Rpv=u(31);
Rhead=u(32);
Rvp=u(33);
Vtot=u(34);
Vo=u(35);
C1=u(36);
C2=u(37);
C3=u(38);
C4=u(39);
C5=u(40);
C6=u(41);
C7=u(42);
C8=u(43);
C9=u(44);
C10=u(45);
C11=u(46);
C12=u(47);
C13=u(48);
C14=u(49);
C15=u(50);
CH1=u(51);
CH2=u(52);
CH3=u(53);
CH4=u(54);
Cpa=u(55);
Cpv=u(56);
Pth=u(57);
Pe=u(58);
Pabd=u(59);
Picp=u(60);
Clad=u(61);
Clas=u(62);
Crad=u(63);
Cras=u(64);
Tsla=u(65);
Tav=u(66);
R_tri=u(67);
R_mitral=u(68);
Tslv=u(69);
Vmaxsp=u(70);
Vmaxll=u(71);
Vmaxab=u(72);
Ph1=u(73);
Ph2=u(74);
Ph3=u(75);
Ph4=u(76);
Ph5=u(77);
Ph6=u(78);
Ph7=u(79);
Ph8=u(80);
Ph9=u(81);
Ph10=u(82);
Ph11=u(83);
Ph12=u(84);
Ph13=u(85);
Ph14=u(86);
Ph15=u(87);
PhH1=u(88);
PhH2=u(89);
PhH3=u(90);
PhH4=u(91);
R0=u(92);

%Save systolic and diastolic times
Ts = (1/3)*sqrt(T);
Td = T-3*Ts/2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output Data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Pressure 1 XXX
P1=yout(:,1);
P2=yout(:,2);
P3=yout(:,3); 
P4=yout(:,4);
P5=yout(:,5);
P6=yout(:,6);
P7=yout(:,7);
P8=yout(:,8);
P9=yout(:,9);
P10=yout(:,10);
P11=yout(:,11);
P12=yout(:,12);
P13=yout(:,13);
P14=yout(:,14);
P15=yout(:,15);
PH1=yout(:,16);
PH2=yout(:,17);
PH3=yout(:,18);
PH4=yout(:,19);
Pra=yout(:,20);
Prv=yout(:,21);
Ppa=yout(:,22);
Ppv=yout(:,23);
Pla=yout(:,24);
Plv=yout(:,25);

%Time Varying Compliances
Cra=yout(:,26);
Crv=yout(:,27);
Cla=yout(:,28);
Clv=yout(:,29);

%Interstitial Volume
Vint=yout(:,30);

%Arterial Baroreflex
ABvhV0delt=yout(:,31);
ABvupV0delt=yout(:,32);
ABvkV0delt=yout(:,33);
ABvspV0delt=yout(:,34);
ABvllV0delt=yout(:,35);

%Cardiopulmonary Reflex
CPvhV0delt=yout(:,36);
CPvupV0delt=yout(:,37);
CPvkV0delt=yout(:,38);
CPvspV0delt=yout(:,39);
CPvllV0delt=yout(:,40);

%Microvascular Resistances
Rhn=yout(:,41);
Rubn=yout(:,42);
Rrcn=yout(:,43);
Rscn=yout(:,44);
Rlcn=yout(:,45);

%Bias Pressures
Picpn=yout(:,46);
Pen=yout(:,47);
Pthn=yout(:,48);
Pabdn=yout(:,49);
PeLBn=yout(:,50);

%Zero Pressure Filling Volumes
ZV1=yout(:,51);
ZV2=yout(:,52);
ZV3=yout(:,53);
ZV4=yout(:,54);
ZV5=yout(:,55);
ZV6=yout(:,56);
ZV7=yout(:,57);
ZV8=yout(:,58);
ZV9=yout(:,59);
ZV10=yout(:,60);
ZV11=yout(:,61);
ZV12=yout(:,62);
ZV13=yout(:,63);
ZV14=yout(:,64);
ZV15=yout(:,65);
ZVH1=yout(:,66);
ZVH2=yout(:,67);
ZVH3=yout(:,68);
ZVH4=yout(:,69);
ZVra=yout(:,70);
ZVrv=yout(:,71);
ZVpa=yout(:,72);
ZVpv=yout(:,73);
ZVla=yout(:,74);
ZVlv=yout(:,75);

%Bodyweight Pressures
Pw1=yout(:,76);
Pw2=yout(:,77);
Pw3=yout(:,78);
Pw4=yout(:,79);
Pw5=yout(:,80);
Pw6=yout(:,81);
Pw7=yout(:,82);
Pw8=yout(:,83);
Pw9=yout(:,84);
Pw10=yout(:,85);
Pw11=yout(:,86);
Pw12=yout(:,87);
Pw13=yout(:,88);
Pw14=yout(:,89);
Pw15=yout(:,90);
PwH1=yout(:,91);
PwH2=yout(:,92);
PwH3=yout(:,93);
PwH4=yout(:,94);

%Calculate Compartment Volumes
V1=C1*(P1-Pthn-Pw1)+ZV1;
V2=C2*(P2-Pthn-Pw2)+ZV2;
V3=yout(:,95);
V4=yout(:,96);
V5=yout(:,97);
V6=C6*(P6-Pthn-Pw6)+ZV6;
V7=C7*(P7-Pabdn-Pw7)+ZV7;
V8=C8*(P8-Pabdn-Pw8)+ZV8;
V9=yout(:,98);
V10=C10*(P10-Pabdn-Pw10)+ZV10;
V11=yout(:,99);
V12=C12*(P12-PeLBn-Pw12)+ZV12;
V13=yout(:,100);
V14=yout(:,101);
V15=C15*(P15-Pthn-Pw15)+ZV15;
VH1=CH1*(PH1-Pen-PwH1)+ZVH1;
VH2=yout(:,102);
VH3=yout(:,103);
VH4=yout(:,104);
Vra=Cra.*(Pra-Pthn)+ZVra;
Vrv=Crv.*(Prv-Pthn)+ZVrv;
Vpa=Cpa*(Ppa-Pthn)+ZVpa;
Vpv=Cpv*(Ppv-Pthn)+ZVpv;
Vla=Cla.*(Pla-Pthn)+ZVla;
Vlv=yout(:,105);

%Flows
qlvo=yout(:,106);
Q2i=yout(:107);
Q3i=yout(:108);
Q4i=yout(:109);
Q5i=yout(:110);
Q5o=yout(:111);
Q6i=yout(:112);
Q7i=yout(:113);
Q8i=yout(:114);
Q9i=yout(:115);
Q9o=yout(:116);
Q10i=yout(:117);
Q11i=yout(:118);
Q11o=yout(:119);
Q12i=yout(:120);
Q13i=yout(:121);
Q13o=yout(:122);
Q14i=yout(:123);
Q15i=yout(:124);
Q15o=yout(:125);
QH1i=yout(:126);
QH2i=yout(:127);
QH3i=yout(:128);
QH3o=yout(:129);
QH4i=yout(:130);
Qvpi=yout(:131);
QH4o=yout(:132);
Qrai=yout(:133);
Qri=yout(:134);
Qro=yout(:135);
Qpv=yout(:136);
Qlai=yout(:137);
Qli=yout(:138);
Qint=yout(:139);

%Cardiac Pacemaker
tv=yout(:,140);
t=yout(:,141);
RRint=yout(:,142);
NewBeat=yout(:,143);

%Design of Experiment
DOE_TiltAngle=yout(:,144);
DOE_Speed=yout(:,145);
DOE_LBNP=yout(:,146);
DOE_GLevel=yout(:,147);

%Proportion of flow through VP
percVP=yout(:,148);

%Total Zero Pressure Volume
ZVtot=ZV1+ZV2+ZV3+ZV4+ZV5+ZV6+ZV7+ZV8+ZV9+ZV10+ZV11...
    +ZV12+ZV13+ZV14+ZV15+ZVH1+ZVH2+ZVH3+ZVH4...
    +ZVra+ZVrv+ZVpa+ZVpv+ZVla+ZVlv;

%Total Volume
Vtot=V1+V2+V3+V4+V5+V6+V7+V8+V9+V10+V11...
    +V12+V13+V14+V15+VH1+VH2+VH3+VH4...
    +Vra+Vrv+Vpa+Vpv+Vla+Vlv+Vint;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate Other Values
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

HR=60./RRint; %HR
TPR=1./(1./Rubn+1./Rrcn+1./Rscn+1./Rlcn); %TPR

TiltAngle=DOE_TiltAngle*180/pi; %Tilt Angle in Degrees
Speed=DOE_Speed*30/pi; %Speed in RPM

TotVenousZPFV= ZV4+ZV9+ZV11+ZV13; %Total Venous ZPFV
TotalLegVol=V12+V13; %Total Leg Volume
TotalAbVol=V7+V8+V9+V10+V11+V14; %Total Abdominal Volume

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Other Code
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Csp=C11./(1+(pi.*C11.*(P11-Pe)./(2*Vmaxsp)).^2);
% Cll=C13./(1+(pi.*C13.*(P13-Pe)./(2*Vmaxll)).^2);
% Cab=C14./(1+(pi.*C14.*(P14-Pe)./(2*Vmaxab)).^2); 
% Pexercise = yout(:,59);
% Pexmax = yout(:,60);
% Pex_abd= yout(:,61);
% %Pseta= yout(:,62);