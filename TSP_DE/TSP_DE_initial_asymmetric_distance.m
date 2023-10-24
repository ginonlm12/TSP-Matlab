function distance = TSP_DE_initial_asymmetric_distance(N, LB, UB);
    rng('shuffle');
    distance = LB + rand(N, N)* (UB - LB);
    for i = 1 : N
        distance(i,i) = 100;
    end
    disp(distance);
end