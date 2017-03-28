%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File Information:
% See 'Example1_20.mat' for interpolation example
% *Please include 'resize.mat' in folder for script to execute*
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Interp 3
%1)Load masks.mat (5 masks)
load resize
%%
%3) Create 3D array
Vf = zeros(701,701,4);
Vf(:,:,1) = i2;
Vf(:,:,2) = i3;
Vf(:,:,3) = i4;
Vf(:,:,4) = i5;


%%
%4)

N=701;
% Sample
[Xs,Ys,Zs] = meshgrid(1:1:N, 1:1:N, 1:1:4);

% Output
[Xo,Yo,Zo] = meshgrid(1:1:N, 1:1:N, 1:.5:4);

interpolated_images= interp3(Xs,Ys,Zs,Vf,Xo,Yo,Zo,'cubic');
%%
figure()
colormap(gray);
contourslice(interpolated_images,[],[],[2 3 4 5],3);
view(3);
axis tight

%%
i3p5 = interpolated_images(:,:,4);

%%
N=701;
A=[1, 10.13];
% Sample
[Xs,Ys,Zs] = meshgrid(1:1:N, 1:1:N, A);

B=[1,2,3,6,10.13];

% Output
[Xo,Yo,Zo] = meshgrid(1:1:N, 1:1:N, B);

interpolated_images= interp3(Xs,Ys,Zs,Vf,Xo,Yo,Zo,'cubic');

%%Vf(:,:,3);
%%
V = smooth3(Vf,'gaussian');
hiso = patch(isosurface(Vf,6),'FaceColor',[.8,.75,.69],'EdgeColor','none')
isonormals(V,hiso)
figure(1) 

%%
subplot(2,1,1)
imagesc(Vf(:,:,1))
title('Original')
subplot(2,1,2)
imagesc(interpolated_images(:,:,1))
title('Interpolated')


figure(2) 
subplot(2,1,1)
imagesc(Vf(:,:,2))
title('Original 2')
subplot(2,1,2)
imagesc(interpolated_images(:,:,2))
title('Interpolated 2')

figure(3) 
subplot(2,1,1)
imagesc(Vf(:,:,3))
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
contourslice(Vf,[],[],[1 2 3],2);
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

