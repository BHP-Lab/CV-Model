function [sys,x0,str,ts] = find_init(t,x,u,flag)


switch flag,
   
case 0
   [sys,x0,str,ts] = mdlInitializeSizes;
   
case 3
   sys = mdlOutputs(t,x,u);
   
case {1,2,4,9}
   sys = [];
   
otherwise
   error(['Unhandled flag = ',num2str(flag)]);
end;   
   
   
   
   
   %%%%%%%%%%%%%%%%%%%%%%%%
   
   function [sys,x0,str,ts] = mdlInitializeSizes
   
   sizes = simsizes;
   
   sizes.NumContStates = 0;
   sizes.NumDiscStates = 0;
   sizes.NumOutputs = 25;
   sizes.NumInputs = 92;
   sizes.DirFeedthrough = 1;
   
   sizes.NumSampleTimes = 1;
   
   sys = simsizes(sizes);
   
   x0 = [];
   str = [];
   
   ts = [-1 0];
   
   
   function sys = mdlOutputs(t,x,u)
   
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

Ts = (0.3)*sqrt(T);
Td = T-Ts-Ts/2;

Cla=1/(1/Clad+0.5*(1/Clas-1/Clad)*(1-cos(pi*Tav*sqrt(60/70)/Tsla)));
Cra=1/(1/Crad+0.5*(1/Cras-1/Crad)*(1-cos(pi*Tav*sqrt(60/70)/Tsla)));

zub=1/(R3+R4+Rub);
zh=1/(RH1+RH2+RH3+(1/(RH4+Rvp))+Rhead);
zr=1/(R8+R9+Rrc);
zs=1/(R10+R11+Rsc);
zg=1/(R12+R13+Rlc);
zu=1/(R2+R5+(1/(zub+zh)));
zl=1/(R6+R7+R14+R15+(1/(zr+zs+zg)));

A = [0                    0            Ts/R1        0                        0               0       (-Ts/R1-T/R6-T/R2) T/R2                0             0     0                         T/R6         0                        0             0     0              0      0              0      0                         0               0               0      0              0        0       0
     0                    0            0            0                        0               0       1/R6               0                   0             0     0                         (-1/R6-1/R7) 1/R7                     0             0     0              0      0              0      0                         0               0               0      0              0        0       0
     0                    0            0            0                        0               0       0                  0                   0             0     0                         1/R7         (-1/R7-1/R8-1/R10-1/R12) 1/R8          0     1/R10          0      1/R12          0      0                         0               0               0      0              0        0       0
     0                    0            0            0                        0               0       0                  0                   0             0     0                         0            1/R8                     (-1/R8-1/Rrc) 1/Rrc 0              0      0              0      0                         0               0               0      0              0        0       0
     0                    0            0            0                        0               0       0                  0                   0             0     0                         0            1/R10                    0             0     (-1/R10-1/Rsc) 1/Rsc  0              0      0                         0               0               0      0              0        0       0
     0                    0            0            0                        0               0       0                  0                   0             0     0                         0            1/R12                    0             0     0              0      (-1/R12-1/Rlc) 1/Rlc  0                         0               0               0      0              0        0       0
     0                    0            0            0                        0               0       0                  0                   0             0     0                         0            1/R8                     -1/R8         -1/R9 0              0      0              0      1/R9                      0               0               0      0              0        0       0
     0                    0            0            0                        0               0       0                  0                   0             0     0                         0            1/R10                    0             0     -1/R10         -1/R11 0              0      1/R11                     0               0               0      0              0        0       0
     0                    0            0            0                        0               0       0                  0                   0             0     0                         0            1/R12                    0             0     0              0      -1/R12         -1/R13 1/R13                     0               0               0      0              0        0       0
     0                    0            0            0                        0               0       0                  0                   0             0     0                         0            0                        0             1/R9  0              1/R11  0              1/R13  (-1/R9-1/R11-1/R13-1/R14) 1/R14           0               0      0              0        0       0
     0                    0            0            1/R15                    0               0       0                  0                   0             0     0                         0            0                        0             0     0              0      0              0      1/R14                     (-1/R15-1/R14)  0               0      0              0        0       0
     0                    0            0            0                        0               0       1/R2               (-1/R2-1/R3-1/RH1)  1/R3          0     0                         0            0                        0             0     0              0      0              0      0                         0               0               0      1/RH1          0        0       0  
     0                    0            0            0                        0               0       0                  1/R3                (-1/R3-1/Rub) 1/Rub 0                         0            0                        0             0     0              0      0              0      0                         0               0               0      0              0        0       0
     0                    0            0            0                        0               0       0                  1/R3                -1/R3         -1/R4 1/R4                      0            0                        0             0     0              0      0              0      0                         0               0               0      0              0        0       0
     0                    0            0            1/R5                     0               0       0                  0                   0             1/R4  (-1/R4-1/R5-1/RH4-1/Rvp)  0            0                        0             0     0              0      0              0      0                         0               0               0      0              0        0       (1/RH4+1/Rvp)
     0                    0            0            (-T/R15-T/R5-Td/R_tri)   Td/R_tri        0       0                  0                   0             0     T/R5                      0            0                        0             0     0              0      0              0      0                         T/R15           0               0      0              0        0       0
     0                    0            0            0                        0               Ts/Rpa  0                  0                   0             0     0                         0            0                        0             0     0              0      0              0      0                         0               (-Ts/Rpa-T/Rpc) T/Rpc  0              0        0       0
     T/Rpv                0            0            0                        0               Ts/Rpa  0                  0                   0             0     0                         0            0                        0             0     0              0      0              0      0                         0               -Ts/Rpa         -T/Rpv 0              0        0       0
     0                    Cld          -Cls         0                        -Crd            Crs     0                  0                   0             0     0                         0            0                        0             0     0              0      0              0      0                         0               0               0      0              0        0       0
     0                    Cld          (-Cls-Ts/R1) 0                        0               0       Ts/R1              0                   0             0     0                         0            0                        0             0     0              0      0              0      0                         0               0               0      0              0        0       0
     Cla                  Cld          0            Cra                      Crd             0       C1                 C2                  C3            C4    C5                        C6           C7                       C8            C9    C10            C11    C12            C13    C14                       C15             Cpa             Cpv    CH1            CH2      CH3     CH4
     0                    0            0            Td/R_tri                 -Td/R_tri       -Ts/Rpa 0                  0                   0             0     0                         0            0                        0             0     0              0      0              0      0                         0               Ts/Rpa          0      0              0        0       0
     (-T/Rpv-Td/R_mitral) Td/R_mitral  0            0                        0               0       0                  0                   0             0     0                         0            0                        0             0     0              0      0              0      0                         0               0               T/Rpv  0              0        0       0
     0                    0            0            0                        0               0       0                  1/RH1               0             0     0                         0            0                        0             0     0              0      0              0      0                         0               0               0      (-1/RH1-1/RH2) 1/RH2    0       0
     0                    0            0            0                        0               0       0                  1/RH1               0             0     0                         0            0                        0             0     0              0      0              0      0                         0               0               0      -1/RH1         -1/Rhead 1/Rhead 0
     0                    0            0            0                        0               0       0                  1/RH1               0             0     0                         0            0                        0             0     0              0      0              0      0                         0               0               0      -1/RH1         0        -1/RH3  1/RH3
     0                    0            0            0                        0               0       0                  1/RH1               0             0     (1/RH4+1/Rvp)             0            0                        0             0     0              0      0              0      0                         0               0               0      -1/RH1         0        0       (-1/RH4-1/Rvp)];


