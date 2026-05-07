---
  title: Voltage Controlled Mmagnetic Anisotropy (VCMA) Magnetic Tunnel Junction (MJT)
---
The UMN voltage-controlled magnetic anisotropy model builds on the STT model and adds voltage-dependent anisotropy control. It includes experiment-based VCMA device parameters and lets the user adjust MTJ geometry, the VCMA coefficient, thermal stability, pulse shape, and external magnetic field.

## Default device parameters

| Device | Default dimensions | Material | `Ms0` | `P0` | `alpha` | `RA0` |
| --- | --- | --- | ---: | ---: | ---: | ---: |
| Interface perpendicular MTJ | 70 nm x 70 nm x 1.49 nm | CoFeB | 950 | 0.54 | 0.025 | 130 |

The top-level example sets:

- `vcma_coeff='33e-15'`
- `VE='2.45'`
- `VSTTP='1.8'`
- `VSTTN='-1.8'`
- `PW_VE='0.48n'`
- `PW_VSTT='2.00n'`

## Model structure

- `MTJ_write.sp` contains the VCMA-assisted STT switching deck and pulse timing definitions.
- `MTJ_model.inc` passes the VCMA control terminal into the LLG solver.
- `LLG_solver.inc` modifies the interfacial anisotropy using `vcma_coeff`, VCMA voltage, and oxide thickness.
- `NoiseGen_MATLAB.m` and `therm_dev_45.in` support thermal fluctuation input.
- `Resistor.inc` and `HeatDF.inc` use the same resistance and self-heating concepts as the STT model.

## Important formulas

The model changes perpendicular interfacial anisotropy with electric field:

$$
K_i(V_E)
=
2\pi M_s^2 t_c
-
\xi \frac{V_E}{t_{\mathrm{ox}}}
$$

The corresponding voltage-dependent thermal stability term is implemented as:

$$
\Delta_{\mathrm{VCMA}}
=
\frac{2\pi\left(t_c/l_z - N_z/(4\pi)\right)M_s^2l_xl_yl_z\cdot 10^6}{k_BT}
-
\frac{\xi l_xl_yV_E\cdot 10^4}{t_{\mathrm{ox}}k_BT}
$$

The switching deck measures pulse energy from average current, average voltage, and switching time:

$$
E_{\mathrm{wr}}
\approx
\overline{I}\,\overline{V}\,\Delta t
$$

## UMN documentation included

The UMN VCMA page describes the model as an STT-derived compact model with experiment-based VCMA parameters. It supports adjustment of MTJ dimensions, the VCMA coefficient, thermal stability factor, voltage pulse, and external magnetic field. It also includes initial-angle and thermal-fluctuation effects for physics-based switching probability studies.

## Sources

