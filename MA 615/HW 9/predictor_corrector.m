

function [w] = predictor_corrector(f, t0, x0, h, n)
    w = zeros([1 n]);
    if n < 5
        w = rk4(f, t0, x0, h, n);
    end
    if n > 4
    x = rk4(f, t0, x0, h, 4);
    w(1:5) = x;
    
    for i = 5:n
           f1 = f(t0+(i-1)*h, w(i));
           f2 = f(t0+(i-2)*h, w(i-1));
           f3 = f(t0+(i-3)*h, w(i-2));
           f4 = f(t0+(i-4)*h, w(i-3));
           f5 = f(t0+(i-5)*h, w(i-4));
           
           w(i+1) = w(i)+(h/720)*(1901*f1-2774*f2+2616*f3-1274*f4+251*f5);
           
           fi1 = f(t0+(i+1)*h, w(i+1));
           
           w(i+1) = w(i) + (h/720)*(251*fi1+646*f1-264*f2+106*f3-19*f4);
    end
    end
    
    fplot(@(t) 12.*exp(t)./((exp(t)+1).^2), [-2 0]);
    hold on
    for i=1:n
       plot(t0+(i-1)*h, w(i), 'r.') ;
    end    
    hold off
end