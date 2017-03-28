load resize

%%
 clear Mask_img1 Mask_img3 Mask_img5 Mask_img7 Mask_img9 Mask_img11 
 
%%
i1 = imresize(Mask_img1, 0.1);
i2 = imresize(Mask_img2, 0.1);
i3 = imresize(Mask_img3, 0.1);
i4 = imresize(Mask_img4, 0.1);
i5 = imresize(Mask_img5, 0.1);
i6 = imresize(Mask_img6, 0.1);

%%

Vi = zeros(701,701,11);

Vi(:,:,1) = i1;
Vi(:,:,2) = i2;
Vi(:,:,3) = i3;
Vi(:,:,4) = i4;
Vi(:,:,5) = i5;
Vi(:,:,6) = i6;
Vi(:,:,7) = i7;
Vi(:,:,8) = i8;
Vi(:,:,9) = i9;
Vi(:,:,10) = i10;
Vi(:,:,11) = i11;



%%

N=701;


[X,Y,Z] = meshgrid(1:1:N, 1:1:N, 1:2:22);
[Xq,Yq,Zq] = meshgrid(1:1:N, 1:1:N, 1:1:22);   


%%
interpolated_images= interp3(X,Y,Z,Vi,Xq,Yq,Zq,'spline');

%%
figure()

colormap(gray);
contourslice(interpolated_images,[],[],[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22],2);
view(3);
axis tight

%%
figure(4)

colormap(gray);
contourslice(Vi,[],[],[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22],2);
view(3);
axis tight
%%
13 14 15 16 17 18 19 20 21 22 23

