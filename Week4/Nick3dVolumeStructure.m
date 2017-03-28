%
% Create data array
V= zeros(700,700,40);
V(:,:,1)=image1translate;
V(:,:,2)=image2translate;
V(:,:,7)=image3translate;
V(:,:,22)=image4translate;
V(:,:,37)=image5translate;

%%
x = xlim;
y = ylim;
%
%%
figure
colormap(gray)
contourslice(V,[],[],[1,2,7,22,37],3);
view(3);
axis tight