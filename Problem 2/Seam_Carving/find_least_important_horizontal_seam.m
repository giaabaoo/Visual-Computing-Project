function horizontal_seam = find_least_important_horizontal_seam(cost_saliency_map)
[rows, columns] = size(cost_saliency_map);

horizontal_seam = zeros(1,columns);
[~, index] =  min(cost_saliency_map(:,columns));
horizontal_seam(columns) = index;

% iterate from cols-1 to 1
for i = columns-1:-1:1
    if index == rows
        [~,k] = min([cost_saliency_map(rows,i),cost_saliency_map(rows-1,i)]); 
    elseif index == 1
        [~,k] = min([cost_saliency_map(1,i),cost_saliency_map(2,i)]); 
        k = k+1;
    else
        [~,k] =min([cost_saliency_map(horizontal_seam(i+1),i),cost_saliency_map(horizontal_seam(i+1)-1,i), cost_saliency_map(horizontal_seam(i+1)+1,i)]);    
    end
    if k == 3
        index = horizontal_seam(i+1)+1;
    elseif k == 2
        index = horizontal_seam(i+1);
    elseif k == 1 
       index = horizontal_seam(i+1)-1;
    end
    horizontal_seam(i)=index;
    
end
end