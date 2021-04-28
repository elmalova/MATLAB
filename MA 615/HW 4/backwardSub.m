


function backwardSub(L, b)
    s = size(L);
    n = s(1,1);
    disp(n);
    x = zeros(n,1);
    for j=n:-1:1
        if (L(j,j)==0) 
            error('Matrix is singular!'); 
        end
        v = 0;
        for i=j+1:n
            v = v + L(j,i)*x(i);
        end
        x(j) = (b(j)-v)/L(j,j);
    end
    disp(x);
end