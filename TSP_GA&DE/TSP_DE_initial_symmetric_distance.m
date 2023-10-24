function distance = TSP_DE_initial_symmetric_distance(N, LB, UB);
    rng('shuffle');
    distance = LB + rand(N, N)* (UB - LB);
    for i = 1 : N
        for j = 1 : i
            distance(i,j) = distance(j,i);
        end
    end
    for i = 1 : N
        distance(i,i) = 0;
    end
    fprintf('Distance: \n');
    disp(distance);
end