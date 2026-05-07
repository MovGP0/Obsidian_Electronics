---
title: Spin transfer torque (STT) Magnetic Tunel Junction (MTJ) Models
---
The UMN spin-transfer torque model is a physics-based SPICE model for STT-MRAM read/write timing and scalability studies. It accepts user-defined free-layer geometry and material parameters and is intended for both in-plane and perpendicular MTJs.

## Included device variants

| Variant | Downloaded folder | Default dimensions | Material | `Ms0` | `P0` | `alpha` | `RA0` | Anisotropy |
| --- | --- | --- | --- | ---: | ---: | ---: | ---: | --- |
| In-plane MTJ | `.temp/STT_model/IMTJ` | 32 nm x 96 nm x 2.44 nm | CoFeB | 1210 | 0.69 | 0.0062 | 5 | `MA='0'` |
| Crystalline perpendicular MTJ | `.temp/STT_model/cPMTJ` | 45 nm x 45 nm x 0.45 nm | FePt | 1210 | 0.62 | 0.03 | 5 | `MA='1'` |
| Interface perpendicular MTJ | `.temp/STT_model/iPMTJ` | 65 nm x 65 nm x 1.48 nm | CoFeB | 1210 | 0.69 | 0.006 | 5 | `MA='1'` |

## Model structure

Each variant has the same basic decomposition:

- `MTJ_write.sp` is the transient switching example and top-level simulation deck.
- `MTJ_model.inc` instantiates the MTJ resistance, LLG solver, and heat-diffusion blocks.
- `LLG_solver.inc` solves magnetization motion using `Mx`, `My`, and `Mz` as state nodes.
- `Resistor.inc` maps magnetization angle, polarization, and temperature into MTJ resistance.
- `HeatDF.inc` estimates self-heating from MTJ current and feeds temperature back into LLG and resistance.

The free-layer state is selected with `ini`. For the STT examples, antiparallel-to-parallel switching uses `ini='1'` with positive MTJ voltage, while parallel-to-antiparallel switching uses `ini='0'` with negative MTJ voltage.

## Important formulas

