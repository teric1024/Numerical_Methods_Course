clear all
clc

L = 50;
N = 100;
n = [0:1:N/2];
k = 2 * pi / L *n;
#h = L/N
kh = 2 * pi / N * n;

kh2_exact = kh.^2;
kh2_D1 = 2- 2 * cos(kh);
#kh2_D3 is not completed
kh2_D3 = 12*(1-cos(kh)) ./ (cos(kh) + 5);

plot(kh,kh2_exact,"k");
hold
plot(kh,kh2_D1,":b");
plot(kh,kh2_D3,"--r");
legend("Exact", "central difference","Pade scheme","location", "northwest");
xlabel("kh");
ylabel("k'^2h^2");
print("-dpng", "D_4");