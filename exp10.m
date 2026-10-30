clc;
clear;
close all;

% Example: x[n] = (0.5)^n u[n]
a = 0.5;

% Z-transform:
% X(z) = 1/(1-a*z^(-1)) = z/(z-a)
% For a = 0.5:
% X(z) = z/(z-0.5)
% ROC: |z| > 0.5

fprintf('X(z) = z/(z-0.5)\n');
fprintf('ROC: |z| > 0.5\n');

theta = linspace(0,2*pi,500);

figure;
plot(0.5*cos(theta),0.5*sin(theta),'LineWidth',1.5);
hold on;
plot(0.5,0,'x','MarkerSize',10,'LineWidth',2);
plot(cos(theta),sin(theta),'--','LineWidth',1.2);

grid on;
axis equal;
xlabel('Real Axis');
ylabel('Imaginary Axis');
title('Pole and ROC Boundary for X(z)=z/(z-0.5)');
legend('ROC boundary |z|=0.5','Pole z=0.5','Unit circle');