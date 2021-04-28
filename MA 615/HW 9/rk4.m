


function [x] = rk4(f, t0, x0, h, n)
    x = zeros([1 n]);
    x(1) = x0;
    
    for k = 1:n
        a = x(k);
       f1 = h*f(t0,a);
       f2 = h*f(t0 +(1/2)*h, a + (1/2)*f1);
       f3 = h*f(t0 + h*(1/2), a + (1/2)*f2);
       f4 = h*f(t0 +h, a + f3);
       x(k+1) = a + (f1 + 2*f2 + 2*f3 + f4)/6;
       t0 = t0 + h;
    end
    
end