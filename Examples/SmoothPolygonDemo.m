% Clear the workspace
close all;
clear all;


Screen('Preference', 'SkipSyncTests', 1);
Screen('Preference', 'VisualDebugLevel', 1);


% Here we call some default settings for setting up Psychtoolbox
PsychDefaultSetup(2);

% Skip sync tests for this demo
Screen('Preference', 'SkipSyncTests', 2);

% Make sure OpenGL is working on this computer
AssertOpenGL;

% Setup Psychtoolbox for OpenGL 3D rendering support and initialize the
% mogl OpenGL for Matlab wrapper
InitializeMatlabOpenGL;

% Get the screen numbers
screens = Screen('Screens');

% Draw to the external screen if avaliable
screenNumber = max(screens);

% Define black and white
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% Open an on screen window
numMultiSamples = 4;
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black,...
    [], 32, 2, [], numMultiSamples, []);

% Get the size of the on screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% Get the centre coordinate of the window
[xCenter, yCenter] = RectCenter(windowRect);

% Number of side for our polygon
numSides = 7;

% Angles at which our polygon vertices endpoints will be
anglesDeg = linspace(0, 360, numSides + 1);
anglesRad = anglesDeg * (pi / 180);
radius = 200;

% X and Y coordinates of the points defining out polygon
yPosVector = sin(anglesRad) .* radius + yCenter;
xPosVector = cos(anglesRad) .* radius + xCenter;

% Set the color of the rect to red
rectColor = [1 0 0];

% Draw the rect to the screen
Screen('FillPoly', window, rectColor, [xPosVector; yPosVector]', 1);

% Flip to the screen
Screen('Flip', window);

% Wait for a key press
KbStrokeWait;

% Clear the screen
sca;