b=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,((Crs-Crd+Cld-Cls)*Pth),((Cld-Cls)*Pth),Vtot-Vo+Pth*(Cla+Cld+Cra+Crd+Cpa+Cpv+C1+C2+C5+C6+C15)+Pe*(C3+C4+C12+C13+CH1+CH4)+Pabd*(C7+C8+C9+C10+C11+C14)+Picp*(CH2+CH3),0,0,0,0,0,0].';


x=A\b;

Pla=x(1);
Plvd=x(2);
Plvs=x(3);
Pra=x(4);
Prvd=x(5);
Prvs=x(6);
P1c=x(7)-Pth;
P2c=x(8)-Pth;
P3c=x(9)-Pe;
P4c=x(10)-Pe;
P5c=x(11)-Pth;
P6c=x(12)-Pth;
P7c=x(13)-Pabd;
P8c=x(14)-Pabd;
P9c=x(15)-Pabd;
P10c=x(16)-Pabd;
P11c=x(17)-Pabd;
P12c=x(18)-Pe;
P13c=x(19)-Pe;
P14c=x(20)-Pabd;
P15c=x(21)-Pth;
Pcpa=x(22)-Pth;
Pcpv=x(23)-Pth;
PH1c=x(24)-Pe;
PH2c=x(25)-Picp;
PH3c=x(26)-Picp;
PH4c=x(27)-Pe;

C11a=C11/(1+pi^2*C11^2*P11c^2/(4*Vmaxsp^2));
C13a=C13/(1+pi^2*C13^2*P13c^2/(4*Vmaxll^2));
C14a=C14/(1+pi^2*C14^2*P14c^2/(4*Vmaxab^2));

V11a=2*Vmaxsp/pi*atan(pi*C11*P11c/(2*Vmaxsp));
V13a=2*Vmaxll/pi*atan(pi*C13*P13c/(2*Vmaxll));
V14a=2*Vmaxab/pi*atan(pi*C14*P14c/(2*Vmaxab));

