
function secant(a, b, fm, M, delta, epsil)
    
    syms f(x)
    str = str2func(['@(x)' fm]);
    f(x) = str;
    
    fa = vpa(f(a));
    fb = vpa(f(b));
    
    outp = [0, a, fa];
    disp (outp);
    outp = [1, b, fb];
    disp(outp);
    
    for k=2:M
       if abs(fa) > abs(fb)
           c = b;
           fc = fb;
           b = a;
           fb = fa;
           a = c;
           fa = fc;
       end
           s = vpa((b-a)/(fb-fa));
           b = a;
           fb = fa;
           a = vpa(a-(fa*s));
           fa = vpa(f(a));
           
           outp = [k, a, fa];
           disp(outp);
           
           if (abs(fa) < epsil || abs(b-a) < delta)
               return;
           end
           
    end    
    
end