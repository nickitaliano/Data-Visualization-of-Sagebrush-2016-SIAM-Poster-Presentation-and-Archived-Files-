File Information
Description	
CaptureFigVid(ViewZ, FileName,OptionZ) 
Captures a video of the 3D plot in the current axis as it rotates based on ViewZ and saves it as 'FileName.mpg'. Option can be specified.

ViewZ: N-rows with 2 columns, each row are the view angles in degrees, First column is azimuth (pan), Second is elevation (tilt) values outside of 0-360 wrap without error, 
*If a duration is specified, angles are used as nodes and views are equally spaced between them (other interpolation could be implemented, if someone feels so ambitious). 
*If only an initial and final view is given, and no duration, then the default is 100 frames. 
FileName: Name of the file of the produced animation. Because I wrote the program, I get to pick my default of mpg-4, and the file extension .mpg will be appended, even if the filename includes another file extension. File is saved in the working directory. 
(OptionZ): Optional input to specify parameters. The ones I use are given below. Feel free to add your own. Any or all fields can be used 
OptionZ.FrameRate: Specify the frame rate of the final video (e.g. 30;) 
OptionZ.Duration: Specify the length of video in seconds (overrides spacing of view angles) (e.g. 3.5;) 
OptionZ.Periodic: Logical to indicate if the video should be periodic. Using this removed the final view so that when the video repeats the initial and final view are not the same. Avoids having to find the interval between view angles. (e.g. true;)

% % % Example (shown in published results, video attached) % % % % 
figure(171);clf; 
surf(peaks,'EdgeColor','none','FaceColor','interp','FaceLighting','phong') 
daspect([1,1,.3]);axis tight; 
OptionZ.FrameRate=15;OptionZ.Duration=5.5;OptionZ.Periodic=true; 
CaptureFigVid([-20,10;-110,10;-190,80;-290,10;-380,10], 'WellMadeVid',OptionZ)