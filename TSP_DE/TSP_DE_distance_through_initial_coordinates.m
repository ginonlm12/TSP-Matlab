function distance = TSP_DE_distance_through_initial_coordinates(coordinates)
    % fprintf('Coordinates: \n');
    % disp(coordinates);
    
    N = size(coordinates,1);
    distance = zeros(N,N);
    for i = 1:N
        for j = 1:i-1
            distance(i,j) = sqrt((coordinates(i, 1)- coordinates(j, 1))^2+(coordinates(i, 2)- coordinates(j, 2))^2);
            distance (j,i) = distance(i,j);
        end
        distance(i,i)=0;
    end
    
    % fprintf('Distance: \n');
    % disp(distance);
end
