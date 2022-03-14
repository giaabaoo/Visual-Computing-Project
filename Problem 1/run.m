clear all
close all
clc

tic

% Set bilateral filter parameters.
w     = 5;       % bilateral filter half-width
sigma = [3 0.1]; % bilateral filter standard deviations

% Create waitbar.
h = waitbar(0,'Applying bilateral filter on depth images with color images...');
set(h,'Name','Bilateral Filter Progress');

imagefiles = dir('RGBD Data/*.png');      
nfiles = length(imagefiles);    % Number of files found
for ii=1:nfiles
    currentfilenameonly = imagefiles(ii).name;
    currentfilename = strcat('RGBD Data/', imagefiles(ii).name);
    if ~contains(currentfilename, "depth")
        rgb_img = imread(currentfilename);
        currentdepthfilename = strrep(currentfilename,'.png','_depth.png')
        depth_img = imread(currentdepthfilename);
        new_depth_img = jbfilter2(im2double(depth_img), im2double(rgb_img),w,  sigma);
        
        % Display grayscale depth image and output filtered depth image
        figure(1); clf;
        %set(gcf,'Name','Grayscale Bilateral Filtering Results');
       % subplot(1,2,1); 
        %imagesc(depth_img);
        %axis image; colormap gray;
        %title('Input Image');
        %subplot(1,2,2); 
        imagesc(new_depth_img);
        axis image; colormap gray;
        title('Result of Bilateral Filtering');
        saveas(gcf, strcat('Denoise Data/', strrep(currentfilenameonly, '.png', strcat('_depth_denoise','.png'))))
    end
    waitbar(ii/nfiles);
end

% Close waitbar.
close(h);

toc