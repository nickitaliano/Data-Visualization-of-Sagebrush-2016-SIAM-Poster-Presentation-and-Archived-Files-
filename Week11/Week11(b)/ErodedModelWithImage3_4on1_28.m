load SaveImage.mat i3 i4

%%

%Resized image 3 and 4
i3 = imresize(Mask_img3,0.10);
i4 = imresize(Mask_img4,0.10);

%%

%Create morphological structuring element
se = strel('disk',1); %strel(shape, parameters) creates a structuring element, SE, of the type specified by shape.

%%

%Erode images
erodedBW2 = imerode(i3,se); 
erodedBW3 = imerode(erodedBW2, se); 
erodedBW4 = imerode(erodedBW3, se); 
erodedBW5 = imerode(erodedBW4, se); 
erodedBW6 = imerode(erodedBW5, se); 
erodedBW7 = imerode(erodedBW6, se); 
erodedBW8 = imerode(erodedBW7, se); 
erodedBW9 = imerode(erodedBW8, se); 

%%
erodedBW17 = imerode(i4, se);
erodedBW16 = imerode(erodedBW17, se);
erodedBW15 = imerode(erodedBW16, se);
erodedBW14 = imerode(erodedBW15, se);
erodedBW13 = imerode(erodedBW14, se);
erodedBW12 = imerode(erodedBW13, se);
erodedBW11 = imerode(erodedBW12, se);
erodedBW10 = imerode(erodedBW11, se);

%%

%Create Volume
Vi = zeros(701,701,16);
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
Vi(:,:,16) = i4;

%%
%Create Slices
figure
colormap(gray);
contourslice(Vi,[],[],[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16],2);
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
