function new_per = TSP_GA_individual_recombination(per1, per2)
    len = length(per2);
    s = find(per1==per2(1));
    d = find(per1==per2(2));

    if (s < d)
        new_per(1:d-s+1)=per1(s:d);
    else
        new_per(1:len-s+1)=per1(s:len);
        new_per(len-s+2:len-s+d+1)=per1(1:d);
    end   
    tmp_per = per2(3:len);

    repetitives = ismember(tmp_per, new_per);
    
    index = length(new_per)+1;
    for i = 1 : length(tmp_per)
        if (~repetitives(i))
            new_per(index) = tmp_per(i);
            index = index + 1;
        end
    end
end