clear all
clc

h1 = 0.1;
h2 = 0.5;
h3 = 1;
x1 = 0:h1:15;
x2 = 0:h2:15;
x3 = 0:h3:15;

yE = zeros(1,15/h1);
yBE = zeros(1,15/h1);
yT = zeros(1,15/h1);
y2nd = zeros(1,15/h1);
y4th = zeros(1,15/h1);

function re = sigmaE(x,h)
  re = 1 - 2*h - 0.02*h*x^2;@#x_n
endfunction
function re = sigmaBE(x,h)
  re = 1/(1+h*(2+0.01*x));#x_n+1
endfunction
function re = sigmaT(x1,x2,h)
  re = (1-h-h/200*x1^2)/(1+h+h/200*x2^2);
endfunction
function re = sigma2nd(
