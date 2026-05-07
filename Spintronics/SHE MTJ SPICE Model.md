# SHE MTJ SPICE Model

The UMN spin Hall effect model extends the STT framework with a spin Hall metal (SHM). The model includes both MTJ and SHM dimensions and material parameters, plus user-controlled initial angle and thermal fluctuation.

## Supported operation modes

The UMN documentation lists four operating modes:

- STT only.
- SHE only with external magnetic field.
- SHE-assisted STT.
- SHE-assisted STT with external magnetic field.

The downloaded examples include `MTJ_write.sp` for SHE-assisted STT and `MTJ_write_SHE_ONLY.sp` for SHE-only switching.

## Default device parameters

| Device | Default dimensions | Material | `Ms0` | `P0` | `alpha` | `RA0` | `SHA` |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
| Crystalline perpendicular MTJ | 45 nm x 45 nm x 0.7 nm | FePdX | 1145 | 0.73 | 0.02 | 5 | - |
| Spin Hall metal | 60 nm x 45 nm x 5 nm | beta-W | - | - | - | - | 0.4 |

## Model structure

- `MTJ_write.sp` applies both STT current and SHM current.
- `MTJ_write_SHE_ONLY.sp` drives switching through the SHM path only.
- `MTJ_model.inc` has electrical terminals for the MTJ and SHM path and feeds both MTJ and SHM current into `LLG_solver.inc`.
- `LLG_solver.inc` adds SHE torque terms, thermal fluctuation controls, user-defined initial angle controls, and external field input.
- `NoiseGen_MATLAB.m` generates thermal fluctuation PWL files for alternate noise parameters.
- `pwlFile_92.in` is the downloaded thermal fluctuation input used by the model.

## Important formulas

The SHE model adds a torque term driven by spin Hall conversion:

$$
\mathbf{\tau}_{\mathrm{SHE}}
=
\gamma H_{\mathrm{SHE}}\mathbf{m}\times(\mathbf{m}\times\boldsymbol{\sigma})
+x_{\mathrm{ad}}\gamma H_{\mathrm{SHE}}\mathbf{m}\times\boldsymbol{\sigma}
$$

where `x_ad` is the field-like torque fraction relative to the damping-like term.

A compact relationship for the effective SHE field is:

$$
H_{\mathrm{SHE}}
\propto
\frac{\hbar\theta_{\mathrm{SH}} I_{\mathrm{SHM}}}{2eM_s V_F}
$$

where $\theta_{\mathrm{SH}}$ is `SHA`, $I_{\mathrm{SHM}}$ is SHM current, and $V_F = l_xl_yl_z$ is the free-layer volume.

## UMN documentation included

The UMN SHE page states that the model is self-contained and physics-based for both the MTJ and spin Hall metal. It exposes MTJ/SHM dimensions and magnetic parameters, and includes user-defined initial angle and thermal fluctuation. The page describes the four modes listed above and notes that field-like torque can be added by changing `x_ad`.

Publication listed by UMN: I. Ahmed, Z. Zhao, M. Mankalale, S. Sapatnekar, J.P. Wang, and C.H. Kim, "A Comparative Study between Spin-Transfer-Torque (STT) and Spin-Hall-Effect (SHE) Switching Mechanisms using SPICE", IEEE JxCDC, October 2017.

## Sources

