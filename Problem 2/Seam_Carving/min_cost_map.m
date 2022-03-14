function min_cummulative_saliency_map = min_cost_map(saliency_map, direction)

[rows, columns] = size(saliency_map);

if strcmp(direction,'VERTICAL')
    M = zeros(rows,columns);
    M(1,:) = saliency_map(1,:);
    for i = 2: rows
        for j = 2: columns-1
            M(i,j) = saliency_map(i,j) + min([M(i-1,j-1), M(i-1,j), M(i-1,j+1)]);
        end
        M(i,1) = saliency_map(i,1) + min([M(i-1,1), M(i-1,2)]);
        M(i,columns) = saliency_map(i,columns) + min([M(i-1,columns), M(i-1,columns-1)]);
    end

else
    M(:,1) = saliency_map(:,1);
    for j = 2: columns
        for i = 2: rows-1   
            M(i,j) = saliency_map(i,j) + min([M(i-1,j-1), M(i,j-1), M(i+1,j-1)]);
        end
        M(1,j) = saliency_map(1,j) + min([M(1,j-1), M(2,j-1)]);
        M(rows,j) = saliency_map(rows,j) + min([M(rows-1,j-1), M(rows,j-1)]);
     end
end

min_cummulative_saliency_map = M;
end