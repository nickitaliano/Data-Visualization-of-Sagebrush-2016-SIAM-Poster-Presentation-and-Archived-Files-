%%
%Import Mike's images (convert to grayscale and double precision)

image1 = im2double(rgb2gray(imread('HG30-01b paint  232-0151 arrow(cropped).JPG')));
image2 = im2double(rgb2gray(imread('HG30-01b paint  232-0151 arrow(cropped).JPG')));
image3 = im2double(rgb2gray(imread('HG30-01b paint  232-0151 arrow(cropped).JPG')));
image4 = im2double(rgb2gray(imread('HG30-01b paint  232-0151 arrow(cropped).JPG')));
image1 = im2double(rgb2gray(imread('HG30-01b paint  232-0151 arrow(cropped).JPG')));
image1 = im2double(rgb2gray(imread('HG30-01b paint  232-0151 arrow(cropped).JPG')));
image1 = im2double(rgb2gray(imread('HG30-01b paint  232-0151 arrow(cropped).JPG')));
image1 = im2double(rgb2gray(imread('HG30-01b paint  232-0151 arrow(cropped).JPG')));
image1 = im2double(rgb2gray(imread('HG30-01b paint  232-0151 arrow(cropped).JPG')));
image1 = im2double(rgb2gray(imread('HG30-01b paint  232-0151 arrow(cropped).JPG')));
image1 = im2double(rgb2gray(imread('HG30-01b paint  232-0151 arrow(cropped).JPG')));

image1mask = im2double(rgb2gray(imread('Mask1.JPG')));
image1mask = im2double(rgb2gray(imread('Mask2.JPG')));
image1mask = im2double(rgb2gray(imread('Mask3.JPG')));
image1mask = im2double(rgb2gray(imread('Mask4.JPG')));
image1mask = im2double(rgb2gray(imread('Mask5.JPG')));
image1mask = im2double(rgb2gray(imread('Mask6.JPG')));
image1mask = im2double(rgb2gray(imread('Mask7.JPG')));
image1mask = im2double(rgb2gray(imread('Mask8.JPG')));
image1mask = im2double(rgb2gray(imread('Mask9.JPG')));
image1mask = im2double(rgb2gray(imread('Mask10.JPG')));
% image1mask = im2double(rgb2gray(imread('Mask11.JPG'))); (No mask 11?)
%%
% Resize images for computational efficiency
image1Matrix = imresize(image1,0.1);
image2Matrix = imresize(image2,0.1);
image3Matrix = imresize(image3,0.1);
image4Matrix = imresize(image4,0.1);
image5Matrix = imresize(image5,0.1);
image6Matrix = imresize(image6,0.1);
image7Matrix = imresize(image7,0.1);
image8Matrix = imresize(image8,0.1);
image9Matrix = imresize(image9,0.1);
image10Matrix = imresize(image19,0.1);
% image11Matrix = imresize(image11,0.1);

%% 
% Resize and mask for computational efficiency
image1maskMatrix = imresize(image1mask ,0.1);
image2maskMatrix = imresize(image2mask ,0.1);
image3maskMatrix = imresize(image3mask ,0.1);
image4maskMatrix = imresize(image4mask ,0.1);
image5maskMatrix = imresize(image5mask ,0.1);
image6maskMatrix = imresize(image6mask ,0.1);
image7maskMatrix = imresize(image6mask ,0.1);
image8maskMatrix = imresize(image8mask ,0.1);
image9maskMatrix = imresize(image9mask ,0.1);
image10maskMatrix = imresize(image10mask ,0.1);
% image1maskMatrix = imresize(image11mask ,0.1);

%%
% Create image w/o bark (done two ways to check difference)
maskedImage1 = image1Matrix.*image1maskMatrix;
maskedImage2 = image1maskMatrix.*image1Matrix;
maskedImage3 = image1maskMatrix.*image1Matrix;
maskedImage4 = image1maskMatrix.*image1Matrix;
maskedImage5 = image1maskMatrix.*image1Matrix;
maskedImage6 = image1maskMatrix.*image1Matrix;
maskedImage7 = image1maskMatrix.*image1Matrix;
maskedImage8 = image1maskMatrix.*image1Matrix;
maskedImage9 = image1maskMatrix.*image1Matrix;
maskedImage10 = image1maskMatrix.*image1Matrix;
% maskedImage11 = image1maskMatrix.*image1Matrix;


%%
% View results (for one image matrix)
figure
title('Big Sagebrush Images w/o bark (Masks, New Images, and Image difference')
subplot(1,5,1)
imagesc(image1Matrix ); colormap(gray);
xlabel('HG30 Image')
subplot(1,5,2)
imagesc(image1maskMatrix); colormap(gray);
xlabel('HG30 Mask')
subplot(1,5,3)
imagesc(maskedImage1); colormap(gray)
xlabel('HG22 Masked Image method 1')
subplot(1,5,4)
imagesc(maskedImage2); colormap(gray);
xlabel('HG22 Masked Image method 2')
subplot(1,5,5)
imagesc(maskedDifference); colormap(gray);
xlabel('Difference between masked images')
