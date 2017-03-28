%First setting up the two squares, the first is a 40x40 and small is a
%20x20 matrix. Both are filled with ones and padded with zeros.
big = zeros(100,100);
big(30:70,30:70) = 1;

small = zeros(100,100);
small(40:60,40:60) = 1;

%%
%The "find" function gives me the boundaries of when the 100x100 matrix gets
%to one. I want to find the max and min values of these to create the new
%square.
[rs,cs] = find(bwperim(small==1));
srmax = max(rs);
srmin = min(rs);
scmax = max(cs);
scmin = min(cs);
[rb,cb] = find(bwperim(big==1));
brmax = max(rb);
brmin = min(rb);
bcmax = max(cb);
bcmin = min(cb);
%%
%Then taking the average of the small and big max and mins of rows and
%columns will tell me how to index the new matrix which is done below.
rowMin = (srmin+brmin)/2;
rowMax = (srmax + brmax)/2;
colMin = (scmin + bcmin)/2;
colMax = (scmax + bcmax)/2;
mid = zeros(100,100);
mid(rowMin:rowMax,colMin:colMax) = 1;

%%
imagesc(mid)
%%
bottom = big;
top = small;
Vi = zeros(100,100,9);
Vi(:,:,1) = big;
Vi(:,:,9) = small;
i ==1;
for i = 1:4
    [rs,cs] = find(bwperim(top==1));
    srmax = max(rs);
    srmin = min(rs);
    scmax = max(cs);
    scmin = min(cs);
    [rb,cb] = find(bwperim(bottom==1));
    brmax = max(rb);
    brmin = min(rb);
    bcmax = max(cb);
    bcmin = min(cb);
    
    rowMin = (srmin+brmin)/2;
    rowMax = (srmax + brmax)/2;
    colMin = (scmin + bcmin)/2;
    colMax = (scmax + bcmax)/2;
    
    mid = zeros(100,100);
    mid(rowMin:rowMax,colMin:colMax) = 1;
    j = i + 4;
    Vi(:,:,j) = mid;
    bottom = mid;        
end 
%%
contourslice(Vi,[],[],[1 2 3 4 5 6 7 8 9],3)
%%
bottom = big;
top = small;
for i = 1:4
    [rs,cs] = find(bwperim(top==1));
    srmax = max(rs);
    srmin = min(rs);
    scmax = max(cs);
    scmin = min(cs);
    [rb,cb] = find(bwperim(bottom==1));
    brmax = max(rb);
    brmin = min(rb);
    bcmax = max(cb);
    bcmin = min(cb);
    
    rowMin = (srmin+brmin)/2;
    rowMax = (srmax + brmax)/2;
    colMin = (scmin + bcmin)/2;
    colMax = (scmax + bcmax)/2;
    
    mid = zeros(100,100);
    mid(rowMin:rowMax,colMin:colMax) = 1;
    k = 6 - i
    Vi(:,:,k) = mid;
    top = mid;
end



%%
contourslice(Vi,[],[],[1 2 3 4 5 6 7 8 9],3)
