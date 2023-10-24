    clc;
    clear;
    coordinates = csvread('coordinates2.csv');
    N = length(coordinates);

    POP_SIZE = 200;
    GENERATION = 10000;
    show_generation_every = 100;
   
    text_x = max(coordinates(:,1)) * 0.15;
    text_y1 = max(coordinates(:,2)) * 0.8;
    text_y2 = max(coordinates(:,2)) * 0.85;
    text_y3 = max(coordinates(:,2)) * 0.9;
    
    % Initianl population
    initial_population = zeros(POP_SIZE, N);
    for i = 1: POP_SIZE
        initial_population(i,:) = randperm(N);
    end
    
    fitnesses(POP_SIZE) = 0;
    population = initial_population;
    
    % Evolving loop
    for gen = 0 : GENERATION
        % Fitness calculation
        for i = 1: POP_SIZE
            fitnesses(i) = TSP_GA_fitness(coordinates, population(i,:));
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
            %fprintf("-------------\n");
            %disp(old_fitnesses);
            %fprintf("--------------\n");
        % Recombination and Mutation
        new_population = TSP_GA_recombination(old_population);
        
        for i = 1 : size(new_population, 1)
            new_population(i,:) = TSP_GA_mutation(new_population(i,:));
        end
        
        % Fitness calculation
        new_fitnesses = fitnesses(1:POP_SIZE/2);
        for i = 1 : POP_SIZE/2
            new_fitnesses(i) = TSP_GA_fitness(coordinates, new_population(i,:));
        end
            % disp(new_fitnesses);
        
        all_population = [old_population; new_population];
        all_fitnesses  = [old_fitnesses, new_fitnesses];
        % disp(all_fitnesses);
        
        % Natural Selection
        [next_generation, new_fittest] = TSP_GA_selection(POP_SIZE, all_population, all_fitnesses);
            % disp(size(population));
            % disp(size(old_population));
            % disp(size(new_population));
            % disp(size(all_population));
            % disp(size(next_generation));
        for i = 1 : POP_SIZE
            population(i,:) = all_population(next_generation(i), :);
        end
        
        % Display the generation
        if rem(gen, show_generation_every)==0 && gen < GENERATION
            fprintf('Generation %d, best objective = %f\n', gen, min(all_fitnesses));
            clf;
            %TSP_GA_display(data, new_population(new_fittest,:), 'r');
            TSP_GA_display(coordinates, old_population(old_fittest,:), 'b');
            text(text_x, text_y2, num2str(old_fitnesses(old_fittest)),'FontWeight', 'bold');
            %text(text_x, text_y2, num2str(new_fitnesses(new_fittest)),'FontWeight', 'bold');
            text(text_x, text_y3, num2str(gen),'FontWeight', 'bold');
            for i = 1:N
            text(coordinates(i, 1), coordinates(i, 2), num2str(i), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom');
            end
            title('Đường đi tối ưu giữa các thành phố sử dụng thuật toán GA');
            drawnow;
        end
    end

    clf;
    TSP_GA_display(coordinates, old_population(old_fittest,:), 'b');
    text(text_x, text_y2, num2str(old_fitnesses(old_fittest)),'FontWeight', 'bold');
    text(text_x, text_y3, num2str(gen),'FontWeight', 'bold');
    for i = 1:N
        text(coordinates(i, 1), coordinates(i, 2), num2str(i), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom');
    end
    title('Đường đi tối ưu giữa các thành phố sử dụng thuật toán GA');
    disp(min(all_fitnesses));