- J. Song, I. Ahmed, Z. Zhao, S. Sapatnekar, J.P. Wang, and C.H. Kim, "Evaluation of Operating Margin and Switching Probability of Voltage-Controlled Magnetic Anisotropy Magnetic Tunnel Junctions", IEEE JxCDC, April 2018.
- [UMN VCMA SPICE model documentation](http://mtj.umn.edu/VCMA.html)
- [UMN downloads page](http://mtj.umn.edu/Downloads.html)
- [VCMA_model.zip](http://mtj.umn.edu/VCMA_model.zip)
- [VCMA model paper, IEEE Xplore](https://ieeexplore.ieee.org/document/8528833/)
- [Magnetic tunnel junction overview](https://en.wikipedia.org/wiki/Magnetic_tunnel_junction)

## Inline SPICE code and helper files

### VCMA_model\HeatDF.inc

```cir
************************************************************************************
************************************************************************************
** Title:  HeatDF.inc
** Author: Jongyeon Kim, VLSI Research Lab @ UMN
** Email:  kimx2889@umn.edu
************************************************************************************
** Joule heating in the MTJ increases the internal temperature resulting in larger Hf. 
** Also, both Ms and P have a temperature dependency.
** The  Tmp is fed to LLG_solver.inc and Resistance.inc.
************************************************************************************

.subckt HD Ihd Tmp lx='lx' ly='ly' lz='lz' Tmp0='Tmp0'

*** Unit length for diffusion ******************
.param dL='lz/7*1e7'  $ [cm]

*** Volumetric specific heat capacity **********
*** f:Fe, o:MgO ********************************
.param Cvf='3.54'     $ [J/cm3*K]
.param Cvo='0.004'  

*** Heat conductivity **************************
.param Kf='0.802'     $ [W/cm*K]
.param Ko='0.6'

*** RC conversion for diffusion equation *******
.param Cf='Cvf'
.param Co='Cvo'
.param Rf='dL*dL/Kf'
.param Ro='dL*dL/Ko'

*** Head diffusion by distributed RC model *****
Rl01 Tmp l1 'Rf'
Rl12 l1 l2 'Rf'
Rl23 l2 l3 'Rf'
Rl34 l3 l4 'Rf'
Rl45 l4 l5 'Rf'
Rl56 l5 l6 'Rf'
Rl67 l6 l7 'Rf'
Vl l7 0 'Tmp0'

Cl0 Tmp 0 'Cf'
Cl1 l1 0 'Cf'
Cl2 l2 0 'Cf'
Cl3 l3 0 'Cf'
Cl4 l4 0 'Cf'
Cl5 l5 0 'Cf'
Cl6 l6 0 'Cf'

.param rho='1e-5'  $ [ohm*cm]
R_Ihd Ihd 0 '1'
G_Tmp 0 Tmp cur='rho*(v(Ihd)/(lx*ly*1e4))^2/Kf'


Rm01 Tmp m1 'Ro'
Rm02 m1 m2 'Ro'
Rr01 m2 r1 'Rf'
Rr12 r1 r2 'Rf'
Rr23 r2 r3 'Rf'
Rr34 r3 r4 'Rf'
Rr45 r4 r5 'Rf'
Rr56 r5 r6 'Rf'
Rr67 r6 r7 'Rf'
Vr r7 0 'Tmp0'

Cm0 Tmp 0 'Co'
Cm1 m1 0 'Co'
Cr0 m2 0 'Cf'
Cr1 r1 0 'Cf'
Cr2 r2 0 'Cf'
Cr3 r3 0 'Cf'
Cr4 r4 0 'Cf'
Cr5 r5 0 'Cf'
Cr6 r6 0 'Cf'


.ic v(l1)='Tmp0'
.ic v(l2)='Tmp0'
.ic v(l3)='Tmp0'
.ic v(l4)='Tmp0'
.ic v(l5)='Tmp0'
.ic v(l6)='Tmp0'

.ic v(Tmp)='Tmp0'
.ic v(m1)='Tmp0'
.ic v(m2)='Tmp0'

.ic v(r1)='Tmp0'
.ic v(r2)='Tmp0'
.ic v(r3)='Tmp0'
.ic v(r4)='Tmp0'
.ic v(r5)='Tmp0'
.ic v(r6)='Tmp0'


.ends
```

### VCMA_model\LLG_solver.inc

```cir
************************************************************************************
************************************************************************************
** Title:  LLG_solver.inc
** Author: Jeehwan Song, VLSI Research Lab @ UMN (songx944@umn.edu)
** This is modified based on previous STT model by Jongyeon Kim, VLSI Research Lab @ UMN (kimx2889@umn.edu)
************************************************************************************
** At the given MTJ dimensions and material parameters, the dynamic tr motion is
** implemented by LLG equation according to the type of MTJ. 
************************************************************************************

.subckt LLG Mx My Mz Is Ias Tmp thi e3 lx='lx' ly='ly' lz='lz' Ms0='Ms0' P0='P0' alpha='alpha' MA='MA' ini='ini' tc='tc' tox='tox' 

.include therm_dev_45.in
.param therm = '1' $ applicaility of thermal fluctuation (therm=1:applied, therm=0:removed)

*** Physical parameters *************************************************
.param pi='355/113'
.param gamma='2.8e6*2*pi'
.param h='6.625e-27/(2*pi)'
.param e='1.602e-19'
.param kb='1.38e-16'

*** Temp. dependent parameters ******************************************
.param Tcurie='1420'
.param beta='0.4'
.param asp='2e-5'
E_Ms Ms 0 vol='Ms0*(1-v(Tmp)/Tcurie)^beta'
E_P  P  0 vol='P0*(1-asp*v(Tmp)^1.5)'

*** Magnetization of pinned layer ***************************************
.param Mpx='0.0'
.param Mpy='1-MA'
.param Mpz='MA'

*** Shape anisotropy - Demagnetizing factors ****************************
.param Nsh(a,b,c)='1/pi*((b^2-c^2)/(2*b*c)*log((sqrt(a^2+b^2+c^2)-a)/(sqrt(a^2+b^2+c^2)+a))+(a^2-c^2)/(2*a*c)*log((sqrt(a^2+b^2+c^2)-b)/(sqrt(a^2+b^2+c^2)+b))+b/(2*c)*log((sqrt(a^2+b^2)+a)/(sqrt(a^2+b^2)-a))+a/(2*c)*log((sqrt(a^2+b^2)+b)/(sqrt(a^2+b^2)-b))+c/(2*a)*log((sqrt(b^2+c^2)-b)/(sqrt(b^2+c^2)+b))+c/(2*b)*log((sqrt(a^2+c^2)-a)/(sqrt(a^2+c^2)+a))+2*atan((a*b)/(c*sqrt(a^2+b^2+c^2)))+(a^3+b^3-2*c^3)/(3*a*b*c)+(a^2+b^2-2*c^2)/(3*a*b*c)*sqrt(a^2+b^2+c^2)+c/(a*b)*(sqrt(a^2+c^2)+sqrt(b^2+c^2))-((b^2+a^2)^(3/2)+(b^2+c^2)^(3/2)+(a^2+c^2)^(3/2))/(3*a*b*c))'

.param Nx='4*pi*Nsh(lz,ly,lx)'
.param Ny='4*pi*Nsh(lz,lx,ly)'
.param Nz='4*pi*Nsh(ly,lx,lz)'
E_Nz Nz 0 vol='4*pi*Nsh(ly,lx,lz)'

*** Interfacial anisotropy field for perpendicular MTJ ******************
 E_Ki Ki 0 vol='(2*pi*v(Ms)*v(Ms)*tc*1e2)-(vcma_coeff*(1e7/1e2)*v(e3)/(tox*1e2))' $VCMA-effect
 E_Hiz Hiz 0 vol='2*v(Ki)/(v(Ms)*lz*1e2)*v(Mz)'	

*** Initialization ******************************************************
.param Msi='Ms0*(1-Tmp0/Tcurie)^beta'
 E_Msi Msi 0 vol='Ms0*(1-Tmp0/Tcurie)^beta'
.param iPMA='(2*pi*((tc/lz)-(Nz/(4*pi)))*Msi*Msi*lx*ly*lz*1e6)/(kb*Tmp0)-(vcma_coeff*(1e7/1e2)*lx*ly*1e4*v(e3)/(tox*1e2*kb*Tmp0))' $VCMA-effect
 E_thste thste 0 vol='iPMA'

.param thi='asin((1/(2*iPMA))^(1/2))'
E_thi thi 0 vol='asin((1/(2*iPMA))^(1/2))'

.param Mx0='0.0'
.param My0='sin(thi)'
.param Mz0='(1-2*ini)*cos(thi)'

.ic v(Mx)='Mx0'
.ic v(My)='My0'
.ic v(Mz)='Mz0'

*** Demagnetizating field for in-plane MTJ ******************************
E_Hdx Hdx 0 vol='-Nx*v(Mx)*v(Ms)'
E_Hdy Hdy 0 vol='-Ny*v(My)*v(Ms)'
E_Hdz Hdz 0 vol='-Nz*v(Mz)*v(Ms)'

*** Effective anisotropy field + External field + Thermal fluctuation ***
E_Hefx Hefx 0 vol='v(Hdx)+Hext_x+therm*v(Hthx)'		
E_Hefy Hefy 0 vol='v(Hdy)+Hext_y+therm*v(Hthy)'		
E_Hefz Hefz 0 vol='v(Hdz)+MA*v(Hiz)+Hext_z+therm*v(Hthz)'	

*** Polarized spin current (J=Ias/lx/ly) ********************************
R_Is Is 0 'v(Ias)*v(P)*h/(2*e*lx*ly*lz*1e6*v(Ms))'

*** LLG solving for Mx, My, Mz ******************************************
C_Mx Mx 0 '(1+alpha*alpha)/gamma'
G_dMx_prec 0 Mx cur='-(v(My)*v(Hefz)-v(Hefy)*v(Mz))'
G_dMx_damp 0 Mx cur='-alpha*(v(My)*(v(Mx)*v(Hefy)-v(Hefx)*v(My))-(v(Mz)*v(Hefx)-v(Hefz)*v(Mx))*v(Mz))'
G_dMx_torq 0 Mx cur='v(Is)*(v(My)*(v(Mx)*Mpy-Mpx*v(My))-(v(Mz)*Mpx-Mpz*v(Mx))*v(Mz))'

C_My My 0 '(1+alpha*alpha)/gamma'
G_dMy_prec 0 My cur='-(v(Mz)*v(Hefx)-v(Hefz)*v(Mx))'
G_dMy_damp 0 My cur='-alpha*(v(Mz)*(v(My)*v(Hefz)-v(Hefy)*v(Mz))-(v(Mx)*v(Hefy)-v(Hefx)*v(My))*v(Mx))'
G_dMy_torq 0 My cur='v(Is)*(v(Mz)*(v(My)*Mpz-Mpy*v(Mz))-(v(Mx)*Mpy-Mpx*v(My))*v(Mx))'

C_Mz Mz 0 '(1+alpha*alpha)/gamma'
G_dMz_prec 0 Mz cur='-(v(Mx)*v(Hefy)-v(Hefx)*v(My))'
G_dMz_damp 0 Mz cur='-alpha*(v(Mx)*(v(Mz1)*v(Hefx)-v(Hefz)*v(Mx))-(v(My)*v(Hefz)-v(Hefy)*v(Mz1))*v(My))'
G_dMz_torq 0 Mz cur='v(Is)*(v(Mx)*(v(Mz1)*Mpx-Mpz*v(Mx))-(v(My)*Mpz-Mpy*v(Mz1))*v(My))'
E_Mz1 Mz1 0 vol='v(Mz)' max='cos(v(thi))' min='-cos(v(thi))'
E_dMz_prec Mz_prec 0 vol='-(v(Mx)*v(Hefy)-v(Hefx)*v(My))'
E_dMz_damp Mz_damp 0 vol='-alpha*(v(Mx)*(v(Mz1)*v(Hefx)-v(Hefz)*v(Mx))-(v(My)*v(Hefz)-v(Hefy)*v(Mz1))*v(My))'
E_dMz_torq Mz_torq 0 vol='v(Is)*(v(Mx)*(v(Mz1)*Mpx-Mpz*v(Mx))-(v(My)*Mpz-Mpy*v(Mz1))*v(My))'
E_dMz_sum_prec_damp_torq Mz_sum_prec_damp_torq 0 vol='v(Mz_prec)+v(Mz_damp)+v(Mz_torq)'


.ends
```

### VCMA_model\MTJ_model.inc

```cir
********************************************************************************************************
********************************************************************************************************
** Title:  MTJ_model.inc
** Author: Jongyeon Kim, VLSI Research Lab @ UMN
** Email:  kimx2889@umn.edu
********************************************************************************************************
** This library includes LLG_solver.inc, Resistance.inc, Thermal_fluctuation.inc, and Heat_diffusion.inc.
** At the given voltage across the MTJ, dynamic current and resistance are generated.
********************************************************************************************************

.include 'LLG_solver.inc'
.include 'Resistor.inc'
.include 'HeatDF.inc'

.subckt MTJ e1 e2 e3 Mx My Mz lx='lx' ly='ly' lz='lz' Ms0='Ms0' P0='P0' alpha='alpha' Tmp0='Tmp0' RA0='RA0' MA='MA' ini='ini' tc='tc' tox='tox' 

XRA   ex e2 Mx My Mz Tmp thi RA lx='lx' ly='ly' P0='P0' RA0='RA0' MA='MA' 
XLLG  Mx My Mz Is Ias Tmp thi e3 LLG lx='lx' ly='ly' lz='lz' Ms0='Ms0' P0='P0' alpha='alpha' MA='MA' ini='ini' tc='tc' tox='tox' 
XHD   Ihd Tmp HD lx='lx' ly='ly' lz='lz' Tmp0='Tmp0'

*** Internal top electrode of MTJ ***************
Ve1 e1 ex 0

*** Asymetry of write current ************************
*** positive bias:Ias=Iatp, negative bias:Ias=Ipta ***
*** Iatp will generate more spin current. ************ 
.param Iatp='1'
.param Ipta='1/1.5'
E_Ias Ias 0 vol='(1+(v(e1)-v(e2))/abs(v(e1)-v(e2)))*(Iatp-Ipta)/2+Ipta'


*** Charge current passing through MTJ stack *************
*** Imtj is fed to LLG and Head_Diffusion models *********
G_Imtj1 0 Is cur='-I(Ve1)'
G_Imtj2 0 Ihd cur='-I(Ve1)'



.ends
```

### VCMA_model\MTJ_write.sp

```cir
************************************************************************************
************************************************************************************
** Title: VCMA-assisted STT switching
** Author: Jeehwan Song, VLSI Research Lab @ UMN (songx944@umn.edu)
** This is modified based on previous STT model by Jongyeon Kim, VLSI Research Lab @ UMN (kimx2889@umn.edu)
************************************************************************************
** This run file simulates the dynamic motion of  MTJ.
** # Instruction for simulation
** 1. Set the MTJ dimensions and material parameters.
** 2. Select initial state of free layer(P/AP).
** 3. Select VCMA coefficient and external magnetic field 
**    ex. vcma_coeff = 33e-15, 105e-15, 290e-15 [J*V^-1*m^-1]
**        Hext_x = 200 [Oe]
** 4. Adjust voltage pulse parameters(voltage-amplitude, pulsewidth) for four switching directions.
**    ex. voltage pulse (1): P-to-P, AP-to-P switching @ ini='0/1'
**     	  voltage pulse (2): P-to-AP, AP-to-AP switching @ ini='0/1'
************************************************************************************
** # Description of parameters
** lx,ly,lz: width, length, and thickness of free layer
** tox: MgO thickness
** Ms0: saturation magnetizaion at 0K
** P0: polarization factor at 0K 
** alpha: damping factor
** Tmp0: temperature [K]
** RA0: resistance-are Product at parallel state
** MA: magnetic anisotropy (MA=0:In-plane,MA=1:Perpendicular)
**     also sets magnetization in pinned layer, MA=0:[0,1,0],MA=1:[0,0,1]
** ini: initial state of free layer (ini=0:Parallel,ini=1:Anti-parallel)
** tc: critical thickness (single interface: tc=1.5nm, Double interface: tc=3nm)
** vcma_coeff: coefficient of voltage-controlled magnetic anisotropy (VCMA)
** VE: voltage for VCMA-effect
** VSTT: voltage for STT-effect (VSTTP:positive VSTT, VSTTN:negative VSTT)
** PW_VE, PW_VSTT: pulsewidths of VE, VSTT
** Hext_x, H_ext_y, Hext_z: external magnetic field toward x-asix, y-axis, z-axis
************************************************************************************
.include 'MTJ_model.inc'

*** Options ************************************************************************
.option post
	+ runlvl=3
	+ ITL4=100
.save

*** Device Parameters of MTJ *******************************************************
.param lx='70n' ly='70n' lz='1.49n' Ms0='950' P0='0.54' alpha='0.025' Tmp0='358' RA0='130' MA='1' tc='1.5n' tox='1.4n' ini = '0' vcma_coeff = '33e-15'
.param pi='355/113' 
*** MTJ ****************************************************************************
XMTJ 1 0 2 Mx My Mz MTJ lx='lx' ly='ly' lz='lz' Ms0='Ms0' P0='P0' alpha='alpha' Tmp0='Tmp0' RA0='RA0' MA='MA' ini='ini' tc='tc' tox='tox' 

*** Experimental Parameters of MTJ ************************************************* 
.param Tmp0='358' Hext_x = '200' Hext_y = '0' Hext_z = '0'
.param VE = '2.45' VSTTP = '1.8' VSTTN = '-1.8' PW_VE = '0.48n' PW_VSTT = '2.00n'
.param t0 = '0.5n'			$time before VE pulse
.param t1 = 'VE*0.02n'  		$rising time from 0V to VE
.param t2 = '(VE-VSTTP)/(VE/t1)'	$falling time from VE to VSTTP
.param t3 = '(VSTTP-0)/(VE/t1)'		$time after VSTT pulse 

*** RC-delay for energy barrier time constant **************************************
.param R_Eb = '0k' C_Eb = '0f' 

R_Eb 1 2 'R_Eb'	$resistance of RC-delay model
C_Eb 2 0 'C_Eb' $capacitance of RC-delay model

*** Analysis ***********************************************************************
.param pw='10ns'
.tran 1p 'pw' START=1.0e-18  uic  $sweep PW_VE 0.45n 0.50n 0.01n

*** Voltage pulse(1): VE + POSTIVE VSTT (VSTTP) ************************************
Vpwl 1 0 pwl (0 0 't0' 0 't0+t1' 'VE' 't0+t1+PW_VE' 'VE' 't0+t1+PW_VE+t2' 'VSTTP' 't0+t1+PW_VE+t2+PW_VSTT' 'VSTTP' 't0+t1+PW_VE+t2+PW_VSTT+t3' 0 'pw' 0)

*** switching time measurement
.meas t_start		when v(1)='VE/2' rise=1
.meas t_finish		when v(Mz)=0.5	rise=1 TD='t0+t1+PW_VE+t2'  
.meas Tsw		param='t_finish-t_start'
.meas final_State	find v(Mz) at 'pw'

*** switching energy measurment
.meas i_avg   		AVG i(XMTJ.ve1) from='t0'	to='t_finish'
.meas v_avg   		AVG V(1) 	from='t0'	to='t_finish'
.meas Ewr_pulse1 	param='i_avg*v_avg*(t_finish-t0)'

*** Voltage pulse(2): VE + NEGATIVE VSTT (VSTTP) ***********************************
.alter
.param t2='(VE-VSTTN)/(VE/t1)'
.param t3='(0-VSTTN)/(VE/t1)'

Vpwl 1 0 pwl (0 0 't0' 0 't0+t1' 'VE' 't0+t1+PW_VE' 'VE' 't0+t1+PW_VE+t2' 'VSTTN' 't0+t1+PW_VE+t2+PW_VSTT' 'VSTTN' 't0+t1+PW_VE+t2+PW_VSTT+t3' 0 'pw' 0)

*** switching time measurement
.meas t_start		when v(1)='VE/2' rise=1
.meas t_finish		when v(Mz)=-0.5	fall=1 TD='t0+t1+PW_VE+t2'  
.meas Tsw		param='t_finish-t_start'
.meas final_State	find v(Mz) at 'pw'

*** switching energy measurment
.meas t_mid		when v(1)='0' fall=1
.meas i_avg_ve 		AVG i(XMTJ.ve1) from='t0'	to='t_mid'
.meas i_avg_vstt 	AVG i(XMTJ.ve1) from='t_mid'	to='t_finish'
.meas v_avg_ve 		AVG V(1) 	from='t0'	to='t_mid'
.meas v_avg_vstt	AVG V(1) 	from='t_mid'	to='t_finish'
.meas Ewr_pulse2 	param='(i_avg_ve*v_avg_ve*(t_mid-t0))+(i_avg_vstt*v_avg_vstt*(t_finish-t_mid))'

.end
```

### VCMA_model\NoiseGen_MATLAB.m

```matlab
% SimulationStartTime = time when noise is injected in the ckt
% SimulationEndTime = when noise injection is finished
% TimeIncrement = time step, change in noise value
% Mean = mean value of noise
% StDev = standard deviation of noise
% NominalVoltage = nominal value of noise, some DC value 
% Number = usually 1, how many files you want


function [out1, out2] = NoiseGen_2(SimulationStartTime, SimulationEndTime, TimeIncrement, Mean, StDev, NominalVoltage, Number)

fidx = fopen('pwlFile_30.in','w');

%  alpha = 0.03; Kb=1.38*10^-16; mu0 = 1; gamma=2*pi*2.8*10^6; lx=70e-7;ly=70e-7; lz=1.49e-7; Ms = 950;
% deltaT=TimeIncrement;
% Hth1 = sqrt(2*alpha*Kb*358/mu0/gamma/lx/ly/lz/Ms/10e-12)
% Hth2 = sqrt(2*alpha*Kb*358/mu0/gamma/lx/ly/lz/Ms/10e-12*0.4)
%StDev = Hth2
k=1;
for line=1:Number
    %% x axis
fprintf(fidx, 'Vth_x Hthx 0 PWL(');
for i=SimulationStartTime:TimeIncrement:SimulationEndTime
time=i*1e9;
x=randn(1)*StDev + Mean;
x=NominalVoltage + x;
out1(k)=time;
out2(k) = x;
fprintf(fidx,'%fn, ',time);
fprintf(fidx,'%4.5f ',x);
k=k+1;
end
fprintf(fidx, ')\n');

    %% yaxis
fprintf(fidx, 'Vth_y Hthy 0 PWL(');
for i=SimulationStartTime:TimeIncrement:SimulationEndTime
time=i*1e9;
x=randn(1)*StDev + Mean;
x=NominalVoltage + x;
out1(k)=time;
out2(k) = x;
fprintf(fidx,'%fn, ',time);
fprintf(fidx,'%4.5f ',x);
k=k+1;
end
fprintf(fidx, ')\n');

    %% z axis
fprintf(fidx, 'Vth_z Hthz 0 PWL(');
for i=SimulationStartTime:TimeIncrement:SimulationEndTime
time=i*1e9;
x=randn(1)*StDev + Mean;
x=NominalVoltage + x;
out1(k)=time;
out2(k) = x;
fprintf(fidx,'%fn, ',time);
fprintf(fidx,'%4.5f ',x);
k=k+1;
end
fprintf(fidx, ')\n');

end

fclose(fidx);

end
```

### VCMA_model\Resistor.inc

```cir
************************************************************************************
************************************************************************************
** Title:  Resistance.inc
** Author: Jongyeon Kim, VLSI Research Lab @ UMN
** Email:  kimx2889@umn.edu
************************************************************************************
** The dependence of resistance on  relative angle, temperature, and bias voltage
** is implemented.
************************************************************************************

.subckt RA n_plus n_minus Mx My Mz Tmp thi lx='lx' ly='ly' P0='P0' RA0='RA0' MA='MA'


*** Spherical coordinate ***
E_thip thip 0 vol='(1-MA)*acos((1-MA)*0.999*v(My)/((v(Mx)^2+v(My)^2)^(1/2)))'
E_th1 th1 0 vol='((v(My)^2+v(Mz)^2)^(1/2))'
E_th2 th2 0 vol='v(Mz)/v(th1)' max=1 min=-1
E_thp thp 0 vol='3.14/2*(1-v(th2))'

E_th th 0 vol='v(thip)+v(thp)' max='355/113-v(thi)' min='v(thi)'
E_phi phi 0 vol='(1-MA)*atan(v(Mx)/v(Mz))+MA*atan(v(My)/v(Mx))'


*** Temp. dependent parameters *******************
.param asp='2e-5'

*** Rp *******************************************
.param RA='RA0*1e-12'   $ [ohm*m2]
.param Rp='RA/(lx*ly)'
E_Rp Rp 0 vol='RA/(lx*ly)'

*** TMR ******************************************
.param v0='0.65'	
E_TMR0 TMR0 0 vol='2*P0^2*(1-asp*v(Tmp)^1.5)^2/(1-P0^2*(1-asp*v(Tmp)^1.5)^2)*100'
E_TMR TMR 0 vol='v(TMR0)/(1+((v(n_plus)-v(n_minus))/v0)^2)'
E_Rap Rap 0 vol='(v(TMR)/100+1)*Rp'

*** R(V,Tmp,th) **********************************
R_MTJ n_plus n_minus '(1+cos(v(th)))*(Rp-v(Rap))/2+v(Rap)'
E_rmtj rmtj 0 vol='(1+cos(v(th)))*(Rp-v(Rap))/2+v(Rap)'


.ends
```

### VCMA_model\therm_dev_45.in

```text
Vth_x Hthx 0 PWL(0.000000n, -46.31232 0.100000n, 6.25546 0.200000n, 128.62604 0.300000n, 43.28045 0.400000n, 56.01983 0.500000n, 27.31731 0.600000n, -52.10230 0.700000n, -85.45084 0.800000n, -3.60859 0.900000n, -45.70974 1.000000n, -65.00410 1.100000n, -6.23831 1.200000n, 19.44093 1.300000n, 101.38471 1.400000n, -20.68113 1.500000n, 4.07192 1.600000n, 117.36607 1.700000n, -46.67262 1.800000n, 11.38969 1.900000n, -11.99695 2.000000n, 59.28677 2.100000n, 5.02657 2.200000n, 57.21465 2.300000n, 18.53007 2.400000n, 34.10624 2.500000n, -75.25508 2.600000n, -33.00685 2.700000n, -59.54465 2.800000n, -68.02041 2.900000n, 41.01476 3.000000n, 46.97443 3.100000n, -6.16675 3.200000n, -44.56779 3.300000n, 46.99814 3.400000n, 82.10965 3.500000n, 31.65356 3.600000n, -36.99685 3.700000n, -20.21909 3.800000n, 31.64444 3.900000n, 2.80026 4.000000n, 46.18965 4.100000n, -44.18616 4.200000n, 69.12747 4.300000n, -12.95462 4.400000n, -32.00849 4.500000n, -52.87300 4.600000n, 38.50977 4.700000n, -15.12793 4.800000n, -12.33848 4.900000n, -16.97828 5.000000n, -46.78796 5.100000n, -31.87791 5.200000n, -5.36349 5.300000n, 97.62407 5.400000n, -16.94838 5.500000n, 35.94087 5.600000n, -42.39125 5.700000n, 39.29009 5.800000n, 40.31992 5.900000n, 32.19847 6.000000n, 16.72210 6.100000n, -82.13404 6.200000n, -6.37184 6.300000n, 27.06255 6.400000n, -81.41803 6.500000n, -18.85107 6.600000n, 53.88961 6.700000n, 1.51935 6.800000n, 61.03393 6.900000n, -15.22478 7.000000n, 55.74035 7.100000n, 7.19107 7.200000n, 30.52156 7.300000n, -64.87798 7.400000n, -66.57880 7.500000n, 21.97580 7.600000n, -16.14192 7.700000n, -82.13314 7.800000n, -20.38797 7.900000n, -15.99976 8.000000n, -38.46464 8.100000n, -56.10701 8.200000n, 9.97944 8.300000n, 15.10345 8.400000n, -36.11206 8.500000n, 59.56850 8.600000n, -21.93339 8.700000n, -89.13140 8.800000n, 1.03064 8.900000n, 36.61283 9.000000n, -85.38863 9.100000n, 84.48812 9.200000n, -13.08007 9.300000n, -37.02967 9.400000n, 12.76673 9.500000n, -24.27737 9.600000n, 42.73816 9.700000n, 59.75567 9.800000n, 19.68232 9.900000n, -0.24796 10.000000n, -76.64980 )
Vth_y Hthy 0 PWL(0.000000n, -34.37069 0.100000n, 0.98161 0.200000n, -89.91982 0.300000n, -47.42707 0.400000n, 6.72770 0.500000n, -55.43576 0.600000n, -34.70541 0.700000n, 13.55671 0.800000n, 8.52430 0.900000n, 5.33575 1.000000n, 109.84019 1.100000n, 30.17683 1.200000n, -30.57885 1.300000n, 2.18379 1.400000n, 52.22178 1.500000n, 81.39252 1.600000n, 30.80795 1.700000n, -35.01166 1.800000n, 30.84974 1.900000n, 25.57498 2.000000n, 23.63735 2.100000n, -2.41554 2.200000n, -9.80402 2.300000n, 4.36271 2.400000n, -26.94801 2.500000n, 26.74704 2.600000n, -2.28089 2.700000n, 59.92461 2.800000n, 33.55378 2.900000n, 10.18512 3.000000n, 59.91765 3.100000n, 39.07390 3.200000n, 15.30215 3.300000n, -40.97691 3.400000n, 59.96651 3.500000n, -5.68481 3.600000n, -15.82196 3.700000n, 1.35643 3.800000n, 48.07449 3.900000n, 5.33587 4.000000n, -51.14653 4.100000n, -12.63820 4.200000n, -36.27945 4.300000n, -12.23105 4.400000n, -56.30958 4.500000n, 16.00973 4.600000n, -15.51566 4.700000n, -39.77357 4.800000n, -26.15641 4.900000n, 57.16984 5.000000n, -53.77839 5.100000n, 21.87208 5.200000n, 7.60270 5.300000n, -53.71300 5.400000n, 1.80319 5.500000n, -41.64047 5.600000n, 37.61457 5.700000n, 24.80750 5.800000n, -5.26593 5.900000n, -44.51426 6.000000n, -23.39433 6.100000n, -22.41599 6.200000n, 15.54294 6.300000n, 56.08064 6.400000n, 34.14076 6.500000n, -20.02989 6.600000n, -84.73437 6.700000n, -33.11501 6.800000n, 15.87004 6.900000n, -47.75057 7.000000n, -0.23237 7.100000n, 66.26789 7.200000n, 73.14598 7.300000n, 7.91179 7.400000n, 79.64123 7.500000n, 25.64218 7.600000n, 31.90217 7.700000n, 25.04520 7.800000n, -22.18691 7.900000n, 8.82080 8.000000n, 23.29837 8.100000n, 53.34875 8.200000n, -115.71078 8.300000n, -38.42958 8.400000n, 62.39970 8.500000n, 29.33668 8.600000n, 9.80127 8.700000n, 23.51636 8.800000n, 53.24759 8.900000n, -42.53788 9.000000n, 18.49650 9.100000n, -84.64255 9.200000n, 5.94383 9.300000n, 4.32748 9.400000n, 56.69929 9.500000n, -33.06319 9.600000n, 24.54428 9.700000n, 43.01132 9.800000n, -31.80179 9.900000n, 14.02325 10.000000n, 2.19429 )
Vth_z Hthz 0 PWL(0.000000n, -7.82206 0.100000n, -22.42149 0.200000n, -29.80363 0.300000n, -52.55847 0.400000n, -20.84905 0.500000n, -41.85173 0.600000n, -2.07701 0.700000n, 70.42659 0.800000n, -13.33214 0.900000n, 43.72375 1.000000n, 21.95871 1.100000n, 60.77231 1.200000n, -0.29149 1.300000n, -4.47390 1.400000n, -6.80793 1.500000n, -54.78614 1.600000n, 91.46235 1.700000n, -64.21446 1.800000n, -5.57948 1.900000n, -16.49124 2.000000n, 3.31389 2.100000n, -64.40239 2.200000n, 35.03495 2.300000n, -1.94353 2.400000n, -10.30353 2.500000n, 63.97898 2.600000n, 30.36068 2.700000n, 77.34562 2.800000n, 59.15130 2.900000n, -24.62240 3.000000n, -11.51334 3.100000n, 56.12381 3.200000n, -18.77095 3.300000n, -3.38288 3.400000n, -20.20356 3.500000n, 18.78004 3.600000n, 48.38683 3.700000n, -27.40163 3.800000n, -22.58372 3.900000n, 42.91792 4.000000n, 76.95909 4.100000n, 42.85838 4.200000n, -61.77878 4.300000n, -3.07839 4.400000n, 14.15314 4.500000n, 3.27764 4.600000n, -23.80245 4.700000n, -79.01142 4.800000n, 54.31235 4.900000n, 47.77081 5.000000n, 32.54778 5.100000n, -17.00060 5.200000n, -59.15275 5.300000n, 26.25926 5.400000n, -38.75717 5.500000n, -10.78843 5.600000n, 56.23606 5.700000n, 43.26929 5.800000n, -14.81028 5.900000n, 16.48040 6.000000n, -29.82658 6.100000n, -35.28912 6.200000n, -8.91454 6.300000n, -57.91319 6.400000n, 84.97538 6.500000n, 22.67374 6.600000n, -34.30637 6.700000n, -0.31466 6.800000n, 43.22130 6.900000n, -7.81963 7.000000n, -10.34347 7.100000n, 35.00061 7.200000n, 66.44401 7.300000n, 39.09408 7.400000n, 6.11065 7.500000n, 23.87386 7.600000n, 1.04489 7.700000n, -20.17274 7.800000n, -29.63076 7.900000n, -35.33337 8.000000n, -38.11630 8.100000n, 0.48936 8.200000n, -71.47821 8.300000n, -5.76157 8.400000n, -68.09506 8.500000n, -12.07740 8.600000n, -41.41195 8.700000n, 6.56227 8.800000n, 43.79168 8.900000n, -75.59807 9.000000n, -33.68898 9.100000n, -33.70516 9.200000n, -20.73159 9.300000n, -8.72205 9.400000n, -41.80641 9.500000n, -11.53257 9.600000n, 44.69677 9.700000n, 6.48177 9.800000n, -22.45770 9.900000n, 13.74432 10.000000n, 24.47554 )
```