Vtotcomp=1;
while abs(Vtotcomp-Vtot)>=1e-12

D = [0                    0            Ts/R1        0                        0               0       (-Ts/R1-T/R6-T/R2) T/R2                0             0     0                         T/R6         0                        0             0     0              0      0              0      0                         0               0               0      0              0        0       0
     0                    0            0            0                        0               0       1/R6               0                   0             0     0                         (-1/R6-1/R7) 1/R7                     0             0     0              0      0              0      0                         0               0               0      0              0        0       0
     0                    0            0            0                        0               0       0                  0                   0             0     0                         1/R7         (-1/R7-1/R8-1/R10-1/R12) 1/R8          0     1/R10          0      1/R12          0      0                         0               0               0      0              0        0       0
     0                    0            0            0                        0               0       0                  0                   0             0     0                         0            1/R8                     (-1/R8-1/Rrc) 1/Rrc 0              0      0              0      0                         0               0               0      0              0        0       0
     0                    0            0            0                        0               0       0                  0                   0             0     0                         0            1/R10                    0             0     (-1/R10-1/Rsc) 1/Rsc  0              0      0                         0               0               0      0              0        0       0
     0                    0            0            0                        0               0       0                  0                   0             0     0                         0            1/R12                    0             0     0              0      (-1/R12-1/Rlc) 1/Rlc  0                         0               0               0      0              0        0       0
     0                    0            0            0                        0               0       0                  0                   0             0     0                         0            1/R8                     -1/R8         -1/R9 0              0      0              0      1/R9                      0               0               0      0              0        0       0
     0                    0            0            0                        0               0       0                  0                   0             0     0                         0            1/R10                    0             0     -1/R10         -1/R11 0              0      1/R11                     0               0               0      0              0        0       0
     0                    0            0            0                        0               0       0                  0                   0             0     0                         0            1/R12                    0             0     0              0      -1/R12         -1/R13 1/R13                     0               0               0      0              0        0       0
     0                    0            0            0                        0               0       0                  0                   0             0     0                         0            0                        0             1/R9  0              1/R11  0              1/R13  (-1/R9-1/R11-1/R13-1/R14) 1/R14           0               0      0              0        0       0
     0                    0            0            1/R15                    0               0       0                  0                   0             0     0                         0            0                        0             0     0              0      0              0      1/R14                     (-1/R15-1/R14)  0               0      0              0        0       0
     0                    0            0            0                        0               0       1/R2               (-1/R2-1/R3-1/RH1)  1/R3          0     0                         0            0                        0             0     0              0      0              0      0                         0               0               0      1/RH1          0        0       0  
     0                    0            0            0                        0               0       0                  1/R3                (-1/R3-1/Rub) 1/Rub 0                         0            0                        0             0     0              0      0              0      0                         0               0               0      0              0        0       0
     0                    0            0            0                        0               0       0                  1/R3                -1/R3         -1/R4 1/R4                      0            0                        0             0     0              0      0              0      0                         0               0               0      0              0        0       0
     0                    0            0            1/R5                     0               0       0                  0                   0             1/R4  (-1/R4-1/R5-1/RH4-1/Rvp)  0            0                        0             0     0              0      0              0      0                         0               0               0      0              0        0       (1/RH4+1/Rvp)
     0                    0            0            (-T/R15-T/R5-Td/R_tri)   Td/R_tri        0       0                  0                   0             0     T/R5                      0            0                        0             0     0              0      0              0      0                         T/R15           0               0      0              0        0       0
     0                    0            0            0                        0               Ts/Rpa  0                  0                   0             0     0                         0            0                        0             0     0              0      0              0      0                         0               (-Ts/Rpa-T/Rpc) T/Rpc  0              0        0       0
     T/Rpv                0            0            0                        0               Ts/Rpa  0                  0                   0             0     0                         0            0                        0             0     0              0      0              0      0                         0               -Ts/Rpa         -T/Rpv 0              0        0       0
     0                    Cld          -Cls         0                        -Crd            Crs     0                  0                   0             0     0                         0            0                        0             0     0              0      0              0      0                         0               0               0      0              0        0       0
     0                    Cld          (-Cls-Ts/R1) 0                        0               0       Ts/R1              0                   0             0     0                         0            0                        0             0     0              0      0              0      0                         0               0               0      0              0        0       0
     Cla                  Cld          0            Cra                      Crd             0       C1                 C2                  C3            C4    C5                        C6           C7                       C8            C9    C10            C11    C12            C13    C14                       C15             Cpa             Cpv    CH1            CH2      CH3     CH4
     0                    0            0            Td/R_tri                 -Td/R_tri       -Ts/Rpa 0                  0                   0             0     0                         0            0                        0             0     0              0      0              0      0                         0               Ts/Rpa          0      0              0        0       0
     (-T/Rpv-Td/R_mitral) Td/R_mitral  0            0                        0               0       0                  0                   0             0     0                         0            0                        0             0     0              0      0              0      0                         0               0               T/Rpv  0              0        0       0
     0                    0            0            0                        0               0       0                  1/RH1               0             0     0                         0            0                        0             0     0              0      0              0      0                         0               0               0      (-1/RH1-1/RH2) 1/RH2    0       0
     0                    0            0            0                        0               0       0                  1/RH1               0             0     0                         0            0                        0             0     0              0      0              0      0                         0               0               0      -1/RH1         -1/Rhead 1/Rhead 0
     0                    0            0            0                        0               0       0                  1/RH1               0             0     0                         0            0                        0             0     0              0      0              0      0                         0               0               0      -1/RH1         0        -1/RH3  1/RH3
     0                    0            0            0                        0               0       0                  1/RH1               0             0     (1/RH4+1/Rvp)             0            0                        0             0     0              0      0              0      0                         0               0               0      -1/RH1         0        0       (-1/RH4-1/Rvp)];


