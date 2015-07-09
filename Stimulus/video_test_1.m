% Clear the workspace and the screen
close all;
clear all;
sca

% Skip sync tests and suppress PTB splash screen
Screen('Preference', 'SkipSyncTests', 2);
Screen('Preference', 'VisualDebugLevel', 1);

% Here we call some default settings for setting up Psychtoolbox
PsychDefaultSetup(2);

% Skip sync tests for demo purposes only
Screen('Preference', 'SkipSyncTests', 2);

% Get the screen numbers
screens = Screen('Screens');

% Select the external screen if it is present, else revert to the native
% screen
screenNumber = max(screens);

% Define black & white
black = BlackIndex(screenNumber);
white = WhiteIndex(screenNumber);

moviefile = 'C:\toolbox\Stimulus\stim1.mov';


[window, windowRect] = Screen('OpenWindow', screenNumber, 1);

moviePtr = SimpleMovieDemo(moviefile, windowRect);

% moviePtr = Screen('OpenMovie', window, moviefile);
Screen('PlayMovie', moviePtr, 1); 








% Wait a second before closing the screen
WaitSecs(1);

% Clear the screen
close all;
clear all;
sca