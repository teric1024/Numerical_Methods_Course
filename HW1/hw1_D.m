clear all
clc
#-----------find g''(x_i)   i =1,2,3,...,N-1--------------------

#create a form like AX = B. three variables are matrix.
#Let g''(x_i) be X

function [DDg] = csi_free_runout(x, y, nsize) 
  #nsize = N + 1
  # when it refers to x, y, delta
  # i(in textbook) = (i+1) (here)
  # i (here) = (i-1) (in textbook)
  
  #create matrix of g''(x_i)   i =1,2,3,...,N-1
  ddg = zeros(nsize - 2, 1);
  
  #----create delta_i-------
  delta = zeros(1, nsize-1);
  for i = 1 : nsize - 1
    delta(i) = x(i+1) - x(i);
  endfor
  #-------------------------
  
  #------create A-----------
  A = zeros(nsize-2, nsize-2);
  for i = 1 : nsize - 2
    for j = 1 : nsize - 2
      if (i == j)
        A(i,j) = (delta(i) + delta(i+1)) / 3;
      elseif ( i == j-1 )
        A(i,j) = delta(i+1) / 6;
      elseif( i == j+1)
        A(i,j) = delta(i)/6;
      else
        continue;
      endif
    endfor
  endfor
  #-------------------------
  
  #---------create B--------
  B = zeros(nsize-2, 1);
  for i = 1 : nsize - 2
    B(i) = (y(i+2) - y(i+1)) / delta(i+1) - (y(i+1) - y(i)) / delta(i);
  endfor
  #-------------------------
  
  ddg = A \ B;
  DDg = zeros(1, nsize);
  for i = 1:nsize-2
    DDg(i+1) = ddg(i,1);
  endfor
  
  #-----------cubic spline interpolation drawing-------
  figure(1)
  x_plot = [];
  y_plot = [];
  for i = 1 : nsize - 1
    x_ref = x(i) : 0.01 : x(i+1);
    y_ref = [];
    #in the textbook P6 eq.(1.6)
    y_ref = DDg(i)/6 * ( (x(i+1)-x_ref).^3 / delta(i) - delta(i)*(x(i+1)-x_ref))...
        + DDg(i+1)/6 * ( (x_ref-x(i)).^3 / delta(i) - delta(i)*(x_ref-x(i)))...
        + y(i) * ( x(i+1) - x_ref )/delta(i) + y(i+1) * ( x_ref - x(i) )/delta(i);
    x_plot = [x_plot, x_ref]; #connect all the x
    y_plot = [y_plot, y_ref]; #connect all the y
  endfor
  plot(x_plot, y_plot, x,y, "b*") #b* means point pattern is blue *
  xlabel("x"); #name the x axis
  ylabel("g(x)"); #name the y axis
  legend("g(x)", "(xi,yi)"); #name the line
  title("Cubic Spline Interpolation"); #name the diagram
    print("-dpng","D_Cubic_Spline_Interpolation");#output file as Cubic....png
  #----------------------------------------------------
endfunction
#---------------------------------------------------------



#-----------GET DATA-------------------
#read the data in hw1AB
rawdata = textread("hw1CD.dat");

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
DDg = csi_free_runout(xi, yi, data_size);
