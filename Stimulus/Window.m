function window = Window( )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
% if nargin < 1 || isempty(video)
% 	video = false;
% end


window = Screen('Windows');

if(isempty(window))
	
	% Skip sync tests (to resolve sync errors) and suppress PTB logo "splash screen"
	Screen('Preference', 'SkipSyncTests', 2);
	Screen('Preference', 'VisualDebugLevel', 1);
	Screen('Preference', 'SuppressAllWarnings', 1);

	% Select the external screen
	screenNum	= max(Screen('Screens'));

	% Define black
	black		= BlackIndex(screenNum);

	% Open an on screen window and color it black
	% if ~video
		window		= PsychImaging('OpenWindow', screenNum, black);
% else
% 	msg		= Screen('OpenWindow', screenNum, black);
end

% Set the blend funciton for the screen
% Screen('BlendFunction', msg, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');

end

