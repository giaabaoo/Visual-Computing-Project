clear all
close all
clc

%% Seam carving with Frequency Tuned Saliency Detection method of Achanta et al importance map
tic

% img = imread(fullfile(matlabdrive, 'Problem 2', 'Data', 'ud2.jpg'))
img = imread('sample.png')

disp(size(img))
figure,imshow(img)

sm = saliency_map(img)
figure,imshow(sm, [])
saveas(gcf, strcat('sample', '_saliency_map.jpg'))


[height, width] = size(sm)
new_height = 70
new_width = 70

%% Image resizing based on seam carving
for i = 1:new_width
   [img, sm] = carve_width(img,sm);
end
figure,imshow(img);
disp(size(img))

% for i = 1:new_height
%    [img, sm] = carve_height(img,sm);
% end
% 
% figure,imshow(img);
% disp(size(img))
saveas(gcf, strcat('sample', '_saliency_map_resize70.jpg'))
toc
%% Image resizing based on sorting values

% height_values = sum(im')
% width_values = sum(im)

% [~, ind1] = sort(height_values)
% [~, ind2] = sort(width_values)
% img(ind1(1:height - new_height),:,:) = []
% figure,imshow(img)
 
% img(:,ind2(1:width-new_width),:) = []
% figure,imshow(img)