- [UMN SHE SPICE model documentation](http://mtj.umn.edu/SHE.html)
- [UMN downloads page](http://mtj.umn.edu/Downloads.html)
- [SHE_model.zip](http://mtj.umn.edu/SHE_model.zip)
- [SHE model paper, IEEE Xplore](https://ieeexplore.ieee.org/document/8067488/)
- [Spin Hall effect overview](https://en.wikipedia.org/wiki/Spin_Hall_effect)

## Inline SPICE code and helper files

### .temp\SHE_model\SHE_model\HeatDF.inc

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

### .temp\SHE_model\SHE_model\LLG_solver.inc

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

.subckt LLG Mx My Mz Is Istt Ias Tmp thi lx='65n' ly='65n' lz='1.8n'  lxshm ='70n' lyshm= '40n' lzshm= '2.2n' Ms0='1075' P0='0.715' alpha='0.01' MA='1' ini='0' Kp='1.2e7' SHA='0.4' H_app = '400'  UI = '0' InA = ' 0.01'  x_ad = '0'

.include pwlFile_92.in
.param thermal = '1'

*** Physical parameters **************************
.param pi='355/113'
.param gamma='2.8e6*2*pi'
.param h='6.625e-27/(2*pi)'
.param e='1.602e-19'
.param kb='1.38e-16'
.param lambda_sf = '3.5e-9'


*** Temp. dependent parameters *******************
.param Tcurie='1420'
.param beta='0.4'
.param asp='2e-5'
E_Ms Ms 0 vol='Ms0*(1-v(Tmp)/Tcurie)^beta'
E_P  P  0 vol='P0*(1-asp*v(Tmp)^1.5)'
*E_Ms Ms 0 vol='Ms0'
*E_P  P  0 vol='P0'

*** Magnetization of pinned layer ****************
.param Mpx='0.0'
.param Mpy='1-MA'
.param Mpz='MA'

.param Mpxshm='0.0'
.param Mpyshm='1.0'
.param Mpzshm='0.0'

*** Shape anisotropy - Demagnetizing factors *****
.param Nsh(a,b,c)='1/pi*((b^2-c^2)/(2*b*c)*log((sqrt(a^2+b^2+c^2)-a)/(sqrt(a^2+b^2+c^2)+a))+(a^2-c^2)/(2*a*c)*log((sqrt(a^2+b^2+c^2)-b)/(sqrt(a^2+b^2+c^2)+b))+b/(2*c)*log((sqrt(a^2+b^2)+a)/(sqrt(a^2+b^2)-a))+a/(2*c)*log((sqrt(a^2+b^2)+b)/(sqrt(a^2+b^2)-b))+c/(2*a)*log((sqrt(b^2+c^2)-b)/(sqrt(b^2+c^2)+b))+c/(2*b)*log((sqrt(a^2+c^2)-a)/(sqrt(a^2+c^2)+a))+2*atan((a*b)/(c*sqrt(a^2+b^2+c^2)))+(a^3+b^3-2*c^3)/(3*a*b*c)+(a^2+b^2-2*c^2)/(3*a*b*c)*sqrt(a^2+b^2+c^2)+c/(a*b)*(sqrt(a^2+c^2)+sqrt(b^2+c^2))-((b^2+a^2)^(3/2)+(b^2+c^2)^(3/2)+(a^2+c^2)^(3/2))/(3*a*b*c))'

.param Nx='4*pi*Nsh(lz,ly,lx)'
.param Ny='4*pi*Nsh(lz,lx,ly)'
.param Nz='4*pi*Nsh(ly,lx,lz)'


****Test****
E_NX_1 NX_1 0 vol = 'Nx'
E_NX_2 NX_2 0 vol = 'Ny'
E_NX_3 NX_3 0 vol = 'Nz'
*** Initialization ********************************
.param Msi='Ms0*(1-Tmp0/Tcurie)^beta'
*.param Msi='Ms0'
.param cPMA='(((Kp)-0.5*(Nz)*(Msi)*(Msi))*lx*ly*lz*1e6)/(kb*(Tmp0))'

.param thi='asin((1/(2*cPMA))^(1/2))*(1-UI) + UI*InA'
E_thi thi 0 vol='asin((1/(2*cPMA))^(1/2))*(1-UI) + UI*InA'
*.print delta=par('cPMA')
E_tsf delta_1_tsf 0 vol = 'cPMA'

.param Mx0='0.0'
.param My0='sin(thi)'
.param Mz0='(1-2*ini)*cos(thi)'


.ic v(Mx)='Mx0'
.ic v(My)='My0'
.ic v(Mz)='Mz0'


*** Thermal fluctuation field *********************

*** Demagnetizating field for in-plane MTJ ********
E_Hdx Hdx 0 vol='-Nx*v(Mx)*v(Ms)'
E_Hdy Hdy 0 vol='-Ny*v(My)*v(Ms)'
E_Hdz Hdz 0 vol='-Nz*v(Mz)*v(Ms)'

E_Hiz Hiz 0 vol='2*Kp/v(Ms)*v(Mz)'

*** applied field *****

E_Happlyx Happliedx 0 vol = 'H_app'
E_Happlyy Happliedy 0 vol = '00'
E_Happlyz Happliedz 0 vol = '0.0'

*** Effective anisotropy field ********************
E_Hefx Hefx 0 vol='v(Hdx)+v(Happliedx)+1*thermal*v(Hthx)' 
E_Hefy Hefy 0 vol='v(Hdy)+v(Happliedy)+1*thermal*v(Hthy)' 
E_Hefz Hefz 0 vol='v(Hdz)+v(Happliedz)+MA*v(Hiz)+thermal*v(Hthz)'

*** Field magnitude from SHE  **********

R_Is Is 0 '1*h/(2*e*lyshm*lzshm*lz*1e6*v(Ms))*1*SHA *(1-(1/cosh(lzshm/lambda_sf)))'


*E_IS_test Is_test 0 vol ='1*SHA*h/(2*e*lx*ly*lz*1e6*v(Ms))*(1-(1/cosh(lzshm/lambda_sf)) )'

E_sha_inst sha_inst 0 vol = 'SHA*(1-(1/cosh(lzshm/lambda_sf) ) )'
E_pshe pshe 0 vol = 'V(sha_inst)*(lx*ly/lyshm/lzshm)'
E_xad xad 0 vol ='x_ad'



*** Polarized spin current (J=Ias/lx/ly) **********
R_Is2 Istt 0 '4*V(Ias)*v(P)*h/(2*e*pi*lx*ly*lz*1e6*v(Ms))'
E_IS_test2 Is2_test 0 vol ='V(Ias)*v(P)*4*h/(2*e*pi*lx*ly*lz*1e6*v(Ms))'

*** LLG solving for Mx, My, Mz ********************

C_Mx Mx 0 '(1+alpha*alpha)/gamma'
G_dMx_prec 0 Mx cur='(-(v(My)*v(Hefz)-v(Hefy)*v(Mz)))'
G_dMx_damp 0 Mx cur='-alpha*(v(My)*(v(Mx)*v(Hefy)-v(Hefx)*v(My))-(v(Mz)*v(Hefx)-v(Hefz)*v(Mx))*v(Mz))'
G_dMx_torq 0 Mx cur='v(Istt)*(v(My)*(v(Mx)*Mpy-Mpx*v(My))-(v(Mz)*Mpx-Mpz*v(Mx))*v(Mz))'
G_dMx_torq2 0 Mx cur='v(Is)*(v(My)*(v(Mx)*Mpyshm-Mpxshm*v(My))-(v(Mz)*Mpxshm-Mpzshm*v(Mx))*v(Mz))'
*G_dMx_antidamp 0 Mx cur = 'v(Is)*x_ad*(v(My)*(v(Mx)*v(Hefy)-v(Hefx)*v(My))-(v(Mz)*v(Hefx)-v(Hefz)*v(Mx))*v(Mz))''
*G_dMx_antidamp 0 Mx cur = 'v(Is)*x_ad*(v(My)*(v(Mx)*Mpyshm-Mpxshm*v(My))-(v(Mz)*Mpxshm-Mpzshm*v(Mx))*v(Mz))''

*G_dMx_antidamp1 0 Mx cur = 'v(Istt)*x_ad*(v(My)*(v(Mx)*Mpy-Mpx*v(My))-(v(Mz)*Mpx-Mpz*v(Mx))*v(Mz))''

G_dMx_antidamp 0 Mx cur='(v(Is)*x_ad*(v(My)*Mpzshm-Mpyshm*v(Mz)))'
G_dMx_antidamp1 0 Mx cur='(v(Istt)*x_ad*(v(My)*Mpz-Mpy*v(Mz)))'



C_My My 0 '(1+alpha*alpha)/gamma'
G_dMy_prec 0 My cur='(-(v(Mz)*v(Hefx)-v(Hefz)*v(Mx)))'
G_dMy_damp 0 My cur='-alpha*(v(Mz)*(v(My)*v(Hefz)-v(Hefy)*v(Mz))-(v(Mx)*v(Hefy)-v(Hefx)*v(My))*v(Mx))'
G_dMy_torq 0 My cur='v(Istt)*(v(Mz)*(v(My)*Mpz-Mpy*v(Mz))-(v(Mx)*Mpy-Mpx*v(My))*v(Mx))'
G_dMy_torq2 0 My cur='v(Is)*(v(Mz)*(v(My)*Mpzshm-Mpyshm*v(Mz))-(v(Mx)*Mpyshm-Mpxshm*v(My))*v(Mx))'
*G_dMy_antidamp 0 My cur='v(Is)*x_ad*(v(Mz)*(v(My)*v(Hefz)-v(Hefy)*v(Mz))-(v(Mx)*v(Hefy)-v(Hefx)*v(My))*v(Mx))'
*G_dMy_antidamp 0 My cur='v(Is)*x_ad*(v(Mz)*(v(My)*Mpzshm-Mpyshm*v(Mz))-(v(Mx)*Mpyshm-Mpxshm*v(My))*v(Mx))'
*G_dMy_antidamp1 0 My cur='v(Istt)*x_ad*(v(Mz)*(v(My)*Mpz-Mpy*v(Mz))-(v(Mx)*Mpy-Mpx*v(My))*v(Mx))'
G_dMy_antidamp 0 My cur='(v(Is)*x_ad*(v(Mz)*Mpxshm-Mpzshm*v(Mx)))'
G_dMy_antidamp1 0 My cur='(v(Istt)*x_ad*(v(Mz)*Mpx-Mpz*v(Mx)))'


C_Mz Mz 0 '(1+alpha*alpha)/gamma'
G_dMz_prec 0 Mz cur='-(v(Mx)*v(Hefy)-v(Hefx)*v(My))'
G_dMz_damp 0 Mz cur='-alpha*(v(Mx)*(v(Mz1)*v(Hefx)-v(Hefz)*v(Mx))-(v(My)*v(Hefz)-v(Hefy)*v(Mz1))*v(My))'
G_dMz_torq 0 Mz cur='v(Istt)*(v(Mx)*(v(Mz1)*Mpx-Mpz*v(Mx))-(v(My)*Mpz-Mpy*v(Mz1))*v(My))'
G_dMz_torq2 0 Mz cur='v(Is)*(v(Mx)*(v(Mz1)*Mpxshm-Mpzshm*v(Mx))-(v(My)*Mpzshm-Mpyshm*v(Mz1))*v(My))'
E_Mz1 Mz1 0 vol='v(Mz)' max='cos(v(thi))' min='-cos(v(thi))'
*G_dMz_antidamp 0 Mz cur='v(Is)*x_ad*(v(Mx)*(v(Mz1)*v(Hefx)-v(Hefz)*v(Mx))-(v(My)*v(Hefz)-v(Hefy)*v(Mz1))*v(My))'
*G_dMz_antidamp 0 Mz cur='v(Is)*x_ad*(v(Mx)*(v(Mz1)*Mpxshm-Mpzshm*v(Mx))-(v(My)*Mpzshm-Mpyshm*v(Mz1))*v(My))'
*G_dMz_antidamp1 0 Mz cur='v(Istt)*x_ad*(v(Mx)*(v(Mz1)*Mpx-Mpz*v(Mx))-(v(My)*Mpz-Mpy*v(Mz1))*v(My))'
G_dMz_antidamp 0 Mz cur='v(Is)*x_ad*(v(Mx)*Mpyshm-Mpxshm*v(My))'
G_dMz_antidamp1 0 Mz cur='v(Istt)*x_ad*(v(Mx)*Mpy-Mpx*v(My))'
.ends
```

### .temp\SHE_model\SHE_model\MTJ_model.inc

```cir
********************************************************************************************************
********************************************************************************************************
** Title:  MTJ_model.inc
** Author: Jongyeon Kim, VLSI Research Lab @ UMN
** Email:  kimx2889@umn.edu
**Modified by: Ibrahim Ahmed, ahmed589@umn.edu 

** Update: Aug 22, 2016
********************************************************************************************************
** This library includes LLG_solver.inc, Resistance.inc, Thermal_fluctuation.inc, and Heat_diffusion.inc.
** At the given voltage across the MTJ, dynamic current and resistance are generated.
********************************************************************************************************
.include 'LLG_solver.inc'
.include 'Resistor.inc'
.include 'HeatDF.inc'


.subckt MTJ e1 e2 e3  lx='65n' ly='65n' lz='1.48n' tox='1n' Ms0='1075' P0='0.715' alpha='0.01' Tmp0='300' RA0='5.4' MA='1' ini='1' Kp='1e7' lxshm ='60n' lyshm= '40n' lzshm= '2.2n' Kp='1e7' SHA='0.4' H_app = '1200' UI = '0' InA = ' 0.01' x_ad = '0'

XRA   ex2 e2 Mx My Mz Tmp thi RA lx='lx' ly='ly' tox='tox' P0='P0' RA0='RA0' MA='MA' 
XLLG  Mx My Mz Is Istt Ias Tmp thi LLG lx='lx' ly='ly' lz='lz' Ms0='Ms0' P0='P0' alpha='alpha' MA='MA' ini='ini' lxshm ='lxshm' lyshm= 'lyshm' lzshm= 'lzshm' Kp='Kp' SHA='SHA' H_app = 'H_app' UI = 'UI' InA = ' InA'  x_ad = 'x_ad'
XHD   Ihd Tmp HD lx='lx' ly='ly' lz='lz' Tmp0='Tmp0'

*** Internal top electrode of SHM ***************
Ve1 e3 ex 0
R_shm ex e2 '2000*lxshm/(lyshm*lzshm)*1n'

*** Ishm is fed to LLG and Head_Diffusion models *********

G_shm1 0 Is cur='-I(Ve1)'


*** Internal top electrode of MTJ ***************
Ve2 e1 ex2 0


*** Charge current passing through MTJ stack *************
*** Asymetry of write current ************************
*** positive bias:Ias=Iatp, negative bias:Ias=Ipta ***
*** Iatp will generate more spin current. ************ 
.param Iatp='1'
.param Ipta='1/1.47'
E_Ias Ias 0 vol='(1+(v(e1)-v(e2))/abs(v(e1)-v(e2)))*(Iatp-Ipta)/2+Ipta'


*** Charge current passing through MTJ stack *************
*** Imtj is fed to LLG and Head_Diffusion models *********
G_Imtj1 0 Istt cur='-I(Ve2)'
G_Imtj2 0 Ihd cur='-I(Ve2)*1'

.ends
```

### .temp\SHE_model\SHE_model\MTJ_write_SHE_ONLY.sp

```cir
************************************************************************************
************************************************************************************
** Title:  MTJ_write.sp
** Author: Ibrahim Ahmed, VLSI Research Lab @ UMN
** Email:  ahmed589@umn.edu
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
**  This model can be used for 4 different switching mechanism: 1) STT Only, 2) SHE Only + Ext. field, 3) STT + SHE, 4) STT + SHE + Ext. field
** External field is defined in 'H_app' in Oe
** UI = 1 for user defined initial angle, 'InA', UI = 0 for avg. initial angle
** 'x_ad' is the additional field like torque. It  is defined as a fraction of damping like torque. 
** So, x_ad = 0.5 means the field like torque has a magnitude half of the damping like torque


** The following code is the switching mechanism type 2)SHE only switching with external field
************************************************************************************

