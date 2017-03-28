load Mask_Processed.mat
%%
%Resized image 3 and 4
i3 = imresize(Mask_img3,0.10);
i4 = imresize(Mask_img4,0.10);

%%

%Create morphological structuring element
se = strel('ball',11,1); %strel(shape, parameters) creates a structuring element, SE, of the type specified by shape.

%%

clear Mask_img1 Mask_img2 Mask_img3 Mask_img4 Mask_img5 Mask_img6 Mask_img7 Mask_img8 Mask_img9 Mask_img10 Mask_img11
%%

%Erode images
erodedBW = imerode(i3,se); %erode image 3
% figure
% imshow(erodedBW)
erodedBW1 = imerode(erodedBW, se); %erode eroded image of 3
% figure
%imshow(erodedBW1)

erodedBW2 = imerode(i4, se);%erode image 4
% figure
% imshow(erodedBW2)

%%

%Create Volume
Vi = zeros(701,701,5);
Vi(:,:,1) = i3;
Vi(:,:,2) = erodedBW;
Vi(:,:,3) = erodedBW1;
Vi(:,:,4) = erodedBW2;
Vi(:,:,5) = i4;

%%
%Create Slices
figure
colormap(gray);
contourslice(Vi,[],[],[1 2 3 4 5],2);
view(3);
axis tight


%%
%3D Model of slices
figure
V = smooth3(Vi);

hiso1 = patch(isosurface(V,5),...
   'FaceColor',[1,.75,.65],...
   'EdgeColor','none');
   isonormals(V,hiso1)


%%
%Lighting
lightangle(45,30);
lighting gouraud
%hcap.AmbientStrength = 0.6;
hiso1.SpecularColorReflectance = 0;
hiso1.SpecularExponent = 50;


%%
view(35,30)
axis tight
% no axis
axis off

%%
% Example of using CaptureFigVid
% Cheers, Dr. Alan Jennings, Research assistant professor, 
% Department of Aeronautics and Astronautics, Air Force Institute of Technology

%% Set up 3D plot to record
figure(4);
clf;
surf(erodedBW,'EdgeColor','none','FaceColor','interp','FaceLighting','phong')
daspect([1,1,.3]);
axis tight;
axis off;

%% Rotate 3D plot
%% Set up recording parameters (optional), and record
OptionZ.FrameRate=15;
OptionZ.Duration=30;
OptionZ.Periodic=true;
CaptureFigVid([-20,30;-110,30;-190,30;-290,30;-380,30], 'WellMadeVid',OptionZ)