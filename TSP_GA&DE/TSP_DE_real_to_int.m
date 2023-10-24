function int_vec = TSP_DE_real_to_int(real_vec)
    % Sắp xếp các giá trị của real_vec theo thứ tự tăng dần
    [~, index] = sort(real_vec, 'ascend');
    
    % Chuyển đổi vị trí của giá trị trong real_vec thành số nguyên từ 1 đến n
    % (n là số lượng phần tử của real_vec)
    int_vec(index) = 1:length(real_vec);
    
    % Trả về vector số nguyên kết quả
    int_vec = int_vec';
end