function [selected, fittest] = TSP_GA_selection(SELECTION_SIZE, pers, fitnesses)
    selected(SELECTION_SIZE) = 0;
    MAX = max(fitnesses); 
    fittest = 1;
    for i = 1 : SELECTION_SIZE
        [M, I] = min(fitnesses);
        selected(i) = I;
        fitnesses(I) = MAX;
    end;
end