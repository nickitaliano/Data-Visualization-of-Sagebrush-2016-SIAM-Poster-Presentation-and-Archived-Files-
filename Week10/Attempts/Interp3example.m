% Interp3 Example with a Ball
% Author: Angel Pineda

% We create a volume of zeros and then fill in a ball
N = 51;
R = 15;
ball = zeros(N,N,N);
for i=1:N
    for j=1:N
        for k=1:N
            % You have to be really careful about centering discrete data
            % on a grid because the indexing starts at 1.  Here the (x,y,z)
            % coordinates of the indices (i,j,k) = (26,26,26) is equal to 
            % (x,y,z) = (0,0,0).  
            x = -(N-1)/2-1 + i; % the ball is centered at i=(N-1)/2+1 
            y = -(N-1)/2-1 + j; % the ball is centered at j=(N-1)/2+1
            z = -(N-1)/2-1 + k; % the ball is centered at k=(N-1)/2+1
            if (R<sqrt(x^2+y^2+z^2))
                ball(i,j,k) = 1;
            end
        end
    end
end
%%
figure(1) % visualizing a slice in the center
imagesc(ball(:,:,(N-1)/2+1))

figure(2) % visualizing a slice in the bottom
imagesc(ball(:,:,(N-1)/2+1-round(R/2)))

figure(3) % visualizing a slice at the very bottom
imagesc(ball(:,:,(N-1)/2+1-R))
%% Now keep only a 11 slices of the ball data and interpolate the rest

data = zeros(N,N,11);

for i=1:11
    data(:,:,i)=ball(:,:,(i-1)*(N-1)/10+1);
end

figure(1) % We see the central slice in the smaller data set
imagesc(data(:,:,6))

%% Now we create an (X,Y,Z) grid for the original ball
% Note that the ball, just like the real data has physical (X,Y,Z)
% coordinates

% Note that for example, the x coordinates of the original ball start from
% -25 and go to 25 with 51 points.
[Xo,Yo,Zo] = meshgrid(-(N-1)/2:1:(N-1)/2,-(N-1)/2:1:(N-1)/2,-(N-1)/2:1:(N-1)/2);

% and now for the one with only eleven samples
% Note that here the x,y grids are the same but for z it starts at -25, and
% goes to 25 but with only 11 points
[Xs,Ys,Zs] = meshgrid(-(N-1)/2:1:(N-1)/2,-(N-1)/2:1:(N-1)/2,-(N-1)/2:5:(N-1)/2);

% We check the z coordinates for the sampled data

Zs(1,1,:)

%%  Now we interpolate from the sampled grid with only 11 z values to the high
% resolution grid with 51 values using linear interpolation

interpolated_ball= interp3(Xs,Ys,Zs,data,Xo,Yo,Zo,'linear');

% Let's compare the interpolated ball with the original ball

figure(1) % visualizing a slice in the center
subplot(2,1,1)
imagesc(ball(:,:,(N-1)/2+1))
title('Original Ball')
subplot(2,1,2)
imagesc(interpolated_ball(:,:,(N-1)/2+1))
title('Interpolated Ball')

figure(2) % visualizing a slice in the bottom
subplot(2,1,1)
imagesc(ball(:,:,(N-1)/2+1-round(R/2)))
title('Original Ball')
subplot(2,1,2)
imagesc(interpolated_ball(:,:,(N-1)/2+1-round(R/2)))
title('Interpolated Ball')

figure(3) % visualizing a slice at the very bottom
subplot(2,1,1)
imagesc(ball(:,:,(N-1)/2+1-R))
title('Original Ball')
subplot(2,1,2)
imagesc(interpolated_ball(:,:,(N-1)/2+1-R))
title('Interpolated Ball')
