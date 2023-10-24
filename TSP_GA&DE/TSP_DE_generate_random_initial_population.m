function pop = TSP_DE_generate_random_initial_population(POP_SIZE, distance)
    N = size(distance,1);
    pop = zeros(POP_SIZE, N);
    for i = 1:POP_SIZE
        pop(i,:) = randperm(N);
    end
        
end