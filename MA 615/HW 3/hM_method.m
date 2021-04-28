
function hM_method(x_0, coefs, M, delta, epsil)

    v = horn(coefs, x_0);
    
    outp = [0, x_0, v];
    disp(outp);
    
    if (abs(v) < epsil)
        return;
    end
    for k = 1:M 
      [v,df] = horn(coefs, x_0);
      dy = df;
      ydy = vpa(v/dy);
      x_1 = vpa(x_0 - ydy);
      
      v = horn(coefs, x_1);
      
      outp = [k, x_1, v];
      disp(outp);
      
      if (abs(x_1 - x_0) < delta || abs(v) < epsil) 
          return;
      end
      
      x_0 = x_1;
      
    end
    
end

function [f_x,df_x] = horn(coefs, x)
    df_x = 0.0;
    v_s = size(coefs);
    s = v_s(1,2);
    if (x == 0 && s == 0)
        f_x = 0;
    elseif (x == 0 && s > 0) || (s == 1)
        f_x = coefs(1,1);
    else
        primx = 0.0;
         t = 0;
         v = coefs(1,s);
         for i = 1:s-1
            primx = primx*x + v;
            t = coefs(1,s-i) + v*x;
            v = t;
         end
        f_x = t;
        df_x = primx;
    end
end