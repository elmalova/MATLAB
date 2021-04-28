

function newton(x_0, fm, M, delta, epsil)
    
    
    syms f(x)
    str = str2func(['@(x)' fm]);
    f(x) = str;
    df = diff(f,x);
    v = vpa(f(x_0));
    
    outp = [0, x_0, v];
    disp(outp);
    
    if (abs(v) < epsil)
        return;
    end
    for k = 1:M 
      dy= vpa(df(x_0));
      ydy = vpa(v/dy);
      x_1 = vpa(x_0 - ydy);
      
      v = vpa(f(x_1));
      
      outp = [k, x_1, v];
      disp(outp);
      
      if (abs(x_1 - x_0) < delta || abs(v) < epsil) 
          return;
      end
      
      x_0 = x_1;
      
    end
    
end