function [im] = importance_map(img)
    img = rgb2gray(img)
    [height, width, c] = size(img);
    im = zeros(height, width);
    
    for i = 2:(height - 1)
        for j = 2:(width - 1)
            vertical_sum = abs(img((i-1),j) - img(i,j)) + abs(img((i+1),j) - img(i,j));
            horizontal_sum = abs(img(i,j-1) - img(i,j)) + abs(img(i,j+1) - img(i,j));
            im(i,j) = vertical_sum + horizontal_sum;
        end
    end
end

