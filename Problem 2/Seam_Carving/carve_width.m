function [new_rgb_image,new_salient_image] = carve_width(im, saliency_map)

cost_saliency_map = min_cost_map(saliency_map, 'VERTICAL');
vertical_seam = find_least_important_vertical_seam(cost_saliency_map);

[rows,columns] = size(saliency_map);

new_rgb_image = zeros(rows, columns-1, 3);

for i = 1:rows
   
    new_rgb_image(i, 1:vertical_seam(i)-1,:) = im(i,1:vertical_seam(i)-1,:);
    new_rgb_image(i,vertical_seam(i):columns-1,:) = im(i,vertical_seam(i)+1:columns,:);
end
new_rgb_image = uint8(new_rgb_image);
new_salient_image = energy_image(new_rgb_image);

end