.include 'MTJ_model.inc'

*** Options ************************************************************************
.option post
.save

*** Voltage biasing to MTJ *********************************************************
.param RAp=5
.param t = 5e-9

.param istt = '00u' 
.param ISHM = '400u' 
.param tshm  = '800p'

.param damping = 0.02

I1 1 0 PULSE (0 ISTT  1.5n 100p 100p 50n 80n)   
I2 3 0 PULSE (0 ISHM 1.5n 100p 100p tshm 80n)  

V_2 2 0 0

XMTJ1 1 2 3 MTJ lx='45n' ly='45n' lz='0.7n' tox='1n' Ms0='1185'  P0='0.73' alpha='0.02' Tmp0='300' RA0='RAp' MA='1' ini='0' Kp='9e6'  lxshm ='60n' lyshm= '45n' lzshm= 't' SHA='0.4' H_app = ' 400 ' UI = '1' InA = ' 0.02436'  x_ad ='0'

.param pw='30ns' 
.tran 2p 'pw' START=2.5e-18 uic 

.end
```

### .temp\SHE_model\SHE_model\MTJ_write.sp

```cir
************************************************************************************
************************************************************************************
** Title:  MTJ_write.sp
** Author: Ibrahim Ahmed, VLSI Research Lab @ UMN
** Email:  ahmed589@umn.edu
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
**  This model can be used for 4 different switching mechanism: 1) STT Only, 2) SHE Only + Ext. field, 3) STT + SHE, 4) STT + SHE + Ext. field
** External field is defined in 'H_app' in Oe
** UI = 1 for user defined initial angle, 'InA', UI = 0 for avg. initial angle
** 'x_ad' is the additional field like torque. It  is defined as a fraction of damping like torque. 
** So, x_ad = 0.5 means the field like torque has a magnitude half of the damping like torque


