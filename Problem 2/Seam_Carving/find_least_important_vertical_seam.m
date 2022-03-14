function vertical_seam = find_least_important_vertical_seam(cost_saliency_map)

[rows, columns] = size(cost_saliency_map);

vertical_seam = zeros(rows,1);
[~, index] =  min(cost_saliency_map(rows,:));
vertical_seam(rows) = index;

for i = rows-1:-1:1
    if index == columns
        [~,k] = min([cost_saliency_map(i,columns-1), cost_saliency_map(i,columns)]); 
    elseif index == 1
        [~,k] = min([cost_saliency_map(i,1),cost_saliency_map(i,2)]);
        k = k+1;
    else
        [~,k] =  min([cost_saliency_map(i,vertical_seam(i+1)-1),cost_saliency_map(i,vertical_seam(i+1)), cost_saliency_map(i,vertical_seam(i+1)+1)]); 
    end
    if k == 3
        index = vertical_seam(i+1)+1;
    elseif k == 2
        index = vertical_seam(i+1);
    elseif k == 1 
       index = vertical_seam(i+1)-1;
    end
    vertical_seam(i)=index;
end
end