%%READ ME
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            Developed by Nicholas Italiano, Manhattan College            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The script features 3d volume visualization preprocessing
% and visulaization development code (To Do: finish)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%
%Import Mike's images (convert to grayscale and double precision)
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
%Rescale the images
delta_w = 154; 
delta_1 = 121;
delta_2 = 109;
delta_3 = 110;
delta_4 = 114;
delta_5 = 107;
delta_6 = 120;
delta_7 = 128;
delta_8 = 138;
delta_10 = 148;
delta_11 = 129;

New_img1 = imresize(removal20, (delta_w/delta_1));
New_img2 = imresize(removal21, (delta_w/delta_2));
New_img3 = imresize(removal22, (delta_w/delta_3));
New_img4 = imresize(removal23, (delta_w/delta_4));
New_img5 = imresize(removal24, (delta_w/delta_5));
New_img6 = imresize(removal25, (delta_w/delta_6));
New_img7 = imresize(removal26, (delta_w/delta_7));
New_img8 = imresize(removal27, (delta_w/delta_8));
New_img9 = removal28;
New_img10 = imresize(removal29, (delta_w/delta_10));
New_img11 = imresize(removal30, (delta_w/delta_11));
%%
clear removal20 removal21 removal22 removal23 removal24 removal25 removal26 removal27 removal28 removal29 removal30 delta_w = 154; 
clear delta_1 delta_2 delta_3 delta_4 delta_5 delta_6 delta_7 delta_8 delta_10 delta_11 
clear image20 image21 image22 image23 image24 image25 image26 image27 image28 image29 image30 
clear image20mask image21mask image22mask image23mask image24mask image25mask image26mask image27mask image28mask image29mask image30mask 
clear outside20 outside21 outside22 outside23 outside24 outside25 outside26 outside27 outside28 outside29 outside30 
clear removal20 removal21 removal22 removal23 removal24 removal25 removal26 removal27 removal28 removal29 removal30 
%%
%Part 3
%I would like to rotate every image so that the zero axis in the image is
%aligned with the x-axis in a coordinate plane so it will lie horizantal.
%The function imrotate reads the image with the new scale. I calulated the
%angle from where the 0 axis is in the image to where the 0 axis would
%be in a coordinate plane so that for each image the 0 axis would be
%horizontal. So the function has that angle which will rotate it in the counter 
%clockwise deirection. I used the method bilinear which is a Bilinear interpolation
%so that with in the rotation parts of the image is not deleted.

R_img1 = imrotate(New_img1,55.35,'bilinear');
R_img2 = imrotate(New_img2,80.23,'bilinear');
R_img3 = imrotate(New_img3,67.80,'bilinear');
R_img4 = imrotate(New_img4,58.49,'bilinear');
R_img5 = imrotate(New_img5,73.26,'bilinear');
R_img6 = imrotate(New_img6,68.12,'bilinear');
R_img7 = imrotate(New_img7,73.24,'bilinear');
R_img8 = imrotate(New_img8,66.30,'bilinear');
R_img9 = imrotate(New_img9,70.64,'bilinear');
R_img10 = imrotate(New_img10,88.74,'bilinear');
R_img11 = imrotate(New_img11,52.27,'bilinear');
%%
clear New_img1 New_img2 New_img3 New_img4 New_img5 New_img6 New_img7 New_img8 New_img9 New_img10 New_img11
%%
%Part 4
%So all my images would be on the same size matrix I made a bigger matrix of the same size
%to insert each image so that I would be able to
%translate the origin of each image to the same index in the matrix allowing it to be in the same location for all images.

%I decided to translate all my images origin point to the index 5000,5000
%in the matrix and therefore had to calculate the distance in x and y
%direction that the image would have to move from where the origin was
%originally at.

Npr = 6000;
Npc = 6000;

Padded_I1 = zeros(Npr,Npc);
[img1r,img1c]=size(R_img1);
Rs1 = round((Npr-img1r)/2);
Cs1 = round((Npc-img1c)/2);
Padded_I1(Rs1:(Rs1+img1r-1),Cs1:(Cs1+img1c-1)) = R_img1;

T_img1 = imtranslate(Padded_I1,[-1262,-460]);
clear Padded_I1 img1r img1c R_img1 Rs1 Cs1
%%
Padded_I2 = zeros(Npr,Npc);
[img2r,img2c]=size(R_img2);
Rs2 = round((Npr-img2r)/2);
Cs2 = round((Npc-img2c)/2);
Padded_I2(Rs2:(Rs2+img2r-1),Cs2:(Cs2+img2c-1)) = R_img2;

T_img2 = imtranslate(Padded_I2,[-1246,210]);

clear Padded_I2 img2r img2c R_img2 Rs2 Cs2
%%
Padded_I3 = zeros(Npr,Npc);
[img3r,img3c]=size(R_img3);
Rs3 = round((Npr-img3r)/2);
Cs3 = round((Npc-img3c)/2);
Padded_I3(Rs3:(Rs3+img3r-1),Cs3:(Cs3+img3c-1)) = R_img3;

