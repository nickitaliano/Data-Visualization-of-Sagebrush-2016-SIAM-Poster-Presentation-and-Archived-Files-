%% Transcribing Created Segements

load resize

 
%% Resize

i1 = imresize(i1, 0.1);
i2 = imresize(i2, 0.1);
i3 = imresize(i3, 0.1);
i4 = imresize(i4, 0.1);
i5 = imresize(i5, 0.1);
i6 = imresize(i6, 0.1);
i7 = imresize(i7, 0.1);
i8 = imresize(i8, 0.1);
i9 = imresize(i9, 0.1);
i10 = imresize(i10, 0.1);
i11 = imresize(i11, 0.1);

%% Create Array

Vi = zeros(71,71,11);

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



%% Create Meshgrid

N=71;
[X,Y,Z] = meshgrid(1:1:N, 1:1:N, 1:2:22);
[Xq,Yq,Zq] = meshgrid(1:1:N, 1:1:N, 1:.5:22);   


%% Interp3

interpolated_images= interp3(X,Y,Z,Vi,Xq,Yq,Zq,'spline');

%% View All

figure()
colormap(gray);
contourslice(interpolated_images,[],[],[1 2 3 4 5 6 7 8 9 10 11 12],2);
view(3);
axis tight

%% Add Isocaps

V = smooth3(Vi,'gaussian');

hiso = patch(isosurface(Vi,3),'FaceColor',[.8,.75,.69],'EdgeColor','none')

isonormals(V,hiso)
