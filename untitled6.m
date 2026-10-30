
clc; clear; close all;
syms z

a = 0.5;
X = z/(z-a);
n = -10:10;
u = double(n>=0);

% Four signals
x1 = a.^n.*u;
x2 = a.^(n-1).*double(n>=1);
x3 = 2.^n.*x1;
x4 = a.^(-n).*double(n<=0);

% Plot four graphs
figure;
subplot(2,2,1); stem(n,x1); title('Original'); grid on;
subplot(2,2,2); stem(n,x2); title('Time Shifting'); grid on;
subplot(2,2,3); stem(n,x3); title('Z-Scaling'); grid on;
subplot(2,2,4); stem(n,x4,'filled'); title('Time Reversal'); grid on;
 
% Verify Z Transform Properties

disp('Z-TRANSFORM PROPERTIES');

disp(['X(z) = ', char(X)]);
disp(['Time Shifting = ', char(X/z)]);
disp(['Z-Scaling = ', char(subs(X,z,z/2))]);
disp(['Time Reversal = ', char(subs(X,z,1/z))]);
disp(['Differentiation = ', char(-z*diff(X,z))]);
disp(['Initial Value = ', char(limit(X,z,inf))]);
disp(['Final Value = ', char(limit((z-1)*X,z,1))]);



