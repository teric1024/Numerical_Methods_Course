clear all
clc
#-----------       --------------------

#--------------------------------------

#-----------GET DATA-------------------
#read the data in hw1AB
rawdata = textread("hw1CD.dat");

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

#------------           -------------

#------------------------------------