e=-1*(A*x-b);
e(21)=-1*(-e(21)-C11*(x(17)-Pabd)-C13*(x(19)-Pe)-C14*(x(20)-Pabd)+V11a+V13a+V14a); %maybe


 %b=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,((Crs-Crd+Cld-Cls)*Pth),((Cld-Cls)*Pth),Vtot-Vo+(Cla+Cld+Cra+Crd+Cpa+Cpv+C1+C2+C5+C6+C15)*Pth+Pe*(C3+C4+C7+C8+C9+C10+C11+C12+C13+C14),0,0].';


dx=D\e;

x=x+dx;

Pla=x(1);
Plvd=x(2);
Plvs=x(3);
Pra=x(4);
Prvd=x(5);
Prvs=x(6);
P1c=x(7)-Pth;
P2c=x(8)-Pth;
P3c=x(9)-Pe;
P4c=x(10)-Pe;
P5c=x(11)-Pth;
P6c=x(12)-Pth;
P7c=x(13)-Pabd;
P8c=x(14)-Pabd;
P9c=x(15)-Pabd;
P10c=x(16)-Pabd;
P11c=x(17)-Pabd;
P12c=x(18)-Pe;
P13c=x(19)-Pe;
P14c=x(20)-Pabd;
P15c=x(21)-Pth;
Pcpa=x(22)-Pth;
Pcpv=x(23)-Pth;
PH1c=x(24)-Pe;
PH2c=x(25)-Picp;
PH3c=x(26)-Picp;
PH4c=x(27)-Pe;

C11a=C11/(1+pi^2*C11^2*P11c^2/(4*Vmaxsp^2));
C13a=C13/(1+pi^2*C13^2*P13c^2/(4*Vmaxll^2));
C14a=C14/(1+pi^2*C14^2*P14c^2/(4*Vmaxab^2));

V11a=2*Vmaxsp/pi*atan(pi*C11*P11c/(2*Vmaxsp));
V13a=2*Vmaxll/pi*atan(pi*C13*P13c/(2*Vmaxll));
V14a=2*Vmaxab/pi*atan(pi*C14*P14c/(2*Vmaxab));

Vtotcomp = C1*P1c + C2*P2c + C3*P3c + C4*P4c + C5*P5c + C6*P6c + C7*P7c + C8*P8c + C9*P9c + C10*P10c + V11a + C12*P12c+...
V13a+V14a + C15*P15c + CH1*PH1c + CH2*PH2c + CH3*PH3c + CH4*PH4c + Cpa*Pcpa + Cpv*Pcpv + Cld*(Plvd-Pth) + Crd*(Prvd-Pth) + Cla*(Pla-Pth) + Cra*(Pra-Pth) + Vo;

Vtotcomp-Vtot;

end

Vl=Cld*(Plvd-Pth);
Vr=Crd*(Prvd-Pth);
Vla=Cla*(Pla-Pth);
Vra=Cra*(Pra-Pth);

V1=C1*P1c;
V2=C2*P2c;
V3=C3*P3c;
V4=C4*P4c;
V5=C5*P5c;
V6=C6*P6c;
V7=C7*P7c;
V8=C8*P8c;
V9=C9*P9c;
V10=C10*P10c;
V12=C12*P12c;
V15=C15*P15c;
Vpa=Cpa*Pcpa;
Vpv=Cpv*Pcpv;
VH1=CH1*PH1c;
VH2=CH2*PH2c;
VH3=CH3*PH3c;
VH4=CH4*PH4c;

sys=[V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11a V12 V13a V14a V15 Vpa Vpv VH1 VH2 VH3 VH4 Vl Vr Vla Vra];
