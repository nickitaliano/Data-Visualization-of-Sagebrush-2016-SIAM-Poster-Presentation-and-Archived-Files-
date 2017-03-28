%% Interp 3
%1)Load masks.mat (5 masks)
load resize

%%
%2) Resize image data for computational efficiency
i1 = imresize(Mask_img1, 0.1);
i2 = imresize(Mask_img2, 0.1);
i3 = imresize(Mask_img3, 0.1);
i4 = imresize(Mask_img4, 0.1);
i5 = imresize(Mask_img5, 0.1);

clear Mask_img1 Mask_img2 Mask_img3 Mask_img4 Mask_img5
%%
%3) Create 3D array
Vi = zeros(701,701,2);

Vi(:,:,1) = i2;
Vi(:,:,2) = i3;
% Vi(:,:,3) = i4;
% Vi(:,:,4) = i5;
%Vi(:,:,5) = i5;

%%
%4)

N=701;
% Sample
[Xs,Ys,Zs] = meshgrid(1:1:N, 1:1:N, 1:1:2);

% Output
[Xo,Yo,Zo] = meshgrid(1:1:N, 1:1:N, 1:.25:2);

interpolated_images= interp3(Xs,Ys,Zs,Vi,Xo,Yo,Zo,'cubic');

figure()
colormap(gray);
contourslice(interpolated_images,[],[],[1 2 3 4 5],3);
view(3);
axis tight

%%
figure()
imagesc(i3)
%%
figure()
imagesc(Vi(:,:,2))
%%
V = smooth3(Vi,'gaussian');
hiso = patch(isosurface(Vi,6),'FaceColor',[.8,.75,.69],'EdgeColor','none')
isonormals(V,hiso)
figure(1) 

%%
subplot(2,1,1)
imagesc(Vi(:,:,1))
title('Original')
subplot(2,1,2)
imagesc(interpolated_images(:,:,1))
title('Interpolated')


figure(2) 
subplot(2,1,1)
imagesc(Vi(:,:,2))
title('Original 2')
subplot(2,1,2)
imagesc(interpolated_images(:,:,2))
title('Interpolated 2')

figure(3) 
subplot(2,1,1)
imagesc(Vi(:,:,3))
title('Original 3')
subplot(2,1,2)
imagesc(interpolated_images(:,:,3))
title('Interpolated 3')


%%

figure(5)
colormap(gray);
contourslice(interpolated_images,[],[],[1 2 3],2);
view(3);
axis tight

%%
figure(6)
colormap(gray);
contourslice(Vi,[],[],[1 2 3],2);
view(3);
axis tight


%%
figure(7) % visualizing a slice in the center
subplot(3,2,1)
imagesc(interpolated_images(:,:,1))
title('Interpolated 1')
subplot(3,2,2)
imagesc(interpolated_images(:,:,2))
title('Interpolated 2')

subplot(3,2,3)
imagesc(interpolated_images(:,:,3))
title('Interpolated 3')

subplot(3,2,4)
imagesc(interpolated_images(:,:,4))
title('Interpolated 4')

subplot(3,2,5)
imagesc(interpolated_images(:,:,5))
title('Interpolated 5')

subplot(3,2,6)
imagesc(interpolated_images(:,:,6))
title('Interpolated 6')

%%

figure(8)

colormap(gray);
contourslice(interpolated_images,[],[],[1 2 3 4 5 6 7 8 9 10],2);
view(3);
axis tight

%%

figure(9)

colormap(gray);
contourslice(interpolated_images,[],[],[1 2 3 4 5 6 7 8 9],2);
view(3);
axis tight

