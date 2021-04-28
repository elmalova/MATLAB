

function romberg(f, a, b, M)
    h = (b-a);
    R = zeros(M);
    R(1,1) = (1/2)*h*(f(a)+f(b));
    
    for i=2:M
        h = h/2;
        w = 0;
        for j=1:(2^(i-2))
            w = w + f(a+(2*j-1)*h);
        end    
        R(i,1) = (1/2)*R(i-1,1) + h*w;
        for m=2:i
            R(i,m) = (R(i,m-1) + (R(i,m-1)-R(i-1,m-1))/((4^(m-1))-1));
        end
    end
    for i=1:M
           disp(R(i,1:i));
    end
    disp(vpa(R(M,M)));
end