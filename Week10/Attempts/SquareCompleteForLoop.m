%%README
%%(TODO)
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
% Description: This script uses for-loops to create new intermediate 2d data slices from 
% the location of two different arrays for 11 arrays.

###################################################################################################################
% create structure to hold your images that you will use for-loop to edit 
s_struct = struct('s',{});
%%
% read your images/array into the struct(for images only)
for i = 1:11 
   
s_struct(i).image = double(imread(sprintf('s%d',i), 'jpg'));
end

%%
%now the images are stored in the structure, where it is easy to access
%them, for example to display them in a loop:
sc=0.1
for i = 1:10;
imresize(s_struct(i).image,sc);
end;
imresize(s_struct(1).image,0.1);
#####################################################################################################################
%%
%First setting up the two squares, the first is a 40x40 and small is a
%20x20 matrix. Both are filled with ones and padded with zeros.
big = zeros(100,100);
big(30:70,30:70) = 1;

small = zeros(100,100);
small(40:60,40:60) = 1;

##############################################################################################################################
% (To Do for Image Array )
 imagecharArray=char('imageHG20.jpg','imageHG21.jpg');
 
% loop calls image based on index number of character index 
 
 for i=1:length(imagecharArray) 
     
     a=imread(imagecharArray(i,:)); 
     imagesc(a); colormap(gray);
     axis image
     axis off
     pause;
 end
####################################################################################################################
%% 
%create arrays and call them layers
layer1 = zeros(100,100);
layer1(30:70,30:70) = 1;

layer2 = zeros(100,100);
layer2(40:60,40:60) = 1;

layer3 = zeros(100,100);
layer3(45:65,45:65) = 1;
%%
%create structure full of arrays
s_struct = struct(sprintf('layer%d',i),{}); 
s_struct(1).layer=layer1
s_struct(2).layer=layer2
s_struct(3).layer=layer3
%%
i=1
for i = i:i+1;
%index first two images, or layers
bottomLayer=s_struct(i).layer;
topLayer=s_struct(i+1).layer;

%"find" function gives the boundaries 
[rb,cb] = find(bwperim(bottomLayer==1));
[rs,cs] = find(bwperim(topLayer==1));

%max and min values of these to create the new
%square.
rowMin = (min(rs)+min(rb))/2;
rowMax = (max(rs) + max(rb))/2;
colMin = (min(cs + min(cb))/2;
colMax = (max(cs) + max(cb))/2;

%index the new matrix 
mid = zeros(100,100);
mid(rowMin:rowMax,colMin:colMax) = 1;
 
%create volume of square perimeters
Vi = zeros(100,100,9);
Vi(:,:,1) = bottomLayer; 
Vi(:,:,9) = topLayer;
i =1;

%For loop that includes top 4 layers in between 2 x 2D arrays at a time
for i = 1:4
    %"find" function gives the boundaries 
    [rb,cb] = find(bwperim(bottomLayer==1));
    [rs,cs] = find(bwperim(topLayer==1));
    
    %max and  min values of these to create the top 4 layers .
    rowMin = (min(rs)+min(rb))/2;
    rowMax = (max(rs) + max(rb))/2;
    colMin = (min(cs + min(cb))/2;
    colMax = (max(cs) + max(cb))/2;
    mid = zeros(100,100);
    mid(rowMin:rowMax,colMin:colMax) = 1;
    j = i + 4;
    Vi(:,:,j) = mid;
    bottomLayer = mid;        
end 
bottomLayer2 = bottomLayer;
topLayer2 = topLayer;
%For loop that includes bottom 5 layers in between 2 x 2D arrays at a time
for i = 1:4
    %"find" function gives the boundaries 
    [rb,cb] = find(bwperim(bottomLayer2==1));
    [rs,cs] = find(bwperim(topLayer2==1));
    
    %max and  min values of these to create the top 4 layers .
    rowMin = (min(rs)+min(rb))/2;
    rowMax = (max(rs) + max(rb))/2;
    colMin = (min(cs + min(cb))/2;
    colMax = (max(cs) + max(cb))/2;
    mid = zeros(100,100);
    mid(rowMin:rowMax,colMin:colMax) = 1;
    k = 6 - i
    Vi(:,:,k) = mid;
    top = mid;
end
end
