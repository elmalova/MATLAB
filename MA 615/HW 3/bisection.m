
function bisection(a, b, fm, M, delta, epsil)
    
    syms f(x)
    str = str2func(['@(x)' fm]);
    f(x) = str;
    u = vpa(f(a));
    v = vpa(f(b));
    e = vpa(b-a);
    
    outp = [a, b, u, v];
    disp(outp);
    
    if (sign(u) == sign(v))
        return;
    end
    for k=1:M
      e = vpa(e/2);
      c = vpa(a + e);
      w = vpa(f(c));
      
      outp = [k, c, w, e];
      disp(outp);
      
      if (abs(e) < delta || abs(w) < epsil)
          return;
      end
      
      if sign(w) ~= sign(u)
          b = c;
          v = w;
      else
          a = c;
          u = w;
      end 
    end 
end