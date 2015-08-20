function drawText( window, text, seconds )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if nargin < 3 || isempty(seconds)
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
null		= ' ';

%% Display text
% Draw all the text in one go
	Screen('TextSize', window, screenX * 0.05);			% === Font size ===
	DrawFormattedText(window, text, 'center', centerY, white);

	% Flip to the screen
	Screen('Flip', window);
	
	
	% Give the subject a few seconds to read the prompt
	WaitSecs(seconds);
	
	% Clear the screen
	DrawFormattedText(window, null, 'center', centerY, white);
	Screen('Flip', window);

end

