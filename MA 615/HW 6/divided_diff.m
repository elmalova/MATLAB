

function [c] = divided_diff( x, y)
    [~,n] = size(x);
    c = zeros(n);
    for k=1:n
       c(k,1) = y(k);
    end    
    for j=2:n
       for i=1:n-j+1
           c(i,j) = (c((i+1),(j-1))-c(i,(j-1)))/(x(j+i-1)-x(i));
       end    
    end    
end