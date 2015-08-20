function drawOrtho( phrase, seconds )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if nargin < 2 || isempty(seconds)
	seconds = 3;
end


%% Set up PTB window
window = Window;					% === Creates a new window if none are open === %



%% Define a few things

% Select the external screen
% screenNumber= max(Screen('Screens'));

% Define white
white	= WhiteIndex(max(Screen('Screens')));

% Get the size of the on screen window in pixels
[X, Y]	= Screen('WindowSize', window);

% === Calculate the center of the screen === %
midY	= Y * 0.35;
null		= ' ';


%% Display text
	% Draw all the text in one go
	Screen('TextSize', window, X * 0.05);			% === Font size ===
	DrawFormattedText(window, phrase, 'center', midY, white);

	% Flip to the screen
	Screen('Flip', window);
	
	
	% Give the subject a few seconds to read the prompt
	WaitSecs(seconds);
	
	% Clear the screen
	DrawFormattedText(window, null);
	Screen('Flip', window);

end

