axis equal;  % keeps fixed viewpoint and graphics properties

for i=1:9
rotate(hSurface,direction,5);
% make sure you put a zero in front of 1-9, to keep order ...
print (gcf,'-deps',strcat('Close2',num2str(i),'.ps'))
end

for i=10:25
rotate(hSurface,direction,5);
print (gcf,'-deps',strcat('Close2',num2str(i),'.ps'))
end
