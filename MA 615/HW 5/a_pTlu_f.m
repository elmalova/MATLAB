

function [Pt, L, U] = a_pTlu_f(A)
    [A, p] = gauss_eli_srpp(A);
    
    [n, ~] = size(A);
    
    Pt = zeros(n);
    P = zeros(n);
    
    for i=1:n
       z = p(i);
       Pt(z, i) = 1;
       P(i, z) = 1;
    end 
    A = P*A;
    
    U = triu(A);
    L = tril(A);
    
    
    for j=1:n
       L(j,j) = 1; 
    end    
end