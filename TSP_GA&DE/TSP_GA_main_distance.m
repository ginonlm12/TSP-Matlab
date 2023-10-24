    clc;
    clear;
    
    N = 10;
    
    data = textread('distance.txt')';
    distance = zeros(N, N);
    index = 1;
    for i = 1 : N
        for j = 1 : i
            distance(i,j) = data(index);
            distance(j,i) = distance(i,j);
            index = index + 1;
        end
    end
    % disp(distance);
            
    POP_SIZE = 100;
    GENERATION = 5000;
    MR = 0.9;
     
    % Initianl population
    
    initial_population = zeros(POP_SIZE, N);
    for i = 1: POP_SIZE
        initial_population(i,:) = randperm(N);
    end
    
    %{
    initial_population = TSP_DE_generate_initial_population(POP_SIZE, distance);
    %}
   
    fitnesses(POP_SIZE) = 0;
    population = initial_population;
    
    % Evolving loop
    for gen = 0 : GENERATION
        % Fitness calculation
        for i = 1: POP_SIZE
            fitnesses(i) = TSP_GA_fitness_distance(distance, population(i,:));
        end
            % disp(fitnesses);

        % Parents Selection
        [selected, old_fittest] = TSP_GA_selection(POP_SIZE/2, population, fitnesses);
           %disp(selected);
           %disp(old_fittest);
        
        old_population = [];
        for i = length(selected) : -1 : 1
            old_population(i,:) = population(selected(i),:);
            old_fitnesses(i) = fitnesses(selected(i));
        end

        % Crossover and Mutation
        new_population = TSP_GA_crossover(old_population);
        
        for i = 1 : size(new_population, 1)
        	new_population(i,:) = TSP_GA_mutation_optimal(new_population(i,:),distance);
        end
        
        % Fitness calculation
        new_fitnesses = fitnesses(1:POP_SIZE/2);
        for i = 1 : POP_SIZE/2
            new_fitnesses(i) = TSP_GA_fitness_distance(distance, new_population(i,:));
        end
            % disp(new_fitnesses);
        
        all_population = [old_population; new_population];
        all_fitnesses  = [old_fitnesses, new_fitnesses];
        % disp(all_fitnesses);
        if gen == GENERATION
            for i = 1: POP_SIZE
                if all_fitnesses(:,i) == min(all_fitnesses)
                  disp(all_population(i,:)); 
                  break;
                end
            end
        end
        
        % Natural Selection
        [next_generation, new_fittest] = TSP_GA_selection(POP_SIZE, all_population, all_fitnesses);
        
        for i = 1 : POP_SIZE
            population(i,:) = all_population(next_generation(i), :);
        end
        
        if mod(gen,500)==0
            fprintf('Generation %d, best objective = %f\n', gen, min(all_fitnesses));
        end
    end

    % fprintf('Generation %d, best objective = %f\n', GENERATION, min(all_fitnesses));
    disp(min(all_fitnesses));