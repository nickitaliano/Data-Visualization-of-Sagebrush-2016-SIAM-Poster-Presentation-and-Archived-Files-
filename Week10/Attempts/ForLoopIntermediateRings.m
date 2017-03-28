%% Description: This script utilizes for loops to create perimeter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%create 100x100 arrays with unique perimeters(3 in this case-- can create up to 11
% in place for images at the moment)

layer1 = zeros(100,100);
layer1(30:70,30:70) = 1;

layer2 = zeros(100,100);
layer2(40:60,40:60) = 1;

layer3 = zeros(100,100);
layer3(45:65,45:65) = 1;
%%
%create structure full of arrays by indexing
s_struct = struct(sprintf('layer%d'),{}); 
s_struct(1).layer=layer1
s_struct(2).layer=layer2
s_struct(3).layer=layer3
%%
%Square complete for loop
m=1
w=0
%%

for m = m:m+1;
    if w=1
        %create volume of square perimeters for first pair
        Vi = zeros(100,100,9);
        Vi(:,:,1) = bottomLayer; 
        Vi(:,:,9) = topLayer;
    else
        %create volume of square perimeters for subsequent pairs
        
        %save new volume
        newV = Vi
        
        %create new z-stack indices
        z = 9*w
        y = z-9
        
        %create new volume
        Vj = zeros(100,100,z);
        Vj(:,:,y) = bottomLayer; 
        Vj(:,:,z) = topLayer;
        
        %insert new volume into prior new volume index
        oldTop = y-9
        
        Vf = zeros(100,100,z)
        Vf(:,:old,y)=TempVi
        
    end
%index first two images, or layers
bottomLayer=s_struct(m).layer;
topLayer=s_struct(m+1).layer;

%"find" function gives the boundaries 
[rb,cb] = find(bwperim(bottomLayer==1));
[rs,cs] = find(bwperim(topLayer==1));
%max and min values of these to create the new
%square.
rowMin = (min(rs)+ min(rb))/2;
rowMax = (max(rs) + max(rb))/2;
colMin = (min(cs) + min(cb))/2;
colMax = (max(cs) + max(cb))/2;

%index the new matrix 
mid = zeros(100,100);
mid(rowMin:rowMax,colMin:colMax) = 1;
imagesc(mid)

%For loop that includes top 4 layers in between 2 x 2D arrays at a time
i =1;
for i = 1:4
    %"find" function gives the boundaries 
    [rb,cb] = find(bwperim(bottomLayer==1));
    [rs,cs] = find(bwperim(topLayer==1));
    
    %max and  min values of these to create the top 4 layers .
    rowMin = (min(rs) + min(rb))/2;
    rowMax = (max(rs) + max(rb))/2;
    colMin = (min(cs) + min(cb))/2;
    colMax = (max(cs) + max(cb))/2;
    mid = zeros(100,100);
    mid(rowMin:rowMax,colMin:colMax) = 1;
    j = i + 4;
    Vi(:,:,j) = mid;
    bottomLayer = mid;        
end 
%For loop that includes bottom 5 layers in between 2 x 2D arrays at a time
i =1;
bottomLayer=s_struct(m).layer;
topLayer=s_struct(m+1).layer;
for i = 1:4
    %"find" function gives the boundaries 
    [rb,cb] = find(bwperim(bottomLayer==1));
    [rs,cs] = find(bwperim(topLayer==1));
    
    %max and  min values of these to create the top 4 layers .
    rowMin = (min(rs)+min(rb))/2;
    rowMax = (max(rs) + max(rb))/2;
    colMin = (min(cs) + min(cb))/2;
    colMax = (max(cs) + max(cb))/2;
    mid = zeros(100,100);
    mid(rowMin:rowMax,colMin:colMax) = 1;
    k = 6 - i
    Vi(:,:,k) = mid;
    topLayer = mid;
end
%new index to create volume for subsequent m segment
w=w+1

Vf=Vi
end
%%
%Visualize results
figure()
contourslice(Vi,[],[],[1 2 3 4 5 6 7 8 9],3)