clear all;

load('supply.mat');
load('supplyABC.mat');
load('thrusters_sup.mat')

% Initial position x, y, z, phi, theta, psi
eta0 = [0,0,0,0,0,0]';
% Initial velocity u, v, w, p, q, r
nu0 = [0,0,0,0,0,0]';

%% Current 
V_c = 0; % Currrent magnitude
beta_c = 135; % Current angle degrees

%% Lineary varying current angle
switch_condition = 0; % 0: constant, 1: lineary varying 

%% Setpoints and simulations
% Need to change the current magnitude, current angle and switch condition
% depndent on which simulation 

% Simulation 1 & 2
setPoint_sim12 = [0 0 0]; 

% Simulation 3
init_setPoint = [0 0 0];
setPoint_change_time = 100;
setPoint_sim3= [10 10 3*pi/2];

% Simulation 4
setPoint0 = [0 0 0];
setPoint1 = [50 0 0];
setPoint2 = [50 -50 0];
setPoint3 = [50 -50 -pi/4];
setPoint4 = [0 -50 -pi/4];
setPoint5 = [0 0 0];

%% Tunning of reference model
omg2 = [0.1 0.1 0.2];
Z2omg = [0.85 0.85 1]; 
satMax = [10 10 1];

%% Tunning of controller
Kp = [4e7 4e7 2e8]; % Kp = [kp_surge kp_sway kp_yaw];
Ki = [3e6 3e6 1e6]; % Ki = [ki_surge ki_sway ki_yaw];
Kd = [7e6 7e6 1e9]; % Kd = [kd_surge kd_sway kd_yaw];

%% Simulation
t_set = 800;
dt = 0.1;   

% sim("part1_sunday.slx");

