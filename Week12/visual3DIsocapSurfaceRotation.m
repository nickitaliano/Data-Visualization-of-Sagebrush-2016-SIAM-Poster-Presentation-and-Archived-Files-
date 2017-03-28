%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File Information
% i. Description
% ii. Interpolation/Morphing Functions
% iii. Movie Functions(code obtained from Mathworks FileExchange)

% i. Description:
% 1)Inputs two sample images,e.g., "i3"& "i4" or 3 &4 
% 2)Interpolates between sample images to produce the "i3p5" layer which gives
% new image data (a 3.5 that is halfway between 3 &4 ) for the volume by 3d interpolation 
% (stored in structure Vf)
% 3)morphs layers 3 to 3.5 to create accurate illustration of surface using functions 
% imdilate() and imerode()
% 4)creates 3D structure Vi to contain two original layers and several new layers; 
% 5)Create movie; output a .avi of the surfaces rotation around the
% z-axis to be used in PowerPoint
% *Folder must also include 'resize.mat',' SaveImage.mat' and 'CaptureFigVid.m' to execute script*

% ii. Interpolation/Morphing Functions:
% interp3- interpolate a new 3d array from an original sample array, scaling
% parameters and new coordinates using a meshgrid (and corresponding
% meshgrid function)
% strel()- creates a structuring element, SE, of the type specified by shape.
% imerode()- horizontally shrinks expands array of image data to along x-axis specified parameter
% imdilate()- horizontally expands array of image data along x-axis to specified parameter
% contourslice()- returns countourslice of image slices 
% view()- dimensional view of current figure (3d in this case)
% smooth3()- creates volume from countourslice
% patch()- applies isosurface parameters to volume
% lightangle()- create lighting conditions
% lighting()- specify lighting algortihm used
% hcap.AmbientStrength()- paramater for effect of light source on object 
% hiso1.SpecularColorReflectance()- paramater for visualizing reflection of
% surface parameters
% hiso1.SpecularExponent()- calculates color reflectance

% iii. Movie Functions:
% CaptureFigVid- Captures a video of the 3D plot in 
% the current axis as it rotates based on ViewZ and saves it as 'FileName.mpg'. 
% (Option can be specified.)
% *CaptureFigVid(ViewZ, FileName,OptionZ)*
% >ViewZ- N-rows with 2 columns, each row are the view angles in degrees, 
% First column is azimuth (pan), Second is elevation (tilt) values outside of 
% 0-360 wrap without error, 
% *If a duration is specified, angles are used as nodes and views are equally 
% spaced between them (other interpolation could be implemented, if someone feels 
% so ambitious). 
% *If only an initial and final view is given, and no duration, then the default
% is 100 frames. 
% >FileName- Name of the file of the produced animation. Because I wrote the program,
% (I get to pick my default of mpg-4, and the file extension .mpg will be appended, 
% even if the filename includes another file extension. File is saved in
% the working directory.)
% (OptionZ)- Optional input to specify parameters. The ones I use are given below.
% Feel free to add your own. Any or all fields can be used 
% OptionZ.FrameRate- Specify the frame rate of the final video (e.g. 30;) 
% OptionZ.Duration- Specify the length of video in seconds (overrides spacing
% of view angles) (e.g. 3.5;) 
% OptionZ.Periodic- Logical to indicate if the video should be periodic. Using 
% this removed the final view so that when the video repeats the initial and final
% view are not the same. Avoids having to find the interval between view angles. 
% (e.g. true;)
% 
% % % % Example (shown in published results, video attached) % % % % 
% figure(171);clf; 
% surf(peaks,'EdgeColor','none','FaceColor','interp','FaceLighting','phong') 
% daspect([1,1,.3]);axis tight; 
% OptionZ.FrameRate=15;OptionZ.Duration=5.5;OptionZ.Periodic=true; 
% CaptureFigVid([-20,10;-110,10;-190,80;-290,10;-380,10], 'WellMadeVid',OptionZ)

% Source:
% (https://www.mathworks.com/matlabcentral/fileexchange/41093-create-video-of-rotating-3d-plot

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
clc
%1)Load data
load resize 
load SaveImage


% 2)interp3
% Create 3D array
Vf = zeros(701,701,4);
Vf(:,:,1) = i2;
Vf(:,:,2) = i3;
Vf(:,:,3) = i4;
Vf(:,:,4) = i5;

N=701;
% Sample
[Xs,Ys,Zs] = meshgrid(1:1:N, 1:1:N, 1:1:4);

% Output
[Xo,Yo,Zo] = meshgrid(1:1:N, 1:1:N, 1:.5:4);
interpolated_images= interp3(Xs,Ys,Zs,Vf,Xo,Yo,Zo,'cubic');

% New bisecting layer in between samples 3 &4
figure()
colormap(gray);
contourslice(interpolated_images,[],[],[2 3 4 5],3);
view(3);
axis tight 
i3p5 = interpolated_images(:,:,4);


% 3)Create morphological structuring element
se = strel('disk',1); %strel(shape, parameters) creates a structuring element, SE, of the type specified by shape.