The STT switching examples rely on the LLG equation with [Slonczewski spin torque](https://en.wikipedia.org/wiki/Spin-transfer_torque):

$$
\frac{d\mathbf{m}}{dt}
=
-\gamma \mathbf{m}\times\mathbf{H}_{\mathrm{eff}}
-\alpha\gamma \mathbf{m}\times(\mathbf{m}\times\mathbf{H}_{\mathrm{eff}})
+\gamma H_{\mathrm{STT}}\mathbf{m}\times(\mathbf{m}\times\mathbf{p})
$$

where $\mathbf{p}$ is the pinned-layer direction. The pinned direction is selected from `MA`: in-plane uses `[0,1,0]`; perpendicular uses `[0,0,1]`.

The MTJ resistance follows:

$$
R_{\mathrm{MTJ}}(\theta)
=
\frac{1+\cos\theta}{2}(R_P - R_{AP}) + R_{AP}
$$

## UMN documentation included

The UMN STT page describes the model as self-contained and physics-based, intended for circuit designers simulating STT-MRAM read/write delay. It emphasizes user-defined length, width, thickness, and technology-node scalability for both in-plane and perpendicular MTJs.

## Sources

- J. Kim, A. Chen, B. Behin-Aein, S. Kumar, J.P. Wang, and C.H. Kim, "A Technology-Agnostic MTJ SPICE Model with User-Defined Dimensions for STT-MRAM Scalability Studies", CICC, September 2015.
- [UMN STT SPICE model documentation](http://mtj.umn.edu/STT.html)
- [UMN downloads page](http://mtj.umn.edu/Downloads.html)
- [STT_model.zip](http://mtj.umn.edu/STT_model.zip)
- [STT model paper, IEEE Xplore](https://ieeexplore.ieee.org/document/7338407/)

## Inline SPICE code

### STT_model\cPMTJ\HeatDF.inc

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

### STT_model\cPMTJ\LLG_solver.inc

```cir
************************************************************************************
************************************************************************************
** Title:  LLG_solver.inc
** Author: Jongyeon Kim, VLSI Research Lab @ UMN
** Email:  kimx2889@umn.edu
************************************************************************************
** At the given MTJ dimensions and material parameters, the dynamic motion is
** implemented by LLG equation according to the type of MTJ. 
************************************************************************************

.subckt LLG Mx My Mz Is Ias Tmp thi lx='65n' ly='130n' lz='1.8n' Ms0='1075' P0='0.715' alpha='0.01' MA='0.0' ini='0' Kp='1.2e7'

*** Physical parameters **************************
.param pi='355/113'
.param gamma='2.8e6*2*pi'
.param h='6.625e-27/(2*pi)'
.param e='1.602e-19'
.param kb='1.38e-16'


*** Temp. dependent parameters *******************
.param Tcurie='1420'
.param beta='0.4'
.param asp='2e-5'
E_Ms Ms 0 vol='Ms0*(1-v(Tmp)/Tcurie)^beta'
E_P  P  0 vol='P0*(1-asp*v(Tmp)^1.5)'


*** Magnetization of pinned layer ****************
.param Mpx='0.0'
.param Mpy='1-MA'
.param Mpz='MA'


*** Shape anisotropy - Demagnetizing factors *****
.param Nsh(a,b,c)='1/pi*((b^2-c^2)/(2*b*c)*log((sqrt(a^2+b^2+c^2)-a)/(sqrt(a^2+b^2+c^2)+a))+(a^2-c^2)/(2*a*c)*log((sqrt(a^2+b^2+c^2)-b)/(sqrt(a^2+b^2+c^2)+b))+b/(2*c)*log((sqrt(a^2+b^2)+a)/(sqrt(a^2+b^2)-a))+a/(2*c)*log((sqrt(a^2+b^2)+b)/(sqrt(a^2+b^2)-b))+c/(2*a)*log((sqrt(b^2+c^2)-b)/(sqrt(b^2+c^2)+b))+c/(2*b)*log((sqrt(a^2+c^2)-a)/(sqrt(a^2+c^2)+a))+2*atan((a*b)/(c*sqrt(a^2+b^2+c^2)))+(a^3+b^3-2*c^3)/(3*a*b*c)+(a^2+b^2-2*c^2)/(3*a*b*c)*sqrt(a^2+b^2+c^2)+c/(a*b)*(sqrt(a^2+c^2)+sqrt(b^2+c^2))-((b^2+a^2)^(3/2)+(b^2+c^2)^(3/2)+(a^2+c^2)^(3/2))/(3*a*b*c))'

.param Nx='4*pi*Nsh(lz,ly,lx)'
.param Ny='4*pi*Nsh(lz,lx,ly)'
.param Nz='4*pi*Nsh(ly,lx,lz)'


*** Initialization  - initial angle with thermal stability *******
.param Msi='Ms0*(1-Tmp0/Tcurie)^beta'
.param cPMA='(((Kp)-0.5*(Nz)*(Msi)*(Msi))*lx*ly*lz*1e6)/(kb*(Tmp0))'
E_thste thste 0 vol='cPMA'

.param thi='asin((1/(2*cPMA))^(1/2))'
E_thi thi 0 vol='asin((1/(2*cPMA))^(1/2))'

.param Mx0='0.0'
.param My0='sin(thi)'
.param Mz0='(1-2*ini)*cos(thi)'


.ic v(Mx)='Mx0'
.ic v(My)='My0'
.ic v(Mz)='Mz0'


*** Demagnetizating field for in-plane MTJ ********
E_Hdx Hdx 0 vol='-Nx*v(Mx)*v(Ms)'
E_Hdy Hdy 0 vol='-Ny*v(My)*v(Ms)'
E_Hdz Hdz 0 vol='-Nz*v(Mz)*v(Ms)'


*** Crystal ansisotropy field for perpendicular MTJ *******
E_Hiz Hiz 0 vol='2*Kp/v(Ms)*v(Mz)'


*** Effective anisotropy field ********************
E_Hefx Hefx 0 vol='v(Hdx)'
E_Hefy Hefy 0 vol='v(Hdy)'
E_Hefz Hefz 0 vol='v(Hdz)+MA*v(Hiz)'


*** Polarized spin current (J=Ias/lx/ly) **********
R_Is Is 0 'v(Ias)*v(P)*h/(2*e*lx*ly*lz*1e6*v(Ms))'


*** LLG solving for Mx, My, Mz ********************
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

.ends
```

### STT_model\cPMTJ\MTJ_model.inc

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

.subckt MTJ e1 e2 lx='65n' ly='130n' lz='1.8n' Ms0='1075' P0='0.715' alpha='0.01' Tmp0='300' RA0='5.4' MA='0.0' ini='1' Kp='1.2e7'

XRA   ex e2 Mx My Mz Tmp thi RA lx='lx' ly='ly' P0='P0' RA0='RA0' MA='MA' 
XLLG  Mx My Mz Is Ias Tmp thi LLG lx='lx' ly='ly' lz='lz' Ms0='Ms0' P0='P0' alpha='alpha' MA='MA' ini='ini' Kp='Kp'
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

### STT_model\cPMTJ\MTJ_write.sp

```cir
************************************************************************************
************************************************************************************
** Title:  MTJ_write.sp
** Author: Jongyeon Kim, VLSI Research Lab @ UMN
** Email:  kimx2889@umn.edu
************************************************************************************
** This run file simulates the dynamic motion of  MTJ.
** # Instruction for simulation
** 1. Set the MTJ dimensions and material parameters.
** 2. Select anisotropy(IMA/PMA) and initial state of free layer(P/AP).
** 3. Adjust bias voltage for Read/Write operation.
** ex. APtoP switching: positive voltage @ ini='1'
**     PtoAP switching: negative voltage @ ini='0'  
************************************************************************************
** # Description of parameters
** lx,ly,lz: width, length, and thickness of free layer
** tox: MgO thickness
** Ms0:saturation magnetizaion at 0K
** P0: polarization factor at 0K 
** alpha: damping factor
** temp: temperature
** MA: magnetic anisotropy (MA=0:In-plane,MA=1:Perpendicular)
**     also sets magnetization in pinned layer, MA=0:[0,1,0],MA=1:[0,0,1]
** ini: initial state of free layer (ini=0:Parallel,ini=1:Anti-parallel)
** Kp: Crystal perpendicular anisotropy constant
************************************************************************************

.include 'MTJ_model.inc'

*** Options ************************************************************************
.option post
.save

*** Voltage biasing to MTJ *********************************************************
.param vmtj='0.5'
V1 1 0 'vmtj'
XMTJ1 1 0 MTJ lx='45n' ly='45n' lz='0.45n' Ms0='1210' P0='0.62' alpha='0.03' Tmp0='358' RA0='5' MA='1' ini='1' Kp='1.08e7'

*** Analysis ***********************************************************************
.param pw='10ns' 
.tran 1p 'pw' START=1.0e-18  uic $sweep vmtj 0.3 0.6 0.1

.meas tsw0 when v(XMTJ1.XLLG.Mz)='0'
.meas iwr find i(XMTJ1.ve1) at 1ns
.meas thermal_stability find v(XMTJ1.XLLG.thste) at 1ns

.end
```

### STT_model\cPMTJ\Resistor.inc

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

.subckt RA n_plus n_minus Mx My Mz Tmp thi lx='65n' ly='130n' P0='0.715' RA0='5.4' MA='0.0'


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


*** TMR ******************************************
.param v0='0.48'
E_TMR0 TMR0 0 vol='2*P0^2*(1-asp*v(Tmp)^1.5)^2/(1-P0^2*(1-asp*v(Tmp)^1.5)^2)*100'
E_TMR TMR 0 vol='v(TMR0)/(1+((v(n_plus)-v(n_minus))/v0)^2)'
E_Rap Rap 0 vol='(v(TMR)/100+1)*Rp'


*** R(V,Tmp,th) **********************************
R_MTJ n_plus n_minus '(1+cos(v(th)))*(Rp-v(Rap))/2+v(Rap)'
E_rmtj rmtj 0 vol='(1+cos(v(th)))*(Rp-v(Rap))/2+v(Rap)'


.ends
```

### STT_model\IMTJ\HeatDF.inc

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

### STT_model\IMTJ\LLG_solver.inc

```cir
************************************************************************************
************************************************************************************
** Title:  LLG_solver.inc
** Author: Jongyeon Kim, VLSI Research Lab @ UMN
** Email:  kimx2889@umn.edu
************************************************************************************
** At the given MTJ dimensions and material parameters, the dynamic motion is
** implemented by LLG equation according to the type of MTJ. 
************************************************************************************

.subckt LLG Mx My Mz Is Ias Tmp thi lx='65n' ly='130n' lz='1.8n' Ms0='1075' P0='0.715' alpha='0.01' MA='0.0' ini='0'

*** Physical parameters **************************
.param pi='355/113'
.param gamma='2.8e6*2*pi'
.param h='6.625e-27/(2*pi)'
.param e='1.602e-19'
.param kb='1.38e-16'


*** Temp. dependent parameters *******************
.param Tcurie='1420'
.param beta='0.4'
.param asp='2e-5'
E_Ms Ms 0 vol='Ms0*(1-v(Tmp)/Tcurie)^beta'
E_P  P  0 vol='P0*(1-asp*v(Tmp)^1.5)'


*** Magnetization of pinned layer ****************
.param Mpx='0.0'
.param Mpy='1-MA'
.param Mpz='MA'


*** Shape anisotropy - Demagnetizing factors *****
.param Nsh(a,b,c)='1/pi*((b^2-c^2)/(2*b*c)*log((sqrt(a^2+b^2+c^2)-a)/(sqrt(a^2+b^2+c^2)+a))+(a^2-c^2)/(2*a*c)*log((sqrt(a^2+b^2+c^2)-b)/(sqrt(a^2+b^2+c^2)+b))+b/(2*c)*log((sqrt(a^2+b^2)+a)/(sqrt(a^2+b^2)-a))+a/(2*c)*log((sqrt(a^2+b^2)+b)/(sqrt(a^2+b^2)-b))+c/(2*a)*log((sqrt(b^2+c^2)-b)/(sqrt(b^2+c^2)+b))+c/(2*b)*log((sqrt(a^2+c^2)-a)/(sqrt(a^2+c^2)+a))+2*atan((a*b)/(c*sqrt(a^2+b^2+c^2)))+(a^3+b^3-2*c^3)/(3*a*b*c)+(a^2+b^2-2*c^2)/(3*a*b*c)*sqrt(a^2+b^2+c^2)+c/(a*b)*(sqrt(a^2+c^2)+sqrt(b^2+c^2))-((b^2+a^2)^(3/2)+(b^2+c^2)^(3/2)+(a^2+c^2)^(3/2))/(3*a*b*c))'


.param Nx='4*pi*Nsh(lz,ly,lx)'
.param Ny='4*pi*Nsh(lz,lx,ly)'
.param Nz='4*pi*Nsh(ly,lx,lz)'


*** Initialization - initial angle with thermal stability ******
.param Msi='Ms0*(1-Tmp0/Tcurie)^beta'
.param IMA='((Nx-Ny)*Msi*Msi*lx*ly*lz*1e6)/(2*kb*Tmp0)'
E_thste thste 0 vol='IMA'

.param thi='asin((1/(2*IMA))^(1/2))'
E_thi thi 0 vol='asin((1/(2*IMA))^(1/2))'


.param Mx0='sin(thi)'
.param My0='(1-2*ini)*cos(thi)'
.param Mz0='0.0'


.ic v(Mx)='Mx0'
.ic v(My)='My0'
.ic v(Mz)='Mz0'


*** Demagnetizating field for in-plane MTJ ********
E_Hdx Hdx 0 vol='-Nx*v(Mx)*v(Ms)'
E_Hdy Hdy 0 vol='-Ny*v(My)*v(Ms)'
E_Hdz Hdz 0 vol='-Nz*v(Mz)*v(Ms)'


*** Effective anisotropy field ********************
E_Hefx Hefx 0 vol='v(Hdx)'
E_Hefy Hefy 0 vol='v(Hdy)'
E_Hefz Hefz 0 vol='v(Hdz)'


*** Polarized spin current (J=Ias/lx/ly) **********
R_Is Is 0 'v(Ias)*v(P)*h/(2*e*lx*ly*lz*1e6*v(Ms))'


*** LLG solving for Mx, My, Mz ********************
C_Mx Mx 0 '(1+alpha*alpha)/gamma'
G_dMx_prec 0 Mx cur='-(v(My)*v(Hefz)-v(Hefy)*v(Mz))'
G_dMx_damp 0 Mx cur='-alpha*(v(My)*(v(Mx)*v(Hefy)-v(Hefx)*v(My))-(v(Mz)*v(Hefx)-v(Hefz)*v(Mx))*v(Mz))'
G_dMx_torq 0 Mx cur='v(Is)*(v(My)*(v(Mx)*Mpy-Mpx*v(My))-(v(Mz)*Mpx-Mpz*v(Mx))*v(Mz))'


C_My My 0 '(1+alpha*alpha)/gamma'
G_dMy_prec 0 My cur='-(v(Mz)*v(Hefx)-v(Hefz)*v(Mx))'
G_dMy_damp 0 My cur='-alpha*(v(Mz)*(v(My1)*v(Hefz)-v(Hefy)*v(Mz))-(v(Mx)*v(Hefy)-v(Hefx)*v(My1))*v(Mx))'
G_dMy_torq 0 My cur='v(Is)*(v(Mz)*(v(My1)*Mpz-Mpy*v(Mz))-(v(Mx)*Mpy-Mpx*v(My1))*v(Mx))'
E_My1 My1 0 vol='v(My)' max='cos(v(thi))' min='-cos(v(thi))'


C_Mz Mz 0 '(1+alpha*alpha)/gamma'
G_dMz_prec 0 Mz cur='-(v(Mx)*v(Hefy)-v(Hefx)*v(My))'
G_dMz_damp 0 Mz cur='-alpha*(v(Mx)*(v(Mz)*v(Hefx)-v(Hefz)*v(Mx))-(v(My)*v(Hefz)-v(Hefy)*v(Mz))*v(My))'
G_dMz_torq 0 Mz cur='v(Is)*(v(Mx)*(v(Mz)*Mpx-Mpz*v(Mx))-(v(My)*Mpz-Mpy*v(Mz))*v(My))'


.ends
```

### STT_model\IMTJ\MTJ_model.inc

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

.subckt MTJ e1 e2 lx='65n' ly='130n' lz='1.8n' Ms0='1075' P0='0.715' alpha='0.01' Tmp0='300' RA0='5.4' MA='0.0' ini='1'

XRA   ex e2 Mx My Mz Tmp thi RA lx='lx' ly='ly' P0='P0' RA0='RA0' MA='MA' 
XLLG  Mx My Mz Is Ias Tmp thi LLG lx='lx' ly='ly' lz='lz' Ms0='Ms0' P0='P0' alpha='alpha' MA='MA' ini='ini'
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

### STT_model\IMTJ\MTJ_write.sp

```cir
************************************************************************************
************************************************************************************
** Title:  MTJ_write.sp
** Author: Jongyeon Kim, VLSI Research Lab @ UMN
** Email:  kimx2889@umn.edu
************************************************************************************
** This run file simulates the dynamic motion of  MTJ.
** # Instruction for simulation
** 1. Set the MTJ dimensions and material parameters.
** 2. Select anisotropy(IMA/PMA) and initial state of free layer(P/AP).
** 3. Adjust bias voltage for Read/Write operation.
** ex. APtoP switching: positive voltage @ ini='1'
**     PtoAP switching: negative voltage @ ini='0'  
************************************************************************************
** # Description of parameters
** lx,ly,lz: width, length, and thickness of free layer
** tox: MgO thickness
** Ms0:saturation magnetizaion at 0K
** P0: polarization factor at 0K 
** alpha: damping factor
** temp: temperature
** MA: magnetic anisotropy (MA=0:In-plane,MA=1:Perpendicular)
**     also sets magnetization in pinned layer, MA=0:[0,1,0],MA=1:[0,0,1]
** ini: initial state of free layer (ini=0:Parallel,ini=1:Anti-parallel)
************************************************************************************

.include 'MTJ_model.inc'

*** Options ************************************************************************
.option post
.save

*** Voltage biasing to MTJ *********************************************************
.param vmtj='0.7'
V1 1 0 'vmtj'
XMTJ1 1 0 MTJ lx='32n' ly='96n' lz='2.44n' Ms0='1210' P0='0.69' alpha='0.0062' Tmp0='358' RA0='5' MA='0' ini='1'

*** Analysis ***********************************************************************
.param pw='30ns' 
.tran 1p 'pw' START=1.0e-18  uic $sweep vmtj 0.3 0.6 0.1

.meas tsw0 when v(XMTJ1.XLLG.My)='0'
.meas iwr find i(XMTJ1.ve1) at 1ns
.meas thermal_stability find v(XMTJ1.XLLG.thste) at 1ns

.end
```

### STT_model\IMTJ\Resistor.inc

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

.subckt RA n_plus n_minus Mx My Mz Tmp thi lx='65n' ly='130n' P0='0.715' RA0='5.4' MA='0.0'


*** Spherical coordinate ***
E_thip thip 0 vol='(1-MA)*acos((1-MA)*0.999*v(My)/((v(Mx)^2+v(My)^2)^(1/2)))'
E_thp thp 0 vol='MA*acos(MA*0.999*v(Mz)/((v(My)^2+v(Mz)^2)^(1/2)))'
E_th th 0 vol='v(thip)+v(thp)' max='355/113-v(thi)' min='v(thi)'
E_phi phi 0 vol='(1-MA)*atan(v(Mx)/v(Mz))+MA*atan(v(My)/v(Mx))'


*** Temp. dependent parameters *******************
.param asp='2e-5'

*** Rp *******************************************
.param RA='RA0*1e-12'   $ [ohm*m2]
.param Rp='RA/(lx*ly)'

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

### STT_model\iPMTJ\HeatDF.inc

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

### STT_model\iPMTJ\LLG_solver.inc

```cir
************************************************************************************
************************************************************************************
** Title:  LLG_solver.inc
** Author: Jongyeon Kim, VLSI Research Lab @ UMN
** Email:  kimx2889@umn.edu
************************************************************************************
** At the given MTJ dimensions and material parameters, the dynamic tr motion is
** implemented by LLG equation according to the type of MTJ. 
************************************************************************************

.subckt LLG Mx My Mz Is Ias Tmp thi lx='65n' ly='130n' lz='1.8n' Ms0='1075' P0='0.715' alpha='0.01' MA='0.0' ini='0' tc='1.5n'

*** Physical parameters **************************
.param pi='355/113'
.param gamma='2.8e6*2*pi'
.param h='6.625e-27/(2*pi)'
.param e='1.602e-19'
.param kb='1.38e-16'


*** Temp. dependent parameters *******************
.param Tcurie='1420'
.param beta='0.4'
.param asp='2e-5'
E_Ms Ms 0 vol='Ms0*(1-v(Tmp)/Tcurie)^beta'
E_P  P  0 vol='P0*(1-asp*v(Tmp)^1.5)'


*** Magnetization of pinned layer ****************
.param Mpx='0.0'
.param Mpy='1-MA'
.param Mpz='MA'


*** Shape anisotropy - Demagnetizing factors *****
.param Nsh(a,b,c)='1/pi*((b^2-c^2)/(2*b*c)*log((sqrt(a^2+b^2+c^2)-a)/(sqrt(a^2+b^2+c^2)+a))+(a^2-c^2)/(2*a*c)*log((sqrt(a^2+b^2+c^2)-b)/(sqrt(a^2+b^2+c^2)+b))+b/(2*c)*log((sqrt(a^2+b^2)+a)/(sqrt(a^2+b^2)-a))+a/(2*c)*log((sqrt(a^2+b^2)+b)/(sqrt(a^2+b^2)-b))+c/(2*a)*log((sqrt(b^2+c^2)-b)/(sqrt(b^2+c^2)+b))+c/(2*b)*log((sqrt(a^2+c^2)-a)/(sqrt(a^2+c^2)+a))+2*atan((a*b)/(c*sqrt(a^2+b^2+c^2)))+(a^3+b^3-2*c^3)/(3*a*b*c)+(a^2+b^2-2*c^2)/(3*a*b*c)*sqrt(a^2+b^2+c^2)+c/(a*b)*(sqrt(a^2+c^2)+sqrt(b^2+c^2))-((b^2+a^2)^(3/2)+(b^2+c^2)^(3/2)+(a^2+c^2)^(3/2))/(3*a*b*c))'

.param Nx='4*pi*Nsh(lz,ly,lx)'
.param Ny='4*pi*Nsh(lz,lx,ly)'
.param Nz='4*pi*Nsh(ly,lx,lz)'


*** Initialization ********************************
.param Msi='Ms0*(1-Tmp0/Tcurie)^beta'
.param iPMA='(2*pi*((tc/lz)-(Nz/(4*pi)))*Msi*Msi*lx*ly*lz*1e6)/(kb*Tmp0)'
E_thste thste 0 vol='iPMA'

.param thi='asin((1/(2*iPMA))^(1/2))'
E_thi thi 0 vol='asin((1/(2*iPMA))^(1/2))'

.param Mx0='0.0'
.param My0='sin(thi)'
.param Mz0='(1-2*ini)*cos(thi)'

.ic v(Mx)='Mx0'
.ic v(My)='My0'
.ic v(Mz)='Mz0'


*** Demagnetizating field for in-plane MTJ ********
E_Hdx Hdx 0 vol='-Nx*v(Mx)*v(Ms)'
E_Hdy Hdy 0 vol='-Ny*v(My)*v(Ms)'
E_Hdz Hdz 0 vol='-Nz*v(Mz)*v(Ms)'


*** Interfacial anisotropy field for perpendicular MTJ ****
E_Ki Ki 0 vol='2*pi*v(Ms)*v(Ms)*tc'
E_Hiz Hiz 0 vol='2*v(Ki)/(v(Ms)*lz)*v(Mz)'


*** Effective anisotropy field ********************
E_Hefx Hefx 0 vol='v(Hdx)'
E_Hefy Hefy 0 vol='v(Hdy)'
E_Hefz Hefz 0 vol='v(Hdz)+MA*v(Hiz)'


*** Polarized spin current (J=Ias/lx/ly) **********
R_Is Is 0 'v(Ias)*v(P)*h/(2*e*lx*ly*lz*1e6*v(Ms))'

*** LLG solving for Mx, My, Mz ********************
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

.ends
```

### STT_model\iPMTJ\MTJ_model.inc

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

.subckt MTJ e1 e2 lx='65n' ly='130n' lz='1.8n' Ms0='1075' P0='0.715' alpha='0.01' Tmp0='300' RA0='5.4' MA='0.0' ini='1' tc='1.5n'

XRA   ex e2 Mx My Mz Tmp thi RA lx='lx' ly='ly' P0='P0' RA0='RA0' MA='MA' 
XLLG  Mx My Mz Is Ias Tmp thi LLG lx='lx' ly='ly' lz='lz' Ms0='Ms0' P0='P0' alpha='alpha' MA='MA' ini='ini' tc='tc'
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

### STT_model\iPMTJ\MTJ_write.sp

```cir
************************************************************************************
************************************************************************************
** Title:  MTJ_write.sp
** Author: Jongyeon Kim, VLSI Research Lab @ UMN
** Email:  kimx2889@umn.edu
************************************************************************************
** This run file simulates the dynamic motion of  MTJ.
** # Instruction for simulation
** 1. Set the MTJ dimensions and material parameters.
** 2. Select anisotropy(IMA/PMA) and initial state of free layer(P/AP).
** 3. Adjust bias voltage for Read/Write operation.
** ex. APtoP switching: positive voltage @ ini='1'
**     PtoAP switching: negative voltage @ ini='0'  
************************************************************************************
** # Description of parameters
** lx,ly,lz: width, length, and thickness of free layer
** tox: MgO thickness
** Ms0:saturation magnetizaion at 0K
** P0: polarization factor at 0K 
** alpha: damping factor
** temp: temperature
** MA: magnetic anisotropy (MA=0:In-plane,MA=1:Perpendicular)
**     also sets magnetization in pinned layer, MA=0:[0,1,0],MA=1:[0,0,1]
** ini: initial state of free layer (ini=0:Parallel,ini=1:Anti-parallel)
** tc: critical thickness that needs to be smaller than lz, 
**     single interface: tc=1.5nm, Double interface: tc=3nm
************************************************************************************

.include 'MTJ_model.inc'

*** Options ************************************************************************
.option post
.save

*** Voltage biasing to MTJ *********************************************************
.param vmtj='0.6'
V1 1 0 'vmtj'
XMTJ1 1 0 MTJ lx='65n' ly='65n' lz='1.48n' Ms0='1210' P0='0.69' alpha='0.006' Tmp0='358' RA0='5' MA='1' ini='1' tc='1.5n'

*** Analysis ***********************************************************************
.param pw='10ns' 
.tran 1p 'pw' START=1.0e-18  uic $ sweep vmtj 0.4 0.5 0.01

.meas tsw0 when v(XMTJ1.XLLG.Mz)='0'
.meas iwr find i(XMTJ1.ve1) at 1ns
.meas thermal_stability find v(XMTJ1.XLLG.thste) at 1ns

.end
```

### STT_model\iPMTJ\Resistor.inc

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

.subckt RA n_plus n_minus Mx My Mz Tmp thi lx='65n' ly='130n' P0='0.715' RA0='5.4' MA='0.0'


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