** The following code is the switching mechanism type 4) where the SHE initially helps creating a larger initial angle
************************************************************************************

.include 'MTJ_model.inc'

*** Options ************************************************************************
.option post
.save

*** Voltage biasing to MTJ *********************************************************
.param RAp=5
.param t = 5e-9

.param istt = '100u' 
.param ISHM = '250u' 
.param tshm  = '500p'

.param damping = 0.02

I1 1 0 PULSE (0 ISTT  1.5n 50p 50p 50n 80n)   
I2 3 0 PULSE (0 ISHM 1.5n 50p 50p 400p 80n)  

V_2 2 0 0

XMTJ1 1 2 3 MTJ lx='45n' ly='45n' lz='0.7n' tox='1n' Ms0='1185'  P0='0.73' alpha='0.02' Tmp0='300' RA0='RAp' MA='1' ini='0' Kp='9e6'  lxshm ='60n' lyshm= '45n' lzshm= 't' SHA='0.4' H_app = ' 000 ' UI = '1' InA = ' 0.02 '  x_ad ='0'

.param pw='30ns' 
.tran 2p 'pw' START=2.5e-18 uic 

.end
```

### .temp\SHE_model\SHE_model\NoiseGen_MATLAB.m

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

### .temp\SHE_model\SHE_model\pwlFile_92.in

```text