% Erode images
erodedBW2 = imerode(i3,se); 
erodedBW3 = imerode(erodedBW2, se); 
erodedBW4 = imerode(erodedBW3, se); 
erodedBW5 = imerode(erodedBW4, se); 
erodedBW6 = imerode(erodedBW5, se); 
erodedBW7 = imerode(erodedBW6, se); 
erodedBW8 = imerode(erodedBW7, se); 
erodedBW9 = imerode(erodedBW8, se); 
erodedBW10 = imerode(erodedBW9 , se);
erodedBW11 = imerode(erodedBW10, se);
erodedBW12 = imdilate(erodedBW11, se);
erodedBW13 = imdilate(erodedBW12, se);
erodedBW14 = imdilate(erodedBW13, se);
erodedBW15 = imdilate(erodedBW14, se);
erodedBW16 = imdilate(erodedBW15,se);
erodedBW31 = imdilate(i3p5, se);
erodedBW30 = imdilate(erodedBW31, se);
erodedBW29 = imdilate(erodedBW30, se);
erodedBW28 = imdilate(erodedBW29, se);
erodedBW27 = imdilate(erodedBW28, se);
erodedBW26 = imdilate(erodedBW27, se);
erodedBW25 = imdilate(erodedBW26, se);
erodedBW24 = imdilate(erodedBW25, se);
erodedBW23 = imdilate(erodedBW24, se);
erodedBW22 = imdilate(erodedBW23, se);
erodedBW21 = imdilate(erodedBW22, se);
erodedBW20 = imdilate(erodedBW21, se);
erodedBW19 = imdilate(erodedBW20, se);
erodedBW18 = imdilate(erodedBW19, se);
erodedBW17 = imdilate(erodedBW18,se);

%Create Volume
Vi = zeros(701,701,30);
Vi(:,:,1) = i3;
Vi(:,:,2) = erodedBW2;
Vi(:,:,3) = erodedBW3;
Vi(:,:,4) = erodedBW4;
Vi(:,:,5) = erodedBW5;
Vi(:,:,6) = erodedBW6;
Vi(:,:,7) = erodedBW7;
Vi(:,:,8) = erodedBW8;
Vi(:,:,9) = erodedBW11;
Vi(:,:,10) = erodedBW12;
Vi(:,:,11) = erodedBW13;
Vi(:,:,12) = erodedBW14;
Vi(:,:,13) = erodedBW15;
Vi(:,:,14) = erodedBW16;
Vi(:,:,15) = erodedBW17;
Vi(:,:,16) = erodedBW18;
Vi(:,:,17) = erodedBW19;
Vi(:,:,18) = erodedBW20;
Vi(:,:,19) = erodedBW21;
Vi(:,:,20) = erodedBW22;
Vi(:,:,21) = erodedBW23;
Vi(:,:,22) = erodedBW24;
Vi(:,:,23) = erodedBW25;
Vi(:,:,24) = erodedBW26;
Vi(:,:,25) = erodedBW27;
Vi(:,:,26) = erodedBW28;
Vi(:,:,27) = erodedBW29;
Vi(:,:,28) = erodedBW30;
Vi(:,:,29) = erodedBW31;
Vi(:,:,30) = i3p5;

% Erode images and create volume(2)
% erode bottom 1/2 of slice
erodedBW2 = imerode(i3,se); 
erodedBW3 = imerode(erodedBW2, se); 
erodedBW4 = imdilate(erodedBW3, se); 
erodedBW5 = imerode(i3p5,se);

% Erode top 1/2 
erodedBW9 = imerode(i4,se);
erodedBW8 = imerode(erodedBW9, se); 
erodedBW7 = imdilate(erodedBW8, se); 
erodedBW6 = imerode(i3p5,se);

Vi = zeros(701,701,10);
Vi(:,:,1) = i3;
Vi(:,:,2) = erodedBW2;
Vi(:,:,3) = erodedBW3;
Vi(:,:,4) = erodedBW4;
Vi(:,:,5) = erodedBW5;
Vi(:,:,6) = erodedBW6;
Vi(:,:,7) = erodedBW7;
Vi(:,:,8) = erodedBW8;
Vi(:,:,9) = erodedBW9;
Vi(:,:,10) = i4;

% index 1 half slice
Vy = zeros(701,701,17);
Vy(:,:,1) = erodedBW15;
Vy(:,:,2) = erodedBW16;
Vy(:,:,3) = erodedBW17;
Vy(:,:,4) = erodedBW18;
Vy(:,:,5) = erodedBW19;
Vy(:,:,6) = erodedBW20;
Vy(:,:,7) = erodedBW21;
Vy(:,:,8) = erodedBW22;
Vy(:,:,9) = erodedBW23;
Vy(:,:,10) = erodedBW24;
Vy(:,:,11) = erodedBW25;
Vy(:,:,12) = erodedBW26;
Vy(:,:,13) = erodedBW27;
Vy(:,:,14) = erodedBW28;
Vy(:,:,15) = erodedBW29;
Vy(:,:,16) = erodedBW30;
Vy(:,:,17) = erodedBW31;


% 4)Apply Isocaps
% Create Slices
figure()
colormap(gray);
contourslice(Vi,[],[],[15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30],2);
view(3);
axis tight
axis off

%3D Model of slices
figure
V = smooth3(Vy);

hiso1 = patch(isosurface(V,5),...
   'FaceColor',[1,.75,.65],...
   'EdgeColor','none');
   isonormals(V,hiso1)

%Lighting
lightangle(45,30);
lighting gouraud
%hcap.AmbientStrength = 0.6;
hiso1.SpecularColorReflectance = 0;
hiso1.SpecularExponent = 50;


view(35,30)
axis tight
axis off

% 5)Record Movie
% Set up 3D plot to record
figure(4);
clf;
surf(erodedBW9,'EdgeColor','none','FaceColor','interp','FaceLighting','phong')
daspect([1,1,.3]);
axis tight;
axis off;

% Set up recording parameters (optional), and record
OptionZ.FrameRate=15;
OptionZ.Duration=30;
OptionZ.Periodic=true;
CaptureFigVid([-20,30;-110,30;-190,30;-290,30;-380,30], '3DRotationMov0',OptionZ)
% *change filename to produce new movie*