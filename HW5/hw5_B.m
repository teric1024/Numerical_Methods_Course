clear all
clc

function re = exact_y(x)
  re = 4*exp(-2*x-x^3/300);
endfunction
function re = sigmaE(x,h)
  re = 1 - 2*h - 0.02*h*x^2;
endfunction
function re = sigmaBE(x,h)
  re = 1/(1+h*(2+0.01*x^2));
endfunction
function re = sigmaT(x1,x2,h)
  re = (1-h-h/200*x1^2)/(1+h+h/200*x2^2);
endfunction
function re = sigma2nd(x,h,y)
  k1 = h*(-2-0.01*x^2)*y;
  k2 = h*(-2-0.01*(x+h/2)^2)*(y+k1/2);
  re = y + k2;
endfunction
function re = sigma4th(x,h,y)
  k1 = h*(-2-0.01*x^2)*y;
  k2 = h*(-2-0.01*(x+h/2)^2)*(y+k1/2);
  k3 = h*(-2-0.01*(x+h/2)^2)*(y+k2/2);
  k4 = h*(-2-0.01*(x+h)^2)*(y+k3);
  re = y + k1/6 + k1/3 + k2/3 + k4/6;
endfunction

h1 = 0.1;
h2 = 0.5;
h3 = 1;
x1 = 0:h1:15;
x2 = 0:h2:15;
x3 = 0:h3:15;

#=== start to plot h =0.1 ===
y = zeros(1,15/h1+1); y(1) = 4;
yE = zeros(1,15/h1+1); yE(1) = 4;
yBE = zeros(1,15/h1+1); yBE(1) = 4;
yT = zeros(1,15/h1+1); yT(1) = 4;
y2nd = zeros(1,15/h1+1); y2nd(1) = 4;
y4th = zeros(1,15/h1+1); y4th(1) = 4;

for i =2:length(x1)
  y(i) = exact_y(x1(i));
  yE(i) = sigmaE(x1(i-1), h1) * yE(i-1);
  yBE(i) = sigmaBE(x1(i-1), h1) * yBE(i-1);
  yT(i) = sigmaT(x1(i-1), x1(i), h1) * yT(i-1);
  y2nd(i) = sigma2nd(x1(i-1), h1, y2nd(i-1) );
  y4th(i) = sigma4th(x1(i-1), h1, y4th(i-1) );
endfor

figure(1)
plot(x1,y,'r')
hold
plot(x1,yE,'b')
plot(x1,yBE,'k')
plot(x1,yT,'m')
plot(x1,y2nd,'c')
plot(x1,y4th,'g')
legend('exact','Euler','backward Euler','trapezoidal','2nd order R-K','4th order R-K');
title('h = 0.1')
#==== end ======

#==== start to plot h =0.5 ===
y = zeros(1,15/h2+1); y(1) = 4;
yE = zeros(1,15/h2+1); yE(1) = 4;
yBE = zeros(1,15/h2+1); yBE(1) = 4;
yT = zeros(1,15/h2+1); yT(1) = 4;
y2nd = zeros(1,15/h2+1); y2nd(1) = 4;
y4th = zeros(1,15/h2+1); y4th(1) = 4;

for i =2:length(x2)
  y(i) = exact_y(x2(i));
  yE(i) = sigmaE(x2(i-1), h2) * yE(i-1);
  yBE(i) = sigmaBE(x2(i-1), h2) * yBE(i-1);
  yT(i) = sigmaT(x2(i-1), x2(i), h2) * yT(i-1);
  y2nd(i) = sigma2nd(x2(i-1), h2, y2nd(i-1) );
  y4th(i) = sigma4th(x2(i-1), h2, y4th(i-1) );
endfor

figure(2)
plot(x2,y,'r')
hold
plot(x2,yE,'b')
plot(x2,yBE,'k')
plot(x2,yT,'m')
plot(x2,y2nd,'c')
plot(x2,y4th,'g')
legend('exact','Euler','backward Euler','trapezoidal','2nd order R-K','4th order R-K');
title('h = 0.5')
#=== end ===

#=== start to plot h = 1 ====
y = zeros(1,15/h3+1); y(1) = 4;
yE = zeros(1,15/h3+1); yE(1) = 4;
yBE = zeros(1,15/h3+1); yBE(1) = 4;
yT = zeros(1,15/h3+1); yT(1) = 4;
y2nd = zeros(1,15/h3+1); y2nd(1) = 4;
y4th = zeros(1,15/h3+1); y4th(1) = 4;

for i =2:length(x3)
  y(i) = exact_y(x3(i));
  yE(i) = sigmaE(x3(i-1), h3) * yE(i-1);
  yBE(i) = sigmaBE(x3(i-1), h3) * yBE(i-1);
  yT(i) = sigmaT(x3(i-1), x3(i), h3) * yT(i-1);
  y2nd(i) = sigma2nd(x3(i-1), h3, y2nd(i-1) );
  y4th(i) = sigma4th(x3(i-1), h3, y4th(i-1) );
endfor

figure(3)
plot(x3,y,'r')
hold
plot(x3,yE,'b')
plot(x3,yBE,'k')
plot(x3,yT,'m')
plot(x3,y2nd,'c')
plot(x3,y4th,'g')
legend('exact','Euler','backward Euler','trapezoidal','2nd order R-K','4th order R-K');
title('h = 1')
#=== end ===