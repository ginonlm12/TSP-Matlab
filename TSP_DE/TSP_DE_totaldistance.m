function fitness = TSP_DE_Totaldistance(v, distance)
    fitness = 0;
    N = numel(v);
%    for i = 1:N
%       disp(v(i));
%    end
    
    for i = 1:N-1
        fitness = fitness + distance(v(i), v(mod(i,N)+1));
    end
end