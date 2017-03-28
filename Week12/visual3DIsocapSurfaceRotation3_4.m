%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File Information
% i. Description
% ii. Image Processing/Morphing Functions
% iii. Movie Functions(code obtained from Mathworks FileExchange)

% i. Description:
% 1)Inputs two sample images,e.g., "i3"& "i4"; 
% 2)creates 3D structure V to contain two original layers and several new layers; 
% 3)morphs layers to create accurate illustration of surface using functions 
% imdilate() and imerode() 
% 4)outputs a .avi of the surfaces rotation around the
% z-axis to be used in PowerPoint
% *Folder must also include 'Mask_Processed.mat' and 'CaptureFigVid.m' to execute script*

% ii. Image Processing/Morphing Functions:
%
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
% Option can be specified.

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
% Load Files
load Mask_Processed.mat

% Resized image 3 and 4
i3 = imresize(Mask_img3,0.10);
i4 = imresize(Mask_img4,0.10);


% Create morphological structuring element
se = strel('ball',11,1); %strel(shape, parameters) creates a structuring element, SE, of the type specified by shape.


% Clear images for efficiency
clear Mask_img1 Mask_img2 Mask_img3 Mask_img4 Mask_img5 Mask_img6 Mask_img7 Mask_img8 Mask_img9 Mask_img10 Mask_img11


% Erode images
erodedBW = imerode(i3,se); %erode image 3
% figure
% imshow(erodedBW)
erodedBW1 = imerode(erodedBW, se); %erode eroded image of 3
% figure
%imshow(erodedBW1)

erodedBW2 = imerode(i4, se);%erode image 4
% figure
% imshow(erodedBW2)


% Create Volume
Vi = zeros(701,701,5);
Vi(:,:,1) = i3;
Vi(:,:,2) = erodedBW;
Vi(:,:,3) = erodedBW1;
Vi(:,:,4) = erodedBW2;
Vi(:,:,5) = i4;


% Create Slices
figure
colormap(gray);
contourslice(Vi,[],[],[1 2 3 4 5],2);
view(3);
axis tight


% 3D Model of slices
figure
V = smooth3(Vi);

hiso1 = patch(isosurface(V,5),...
   'FaceColor',[1,.75,.65],...
   'EdgeColor','none');
   isonormals(V,hiso1)


% Lighting
lightangle(45,30);
lighting gouraud
%hcap.AmbientStrength = 0.6;
hiso1.SpecularColorReflectance = 0;
hiso1.SpecularExponent = 50;


view(35,30)
axis tight
% no axis
axis off

% Example of using CaptureFigVid

% Set up 3D plot to record
%figure(4);
clf;
surf(erodedBW,'EdgeColor','none','FaceColor','interp','FaceLighting','phong')
daspect([1,1,.3]);
axis tight;
axis off;

% Set up recording parameters (optional), and record
OptionZ.FrameRate=15;
OptionZ.Duration=30;
OptionZ.Periodic=true;
CaptureFigVid([-20,10;-110,10;-190,10;-290,10;-380,10], '3Drotation1',OptionZ)