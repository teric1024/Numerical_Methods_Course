clear allclct = linspace(0,2*pi);sec = zeros(1,10);count = 1;figure(1)for j = 2:100  p = [1/2 1 1-exp(i*t(j))];  #if (imag(roots(p)(1)) == 0)  plot(roots(p),'o');  hold onendfor title('2nd order R-K');four = zeros(1,20);count = 1;figure(2)for j=2:100  p=[1/4 1/2 1 1 1-exp(i*t(j))];  plot(roots(p), 'x');  hold onendtitle('4th order R-K');