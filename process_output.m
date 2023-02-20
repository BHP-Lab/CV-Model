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
Rub=u(21);
Rrc=u(22);
Rsc=u(23);
Rlc=u(24);
Rpa=u(25);
Rpc=u(26);
Rpv=u(27);
Vtot0=u(28);
Vo=u(29);
C1=u(30);
C2=u(31);
C3=u(32);
C4=u(33);
C5=u(34);
C6=u(35);
C7=u(36);
C8=u(37);
C9=u(38);
C10=u(39);
C11=u(40);
C12=u(41);
C13=u(42);
C14=u(43);
C15=u(44);
Cpa=u(45);
Cpv=u(46);
Pth=u(47);
Pe=u(48);
Pabd=u(49);
Clad=u(50);
Clas=u(51);
Crad=u(52);
Cras=u(53);
Tsla=u(54);
Tav=u(55);
R_tri=u(56);
R_mitral=u(57);
Tslv=u(58);
Vmaxsp=u(59);
Vmaxll=u(60);
Vmaxab=u(61);
Ph1=u(62);
Ph2=u(63);
Ph3=u(64);
Ph4=u(65);
Ph5=u(66);
Ph6=u(67);
Ph7=u(68);
Ph8=u(69);
Ph9=u(70);
Ph10=u(71);
Ph11=u(72);
Ph12=u(73);
Ph13=u(74);
Ph14=u(75);
Ph15=u(76);
R0=u(77);

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
Pra=yout(:,16);
Prv=yout(:,17);
Ppa=yout(:,18);
Ppv=yout(:,19);
Pla=yout(:,20);
Plv=yout(:,21);

%Time Varying Compliances
Cra=yout(:,22);
Crv=yout(:,23);
Cla=yout(:,24);
Clv=yout(:,25);

%Interstitial Volume
Vint=yout(:,26);

%Arterial Baroreflex
ABvupV0delt=yout(:,27);
ABvkV0delt=yout(:,28);
ABvspV0delt=yout(:,29);
ABvllV0delt=yout(:,30);

%Cardiopulmonary Reflex
CPvupV0delt=yout(:,31);
CPvkV0delt=yout(:,32);
CPvspV0delt=yout(:,33);
CPvllV0delt=yout(:,34);

%Microvascular Resistances
Rubn=yout(:,35);
Rrcn=yout(:,36);
Rscn=yout(:,37);
Rlcn=yout(:,38);

%Bias Pressures
Pen=yout(:,39);
Pthn=yout(:,40);
Pabdn=yout(:,41);
PeLBn=yout(:,42);

%Zero Pressure Filling Volumes
ZV1=yout(:,43);
ZV2=yout(:,44);
ZV3=yout(:,45);
ZV4=yout(:,46);
ZV5=yout(:,47);
ZV6=yout(:,48);
ZV7=yout(:,49);
ZV8=yout(:,50);
ZV9=yout(:,51);
ZV10=yout(:,52);
ZV11=yout(:,53);
ZV12=yout(:,54);
ZV13=yout(:,55);
ZV14=yout(:,56);
ZV15=yout(:,57);
ZVra=yout(:,58);
ZVrv=yout(:,59);
ZVpa=yout(:,60);
ZVpv=yout(:,61);
ZVla=yout(:,62);
ZVlv=yout(:,63);

%Calculate Compartment Volumes
V1=C1*(P1-Pthn)+ZV1;
V2=C2*(P2-Pthn)+ZV2;
V3=yout(:,64);
V4=yout(:,65);
V5=yout(:,66);
V6=C6*(P6-Pthn)+ZV6;
V7=C7*(P7-Pabdn)+ZV7;
V8=C8*(P8-Pabdn)+ZV8;
V9=yout(:,67);
V10=C10*(P10-Pabdn)+ZV10;
V11=yout(:,68);
V12=C12*(P12-PeLBn)+ZV12;
V13=yout(:,69);
V14=yout(:,70);
V15=C15*(P15-Pthn)+ZV15;
Vra=Cra.*(Pra-Pthn)+ZVra;
Vrv=Crv.*(Prv-Pthn)+ZVrv;
Vpa=Cpa*(Ppa-Pthn)+ZVpa;
Vpv=Cpv*(Ppv-Pthn)+ZVpv;
Vla=Cla.*(Pla-Pthn)+ZVla;
Vlv=yout(:,71);

%Total Zero Pressure Volume
ZVtot=ZV1+ZV2+ZV3+ZV4+ZV5+ZV6+ZV7+ZV8+ZV9+ZV10+ZV11...
    +ZV12+ZV13+ZV14+ZV15+ZVra+ZVrv+ZVpa+ZVpv+ZVla+ZVlv;

%Total Volume
Vtot=V1+V2+V3+V4+V5+V6+V7+V8+V9+V10+V11...
    +V12+V13+V14+V15+Vra+Vrv+Vpa+Vpv+Vla+Vlv+Vint;

%Left Ventricular Outflow
qlvo=yout(:,72);

%Cardiac Pacemaker
tv=yout(:,73);
t=yout(:,74);
RRint=yout(:,75);
NewBeat=yout(:,76);

%Design of Experiment
DOE_TiltAngle=yout(:,77);
DOE_Speed=yout(:,78);
DOE_LBNP=yout(:,79);
DOE_GLevel=yout(:,80);



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