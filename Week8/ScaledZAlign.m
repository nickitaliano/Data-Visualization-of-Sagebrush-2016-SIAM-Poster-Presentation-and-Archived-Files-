%%
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

save 'Processed_Fine _Resolution.mat'

%%
Vi = zeros(701,701,3001);
Vi(:,:,300) = i1;
Vi(:,:,750) = i3;
Vi(:,:,1100) = i5;
Vi(:,:,1600) = i7;
Vi(:,:,2300) = i9;
Vi(:,:,3000) = i11;
%