% Author: Danie Ludick (dludick@sun.ac.za)
% Project: Bowtie array simulation using MoM and DGFM
%
% Note: Each project directory / example directory needs to have a sunem_initialise.m
% script, that is used to setup the correct environment for that example.
%
% Refer to the /doc folder for more information

% --------------------------------------------------------------------------------------------------
% Initialise the environment
% --------------------------------------------------------------------------------------------------
% Project output directory: './dipoles/'
% Debug: True/False
Const = sunem_initialise('bow_tie_array',false);

% --------------------------------------------------------------------------------------------------
% Program flow settings
% --------------------------------------------------------------------------------------------------

% Choose the solvers that will be executed
Const.runMoMsolver          = true;
Const.runDGFMsolver         = false;



% --------------------------------------------------------------------------------------------------
% Define input files for extracting FEKO data
% --------------------------------------------------------------------------------------------------
Const.FEKOmatfilename          = 'bow_tie_array_MoM.mat';
Const.FEKOstrfilename          = 'bow_tie_array_MoM.str';
Const.FEKOrhsfilename          = 'bow_tie_array_MoM.rhs';
Const.FEKOoutfilename          = 'bow_tie_array_MoM.out';


% --------------------------------------------------------------------------------------------------
% Define output files for transferring expansion coefficients back to FEKO data
% --------------------------------------------------------------------------------------------------
Const.SUNEMmomstrfilename      =  ''; %sunem_mom_bow_tie_array.str';
Const.SUNEMdgfmstrfilename     =  '';%'sunem_dgfm_bow_tie_array.str';

% --------------------------------------------------------------------------------------------------
% Define additional program flow constants
% --------------------------------------------------------------------------------------------------
% TO-DO: Setup some documentation for this
% Defined explicitely
%Const.no_mutual_coupling_array = false; % Deactivate coupling between domains.

% --------------------------------------------------------------------------------------------------
% Read the MoM matrix equation from the file
% --------------------------------------------------------------------------------------------------
 [Const, zMatrices, yVectors, xVectors] = extractFEKOMoMmatrixEq(Const);

% --------------------------------------------------------------------------------------------------
% Parse the setup files to extract the frequency sweep, the geometry and basis function setup 
% --------------------------------------------------------------------------------------------------
% TO-DO: At a later stage we can also add other meshing / geometry
% preprocessxing, e.g. Gmsh or GiD. For now the solver setup is read from FEKO.
[Const, Solver_setup] = parseFEKOoutfile(Const, yVectors);

% --------------------------------------------------------------------------------------------------
% Run the EM solver 
% --------------------------------------------------------------------------------------------------
% (Note: We either pass our own (internal) matrices, or those read from FEKO). For this particular
% array configuration, we are not yet supporting radiating elements. But as we are consistent with the
% FEKO mesh, we can just use the FEKO RHS vector.
[Solution] = runEMsolvers(Const, Solver_setup, zMatrices, yVectors, xVectors);

%Solution.mom has all the solver settings

%Top plot
ax1 = nexttile;
yvalues = log10(abs(zMatrices.values(1,1,1:5))); % build 3D array of all of individuals to manipulate as one
yvalues=reshape(permute(yvalues,[5,4,3,2,1]),5,[]);  % rearrange by plane first, row & column and put in columns
plot(1:5,yvalues)                                    % plot each column against the y vector

yvalues = log10(abs(zMatrices.values(1,10,1:5))); 
yvalues=reshape(permute(yvalues,[5,4,3,2,1]),5,[]);
hold on;
plot(1:5,yvalues);

 
yvalues = log10(abs(zMatrices.values(1,20,1:5))); 
yvalues=reshape(permute(yvalues,[5,4,3,2,1]),5,[]);
hold on;
plot(1:5,yvalues);

legend('m,n = 1,1','m,n = 1,10','m,n = 1,20');
title(ax1,'magnitude plots');
hold off

%bottom plot
ax2 = nexttile;
angle = phase(zMatrices.values(1,1,1:5));
angle=reshape(permute(angle,[5,4,3,2,1]),5,[]);
hold on;
plot(1:5,angle);

angle = phase(zMatrices.values(1,10,1:5));
angle=reshape(permute(angle,[5,4,3,2,1]),5,[]);
hold on;
plot(1:5,angle);

angle = phase(zMatrices.values(1,20,1:5));
angle=reshape(permute(angle,[5,4,3,2,1]),5,[]);
hold on;
plot(1:5,angle);

legend('m,n = 1,1','m,n = 1,10','m,n = 1,20');
title(ax2,'Phase plots');
hold off

%Link the axes
linkaxes([ax1,ax2],'x');

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