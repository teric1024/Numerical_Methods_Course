clear all
clc
#--------draw L(x) function-----------------
function [y_ref] = lagrange (x_ref, x, y, nsize)
  y_ref = 0;
  #the definition of L(x)
  for j = 1:nsize
    Lj = 1;
    for i = 1:nsize
      if i == j 
        continue
      endif
      Lj .*= (x_ref - x(i)) / (x(j) - x(i));
    endfor
    figure(j)
    plot(x_ref,Lj)
    xlabel("x");
    lname = strcat("L", dec2base(j, 10), "(x)"); #create name of Lj(x)
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
psize = size(point);
data_size = psize(2)-1;

#declare x and y to store all the point(point known already)
xi = 1 : 1 : data_size;
yi = 1 : 1 : data_size;

#load the data onto xj and yj
for i = 1:data_size
  xi(i) = point(1,i+1);
  yi(i) = point(2,i+1);
endfor
#--------------------------------------

#-------------draw P(x)----------------
x_ref = -1 : 0.01 : 1;
px = lagrange(x_ref, xi, yi, data_size);
figure(data_size+1)
plot(x_ref, px)
xlabel("x");
ylabel("P(x)");
legend("P(x)");
#-------------------------------------