T_img3 = imtranslate(Padded_I3,[-1433,323]);

clear Padded_I3 img3r img3c R_img3 Rs3 Cs3
%%
Padded_I4 = zeros(Npr,Npc);
[img4r,img4c]=size(R_img4);
Rs4 = round((Npr-img4r)/2);
Cs4 = round((Npc-img4c)/2);
Padded_I4(Rs4:(Rs4+img4r-1),Cs4:(Cs4+img4c-1)) = R_img4;

T_img4 = imtranslate(Padded_I4,[-1484,178]);

clear Padded_I4 img4r img4c R_img4 Rs4 Cs4
%%
Padded_I5 = zeros(Npr,Npc);
[img5r,img5c]=size(R_img5);
Rs5 = round((Npr-img5r)/2);
Cs5 = round((Npc-img5c)/2);
Padded_I5(Rs5:(Rs5+img5r-1),Cs5:(Cs5+img5c-1)) = R_img5;

T_img5 = imtranslate(Padded_I5,[-1422,294]);

clear Padded_I5 img5r img5c R_img5 Rs5 Cs5
%%
Padded_I6 = zeros(Npr,Npc);
[img6r,img6c]=size(R_img6);
Rs6 = round((Npr-img6r)/2);
Cs6 = round((Npc-img6c)/2);
Padded_I6(Rs6:(Rs6+img6r-1),Cs6:(Cs6+img6c-1)) = R_img6;

T_img6 = imtranslate(Padded_I6,[-1384,-186]);

clear Padded_I6 img6r img6c R_img6 Rs6 Cs6
%%
Padded_I7 = zeros(Npr,Npc);
[img7r,img7c]=size(R_img7);
Rs7 = round((Npr-img7r)/2);
Cs7 = round((Npc-img7c)/2);
Padded_I7(Rs7:(Rs7+img7r-1),Cs7:(Cs7+img7c-1)) = R_img7;

T_img7 = imtranslate(Padded_I7,[-734,-348]);

clear Padded_I7 img7r img7c R_img7 Rs7 Cs7
%%
Padded_I8 = zeros(Npr,Npc);
[img8r,img8c]=size(R_img8);
Rs8 = round((Npr-img8r)/2);
Cs8 = round((Npc-img8c)/2);
Padded_I8(Rs8:(Rs8+img8r-1),Cs8:(Cs8+img8c-1)) = R_img8;

T_img8 = imtranslate(Padded_I8,[-330,-71]);

clear Padded_I8 img8r img8c R_img8 Rs8 Cs8
%%
Padded_I9 = zeros(Npr,Npc);
[img9r,img9c]=size(R_img9);
Rs9 = round((Npr-img9r)/2);
Cs9 = round((Npc-img9c)/2);
Padded_I9(Rs9:(Rs9+img9r-1),Cs9:(Cs9+img9c-1)) = R_img9;

T_img9 = imtranslate(Padded_I9,[-177,-19]);

clear Padded_I9 img9r img9c R_img9 Rs9 Cs9
%%
Padded_I10 = zeros(Npr,Npc);
[img10r,img10c]=size(R_img10);
Rs10 = round((Npr-img10r)/2);
Cs10 = round((Npc-img10c)/2);
Padded_I10(Rs10:(Rs10+img10r-1),Cs10:(Cs10+img10c-1)) = R_img10;

T_img10 = imtranslate(Padded_I10,[89,-179]);

clear Padded_I10 img10r img10c R_img10 Rs10 Cs10
%%
Padded_I11 = zeros(Npr,Npc);
[img11r,img11c]=size(R_img11);
Rs11 = round((Npr-img11r)/2);
Cs11 = round((Npc-img11c)/2);
Padded_I11(Rs11:(Rs11+img11r-1),Cs11:(Cs11+img11c-1)) = R_img11;

T_img11 = imtranslate(Padded_I11,[139,121]);

clear Padded_I11 img11r img11c R_img11 Rs11 Cs11 Npc Npr
%%
Q_img1 = imcrop(T_img1,[1000 1000 7000 7000]);
Q_img2 = imcrop(T_img2,[1000 1000 7000 7000]);
Q_img3 = imcrop(T_img3,[1000 1000 7000 7000]);
Q_img4 = imcrop(T_img4,[1000 1000 7000 7000]);
Q_img5 = imcrop(T_img5,[1000 1000 7000 7000]);

%%
clear T_img1 T_img2 T_img3 T_img4 T_img5

Q_img6 = imcrop(T_img6,[1000 1000 7000 7000]);
Q_img7 = imcrop(T_img7,[1000 1000 7000 7000]);
Q_img8 = imcrop(T_img8,[1000 1000 7000 7000]);
Q_img9 = imcrop(T_img9,[1000 1000 7000 7000]);
Q_img10 = imcrop(T_img10,[1000 1000 7000 7000]);

