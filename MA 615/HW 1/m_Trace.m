%{ 
%    Problem 2 
%        takes a matrix N
%        if size is n x n then return trace of N
%        if not, return org. matrix N and disp message 
%}

function trac = m_Trace(N)
    s = size(N);
    if(s(1,1) == s(1,2))
        t = 0;
        for i = 1:s(1,1)
            t = t + N(i,i);
        end
        trac = t;
    else
        trac = N;
        disp('not a square matrix')
    end
end