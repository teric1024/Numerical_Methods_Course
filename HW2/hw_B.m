clear all
clc

L = 50;
N = 100;
n = [0:1:N/2];
k = 2 * pi / L *n;
#h = L/N
kh = 2 * pi / N * n;

k2h_sec_cen_diff = sin(kh);
k2h_four_cen_diff = (sin(2*kh) + 8 * sin(kh))/6;
k2h_Pade_scheme = 

plot(kh,kh,'k');
hold
plot(kh,k2h_forward,'b--');
plot(kh,k2h_sec_cen_diff,'c--');
plot(kh,k2h_forward,'g--');