function new_per = TSP_GA_mutation(per)
    len = length(per);
    s = randi([1,len-1]);
    d = randi([s+1,len]);
    tmp = per(s:d);
    new_per = per;
    new_per(s:d) = tmp(length(tmp):-1:1);
end