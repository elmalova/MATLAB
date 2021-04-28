%{
%    Problem 3 
%       if x is zero and size is zero then ans is zero
%       if (x is zero and size is greater than 0) or (size is 1) then ans
%           is the first coefs
%       else do horners method to evaluate polynomial
%}

function f_x = eval_poly(coefs, x)
    v_s = size(coefs);
    s = v_s(1,2);
    disp(s)
    if (x == 0 && s == 0)
        f_x = 0;
    elseif (x == 0 && s > 0) || (s == 1)
        f_x = coefs(1,1);
    else
         t = 0;
         v = coefs(1,s);
         for i = s-1: -1: 1
            t = coefs(1,i) + v*x;
            v = t;
         end
        f_x = t;
    end
end