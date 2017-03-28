%%READ ME
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            Developed by Nicholas Italiano, Manhattan College            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: 
% Maksing is creating a new image from one or more old images that have been preprocessed
% as layers. The layers should include 2 items; a (1) sample image and a
% (2)corresponding Masking.

%Inputs/Outputs:
% "Sample 20.JPG","Sample 21.... "Sample 30.JPG" as inputs 
% "Removal 20".JPG","Removal 21...."Removal 30.JPG" as outputs (New images)

% This script does the following processes using images named

%Functions:
%1)Import images (convert to grayscale and double precision)
%2)Import mask (convert to grayscale and double precision)
%3)Rename masks 
%4) Produce image w/o bark via elelement-wise matrix multiplication
%5) For-loop to display the 2-D pictures in order from

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%1)
%Import images (convert to grayscale and double precision)
image20 = im2double(rgb2gray(imread('Sample 20.JPG')));
image21 = im2double(rgb2gray(imread('Sample 21.JPG')));
image22 = im2double(rgb2gray(imread('Sample 22.JPG')));
image23 = im2double(rgb2gray(imread('Sample 23.JPG')));
image24 = im2double(rgb2gray(imread('Sample 24.JPG')));
image25 = im2double(rgb2gray(imread('Sample 25.JPG')));
image26 = im2double(rgb2gray(imread('Sample 26.JPG')));
image27 = im2double(rgb2gray(imread('Sample 27.JPG')));
image28 = im2double(rgb2gray(imread('Sample 28.JPG')));
image29 = im2double(rgb2gray(imread('Sample 29.JPG')));
image30 = im2double(rgb2gray(imread('Sample 30.JPG')));

%%
%2)
%Import mask (convert to grayscale and double precision)
image20mask = im2double(rgb2gray(imread('Sample 20(Mask).jpg')));
image21mask = im2double(rgb2gray(imread('Sample 21(Mask).jpg')));
image22mask = im2double(rgb2gray(imread('Sample 22(Mask).jpg')));
image23mask = im2double(rgb2gray(imread('Sample 23(Mask).jpg')));
image24mask = im2double(rgb2gray(imread('Sample 24(Mask).jpg')));
image25mask = im2double(rgb2gray(imread('Sample 25(Mask).jpg')));
image26mask = im2double(rgb2gray(imread('Sample 26(Mask).jpg')));
image27mask = im2double(rgb2gray(imread('Sample 27(Mask).jpg')));
image28mask = im2double(rgb2gray(imread('Sample 28(Mask).jpg')));
image29mask = im2double(rgb2gray(imread('Sample 29(Mask).jpg')));
image30mask = im2double(rgb2gray(imread('Sample 30(Mask).jpg')));
%%
%3)
%Rename masks 
outside20 = image20mask;
outside21 = image21mask;
outside22 = image22mask;
outside23 = image23mask;
outside24 = image24mask;
outside25 = image25mask;
outside26 = image26mask;
outside27 = image27mask;
outside28 = image28mask;
outside29 = image29mask;
outside30 = image30mask;

%%
%4)
% Produce image w/o bark via elelement-wise matrix multiplication

removal20 = outside20.*image20;
removal21 = outside21.*image21;
removal22 = outside22.*image22;
removal23 = outside23.*image23;
removal24 = outside24.*image24;
removal25 = outside25.*image25;
removal26 = outside26.*image26;
removal27 = outside27.*image27;
removal28 = outside28.*image28;
removal29 = outside29.*image29;
removal30 = outside30.*image30;

%%
%5)
% View new images( uses a for-loop to display the 2-D pictures in order from
% top to bottom as if traveling through a tree.)

% *Reel is key-activated,thus,press any key to continue

% (What to look for: view of pictures )
% Convert images to characters and input into array for for loop to index
% images
 imagecharArray=char('removal20.jpg','removal21.jpg','removal22.jpg','removal23.jpg','removal24.jpg','removal25.jpg','removal26.jpg','removal27.jpg','removal28.jpg','removal29.jpg','removal30.jpg');
 
% loop calls image based on index number of character index 
 
 for i=1:length(imagecharArray) 
     a=imread(imagecharArray(i,:)); 
     imagesc(a); colormap(gray);
     axis image
     axis off
     pause;
 end
 