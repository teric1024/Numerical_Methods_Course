clear all
clc
#--------draw L(x) function-----------------
function [y_ref] = lagrange (x_ref, x, y)
  nsize = size(x);
  y_ref = 0;
  #the definition of L(x)
  for j = 1:nsize
    Lj = 1;
    for i = 1:nsize
      if i == j 
        continue
      endif
      Lj *= (x_ref - x(i)) / (x(j) - x(i));
    endfor
    figure(j)
    plot(x_ref,Lj)
    xlabel("x");
    lname = strcat("L", dec2base(j, 10), "(x)");
    ylabel(lname);
    legend(lname);
    y_ref += Lj * y(j);
  endfor
endfunction
#--------------------------------------

#-----------GET DATA-------------------
#read the data in hw1AB
rawdata = textread("hw1AB.dat");

#transfrom the data into a matrix
point = reshape(rawdata, 2, []);

#check the size of point
data_size = size(point);

#declare x and y to store all the point(point known already)
xi = 1 : 1 : data_size(2)-1;
yi = 1 : 1 : data_size(2)-1;

#load the data onto xj and yj
for i = 2:data_size(2)
  xi(i-1) = point(1,i);
  yi(i-1) = point(2,i);
endfor
#--------------------------------------

#-------------draw P(x)----------------
x_ref = -1 : 0.01 : 1;
px = lagrange(x_ref, xi, yi);
figure(12)
plot(x_ref, y)
xlabel("x");
ylabel("P(x)");
#-------------------------------------