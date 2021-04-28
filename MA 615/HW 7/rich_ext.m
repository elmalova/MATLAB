


function rich_ext(h, M, f)
   
    D = zeros(M);
    for n=1:M
        v = f(h/(2^n));
        D(n,1) = v;
    end
    
    for k=2:M
       for n=k:M
          D(n,k) = D(n,k-1)+(D(n,k-1)-D(n-1,k-1))/(4^k-1); 
       end
    end  
    
    for i=1:M
       disp(D(1:i));
    end
end