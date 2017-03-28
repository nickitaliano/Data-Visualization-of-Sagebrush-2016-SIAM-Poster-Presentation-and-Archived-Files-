%%READ ME
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            Developed by Nicholas Italiano, Manhattan College            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%READ ME
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            Developed by Nicholas Italiano, Manhattan College            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: 
% A 3D Scalar Volume structure is created in order to visualize a 3D array of data.
 % The script creates(1)Vi, a 501x501x11 scalar volume structure, and 
% 2)inputs image variables i1 through i11 into 11 layers  

%Inputs/Outputs:
% Q_img1.mat workspace variable has fully preprocessed image variables
% named" Q_img1 through Q_img11"
% Vi is a 501x501x11 scalar volume structure that is created from inputting 
%"i1 through i11--It is considered output (New data structure created from images)
 
%l This script does the following processes using images named

%Functions:
%1) Create 3d data volume
%2) Reduce image resolution by 10% for computational efficiency  
%3)Create 3D volume-3D matrix volume of 0's- to hold all 11 images
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%1)
% Create 3d data volume
% Note: Load workspace variable "Q_img1.mat" from google drive

load Q_img1.mat


%%
%2)
%Reduce image resolution by 10% for computational efficiency 
% Note: Q_img1-11 are completely precprocessed images! 
i1 = imresize(Q_img1,.1);
i2 = imresize(Q_img2,.1);
i3 = imresize(Q_img3,.1);
i4 = imresize(Q_img4,.1);
i5 = imresize(Q_img5,.1);
i6 = imresize(Q_img6,.1);
i7 = imresize(Q_img7,.1);
i8 = imresize(Q_img8,.1);
i9 = imresize(Q_img9,.1);
i10 = imresize(Q_img10,.1);
i11 = imresize(Q_img11,.1);
%%
%3)Create 3D volume-3D matrix volume of 0's- to hold all 11 images
Vi = zeros(501,501,11);
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

% Mike's code to produce 3d visulization(Nick Edit)
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
%%























%OR........To Reduce Resolution and Create Volume Structure
%%
% create a 3d volume structure to where you can load your images 
s_struct = struct('s',{}); 
%%
% read your images into the struct
for i = 1:11 
s_struct(i).image = double(imread(sprintf('s%d',i), 'jpg'));
end
%%
% Iterate imresize function  
% now the images are stored in the structure, where it is easy to access
% them, for example to resize them in a loop:
sc=0.1
for i = 1:11;
imresize(s_struct(i).image,sc);
end;

%%
%now the images are stored in the structure, where it is easy to access
%them, for example to display them in a loop:
sc=0.1
for i = 1:10;
imresize(s_struct(i).image,sc);
end;
imresize(s_struct(1).image,0.1);

%%
Reference https://www.physicsforums.com/threads/matlab-changing-variable-name-with-each-iteration.217012/