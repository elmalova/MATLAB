
function [r] = comp_simpson(f, a, b, n)
    
    h = (b-a)/n;
    x = zeros([1 n]);
    for i=1:n
    x(i) = a + i*h;
    end
    
    r = f(x(1))+f(x(n));
    r1 = 0;
    for i=3:(n/2)+1
        r1 = r1 + f(x(2*i-3));
    end 
    r = r + r1*2;
    
    r2 = 0;
    for i=2:(n/2)+1
        r2 = r2 + f(x(2*i-2));
    end 
    r = r + r2*4;
    
    r = r*(h/3);
end