function drawText( window, text )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%% Define a few things

% Select the external screen
screenNumber = max(Screen('Screens'));

% Define black & white
black	= BlackIndex(screenNumber);
white	= WhiteIndex(screenNumber);

% Get the size of the on screen window in pixels
[screenX, screenY] = Screen('WindowSize', window);


%% Variables
centerY		= screenY * 0.5;
null		= ' ';

%% Display text
% Draw all the text in one go
	Screen('TextSize', window, screenX * 0.05);			% === Font size ===
	DrawFormattedText(window, text, 'center', centerY, white);

	% Flip to the screen
	Screen('Flip', window);
	
	
	% Give the subject a few seconds to read the prompt
	WaitSecs(4);
	
	% Clear the screen
	DrawFormattedText(window, null, 'center', centerY, white);
	Screen('Flip', window);

end

