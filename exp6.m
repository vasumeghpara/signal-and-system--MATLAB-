clc;
close all;
clear all;

b = [1];
a = [1, -1];

n = 0:1:10;

figure;
stem(n)
hold on;
stem(impz(b,a,n))

figure;
stem(n)
hold on;
stem(filter(b,a,n))

figure;
stem(n)
hold on;
stem(freqz(b,a,n))
