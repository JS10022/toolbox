% Clear the workspace and the screen
close all;
clear all;
sca

Screen('Preference', 'SkipSyncTests', 2);
Screen('Preference', 'VisualDebugLevel', 2);


% Here we call some default settings for setting up Psychtoolbox
PsychDefaultSetup(2);

% Get the screen numbers
screens = Screen('Screens');

% Select the external screen if it is present, else revert to the native screen
screenNumber = max(screens);

% Define black, white and grey
black = BlackIndex(screenNumber);
white = WhiteIndex(screenNumber);
grey = white / 2;

% Open an on screen window and color it grey
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, grey);

% Set the blend funciton for the screen
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');

% Get the size of the on screen window in pixels
% For help see: Screen WindowSize?
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% Get the centre coordinate of the window in pixels
% For help see: help RectCenter
[xCenter, yCenter] = RectCenter(windowRect);

% Lets write three lines of text, the first and second right after one
% another, and the third with a line space in between. To add line spaces
% we use the special characters "\n"
% lines = getCater;
lines = {'ABCDEFGHIJKLMNOPQRSTUVWXYZ', '\nabcdefghijklmnopqrstuvwxyz'};


% Draw all the text in one go
Screen('TextSize', window, 1440 * 0.05);							% === Font size ===

size = Screen('TextSize', window);

DrawFormattedText(window, [lines{:}],...
    'center', screenYpixels * 0.05, white);




% Flip to the screen
Screen('Flip', window);

% Now we have drawn to the screen we wait for a keyboard button press (any
% key) to terminate the demo
KbStrokeWait;

% Clear the screen
sca;