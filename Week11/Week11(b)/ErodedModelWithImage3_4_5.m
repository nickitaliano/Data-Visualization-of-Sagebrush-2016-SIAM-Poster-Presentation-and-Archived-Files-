load Mask_Processed.mat
%%
%Resized image 3, 4, and 5
i3 = imresize(Mask_img3,0.10);
i4 = imresize(Mask_img4,0.10);
% figure
i5 = imresize(Mask_img5,0.10);
% imshow(i5)
% figure
% imshow(i4)
% figure
% imshow(i3)
%%
clear Mask_img1 Mask_img2 Mask_img3 Mask_img4 Mask_img5 Mask_img6 Mask_img7 Mask_img8 Mask_img9 Mask_img10 Mask_img11
%%
%Create morphological structuring element
se = strel('disk',11); %strel(shape, parameters) creates a structuring element, SE, of the type specified by shape.
%%
%Erode images
erodedBW = imerode(i3,se); %erode image 3
% figure
% imshow(erodedBW)
erodedBW1 = imerode(erodedBW, se); %erode eroded image of 3
% figure
% imshow(erodedBW1)
erodedBW2 = imerode(i4, se);%erode image 4
% figure
% imshow(erodedBW2)
erodedBW3 = imerode(erodedBW2, se); %erode eroded image of 4

dialtedBW4 = imdilate(i5,se); % dialate image 5 

dialtedBW5 = imdilate(erodedBW3,se);%dilate eroded twice image 4

%%
Vi = zeros(701,701,10);
Vi(:,:,1) = i3;
Vi(:,:,2) = erodedBW;
Vi(:,:,3) = erodedBW1;
Vi(:,:,4) = erodedBW2;
Vi(:,:,5) = i4;
Vi(:,:,6) = erodedBW2;
Vi(:,:,7) = erodedBW3;
Vi(:,:,8) = dialtedBW5;
Vi(:,:,9) = dialtedBW4;
Vi(:,:,10) = i5;
%%
figure
colormap(gray);
contourslice(Vi,[],[],[1 2 3 4 5 6 7 8 9 10],2);
view(3);
axis tight

%%

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






