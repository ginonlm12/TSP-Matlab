clc; clear all; close all;
tic

rng('default')

N = 15; % The number of cities
UB = 100;
LB = 1;

% Input distances through the following 5 methods:
    % 1. Randomly generate distances by symmetric matrix
            %distance = TSP_DE_initial_symmetric_distance(N, LB, UB);
    % 2. Randomly generate distances by assymmetric matrix
            % distance = TSP_DE_initial_asymmetric_distance(N, LB, UB);
    % 3. Directly read distance data extracted from the txt file
             distance = textread('distance.txt');
             N = size(distance,1);
             fprintf('Distance: \n');
             disp(distance);
    % 4. Randomly generate coordinates of cities and then calculate distances
            %[coordinates,distance] = TSP_DE_initial_coordinates(N, LB, UB);
    % 5. Calculate distances from coordinate data extracted from the txt file
            %coordinates = csvread('UScapitals.csv');
            %distance = TSP_DE_distance_through_initial_coordinates(coordinates);
            %N = size(distance,1);
    % 6. Directly read distance of lower triangular matrix data extracted from the txt file
            % data = textread('abc.txt')';
            % distance = zeros(N, N);
            % index = 1;
            % for i = 1 : N
            %     for j = 1 : i
            %        distance(i,j) = data(index);
            %        index = index + 1;
            %        distance(j,i) = distance(i,j);
            %    end
            % end
            %disp(distance);

POP_SIZE = 100;
GENERATION = 100;
F = 0.4;

pop = [];
pop_fit = zeros(1, POP_SIZE); % Current population's objective values

offspring = zeros(POP_SIZE, N);
offspring_fit = zeros(1, POP_SIZE); % Offsprings' objective values

best = [];
best_fit = 1e9; % Objective value

show_iteration_every = 1000;

%text_x = max(coordinates(:,1)) * 0.15 + min(coordinates(:,1));
%text_y1 = max(coordinates(:,2)) * 0.85 + min(coordinates(:,2));
%text_y2 = max(coordinates(:,2)) * 0.9 + min(coordinates(:,2));
    
pop = zeros(POP_SIZE, N);
% Generate first population through the following 2 methods:
    % 1. Random generation
            pop = TSP_DE_generate_random_initial_population(POP_SIZE, distance);
    % 2. Greedy generation
            % pop = TSP_DE_generate_initial_population(POP_SIZE, distance);

for i = 1:POP_SIZE

    pop_fit(i) = TSP_DE_totaldistance(pop(i,:),distance);
    
    if pop_fit(i) < best_fit
        best_fit = pop_fit(i);
        best = pop(i, :);
    end
end

for gen = 0:GENERATION
    for ii = 1:POP_SIZE
        % Mutation
        k1 = randi([1, POP_SIZE-1]);
        k2 = randi([1, POP_SIZE-1]);
        k3 = randi([1, POP_SIZE-1]);
        while k2 == k1
            k1 = randi([1, POP_SIZE-1]);
        end
        F = 2 * rand();
        %v2 = pop(k3,:) + F * (pop(k1, :) - pop(k2, :));
        v2 = best + F * (pop(k1, :) - pop(k2, :));
        
        v22 = TSP_DE_real_to_int(v2)';

        % Crossover
        new_offspring = TSP_DE_crossover(pop(ii,:),v22,distance);
        offspring(ii,:) = new_offspring;
        
        % Fitness compulation
        offspring_fit(ii) = TSP_DE_totaldistance(offspring(ii,:),distance);
    end

    % Survival selection
    for iii = 1:POP_SIZE
        if pop_fit(iii) >= offspring_fit(iii)
            pop(iii,:) = offspring(iii, :);
            pop_fit(iii) = offspring_fit(iii);
        end

        if pop_fit(iii) < best_fit
            best_fit = pop_fit(iii);
            best = pop(iii, :);
        end
    end
    if mod(gen, 50) == 0
        fprintf('Generation %d, best objective = %f\n', gen, best_fit);
    end
    %{
    if rem(gen, show_iteration_every)== 0
       %fprintf('Generation %d, best objective = %f\n', gen, best_fit);
       clf;
       TSP_DE_display(coordinates, best, 'b');
       text(text_x, text_y1, num2str(best_fit),'FontWeight', 'bold');
       text(text_x, text_y2, num2str(gen),'FontWeight', 'bold');
       % for i = 1:N
       %    text(coordinates(i, 1), coordinates(i, 2), num2str(i), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom');
       % end
       title('Đường đi tối ưu giữa các thành phố sử dụng thuật toán DE');
       drawnow;
    end
    %}   
end
disp(best);