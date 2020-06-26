%%%%%%%%%%%%%%%%%%%%
%% CONFIGURACION
topUSB_config
eval('topUSB_config_Mat')
%%%%%%%%%%%%%%%%%%%%
%% PROBLEMA
nproblema='C1_F2_0_Connor_etal_R';
%% Geometria
Scale=2;
A_G_F_Connor
%%%%%%%%%%%%%%%%%%%%
%%  %% METODO %%
METODO=300; %300 puro 400 combinado
F1=0;
Met=0;
Metodo1='M6_0_OT_2D_HOM_m2_topUSB_Mat'; 
%%%%%%%%%%%%%%%%%%%%%
%% LOOP PARAMETERS
%%%%%%%%%%%%%%%%%%%%
volfrac=0.6; volmin=0; v=volfrac;
penal=3;tolx=0.001;
rmin=3/paso;
ft=2;
maxloop=1000;
nmicro='micro2';
%% RESTRICCIONES
PorObj=0.6;        % R1
A_R_M2
%%%%%%%%%%%%%%%%%%%%%
if METODO==100;ConvergenciaFEM,else A_2D_topUSB,end

ai(1)*paso*1000


