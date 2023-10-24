function fitness = TSP_GA_fitness(data, per)
    fitness = 0;
    N = length(data);
    
    for i = 1 : N
        s = data(per(i), :);
        if (i < N)
            d = data(per(i+1), :);
        else
            d = data(per(1), :);
        end

        distance = sqrt((d(1)-s(1))^2 + (d(2)-s(2))^2);
        fitness = fitness + distance;
    end
end