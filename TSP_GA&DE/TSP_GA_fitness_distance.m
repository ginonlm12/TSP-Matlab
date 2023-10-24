function fitness = TSP_GA_fitness_distance(dis, per)
    fitness = 0;
    N = length(dis);
    
    for i = 1 : N
        if (i < N)
            d = dis(per(i), per(i+1));
        else
            d = dis(per(N), per(1));
        end

        distance = d;
        fitness = fitness + distance;
    end
end