x = 1:0.1:5;
y=1:50;  

X = repmat(x',1,size(y,2)).';
Y = repmat(y',1,size(x,2));
Z = X./Y;

figure
hSurf = surf(Y,X,Z);

rotate(hSurf,[1,0,0],45) % As proposed by @ASantosRibeiro

colorbar
xlabel('x')
ylabel('y')
zlabel('z')