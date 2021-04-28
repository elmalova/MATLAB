


function doolittle(n, a)
    L = zeros(n,n);
    u = zeros(n,n);
    for k=1:n
        L(k,k) = 1;
        for j=k:n
            v = 0;
            for s=1:(k-1)
                v = v + L(k,s)*u(s,j);
            end
            u(k,j) = a(k,j) - v;
        end
        for i=k+1:n
            c = 0;
            for s=1:(k-1)
                c = c + L(i,s)*u(s,k);
            end
            L(i,k) = (a(i,k) - c)/u(k,k);
        end
    end
    disp(L);
    disp(u);
end