%{ Problem Number 1 %}

function do_FB(m)
    for i = 1:m
        x_iii = mod(i,3);
        x_v = mod(i,5);
        if (x_iii == 0) && (x_v == 0)
            disp('Fizz-Buzz')
        elseif (x_iii == 0)
            disp('Fizz')
        elseif (x_v == 0)
            disp('Buzz')
        else
            disp(i)
        end
    end
end

