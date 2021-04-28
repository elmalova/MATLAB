

function [x] = solve_ax_b (A, b)
    [~, l, u] = a_pTlu_f(A);
    
    [A, p] = gauss_eli_srpp(A);
    
    [n, ~] = size(A);
    z = zeros(1,n);
    x = zeros(1,n);
    for i=1:n
      h = 0;
      for j=1:i-1
          h = h + l(i,j)*z(j);
      end
      z(i) = b(p(i))-h;
    end 
    
    for i=n:-1:1
        h = 0;
        for j=i+1:n
            h = h + u(i,j)*x(j);
        end
        x(i) = (z(i)-h)/u(i,i);
    end    
end