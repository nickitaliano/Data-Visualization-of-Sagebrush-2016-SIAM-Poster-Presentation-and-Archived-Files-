%% Transcribing Created Segements

load resize

 
%% Resize

i1 = imresize(i1, 0.25);
i2 = imresize(i2, 0.25);
i3 = imresize(i3, 0.25);
i4 = imresize(i4, 0.25);
i5 = imresize(i5, 0.25);
i6 = imresize(i6, 0.25);
i7 = imresize(i7, 0.25);
i8 = imresize(i8, 0.25);
i9 = imresize(i9, 0.25);
i10 = imresize(i10, 0.25);
i11 = imresize(i11, 0.25);

%% Create Array

Vi = zeros(176,176,2);

Vi(:,:,1) = i5;  
Vi(:,:,2) = i6;
% Vi(:,:,3) = i3;
% Vi(:,:,4) = i4;
% Vi(:,:,5) = i5;
% Vi(:,:,6) = i6;
% Vi(:,:,7) = i7;
% Vi(:,:,8) = i8;
% Vi(:,:,9) = i9;
% Vi(:,:,10) = i10;
% Vi(:,:,11) = i11;



%% Create Meshgrid

N=176;
[X,Y,Z] = meshgrid(1:1:N, 1:1:N, 1:2:4);
[Xq,Yq,Zq] = meshgrid(1:1:N, 1:1:N, 1:.5:4);   


%% Interp3(spline unless told otherwise)

interpolated_images= interp3(X,Y,Z,Vi,Xq,Yq,Zq,'spline');

%% View All

figure()
colormap(gray);
contourslice(interpolated_images,[],[],[1 2 3 4 5 6 7],2);
view(3);
axis tight

%% Add Isocaps

V = smooth3(Vi,'gaussian');

hiso = patch(isosurface(Vi,3),'FaceColor',[.8,.75,.69],'EdgeColor','none')

isonormals(V,hiso)
