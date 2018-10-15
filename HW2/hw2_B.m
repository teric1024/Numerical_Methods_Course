clear all
clc

L = 50;
N = 100;
n = [0:1:N/2];
k = 2 * pi / L *n;
#h = L/N
kh = 2 * pi / N * n;

k2h_sec_cen_diff = sin(kh);
k2h_four_cen_diff = (-sin(2*kh) + 8 * sin(kh))/6;
k2h_Pade_scheme = (-kh .* cos(kh) / 2) + 3/2*sin(kh);

plot(kh,kh);
hold
plot(kh,k2h_sec_cen_diff,"--");
plot(kh,k2h_four_cen_diff,":");
plot(kh,k2h_Pade_scheme,"-.");
legend("Exact", "2nd O Central","4th O Central", "4th O Pade");
xlabel("hk");
ylabel("hk'");