Vth_x Hthx 0 PWL (0.000000n, 66.43242 0.100000n, -197.66720 0.200000n, -50.68738 0.300000n, 111.62585 0.400000n, 31.20509 0.500000n, -188.10066 0.600000n, 81.66081 0.700000n, 8.21898 0.800000n, 96.83723 0.900000n, -160.67569 1.000000n, 83.33317 1.100000n, -39.27757 1.200000n, 40.76066 1.300000n, -183.65423 1.400000n, 48.77099 1.500000n, -219.58707 1.600000n, 29.30325 1.700000n, 0.52102 1.800000n, 5.85928 1.900000n, 79.21466 2.000000n, -36.99362 2.100000n, -37.72317 2.200000n, 17.94188 2.300000n, 128.25998 2.400000n, -43.03327 2.500000n, -65.55001 2.600000n, -132.91891 2.700000n, 146.97756 2.800000n, 65.94016 2.900000n, 38.54507 3.000000n, 132.46232 3.100000n, 20.87550 3.200000n, -63.01557 3.300000n, -34.22017 3.400000n, 61.40912 3.500000n, 180.68292 3.600000n, 65.07151 3.700000n, -24.03308 3.800000n, -0.59334 3.900000n, 38.95317 4.000000n, -26.70610 4.100000n, -142.30309 4.200000n, -68.36635 4.300000n, -64.49893 4.400000n, -99.14472 4.500000n, -48.43772 4.600000n, 5.23238 4.700000n, -89.28080 4.800000n, -27.47887 4.900000n, 80.34402 5.000000n, 46.11632 5.100000n, 41.08346 5.200000n, -14.33041 5.300000n, 46.04508 5.400000n, -65.10148 5.500000n, -11.58650 5.600000n, -209.66551 5.700000n, 29.25128 5.800000n, -184.54492 5.900000n, -69.31102 6.000000n, 120.48425 6.100000n, 153.76694 6.200000n, 143.80451 6.300000n, -100.35658 6.400000n, -70.23995 6.500000n, -12.69772 6.600000n, 3.87042 6.700000n, -8.96904 6.800000n, 71.43706 6.900000n, 1.04708 7.000000n, 95.37301 7.100000n, 34.51903 7.200000n, 24.95061 7.300000n, -43.39391 7.400000n, 41.93964 7.500000n, 82.31767 7.600000n, 125.16313 7.700000n, 52.56178 7.800000n, -143.35422 7.900000n, 170.23517 8.000000n, -51.12535 8.100000n, 64.86368 8.200000n, -261.33623 8.300000n, 226.63961 8.400000n, -107.30323 8.500000n, -64.74708 8.600000n, -31.06565 8.700000n, 28.15899 8.800000n, -97.43380 8.900000n, 91.10807 9.000000n, -186.40705 9.100000n, -2.56085 9.200000n, 9.72752 9.300000n, -28.39354 9.400000n, -167.40347 9.500000n, 30.04131 9.600000n, -87.91057 9.700000n, 60.38412 9.800000n, -21.83792 9.900000n, 74.87949 10.000000n, 65.91104 10.100000n, 23.89302 10.200000n, 22.39523 10.300000n, -22.50938 10.400000n, 64.23270 10.500000n, -82.70818 10.600000n, -13.18944 10.700000n, -10.73633 10.800000n, -39.33917 10.900000n, -37.87674 11.000000n, -51.16351 11.100000n, 49.59109 11.200000n, 134.00354 11.300000n, 102.03464 11.400000n, -120.80454 11.500000n, 12.10452 11.600000n, 36.26596 11.700000n, -79.17889 11.800000n, -14.63250 11.900000n, 62.29215 12.000000n, -89.06726 12.100000n, -2.90249 12.200000n, 84.44663 12.300000n, -9.08450 12.400000n, 97.49158 12.500000n, 42.71193 12.600000n, -61.93637 12.700000n, 135.80443 12.800000n, 17.45210 12.900000n, -127.27278 13.000000n, -72.20905 13.100000n, -93.51587 13.200000n, -213.14271 13.300000n, -10.24692 13.400000n, 20.60472 13.500000n, 45.39800 13.600000n, 43.05519 13.700000n, 41.52061 13.800000n, -70.67302 13.900000n, -101.76040 14.000000n, 30.23138 14.100000n, -60.16215 14.200000n, 11.42973 14.300000n, -53.28440 14.400000n, -21.86019 14.500000n, 97.98966 14.600000n, -56.14185 14.700000n, -233.29002 14.800000n, -35.67340 14.900000n, 16.51568 15.000000n, 102.69587 15.100000n, -29.80006 15.200000n, -1.23026 15.300000n, 48.18068 15.400000n, 56.73868 15.500000n, 100.70691 15.600000n, -81.38741 15.700000n, 50.50724 15.800000n, -53.39323 15.900000n, 9.64154 16.000000n, 119.94231 16.100000n, -46.49417 16.200000n, 141.06310 16.300000n, -3.83102 16.400000n, -53.11979 16.500000n, 63.01857 16.600000n, -92.21445 16.700000n, -41.80094 16.800000n, -31.83909 16.900000n, -80.29266 17.000000n, 58.06961 17.100000n, 89.79334 17.200000n, -60.57366 17.300000n, 72.05166 17.400000n, -94.39223 17.500000n, 51.14419 17.600000n, -78.85187 17.700000n, -79.33094 17.800000n, 95.84907 17.900000n, -37.54263 18.000000n, -107.86319 18.100000n, 4.37064 18.200000n, -91.70552 18.300000n, -169.63085 18.400000n, -29.74377 18.500000n, -160.14271 18.600000n, -14.61301 18.700000n, -220.36157 18.800000n, -70.71868 18.900000n, -32.45241 19.000000n, -31.17757 19.100000n, 7.54063 19.200000n, -110.93733 19.300000n, 12.95864 19.400000n, 15.96685 19.500000n, -65.24428 19.600000n, 329.40699 19.700000n, 109.12286 19.800000n, 85.11181 19.900000n, 1.27960 20.000000n, -171.44816 20.100000n, -78.98475 20.200000n, -55.29223 20.300000n, 23.23883 20.400000n, -74.32161 20.500000n, 20.28633 20.600000n, 74.23862 20.700000n, -29.54687 20.800000n, -117.09708 20.900000n, 13.84460 21.000000n, 34.53065 21.100000n, -130.67060 21.200000n, 110.59971 21.300000n, -3.76251 21.400000n, -64.11603 21.500000n, -42.25561 21.600000n, 84.61817 21.700000n, 0.04636 21.800000n, -11.71920 21.900000n, -61.33466 22.000000n, 27.87129 22.100000n, -95.08158 22.200000n, 18.74293 22.300000n, 313.61015 22.400000n, -6.67126 22.500000n, -57.27290 22.600000n, 74.02340 22.700000n, -66.86628 22.800000n, -57.17215 22.900000n, -22.69792 23.000000n, -11.91912 23.100000n, 20.19075 23.200000n, 45.87598 23.300000n, 9.38943 23.400000n, -83.33126 23.500000n, -30.76650 23.600000n, -26.28537 23.700000n, -27.69306 23.800000n, 127.14746 23.900000n, 219.14573 24.000000n, -55.90913 24.100000n, 6.69987 24.200000n, 39.80756 24.300000n, 123.15727 24.400000n, 17.33022 24.500000n, -13.57069 24.600000n, 40.85278 24.700000n, -122.59894 24.800000n, 22.58988 24.900000n, -38.43068 25.000000n, -156.16039 25.100000n, -56.55992 25.200000n, -27.14776 25.300000n, -9.29461 25.400000n, -57.34159 25.500000n, 62.13686 25.600000n, 14.76890 25.700000n, -116.66452 25.800000n, -124.81080 25.900000n, 76.87446 26.000000n, 58.54572 26.100000n, -73.42405 26.200000n, -91.83213 26.300000n, -23.50100 26.400000n, -11.59883 26.500000n, 5.88561 26.600000n, 138.07005 26.700000n, 131.54501 26.800000n, -67.06103 26.900000n, 70.90493 27.000000n, 83.15315 27.100000n, 80.28147 27.200000n, 58.00207 27.300000n, 41.82414 27.400000n, -31.41816 27.500000n, -59.74726 27.600000n, 25.82848 27.700000n, 58.49229 27.800000n, 60.73989 27.900000n, -137.23175 28.000000n, -41.28537 28.100000n, 42.80610 28.200000n, -0.43497 28.300000n, -33.39049 28.400000n, -21.38920 28.500000n, -82.01221 28.600000n, 98.53819 28.700000n, -22.97930 28.800000n, -100.59325 28.900000n, 14.23606 29.000000n, -89.41195 29.100000n, 19.51365 29.200000n, -18.46537 29.300000n, 80.71540 29.400000n, -126.27218 29.500000n, -10.78917 29.600000n, 22.28930 29.700000n, -72.10654 29.800000n, -0.54040 29.900000n, 50.28656 30.000000n, -105.74159 )
Vth_y Hthy 0 PWL (0.000000n, 47.14985 0.100000n, 125.00176 0.200000n, 3.30862 0.300000n, -166.05342 0.400000n, -34.46246 0.500000n, 153.96080 0.600000n, -68.69109 0.700000n, 94.54508 0.800000n, -32.74212 0.900000n, -73.87457 1.000000n, 5.04858 1.100000n, -30.45006 1.200000n, 73.08697 1.300000n, -30.02114 1.400000n, -131.05701 1.500000n, -38.49366 1.600000n, -109.71841 1.700000n, 143.66131 1.800000n, 62.80916 1.900000n, 51.21731 2.000000n, 97.37455 2.100000n, 4.77706 2.200000n, -34.39411 2.300000n, -193.45379 2.400000n, 125.18594 2.500000n, -37.81215 2.600000n, 40.41370 2.700000n, -4.37025 2.800000n, 41.75995 2.900000n, -20.38879 3.000000n, -62.49219 3.100000n, 62.98410 3.200000n, 131.40333 3.300000n, -115.79176 3.400000n, 156.04604 3.500000n, 173.67949 3.600000n, 68.58155 3.700000n, 89.89277 3.800000n, -82.52433 3.900000n, 67.83549 4.000000n, 36.23723 4.100000n, 120.39753 4.200000n, 101.89829 4.300000n, -1.81147 4.400000n, 53.92434 4.500000n, 66.68576 4.600000n, -79.65959 4.700000n, 72.68961 4.800000n, -13.49571 4.900000n, 6.29441 5.000000n, 85.76569 5.100000n, 45.53816 5.200000n, 117.60642 5.300000n, -57.03997 5.400000n, -48.75368 5.500000n, -32.21371 5.600000n, -17.58881 5.700000n, 15.06908 5.800000n, -65.03881 5.900000n, 211.26219 6.000000n, 39.34071 6.100000n, 148.28681 6.200000n, -59.91245 6.300000n, -87.70854 6.400000n, -95.54773 6.500000n, 50.92324 6.600000n, 44.78108 6.700000n, -76.34362 6.800000n, -180.42924 6.900000n, -125.27848 7.000000n, 1.81271 7.100000n, 67.99400 7.200000n, 160.08532 7.300000n, 63.40269 7.400000n, 68.77986 7.500000n, -16.81609 7.600000n, -65.41532 7.700000n, -179.44201 7.800000n, 34.74212 7.900000n, -121.56575 8.000000n, -242.43865 8.100000n, 110.67975 8.200000n, -7.36504 8.300000n, 37.06116 8.400000n, -105.74173 8.500000n, -19.72461 8.600000n, 11.73083 8.700000n, 205.95820 8.800000n, 60.93381 8.900000n, -65.53609 9.000000n, -27.28394 9.100000n, -103.03343 9.200000n, 100.01923 9.300000n, -36.25153 9.400000n, 122.87736 9.500000n, -26.95569 9.600000n, -9.91813 9.700000n, -100.12654 9.800000n, -74.53164 9.900000n, 101.84207 10.000000n, 94.17025 10.100000n, -6.91387 10.200000n, 107.62716 10.300000n, 24.28896 10.400000n, -125.48577 10.500000n, -85.34221 10.600000n, -71.56737 10.700000n, -33.48709 10.800000n, 18.63932 10.900000n, 16.86355 11.000000n, -59.98887 11.100000n, 28.84146 11.200000n, -94.95881 11.300000n, 28.97935 11.400000n, -172.41812 11.500000n, -14.40018 11.600000n, 83.75205 11.700000n, 13.29785 11.800000n, 128.05804 11.900000n, -23.63384 12.000000n, 17.81837 12.100000n, -41.34887 12.200000n, -24.83268 12.300000n, 63.48286 12.400000n, 35.59792 12.500000n, -140.56587 12.600000n, -8.35991 12.700000n, 46.91193 12.800000n, -45.39748 12.900000n, -93.43279 13.000000n, 19.99391 13.100000n, 64.70340 13.200000n, 91.36537 13.300000n, 228.08402 13.400000n, 102.17913 13.500000n, 44.29958 13.600000n, 52.41680 13.700000n, 75.34221 13.800000n, 55.98928 13.900000n, -25.15299 14.000000n, -160.44304 14.100000n, 1.71941 14.200000n, -136.46797 14.300000n, -16.78475 14.400000n, -46.85316 14.500000n, -15.85916 14.600000n, 146.87917 14.700000n, 109.97894 14.800000n, 181.33281 14.900000n, -38.17559 15.000000n, -165.25003 15.100000n, 119.29390 15.200000n, 43.97493 15.300000n, 16.69732 15.400000n, -117.32686 15.500000n, 7.18904 15.600000n, -80.67759 15.700000n, -17.60595 15.800000n, -68.91969 15.900000n, -48.86899 16.000000n, 150.59492 16.100000n, 182.61553 16.200000n, -49.34488 16.300000n, -48.46641 16.400000n, 64.22797 16.500000n, 73.79895 16.600000n, -145.36067 16.700000n, -71.74455 16.800000n, -105.19986 16.900000n, 42.59389 17.000000n, 118.27629 17.100000n, -34.57433 17.200000n, 55.91858 17.300000n, -68.22698 17.400000n, -41.28389 17.500000n, 117.59793 17.600000n, 18.34825 17.700000n, 51.20405 17.800000n, 80.99932 17.900000n, -97.87501 18.000000n, 77.52651 18.100000n, -69.59123 18.200000n, 90.29251 18.300000n, 82.14659 18.400000n, 124.00404 18.500000n, 40.31644 18.600000n, 70.63170 18.700000n, -39.87210 18.800000n, -135.80789 18.900000n, -46.92212 19.000000n, 63.42636 19.100000n, -42.10445 19.200000n, 11.34106 19.300000n, 98.79354 19.400000n, 144.71183 19.500000n, -7.09455 19.600000n, -76.53672 19.700000n, -65.23848 19.800000n, 173.32644 19.900000n, -170.02404 20.000000n, 19.14334 20.100000n, -29.74872 20.200000n, -8.25212 20.300000n, -163.54860 20.400000n, -134.89086 20.500000n, 145.68579 20.600000n, -161.43674 20.700000n, 139.47129 20.800000n, -28.80565 20.900000n, -22.34503 21.000000n, -33.83700 21.100000n, -84.92802 21.200000n, 64.56941 21.300000n, -31.31819 21.400000n, 35.14960 21.500000n, 88.39777 21.600000n, 31.34677 21.700000n, -2.86861 21.800000n, 119.65331 21.900000n, -108.26550 22.000000n, -89.82780 22.100000n, -16.89656 22.200000n, -169.87629 22.300000n, 54.52866 22.400000n, -53.59598 22.500000n, -31.38488 22.600000n, -52.69247 22.700000n, 182.84022 22.800000n, -55.95287 22.900000n, -1.48165 23.000000n, -45.92482 23.100000n, 14.96121 23.200000n, 4.25849 23.300000n, 67.91009 23.400000n, -109.48161 23.500000n, -31.89216 23.600000n, -167.08820 23.700000n, 24.30944 23.800000n, 86.26735 23.900000n, 37.57890 24.000000n, -77.02258 24.100000n, 47.23978 24.200000n, -48.78671 24.300000n, -14.79189 24.400000n, 44.74136 24.500000n, -149.90602 24.600000n, -81.93987 24.700000n, -41.06082 24.800000n, 24.41135 24.900000n, -20.76020 25.000000n, -14.54605 25.100000n, -44.43175 25.200000n, 168.40293 25.300000n, 29.47838 25.400000n, -89.26675 25.500000n, 38.47878 25.600000n, -196.46945 25.700000n, 83.75638 25.800000n, -198.61676 25.900000n, 54.95659 26.000000n, -154.42507 26.100000n, -20.09450 26.200000n, -120.81250 26.300000n, 20.93994 26.400000n, -61.88806 26.500000n, -40.91871 26.600000n, 158.90012 26.700000n, -93.01256 26.800000n, 78.10104 26.900000n, -70.54042 27.000000n, -36.85326 27.100000n, 116.84401 27.200000n, 43.99582 27.300000n, 40.73481 27.400000n, 106.18938 27.500000n, -54.10590 27.600000n, -15.32975 27.700000n, 36.46302 27.800000n, 20.74716 27.900000n, 84.36525 28.000000n, -161.88740 28.100000n, -83.49635 28.200000n, -116.03863 28.300000n, -142.29902 28.400000n, 54.10169 28.500000n, -40.72739 28.600000n, -97.17988 28.700000n, -18.38821 28.800000n, -159.95095 28.900000n, -112.54326 29.000000n, 28.74054 29.100000n, -159.17415 29.200000n, 138.34793 29.300000n, -120.96843 29.400000n, -5.06748 29.500000n, -66.68692 29.600000n, -15.63241 29.700000n, 37.89992 29.800000n, 112.54951 29.900000n, 111.80519 30.000000n, -39.21475 )
Vth_z Hthz 0 PWL (0.000000n, -16.51717 0.100000n, 22.48177 0.200000n, 152.67225 0.300000n, 82.75207 0.400000n, -150.77920 0.500000n, -67.48345 0.600000n, -103.52804 0.700000n, -86.51231 0.800000n, 65.90780 0.900000n, -43.19043 1.000000n, 147.20126 1.100000n, 48.37873 1.200000n, 29.54934 1.300000n, 192.76419 1.400000n, -35.89178 1.500000n, 33.93092 1.600000n, 56.32700 1.700000n, -59.17336 1.800000n, 17.18093 1.900000n, -130.44111 2.000000n, 95.08780 2.100000n, 174.63888 2.200000n, 28.33535 2.300000n, -201.32867 2.400000n, 173.09836 2.500000n, -117.76425 2.600000n, -116.78150 2.700000n, -79.25858 2.800000n, -24.75268 2.900000n, -127.74212 3.000000n, 280.50631 3.100000n, -85.73209 3.200000n, 81.37960 3.300000n, 62.99446 3.400000n, -77.88719 3.500000n, -84.64830 3.600000n, 154.73823 3.700000n, 66.69885 3.800000n, -101.31167 3.900000n, -25.76115 4.000000n, -10.38058 4.100000n, 58.67237 4.200000n, 89.88144 4.300000n, 92.26970 4.400000n, 89.70776 4.500000n, 27.39179 4.600000n, 154.79505 4.700000n, -77.40275 4.800000n, 191.52972 4.900000n, 62.48257 5.000000n, 134.19295 5.100000n, -20.35721 5.200000n, -71.18788 5.300000n, 49.55123 5.400000n, 43.84619 5.500000n, 45.08364 5.600000n, 18.93657 5.700000n, 62.58146 5.800000n, 45.99889 5.900000n, -70.80664 6.000000n, -125.75069 6.100000n, 42.18331 6.200000n, 15.85636 6.300000n, 45.58889 6.400000n, -136.51610 6.500000n, -59.49459 6.600000n, 18.38752 6.700000n, 123.72740 6.800000n, -110.19700 6.900000n, 12.06015 7.000000n, 20.17897 7.100000n, 26.27823 7.200000n, -74.57659 7.300000n, -75.13984 7.400000n, -50.45987 7.500000n, 6.32084 7.600000n, 44.76949 7.700000n, 190.27847 7.800000n, -147.05741 7.900000n, 91.18843 8.000000n, 95.98075 8.100000n, -9.27304 8.200000n, -87.19304 8.300000n, -31.88819 8.400000n, -30.93621 8.500000n, 53.19190 8.600000n, 22.45851 8.700000n, 65.89813 8.800000n, -7.35774 8.900000n, 53.89269 9.000000n, -8.97526 9.100000n, 164.91325 9.200000n, -64.84756 9.300000n, 67.43210 9.400000n, 207.50617 9.500000n, -53.47911 9.600000n, 6.49618 9.700000n, 70.76677 9.800000n, 8.31439 9.900000n, 87.76953 10.000000n, 27.24603 10.100000n, 125.76834 10.200000n, -19.89518 10.300000n, -158.99980 10.400000n, 72.61804 10.500000n, -33.13802 10.600000n, 4.33656 10.700000n, 58.06443 10.800000n, -178.44915 10.900000n, -33.05344 11.000000n, 54.04857 11.100000n, -209.81872 11.200000n, -102.75177 11.300000n, -75.11671 11.400000n, -44.65004 11.500000n, 61.18175 11.600000n, -122.20478 11.700000n, -11.60663 11.800000n, 58.22811 11.900000n, 43.23807 12.000000n, 5.84345 12.100000n, 51.17458 12.200000n, 144.95343 12.300000n, 11.55825 12.400000n, 149.55503 12.500000n, 165.58054 12.600000n, -44.28571 12.700000n, -36.11344 12.800000n, 55.88168 12.900000n, -69.14409 13.000000n, -152.29397 13.100000n, 24.99975 13.200000n, 40.06008 13.300000n, 18.14313 13.400000n, -88.50427 13.500000n, -36.08243 13.600000n, 94.78943 13.700000n, 16.55844 13.800000n, -17.78073 13.900000n, -52.81343 14.000000n, -33.41264 14.100000n, 2.73619 14.200000n, 27.97819 14.300000n, -64.59338 14.400000n, -91.61212 14.500000n, 4.03233 14.600000n, 14.99977 14.700000n, 3.14412 14.800000n, -56.64915 14.900000n, -152.71894 15.000000n, -15.79860 15.100000n, 79.64916 15.200000n, 166.58797 15.300000n, 47.53610 15.400000n, 30.91874 15.500000n, 42.57870 15.600000n, 9.93875 15.700000n, -74.74712 15.800000n, -56.07964 15.900000n, -105.60341 16.000000n, -13.40697 16.100000n, 16.93019 16.200000n, 77.33086 16.300000n, -37.59201 16.400000n, -88.19473 16.500000n, 30.06705 16.600000n, -132.14644 16.700000n, -95.95336 16.800000n, -147.68236 16.900000n, 5.43069 17.000000n, 30.09223 17.100000n, -92.79198 17.200000n, -21.48982 17.300000n, 59.60809 17.400000n, 21.40496 17.500000n, -25.58494 17.600000n, 5.81140 17.700000n, -15.69488 17.800000n, -118.01878 17.900000n, 46.63459 18.000000n, 71.39223 18.100000n, 23.27781 18.200000n, 32.33604 18.300000n, 36.35808 18.400000n, 31.50231 18.500000n, -41.81307 18.600000n, 36.83644 18.700000n, 45.56446 18.800000n, 126.67349 18.900000n, -155.54953 19.000000n, -140.93637 19.100000n, 60.31614 19.200000n, 104.21775 19.300000n, 29.08982 19.400000n, -110.16713 19.500000n, -52.65515 19.600000n, 93.25920 19.700000n, 113.36398 19.800000n, 65.10873 19.900000n, -135.42201 20.000000n, 41.63740 20.100000n, -178.76877 20.200000n, 20.81073 20.300000n, -11.06313 20.400000n, 69.78742 20.500000n, -11.76468 20.600000n, -95.29156 20.700000n, -27.66731 20.800000n, -11.28339 20.900000n, -137.70756 21.000000n, 28.32664 21.100000n, -81.15547 21.200000n, 102.54529 21.300000n, 44.74002 21.400000n, -45.95568 21.500000n, -102.56552 21.600000n, -154.75130 21.700000n, 82.28165 21.800000n, 121.15194 21.900000n, 24.54247 22.000000n, -54.27046 22.100000n, 43.81880 22.200000n, 4.94842 22.300000n, 25.15020 22.400000n, 158.77529 22.500000n, -18.68983 22.600000n, 10.79226 22.700000n, -108.05343 22.800000n, -66.43958 22.900000n, 94.54945 23.000000n, -50.54992 23.100000n, -169.75179 23.200000n, 51.76610 23.300000n, 53.02937 23.400000n, 47.67041 23.500000n, 76.10934 23.600000n, -61.51167 23.700000n, 32.92267 23.800000n, -23.23431 23.900000n, 40.27935 24.000000n, -80.54313 24.100000n, 24.55484 24.200000n, -19.05815 24.300000n, 178.67346 24.400000n, -10.84506 24.500000n, 38.75264 24.600000n, 42.30546 24.700000n, -46.16054 24.800000n, 108.93831 24.900000n, 37.51633 25.000000n, 94.57214 25.100000n, -62.32441 25.200000n, -74.41487 25.300000n, 49.90887 25.400000n, 63.00351 25.500000n, 56.73258 25.600000n, 90.25650 25.700000n, 6.70359 25.800000n, -9.96449 25.900000n, -96.46749 26.000000n, 8.50253 26.100000n, 51.95064 26.200000n, 115.36304 26.300000n, -66.94616 26.400000n, 44.35587 26.500000n, 68.39254 26.600000n, 100.91620 26.700000n, -12.18381 26.800000n, -99.43318 26.900000n, -38.50783 27.000000n, -72.75276 27.100000n, -1.61867 27.200000n, -150.94101 27.300000n, -60.68471 27.400000n, -54.39052 27.500000n, 70.72610 27.600000n, 90.08160 27.700000n, 48.21968 27.800000n, -60.47560 27.900000n, -53.58885 28.000000n, -157.61869 28.100000n, 121.75486 28.200000n, -169.67327 28.300000n, 76.29414 28.400000n, -105.20798 28.500000n, 4.87457 28.600000n, -21.30175 28.700000n, 72.45860 28.800000n, 128.63168 28.900000n, -23.48067 29.000000n, 122.34680 29.100000n, -131.62590 29.200000n, -123.92734 29.300000n, 59.83583 29.400000n, 50.09572 29.500000n, 13.98342 29.600000n, -151.31260 29.700000n, 71.11140 29.800000n, 112.32204 29.900000n, 14.05127 30.000000n, -15.71344 )
```

### .temp\SHE_model\SHE_model\Resistor.inc

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

.subckt RA n_plus n_minus Mx My Mz Tmp thi lx='65n' ly='130n' tox='1n' P0='0.715' RA0='5.4' MA='0.0'

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
*** Previous .param v0='0.65'

.param v0='0.48'
E_TMR0 TMR0 0 vol='2*P0^2*(1-asp*v(Tmp)^1.5)^2/(1-P0^2*(1-asp*v(Tmp)^1.5)^2)*100'
E_TMR TMR 0 vol='v(TMR0)/(1+((v(n_plus)-v(n_minus))/v0)^2)'
*E_TMR TMR 0 vol='150/(1+((v(n_plus)-v(n_minus))/v0)^2)'
E_Rap Rap 0 vol='(v(TMR)/100+1)*Rp'



*** R(V,Tmp,th) **********************************
R_MTJ n_plus n_minus '(1+cos(v(th)))*(Rp-v(Rap))/2+v(Rap)'
E_rmtj rmtj 0 vol='(1+cos(v(th)))*(Rp-v(Rap))/2+v(Rap)'


.ends
```
