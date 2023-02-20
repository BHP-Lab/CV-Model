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
   sizes.NumOutputs = 21;
   sizes.NumInputs = 77;
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
Rub=u(21);
Rrc=u(22);
Rsc=u(23);
Rlc=u(24);
Rpa=u(25);
Rpc=u(26);
Rpv=u(27);
Vtot=u(28);
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

Ts = (0.3)*sqrt(T);
Td = T-Ts-Ts/2;

Cla=1/(1/Clad+0.5*(1/Clas-1/Clad)*(1-cos(pi*Tav*sqrt(60/70)/Tsla)));
Cra=1/(1/Crad+0.5*(1/Cras-1/Crad)*(1-cos(pi*Tav*sqrt(60/70)/Tsla)));

zu=1/(R2+R3+R4+R5);
zr=1/(R8+R9+Rrc);
zs=1/(R10+R11+Rsc);
zg=1/(R12+R13+Rlc);
zl=1/(R6+R7+R14+R15+(1/(zr+zs+zg)));

A = [0                    0            Ts/R1        0                        0               0       (-Ts/R1-T/R6-T/R2) T/R2         0      0     0             T/R6         0                        0             0     0              0      0              0      0                         0               0               0        
     0                    0            0            0                        0               0       1/R6               0            0      0     0             (-1/R6-1/R7) 1/R7                     0             0     0              0      0              0      0                         0               0               0        
     0                    0            0            0                        0               0       0                  0            0      0     0             1/R7         (-1/R7-1/R8-1/R10-1/R12) 1/R8          0     1/R10          0      1/R12          0      0                         0               0               0        
     0                    0            0            0                        0               0       0                  0            0      0     0             0            1/R8                     (-1/R8-1/Rrc) 1/Rrc 0              0      0              0      0                         0               0               0        
     0                    0            0            0                        0               0       0                  0            0      0     0             0            1/R10                    0             0     (-1/R10-1/Rsc) 1/Rsc  0              0      0                         0               0               0        
     0                    0            0            0                        0               0       0                  0            0      0     0             0            1/R12                    0             0     0              0      (-1/R12-1/Rlc) 1/Rlc  0                         0               0               0        
     0                    0            0            0                        0               0       0                  0            0      0     0             0            1/R8                     -1/R8         -1/R9 0              0      0              0      1/R9                      0               0               0        
     0                    0            0            0                        0               0       0                  0            0      0     0             0            1/R10                    0             0     -1/R10         -1/R11 0              0      1/R11                     0               0               0        
     0                    0            0            0                        0               0       0                  0            0      0     0             0            1/R12                    0             0     0              0      -1/R12         -1/R13 1/R13                     0               0               0        
     0                    0            0            0                        0               0       0                  0            0      0     0             0            0                        0             1/R9  0              1/R11  0              1/R13  (-1/R9-1/R11-1/R13-1/R14) 1/R14           0               0        
     0                    0            0            1/R15                    0               0       0                  0            0      0     0             0            0                        0             0     0              0      0              0      1/R14                     (-1/R15-1/R14)  0               0        
     0                    0            0            0                        0               0       1/R2               (-1/R2-1/R3) 1/R3   0     0             0            0                        0             0     0              0      0              0      0                         0               0               0        
     0                    0            0            0                        0               0       1/R2              -1/R2         -1/Rub 1/Rub 0             0            0                        0             0     0              0      0              0      0                         0               0               0        
     0                    0            0            0                        0               0       1/R2              -1/R2         0      -1/R4 1/R4          0            0                        0             0     0              0      0              0      0                         0               0               0        
     0                    0            0            1/R5                     0               0       0                 0             0      1/R4  (-1/R4-1/R5)  0            0                        0             0     0              0      0              0      0                         0               0               0        
     0                    0            0            (-T/R15-T/R5-Td/R_tri)   Td/R_tri        0       0                 0             0      0     T/R5          0            0                        0             0     0              0      0              0      0                         T/R15           0               0        
     0                    0            0            0                        0               Ts/Rpa  0                 0             0      0     0             0            0                        0             0     0              0      0              0      0                         0               (-Ts/Rpa-T/Rpc) T/Rpc    
     T/Rpv                0            0            0                        0               Ts/Rpa  0                 0             0      0     0             0            0                        0             0     0              0      0              0      0                         0               -Ts/Rpa         -T/Rpv  
     0                    Cld          -Cls         0                        -Crd            Crs     0                 0             0      0     0             0            0                        0             0     0              0      0              0      0                         0               0               0        
     0                    Cld          (-Cls-Ts/R1) 0                        0               0       Ts/R1             0             0      0     0             0            0                        0             0     0              0      0              0      0                         0               0               0        
     Cla                  Cld          0            Cra                      Crd             0       C1                C2            C3     C4    C5            C6           C7                       C8            C9    C10            C11    C12            C13    C14                       C15             Cpa             Cpv      
     0                    0            0            Td/R_tri                 -Td/R_tri       -Ts/Rpa 0                 0             0      0     0             0            0                        0             0     0              0      0              0      0                         0               Ts/Rpa          0
     (-T/Rpv-Td/R_mitral) Td/R_mitral  0            0                        0               0       0                 0             0      0     0             0            0                        0             0     0              0      0              0      0                         0               0               T/Rpv];


