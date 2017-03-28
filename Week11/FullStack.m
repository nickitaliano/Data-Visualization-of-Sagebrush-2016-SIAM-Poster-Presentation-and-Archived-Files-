%% Create 110 slices for 176x176x36 volume

Vf = zeros(176,176,36);
%%
%Section 1 (Sample 20-21)
s1 = interpolated_images(:,:,1);
s2 = interpolated_images(:,:,2);
s3 = interpolated_images(:,:,3);
s4 = interpolated_images(:,:,4);
s5 = interpolated_images(:,:,5);
s6 = interpolated_images(:,:,6);
s7 = interpolated_images(:,:,7);
%%
%Section 2 (Sample 21-22)
s8 = interpolated_images(:,:,1);
s9 = interpolated_images(:,:,2);
s10 = interpolated_images(:,:,3);
s11 = interpolated_images(:,:,4);
s12 = interpolated_images(:,:,5);
s13 = interpolated_images(:,:,6);
s14 = interpolated_images(:,:,7);
%%
%Section 3 (Sample 22-23)
s15 = interpolated_images(:,:,1);
s16 = interpolated_images(:,:,2);
s17 = interpolated_images(:,:,3);
s18 = interpolated_images(:,:,4);
s19 = interpolated_images(:,:,5);
s20 = interpolated_images(:,:,6);
s21 = interpolated_images(:,:,7);
%%
%Section 4 (Sample 23-24)
s22 = interpolated_images(:,:,1);
s23 = interpolated_images(:,:,2);
s24 = interpolated_images(:,:,3);
s25 = interpolated_images(:,:,4);
s26 = interpolated_images(:,:,5);
s27 = interpolated_images(:,:,6);
s28 = interpolated_images(:,:,7);
%%
%Section 5 (Sample 24-25)
s29 = interpolated_images(:,:,1);
s30 = interpolated_images(:,:,2);
s31 = interpolated_images(:,:,3);
s32 = interpolated_images(:,:,4);
s33 = interpolated_images(:,:,5);
s34 = interpolated_images(:,:,6);
s35 = interpolated_images(:,:,7);
%%
Vf(:,:,1) = s1;
Vf(:,:,2) = s2;
Vf(:,:,3) = s3;
Vf(:,:,4) = s4;
Vf(:,:,5) = s5;
Vf(:,:,6) = s6;
Vf(:,:,7) = s7;
Vf(:,:,8) = s8;
Vf(:,:,9) = s9;
Vf(:,:,10) = s10;
Vf(:,:,11) = s11;
Vf(:,:,12) = s12;
Vf(:,:,13) = s13;
Vf(:,:,14) = s14;
Vf(:,:,15) = s15;
Vf(:,:,16) = s16;
Vf(:,:,17) = s17;
Vf(:,:,18) = s18;
Vf(:,:,19) = s19;
Vf(:,:,20) = s20;
Vf(:,:,21) = s21;
Vf(:,:,22) = s21;
Vf(:,:,23) = s23;
Vf(:,:,24) = s24;
Vf(:,:,25) = s25;
Vf(:,:,26) = s26;
Vf(:,:,27) = s27;
Vf(:,:,28) = s28;
Vf(:,:,29) = s29;
Vf(:,:,30) = s30;
Vf(:,:,31) = s31;
Vf(:,:,32) = s32;
Vf(:,:,33) = s33;
Vf(:,:,34) = s34;
Vf(:,:,35) = s35;


%%
figure()
colormap(gray);
contourslice(Vf,[],[],[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35],2);
view(3);
axis tight