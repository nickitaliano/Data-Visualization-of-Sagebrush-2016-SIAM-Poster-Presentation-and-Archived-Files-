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
