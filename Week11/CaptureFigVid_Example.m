% Example of using CaptureFigVid
% Cheers, Dr. Alan Jennings, Research assistant professor, 
% Department of Aeronautics and Astronautics, Air Force Institute of Technology

%% Set up 3D plot to record
figure(1);
clf;
surf(peaks,'EdgeColor','none','FaceColor','interp','FaceLighting','phong')
daspect([1,1,.3]);
axis tight;
axis off;

%% Rotate 3D plot
%% Set up recording parameters (optional), and record
OptionZ.FrameRate=15;
OptionZ.Duration=30;
OptionZ.Periodic=true;
CaptureFigVid([-20,30;-110,30;-190,30;-290,30;-380,30], 'WellMadeVid',OptionZ)
