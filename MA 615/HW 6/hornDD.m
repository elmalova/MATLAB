

function f_x = hornDD(x,y,z)
    
    c = divided_diff(x,y);
    
         f_x = 0;
         for i =1:n
             v = 1;
             for j=i-1:-1:1
                v = v*(z-x(j)); 
             end
             f_x = f_x + c(1,i)*v;
         end
end