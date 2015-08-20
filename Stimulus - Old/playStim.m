function  playStim( ) % phrase, subject, match, stimulus )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


% Skip sync tests (to resolve sync errors) and suppress PTB logo "splash screen"
Screen('Preference', 'SkipSyncTests', 2);
Screen('Preference', 'VisualDebugLevel', 1);

% Select the external screen if it is present, else revert to the native screen
screenNumber = max(Screen('Screens'));

% Define black & white
black	= BlackIndex(screenNumber);

% rect = Screen('WindowSize', screenNumber);



win		= Screen('OpenWindow', screenNumber, black); % , rect);




% Variables
% ycenter		= screenY * 0.5;

% moviename	= getStim(phrase, subject, match, stimulus);

moviename = 'E:\Users\SpeechLab\Videos\videoplayback.mp4';

%% Attempt to play video
try
% 	error(moviename)
	movie = Screen('OpenMovie', win, moviename);
	Screen('PlayMovie', movie, 1);
	
		% Inturrupts if a key is pressed
		while ~KbCheck
		% Wait for next movie frame, retrieve texture handle to it
		tex = Screen('GetMovieImage', win, movie);
		
		% Valid texture returned? A negative value means end of movie reached:
		if tex <= 0
			% We're done, break out of loop:
			break;
		end
		
		
		% Draw the new texture immediately to screen:
		Screen('DrawTexture', win, tex);
		
		% Update display:
		Screen('Flip', win);
		
		% Release texture:
		Screen('Close', tex);
	end
	
	% Stop playback:
	Screen('PlayMovie', movie, 0);
	
	% Close movie:
	Screen('CloseMovie', movie);
	
catch %#ok<CTCH>
	sca;
	psychrethrow(psychlasterror);
end

% Close window
Screen('Close', win);

end

