%%READ ME
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            Developed by Nicholas Italiano, Manhattan College            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The script features 3d meshgrid preprocessing
% and Sagebrush branch conversion code (To Do: begin scaling using 
% Tiffany's .xls data) 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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