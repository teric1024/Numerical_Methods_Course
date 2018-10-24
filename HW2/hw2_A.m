clear all
clc

function re = f(delta)
  x_j = 4;
  re = sin( x_j + delta) ./ (x_j+delta).^3;
endfunction

h = [1, 0.5, 0.1, 0.05, 0.01, 0.005];
x_j = 4;

exact_diff = (cos(x_j)* x_j^3 - 3 * x_j^2 * sin(x_j))/x_j^6;
h_size = size(h);

forward_diff = ( f(h) - f(0) ) ./ h;
sec_cen_diff = ( f(h) - f(-h) ) ./ (2*h);
four_cen_diff = ( f(-2*h) - 8*f(-h) +8*f(h) - f(2*h)  ) ./ (12*h);

forward_err = log10(abs(exact_diff - forward_diff));
sec_err = log10(abs(exact_diff - sec_cen_diff));
four_err = log10(abs(exact_diff - four_cen_diff));
logh = log10(h);

plot(logh, forward_err, "o");
hold
plot(logh, sec_err, "*");
plot(logh, four_err, "+k");
legend("1st order", "2nd order", "4th order",'Location','northwest');
plot(logh, forward_err, "b");
#legend("1st order");
plot(logh, sec_err, "r");
#legend("2nd order");
plot(logh, four_err, "k");
#legend("4th order");
xlabel("h -- grid spacing");
ylabel("error");
title("A.2");
print("-dpng","A_2");
