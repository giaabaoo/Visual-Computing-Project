function [new_rgb_image,new_salient_image] = carve_height(im, saliency_map)

cost_map = min_cost_map(saliency_map, 'HORIZONTAL');
horizontal_seam = find_least_important_horizontal_seam(cost_map);

[rows,columns] = size(saliency_map);

new_rgb_image = zeros(rows-1, columns, 3);

for i = 1:columns
    new_rgb_image(1:horizontal_seam(i)-1,i,:) = im(1:horizontal_seam(i)-1,i,:);
    new_rgb_image(horizontal_seam(i):rows-1,i,:) = im(horizontal_seam(i)+1:rows,i,:);  
end
 new_rgb_image = uint8(new_rgb_image);
 new_salient_image = energy_image(new_rgb_image);

end