b=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,((Crs-Crd+Cld-Cls)*Pth),((Cld-Cls)*Pth),Vtot-Vo+(Cla+Cld+Cra+Crd+Cpa+Cpv+C1+C2+C5+C6+C15)*Pth+Pe*(C3+C4+C12+C13)+Pabd*(C7+C8+C9+C10+C11+C14),0,0].';


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

C11a=C11/(1+pi^2*C11^2*P11c^2/(4*Vmaxsp^2));
C13a=C13/(1+pi^2*C13^2*P13c^2/(4*Vmaxll^2));
C14a=C14/(1+pi^2*C14^2*P14c^2/(4*Vmaxab^2));

V11a=2*Vmaxsp/pi*atan(pi*C11*P11c/(2*Vmaxsp));
V13a=2*Vmaxll/pi*atan(pi*C13*P13c/(2*Vmaxll));
V14a=2*Vmaxab/pi*atan(pi*C14*P14c/(2*Vmaxab));

Vtotcomp=1;
while abs(Vtotcomp-Vtot)>=1e-12

    
D = [0                    0            Ts/R1        0                        0               0       (-Ts/R1-T/R6-T/R2) T/R2         0      0     0             T/R6         0                        0             0     0              0      0              0      0                         0               0               0        
     0                    0            0            0                        0               0       1/R6               0            0      0     0             (-1/R6-1/R7) 1/R7                     0             0     0              0      0              0      0                         0               0               0        
     0                    0            0            0                        0               0       0                  0            0      0     0             1/R7         (-1/R7-1/R8-1/R10-1/R12) 1/R8          0     1/R10          0      1/R12          0      0                         0               0               0        
     0                    0            0            0                        0               0       0                  0            0      0     0             0            1/R8                     (-1/R8-1/Rrc) 1/Rrc 0              0      0              0      0                         0               0               0        
     0                    0            0            0                        0               0       0                  0            0      0     0             0            1/R10                    0             0     (-1/R10-1/Rsc) 1/Rsc  0              0      0                         0               0               0        
     0                    0            0            0                        0               0       0                  0            0      0     0             0            1/R12                    0             0     0              0      (-1/R12-1/Rlc) 1/Rlc  0                         0               0               0        
     0                    0            0            0                        0               0       0                  0            0      0     0             0            1/R8                     -1/R8         -1/R9 0              0      0              0      1/R9                      0               0               0        
     0                    0            0            0                        0               0       0                  0            0      0     0             0            1/R10                    0             0     -1/R10         -1/R11 0              0      1/R11                     0               0               0        
     0                    0            0            0                        0               0       0                  0            0      0     0             0            1/R12                    0             0     0              0      -1/R12         -1/R13 1/R13                     0               0               0        
     0                    0            0            0                        0               0       0                  0            0      0     0             0            0                        0             1/R9  0              1/R11  0              1/R13  (-1/R9-1/R11-1/R13-1/R14) 1/R14           0               0        
     0                    0            0            1/R15                    0               0       0                  0            0      0     0             0            0                        0             0     0              0      0              0      1/R14                     (-1/R15-1/R14)  0               0        
     0                    0            0            0                        0               0       1/R2               (-1/R2-1/R3) 1/R3   0     0             0            0                        0             0     0              0      0              0      0                         0               0               0        
     0                    0            0            0                        0               0       1/R2              -1/R2         -1/Rub 1/Rub 0             0            0                        0             0     0              0      0              0      0                         0               0               0        
     0                    0            0            0                        0               0       1/R2              -1/R2         0      -1/R4 1/R4          0            0                        0             0     0              0      0              0      0                         0               0               0        
     0                    0            0            1/R5                     0               0       0                 0             0      1/R4  (-1/R4-1/R5)  0            0                        0             0     0              0      0              0      0                         0               0               0        
     0                    0            0            (-T/R15-T/R5-Td/R_tri)   Td/R_tri        0       0                 0             0      0     T/R5          0            0                        0             0     0              0      0              0      0                         T/R15           0               0        
     0                    0            0            0                        0               Ts/Rpa  0                 0             0      0     0             0            0                        0             0     0              0      0              0      0                         0               (-Ts/Rpa-T/Rpc) T/Rpc    
     T/Rpv                0            0            0                        0               Ts/Rpa  0                 0             0      0     0             0            0                        0             0     0              0      0              0      0                         0               -Ts/Rpa         -T/Rpv  
     0                    Cld          -Cls         0                        -Crd            Crs     0                 0             0      0     0             0            0                        0             0     0              0      0              0      0                         0               0               0        
     0                    Cld          (-Cls-Ts/R1) 0                        0               0       Ts/R1             0             0      0     0             0            0                        0             0     0              0      0              0      0                         0               0               0        
     Cla                  Cld          0            Cra                      Crd             0       C1                C2            C3     C4    C5            C6           C7                       C8            C9    C10            C11a   C12            C13a   C14a                      C15             Cpa             Cpv      
     0                    0            0            Td/R_tri                 -Td/R_tri       -Ts/Rpa 0                 0             0      0     0             0            0                        0             0     0              0      0              0      0                         0               Ts/Rpa          0
     (-T/Rpv-Td/R_mitral) Td/R_mitral  0            0                        0               0       0                 0             0      0     0             0            0                        0             0     0              0      0              0      0                         0               0               T/Rpv];


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

C11a=C11/(1+pi^2*C11^2*P11c^2/(4*Vmaxsp^2));
C13a=C13/(1+pi^2*C13^2*P13c^2/(4*Vmaxll^2));
C14a=C14/(1+pi^2*C14^2*P14c^2/(4*Vmaxab^2));

V11a=2*Vmaxsp/pi*atan(pi*C11*P11c/(2*Vmaxsp));
V13a=2*Vmaxll/pi*atan(pi*C13*P13c/(2*Vmaxll));
V14a=2*Vmaxab/pi*atan(pi*C14*P14c/(2*Vmaxab));

Vtotcomp = C1*P1c + C2*P2c + C3*P3c + C4*P4c + C5*P5c + C6*P6c + C7*P7c + C8*P8c + C9*P9c + C10*P10c + V11a + C12*P12c+...
V13a+V14a + P15c*C15 + Cpa*Pcpa + Cpv*Pcpv + Cld*(Plvd-Pth) + Crd*(Prvd-Pth) + Cla*(Pla-Pth) + Cra*(Pra-Pth) + Vo;

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

sys=[V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11a V12 V13a V14a V15 Vpa Vpv Vl Vr Vla Vra];
