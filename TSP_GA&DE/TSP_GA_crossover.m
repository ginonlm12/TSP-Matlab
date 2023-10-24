function new_pers = TSP_GA_crossover(pers)
    input_size = size(pers);
    new_pers = pers;
    order(input_size(1)+1) = 0;
    order = randperm(input_size(1));
    order(input_size(1)+1) = order(1);
    for i = 1 : input_size(1)
        new_pers(i, :) = TSP_GA_individual_recombination(pers(order(i),:), pers(order(i+1),:));
    end
end
