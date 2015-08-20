function drawOrtho( phrase, seconds )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%% Create & draw window
window = Window;

if nargin < 2 || isempty(seconds)
% 	seconds = 35;
	seconds = 3;
end

%% Define a few things

% Select the external screen
screenNumber = max(Screen('Screens'));

% Define white
white	= WhiteIndex(screenNumber);

% Get the size of the on screen window in pixels
[screenX, screenY] = Screen('WindowSize', window);


%% Variables
centerY		= screenY * 0.35;

%% Display text
% Draw all the text in one go
	Screen('TextSize', window, screenX * 0.05);			% === Font size ===
	DrawFormattedText(window, phrase, 'center', centerY, white);

	% Flip to the screen
	Screen('Flip', window);
	
	
	% Give the subject a few seconds to read the prompt
	WaitSecs(seconds);
	
	% Close the screen
	Screen('CloseAll');



end

