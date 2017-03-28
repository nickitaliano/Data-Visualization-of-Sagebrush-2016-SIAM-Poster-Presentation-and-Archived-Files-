load SaveImage.mat 
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



%%
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
%%
%Erode images and create volume(2)
erodedBW2 = imerode(i3,se); 
erodedBW3 = imerode(erodedBW2, se); 
erodedBW4 = imdilate(erodedBW3, se); 
erodedBW5 = imerode(i3p5,se);

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
%%
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
%%
%Create Slices
figure()
colormap(gray);
contourslice(Vi,[],[],[15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30],2);
view(3);
axis tight


%%
%3D Model of slices
figure
V = smooth3(Vy);

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
