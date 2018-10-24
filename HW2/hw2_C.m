clear all
clc

function re = f(x)
  re = sin(5*x);
endfunction

#input the initial value
N = 14;
x0 = 0;
xN = 3;
x = x0:xN/N:xN;
nsize = size(x);
nsize = nsize(1,2);

#create a form like AX = B/h, h is a number, 
#the others are matrix
#Let all f'j be X

#---create A----
A = zeros(nsize,nsize);
A(1,1) = A(nsize,nsize) = 1;
A(1,2) = A(nsize,nsize-1) = 2;
for i = 2:nsize-1
  A(i,i-1) = 1;
  A(i,i) = 4;
  A(i,i+1) = 1;
endfor
#---------------

#----create B----
B = zeros(nsize,1);
B(1,1) = -5/2*f(x(1)) + 2*f(x(2)) + f(x(3))/2;
B(nsize,1) = 5/2*f(x(nsize)) - 2*f(x(nsize-1)) - f(x(nsize-2))/2;
for i = 2 : nsize-1
  B(i,1) = 3*(f(x(i+1)) - f(x(i-1)));
endfor
B ./= xN/N;
#----------------

#find X
Df = A\B;

plot(x,Df,"or");
hold
x_ref = x0:0.01:xN;
plot(x_ref,5*cos(5*x_ref));
legend("f'(x_j)", "f'(x)");
title("4th Order Pade Differentiation");
xlabel("x");
ylabel("Derivative");
print("-dpng", "C_2");
