
clc;
clear;
close all;

n = -10:10;

% Rectangular signal
x = double(abs(n) <= 2);

% Triangular signal
h = max(0, 3-abs(n));

% (i) Convolution of two rectangular signals
y1 = zeros(1, length(x)+length(x)-1);

for i = 1:length(x)
    for j = 1:length(x)
        y1(i+j-1) = y1(i+j-1) + x(i)*x(j);
    end
end

% (ii) Convolution of rectangular and triangular signals
y2 = zeros(1, length(x)+length(h)-1);

for i = 1:length(x)
    for j = 1:length(h)
        y2(i+j-1) = y2(i+j-1) + x(i)*h(j);
    end
end

% (iii) Convolution of two triangular signals
y3 = zeros(1, length(h)+length(h)-1);

for i = 1:length(h)
    for j = 1:length(h)
        y3(i+j-1) = y3(i+j-1) + h(i)*h(j);
    end
end

% Time axis for resultant signals
ny = -20:20;

% Plotting
figure;

subplot(3,1,1);
stem(ny,y1);
title('Rectangular * Rectangular');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(3,1,2);
stem(ny,y2);
title('Rectangular * Triangular');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(3,1,3);
stem(ny,y3);
title('Triangular * Triangular');
xlabel('n');
ylabel('Amplitude');
grid on;
