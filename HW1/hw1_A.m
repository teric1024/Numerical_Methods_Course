clear all
clc
#--------draw L(x) function-----------------
function [y_ref] = lagrange (x_ref, x, y, nsize)
  y_ref = 0;
  #the definition of L(x)
  for j = 1:nsize
    Lj = 1;
    for i = 1:nsize
      if ( i == j )
        continue
      endif
      Lj .*= (x_ref - x(i)) / (x(j) - x(i)); #.*= means do *= to every element
    endfor
    figure(j); #name a file
    plot(x_ref,Lj); #draw the diagram
    xlabel("x"); #name the x axis
    lname = strcat("L", dec2base(j, 10), "(x)"); #create name of Lj(x)
    ylabel(lname); #name the y axis
    legend(lname); #name the line
    title(lname); #name the diagram
    y_ref += Lj * y(j); #create P(x_ref)
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
xi = zeros(1, data_size);
yi = zeros(1, data_size);

#load the data onto xj and yj
for i = 1:data_size
  xi(i) = point(1,i+1);
  yi(i) = point(2,i+1);
endfor
#--------------------------------------

#-------------draw P(x)----------------
x_ref = xi(1) : 0.01 : xi(data_size);
px = lagrange(x_ref, xi, yi, data_size);
figure(data_size+1)
plot(x_ref, px)
xlabel("x");
ylabel("P(x)");
title("P(x)");
legend("P(x)");
#-------------------------------------