%%
clear T_img6 T_img7 T_img8 T_img9 T_img10

Q_img11 = imcrop(T_img11,[1000 1000 7000 7000]);

clear T_img11
%%
subplot(4,3,1)
imagesc(Q_img1)
title('sample 20')
colormap('gray')

subplot(4,3,2)
imagesc(Q_img2)
title('sample 21')
colormap('gray')

subplot(4,3,3)
imagesc(Q_img3)
title('sample 22')
colormap('gray')

subplot(4,3,4)
imagesc(Q_img4)
title('sample 23')
colormap('gray')

subplot(4,3,5)
imagesc(Q_img5)
title('sample 24')
colormap('gray')

subplot(4,3,6)
imagesc(Q_img6)
title('sample 25')
colormap('gray')

subplot(4,3,7)
imagesc(Q_img7)
title('sample 26')
colormap('gray')

subplot(4,3,8)
imagesc(Q_img8)
title('sample 27')
colormap('gray')

subplot(4,3,9)
imagesc(Q_img9)
title('sample 28')
colormap('gray')

subplot(4,3,10)
imagesc(Q_img10)
title('sample 30')
colormap('gray')

subplot(4,3,11)
imagesc(Q_img11)
title('sample 31')
colormap('gray')

% imagesc(T_img11);
% colorbar
% colormap('gray')
%%
Layer20 = imread('Layer 20.JPG');
Layer21 = imread('Layer 21.JPG');
Layer22 = imread('Layer 22.JPG');
Layer23 = imread('Layer 23.JPG');
Layer24 = imread('Layer 24.JPG');
Layer25 = imread('Layer 25.JPG');
Layer26 = imread('Layer 26.JPG');
Layer27 = imread('Layer 27.JPG');
Layer28 = imread('Layer 28.JPG');
Layer29 = imread('Layer 29.JPG');
Layer30 = imread('Layer 30.JPG');
%%
i1 = Layer20;
i2 = Layer21;
i3 = Layer22;
i4 = Layer23;
i5 = Layer24;
i6 = Layer25;
i7 = Layer26;
i8 = Layer27;
i9 = Layer28;
i10 = Layer29;
i11 = Layer30;
%clear Q_img1 Q_img2 Q_img3 Q_img4 Q_img5 Q_img6 Q_img7 Q_img8 Q_img9 Q_img10 Q_img11


%%
clear T_img6 T_img7 T_img8 T_img9 T_img10

Q_img11 = imcrop(T_img11,[1000 1000 7000 7000]);

clear T_img11
%%
imwrite(i1,'Layer 20.jpg')
imwrite(i2,'Layer 21.jpg')
imwrite(i3,'Layer 22.jpg')
imwrite(i4,'Layer 23.jpg')
imwrite(i5,'Layer 24.jpg')
imwrite(i6,'Layer 25.jpg')
imwrite(i7,'Layer 26.jpg')
imwrite(i8,'Layer 27.jpg')
imwrite(i9,'Layer 28.jpg')
imwrite(i10,'Layer 29.jpg')
imwrite(11,'Layer 30.jpg')
%%
figure
colormap(map)
image_num = 5;
image(Vi(:,:,image_num))
axis image
%%
Vi = zeros(501,501,50);
Vi(:,:,1) = i1;
Vi(:,:,5) = i2;
Vi(:,:,10) = i3;
Vi(:,:,20) = i4;
Vi(:,:,25) = i5;
Vi(:,:,30) = i6;
Vi(:,:,35) = i7;
Vi(:,:,37) = i8;
Vi(:,:,40) = i9;
Vi(:,:,45) = i10;
Vi(:,:,47) = i11;
%%
clear i1 i2 i3 i4 i5 i6 i7 i8 i9 i10 i11 
%%
m = brighten(jet(length(map)),-.5);
figure
colormap(cm)
contourslice(Vi,[],[],image_num)
axis ij
xlim(x)
ylim(y)
daspect([1,1,1])
%%
figure
colormap(cm);
contourslice(Vi,[],[],[1 5 10 20 25 30 35 37 40 47 47],1);
view(3);
axis tight
%%
figure
colormap(map)
V = smooth3(Vi);
p = patch(isosurface(Vi,11));
isonormals(V,p)
set(p,'FaceColor','yellow','EdgeColor','none');
%%
view(35,30)
axis tight
hcap = patch(isocaps(Vi,5),...
   'FaceColor','interp',...
   'EdgeColor','none');
%%

view(35,30)
axis tight
daspect([1,1,.4])
%%
lightangle(45,30);
lighting gouraud
hcap.AmbientStrength = 0.6;
hiso.SpecularColorReflectance = 0;
hiso.SpecularExponent = 50;





