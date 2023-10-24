data = csvread('data.csv');
coordinates = csvread('gr666.csv');
fprintf('DE: \n');
distance = TSP_DE_distance_through_initial_coordinates(coordinates);
fitness = TSP_DE_totaldistance(data, distance);
disp(fitness);
fprintf('---------------------------------------------------------\n');
fprintf('GA: \n');
fitness = TSP_GA_fitness(coordinates, data);
disp(fitness);