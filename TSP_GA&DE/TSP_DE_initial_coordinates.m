function [coordinates, distance] = initial_coordinates(N, LB, UB)
    distance = zeros(N,N);
    
    rng('shuffle');
    coordinates = rand(N, 2);

    coordinates(:, 1) = LB + (UB-LB)* (coordinates(:, 1));
    coordinates(:, 2) = LB + (UB-LB)* (coordinates(:, 2)); 
    
    fprintf('Coordinates: \n');
    disp(coordinates);
    
    %{
    plot(coordinates(:, 1), coordinates(:, 2), 'o');
    xlabel('X');
    ylabel('Y');
    title('Tọa độ các thành phố');
    %}

    for i = 1:N
        for j = 1:i-1
            distance(i,j) = sqrt((coordinates(i, 1)- coordinates(j, 1))^2+(coordinates(i, 2)- coordinates(j, 2))^2);
            distance (j,i) = distance(i,j);
        end
        distance(i,i)=0;
    end
    
    fprintf('Distance: \n');
    disp(distance);
end
