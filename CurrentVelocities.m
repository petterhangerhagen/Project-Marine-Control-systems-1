close all;
%% Current velocities

% Currrent magnitude
Vc = 0.5;
% Current angle
psi_c = 1; 

Vc = [Vc*cos(psi_c) Vc*sin(psi_c)];

N = Vc(1);
E = Vc(2);

%% Tunning of controller

set_x = 10;
set_y = 10;
set_yaw = 0.785;

kp_surge = 8e5;
ki_surge = 14e3;
kd_surge = 6e6;

kp_sway = 8e5;
ki_sway = 14e3;
kd_sway = 6e6;

kp_yaw = 8e5;
ki_yaw = 14e3;
kd_yaw = 6e6;

Kp = [kp_surge kp_sway kp_yaw];
Ki = [ki_surge ki_sway ki_yaw];
Kd = [kd_surge kd_sway kd_yaw];

%% Tunning of ref model

m_spring = 10;
d = 100;
k = 80;

%% Simulation

t_set = 500;
dt = 0.5;

sim("part1.slx");


%% Plotting

fig = figure;
hold on;

% surge
subplot(3,1,1)
plot(tout,pos.data(:,1),"k",tout,set_point.data(:,1)*ones(1,length(tout)),"k--");
legend("surge position","surge reference position");
grid on;

% sway
subplot(3,1,2)
plot(tout,pos.data(:,2),"k",tout,set_point.data(:,2)*ones(1,length(tout)),"k--");
legend("sway position","sway reference position");
grid on;

subplot(3,1,3)
plot(tout,pos.data(:,3),"k",tout,set_point.data(:,3)*ones(1,length(tout)),"k--");
legend("yaw rotation","yaw reference rotation");
grid on;

hold off;


fig2 = figure;
hold on;
plot(pos.data(:,2),pos.data(:,1),"k");
%legend();
grid on;

hold off;

fig3 = figure;
hold on;
plot(tout,kp_out.data(:,1),"Blue",tout,ki_out.data(:,1),"Green",tout,kd_out.data(:,1),"Yellow");
legend("P","I","D");
grid on;
hold off;




