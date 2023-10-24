function new_offspring = TSP_DE_crossover(x,v, distance)

 N = numel(x);
 X = x;
 V = v;
 
 new_offspring = zeros(1,N);
 visited = zeros(1, N);
    
    current_city = X(1);
    %fprintf('current_city: ');
    %disp(current_city);
    
    new_offspring(1) = current_city;
    visited(current_city) = 1;
    
    x_current_val = X(1);
    v_current_val = X(1);
    next_city = 1;
    %fprintf('The chosen city: ');
    %disp(new_offspring(1));
        
    for j = 2:N 
        x_idx = find(X == x_current_val);
        %fprintf('x_idx: ');
        %disp(x_idx);
        x_next_val  = X(1+mod(x_idx, numel(X)));
        %fprintf('x_next_val: ');
        %disp(x_next_val);
        v_idx = find(V == v_current_val);
        %fprintf('v_idx: ');
        %disp(v_idx);
        v_next_val  = V(1+mod(v_idx, numel(V)));
        %fprintf('v_next_val: ');
        %disp(v_next_val);
        while visited(x_next_val) == 1 && visited(v_next_val) == 1
            x_current_val  = x_next_val;
            v_current_val  = v_next_val;
            x_idx = find(X == x_current_val);
            x_next_val  = X(1+mod(x_idx, numel(X)));
            v_idx = find(V == v_current_val);
            v_next_val  = V(1+mod(v_idx, numel(V)));
        end
        
        
        %X(x_current_val) = [];
        %V(v_current_val) = [];
        %fprintf('Updated X: ');
        %disp(X);
        %fprintf('Updated V: ');
        %disp(V);
        %fprintf('distance(%d,%d) :',x_current_val, x_next_val);
        %disp(distance(x_current_val,x_next_val));
        %fprintf('visited(%d): ', x_next_val);
        %disp(visited(x_next_val));
        %fprintf('distance(%d,%d)',v_current_val, v_next_val);
        %disp(distance(v_current_val,v_next_val));
        %fprintf('visited(%d): ', v_next_val);
        %disp(visited(v_next_val));
        if visited(x_next_val) == 0 && visited(v_next_val)==0
            if distance(x_current_val,x_next_val) >= distance(v_current_val,v_next_val)
                next_city = v_next_val;
            else
                next_city = x_next_val;
            end
        end
        if visited(x_next_val) == 1
            next_city = v_next_val;
        end
        if visited(v_next_val) == 1
            next_city = x_next_val;
        end
       
        %fprintf('next_city: ');
        %disp(next_city);
        
        visited(next_city) = 1;
        new_offspring(j) = next_city;
        current_city = next_city;
        x_current_val = next_city;
        v_current_val = next_city;
        
    end
    %fprintf('The chosen city: ');
    %disp(new_offspring);
end
