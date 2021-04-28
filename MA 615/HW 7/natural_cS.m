

function [z] = natural_cS(n, t, y)
    h = zeros(1, n);
    b = zeros(1, n);
    for i=1:n-1
        h(1,i) = t(i+1)-t(i);
        b(1,i) = 6*(y(i+1)-y(i))/h(1,i);
    end
    u = zeros(1, n);
    v = zeros(1, n);
    
    u(1,2) = 2*(h(1,1)+ h(1,2));
    v(1,2) = (b(1,2)- b(1,1));
    
    for i=3:n
       u(1,i) = (2*(h(1,i)+h(1,i-1))-(((h(1,i-1))^2)/u(1,i-1)));
       v(1,i) = (b(1,i)- b(1,i-1)-((h(1,i-1)*v(1,i-1))/u(1,i-1)));
    end
    z(n) = 0;
    for i=n-1:-1:2
        z(i) = (v(1,i)-h(1,i)*z(i+1))/u(1,i);
    end
    z(1) = 0;
 
    % the below code is for plotting the pts and spline
    for i=1:n-1
       A = (1/(6*h(i)))*(z(i+1)- z(i));
       B = z(i)/2;
       C = -(h(i)/6)*z(i+1)-(h(i)/3)*z(i)+(1/h(i))*(y(i+1)-y(i));
       a = t(i);
       aa = t(i+1);
       yy= y(i);
       fplot(@(x) yy+(x-a).*(C + (x-a).*(B + (x-a).*A)), [a,aa], "b");
       hold on
    end
    plot(t, y);
end
