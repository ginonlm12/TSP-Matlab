function pop = TSP_DE_generate_initial_population(POP_SIZE, distance)

% Get number of cities
N = size(distance, 1);

% Initialize population matrix
pop = zeros(POP_SIZE, N);

% Loop over each individual in the population
for i = 1:POP_SIZE
    % Initialize list of visited cities
    visited = zeros(1, N);
    
    % Choose a random starting city
    current_city = i;
    
    % Add starting city to the path and mark it as visited
    pop(i, 1) = current_city;
    visited(current_city) = 1;
    
    % Loop over remaining cities in the path
    for j = 2:N
        A = distance(current_city, :) .* ~visited;
        %disp(A);
        [~, idx] = find(A==min(A(A>0)));
        %disp(min(A(A>0)));
        %disp(idx(1));
        next_city = idx(1);
        %next_city = idx(1);
        visited(next_city) = 1;
        pop(i, j) = next_city;
        current_city = next_city;
    end

end

end
