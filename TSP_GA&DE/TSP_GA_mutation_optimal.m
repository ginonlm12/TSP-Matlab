function new_per = TSP_GA_mutation_optimal(per, distance)
    len = length(per);
    s = randi([1,len-1]);
    d = randi([s+1,len]);
    tmp = per(s:d);
    new_per = per;
    if s > 1 && d < len
        if distance(s-1,s)+distance(d,d+1) > distance(s-1,d) + distance(s,d+1)
            new_per(s:d) = tmp(length(tmp):-1:1);
        end
    end
    if s == 1 && d < len
        if distance(1,len)+distance(d,d+1) > distance(d,len) + distance(1,d+1)
            new_per(s:d) = tmp(length(tmp):-1:1);
        end
    end
    if s > 1 && d == len
        if distance(1,len)+distance(d-1,d) > distance(1,d) + distance(d-1,len)
            new_per(s:d) = tmp(length(tmp):-1:1);
        end
    end    
end