%%READ ME
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            Developed by Nicholas Italiano, Manhattan College            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The script features RGB component extraction 
%
% Dear User,
%
%
%
%  Input/Output:
%      1)
%
% Note:  
% 
% Best of luck user!
%
%                                                     -Nick
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
% Read in Mike's work (images edited with photoshop) 
image1 = im2double(imread('HG20-01b paint(Barkified) - arrow.JPG'));
image2 = im2double(imread('HG20-01b paint(No Fill) - arrow.JPG'));
image3 = im2double(imread('HG22 Paint crop - arrow(cropped).JPG'));

% Rescale by a factor of 10 for computational efficiency
Scale = .1;
i1 = imresize(image1,Scale);
i2 = imresize(image2,Scale);
i3 = imresize(image3,Scale);

% View imported/resized images
figure
imagesc(i1); colormap(gray);
title('HG20-01b paint(Barkified)')
figure
imagesc(i2); colormap(gray);
title('HG20-01b paint(No Fill)')
figure
imagesc(i3); colormap(gray);
title('HG22 Paint crop - arrow(cropped)')

