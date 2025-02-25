vq = (59958500:0.1:1349070000);
yvaluesqlin = interp1(xvalues,yvalues,1349070000,'linear');
yvaluesqspl = interp1(xvalues,yvalues,1349070000,'spline');
yvaluesqpch = interp1(xvalues,yvalues,1349070000,'pchip');


real_z1 = real(yvalues);
imag_z1 = imag(yvalues);
plot(real_z1,imag_z1,'-x');
xlabel('Real axis');
ylabel('Imaginary axis');


%Top plot
ax1 = nexttile;
xvalues = Solver_setup.frequencies;
yvalues = abs(zMatrices.values(1,1,1:5));    % build 3D array of all of individuals to manipulate as one
yvalues=reshape(permute(yvalues,[5,4,3,2,1]),5,[]); % rearrange by plane first, row & column and put in columns
plot(xvalues.samples,yvalues,'-x');                      


yvalues = abs(zMatrices.values(1,10,1:5)); 
yvalues=reshape(permute(yvalues,[5,4,3,2,1]),5,[]); 
hold on;
plot(xvalues.samples,yvalues,'-x');

 
yvalues = abs(zMatrices.values(1,20,1:5)); 
yvalues=reshape(permute(yvalues,[5,4,3,2,1]),5,[]); 
hold on;
plot(xvalues.samples,yvalues,'-x');

legend('m,n = 1,1','m,n = 1,10','m,n = 1,20');
title(ax1,'magnitude plots');
hold off




%Top plot
ax1 = nexttile;
xvalues = Solver_setup.frequencies;
yvalues = log10(abs(zMatrices.values(1,1,1:5)));    % build 3D array of all of individuals to manipulate as one
yvalues=reshape(permute(yvalues,[5,4,3,2,1]),5,[]); % rearrange by plane first, row & column and put in columns
plot(xvalues.samples,yvalues);                      


yvalues = log10(abs(zMatrices.values(1,10,1:5))); 
yvalues=reshape(permute(yvalues,[5,4,3,2,1]),5,[]); 
hold on;
plot(xvalues.samples,yvalues);

 
yvalues = log10(abs(zMatrices.values(1,20,1:5))); 
yvalues=reshape(permute(yvalues,[5,4,3,2,1]),5,[]); 
hold on;
plot(xvalues.samples,yvalues);

legend('m,n = 1,1','m,n = 1,10','m,n = 1,20');
title(ax1,'magnitude plots');
hold off




% bottom plot
ax2 = nexttile;
angle = phase(zMatrices.values(1,1,1:50));
angle=reshape(permute(angle,[5,4,3,2,1]),5,[]);
hold on;
plot(xvalues.samples,angle);

angle = phase(zMatrices.values(1,10,1:5));
angle=reshape(permute(angle,[5,4,3,2,1]),5,[]);
hold on;
plot(xvalues.samples,angle);

angle = phase(zMatrices.values(1,20,1:5));
angle=reshape(permute(angle,[5,4,3,2,1]),5,[]);
hold on;
plot(xvalues.samples,angle);

legend('m,n = 1,1','m,n = 1,10','m,n = 1,20');
title(ax2,'Phase plots');
hold off

%Link the axes
linkaxes([ax1,ax2], 'x');


%ax3 = nexttile;
%Resistance = real(zMatrices.values(1,1,1:5));
%Resistance=reshape(permute(Resistance,[5,4,3,2,1]),5,[]);
%hold on;
%plot(1:5,Resistance);

%Resistance = real(zMatrices.values(1,10,1:5));
%Resistance=reshape(permute(Resistance,[5,4,3,2,1]),5,[]);
%hold on;
%plot(1:5,Resistance);

%Resistance = real(zMatrices.values(1,20,1:5));
%Resistance=reshape(permute(Resistance,[5,4,3,2,1]),5,[]);
%hold on;
%plot(1:5,Resistance);

%legend('m,n = 1,1','m,n = 1,10','m,n = 1,20');
%title(ax3,'Input Resistance');
%hold off














%Top plot
ax1 = nexttile;
xvalues = Solver_setup.frequencies;
yvalues = log10(abs(zMatrices.values(1,1,1:5)));    % build 3D array of all of individuals to manipulate as one
yvalues=reshape(permute(yvalues,[5,4,3,2,1]),5,[]); % rearrange by plane first, row & column and put in columns
plot(xvalues.samples,yvalues);                      % plot each column against the y vector


yvalues = log10(abs(zMatrices.values(1,10,1:5))); 
yvalues=reshape(permute(yvalues,[5,4,3,2,1]),5,[]); 
hold on;
plot(xvalues.samples,yvalues);

 
yvalues = log10(abs(zMatrices.values(1,20,1:5))); 
yvalues=reshape(permute(yvalues,[5,4,3,2,1]),5,[]); 
hold on;
plot(xvalues.samples,yvalues);

legend('m,n = 1,1','m,n = 1,10','m,n = 1,20');
title(ax1,'magnitude plots');
hold off


% bottom plot
ax2 = nexttile;
angle = phase(zMatrices.values(1,1,1:5));
angle=reshape(permute(angle,[5,4,3,2,1]),5,[]);
hold on;
plot(xvalues.samples,angle);

angle = phase(zMatrices.values(1,10,1:5));
angle=reshape(permute(angle,[5,4,3,2,1]),5,[]);
hold on;
plot(xvalues.samples,angle);

angle = phase(zMatrices.values(1,20,1:5));
angle=reshape(permute(angle,[5,4,3,2,1]),5,[]);
hold on;
plot(xvalues.samples,angle);

legend('m,n = 1,1','m,n = 1,10','m,n = 1,20');
title(ax2,'Phase plots');
hold off

%Link the axes
linkaxes([ax1,ax2], 'x');


%ax3 = nexttile;
%Resistance = real(zMatrices.values(1,1,1:5));
%Resistance=reshape(permute(Resistance,[5,4,3,2,1]),5,[]);
%hold on;
%plot(1:5,Resistance);

%Resistance = real(zMatrices.values(1,10,1:5));
%Resistance=reshape(permute(Resistance,[5,4,3,2,1]),5,[]);
%hold on;
%plot(1:5,Resistance);

%Resistance = real(zMatrices.values(1,20,1:5));
%Resistance=reshape(permute(Resistance,[5,4,3,2,1]),5,[]);
%hold on;
%plot(1:5,Resistance);

%legend('m,n = 1,1','m,n = 1,10','m,n = 1,20');
%title(ax3,'Input Resistance');
%hold off