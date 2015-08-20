function stimTest1( runs, phrase)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

close all;
% clear all;
sca

if nargin < 1 || isempty(runs)
    runs = 2;
end

% Skip sync tests (to resolve sync errors) and suppress PTB splash screen
Screen('Preference', 'SkipSyncTests', 2);
Screen('Preference', 'VisualDebugLevel', 1);


% Select the external screen if it is present, else revert to the native screen
screenNumber = max(Screen('Screens'));

% Define black & white
black	= BlackIndex(screenNumber);
white	= WhiteIndex(screenNumber);
grey	= white / 4;





% Open an on screen window and color it grey
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

% Set the blend funciton for the screen
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');

% Get the size of the on screen window in pixels
% For help see: Screen WindowSize?
[screenXpixels, screenYpixels] = Screen('WindowSize', window);


% Lets write three lines of text, the first and second right after one
% another, and the third with a line space in between. To add line spaces
% we use the special characters "\n"

null	= ' ';




% moviename	= 'C:\toolbox\Stimulus\test3.mp4';
beepfile	= 'C:\toolbox\Stimulus\beep.wav';

beep		= audioread(beepfile);
beeptone	= 28000;									% === 28,000 Hz ===





for i = 1:runs

% 	break;
	
	
	% Draw all the text in one go
	Screen('TextSize', window, screenXpixels * 0.05);			% === Font size ===
	DrawFormattedText(window, phrase,'center', screenYpixels * 0.5, white);

	% Flip to the screen
	Screen('Flip', window);
	
	% Give the subject a few seconds to read the prompt
	WaitSecs(5);
	
	% Clear the screen
	DrawFormattedText(window, null,'center', screenYpixels * 0.5, white);
	Screen('Flip', window);
	
	sound(beep, beeptone);
	
% 	visualStim
	
	
%{
try
    % Open 'windowrect' sized window on screen, with black [0] background color:
%     win = Screen('OpenWindow', screenNumber, 0, windowRect);
    
% 	win
	
% 	break
	
    % Open movie file:
    movie = Screen('OpenMovie',window, moviename);
    
    % Start playback engine:
    Screen('PlayMovie', movie, 1);
    
    % Playback loop: Runs until end of movie or keypress:
    while ~KbCheck
        % Wait for next movie frame, retrieve texture handle to it
        tex = Screen('GetMovieImage', window, movie);
        
        % Valid texture returned? A negative value means end of movie reached:
        if tex <= 0
            % We're done, break out of loop:
            break;
        end
        
        % Draw the new texture immediately to screen:
        Screen('DrawTexture', window, tex);
        
        % Update display:
        Screen('Flip', window);
        
        % Release texture:
        Screen('Close', tex);
    end
    
    % Stop playback:
    Screen('PlayMovie', movie, 0);
    
    % Close movie:
    Screen('CloseMovie', movie);
    
    % Close Screen, we're done:
    Screen('Close', window);
    
catch %#ok<CTCH>
    sca;
    psychrethrow(psychlasterror);
end
	
%}
	
	% Now we have drawn to the screen we wait for a keyboard button press (any
	% key) to terminate the demo
% 	KbStrokeWait;

	WaitSecs(1);
end

% visualStim;

% Clear the screen
sca;




%{


%% RASS

close all;
% clear all;
sca

moviename = 'C:\toolbox\Stimulus\test3.mp4';


[window, windowrect] = Screen('OpenWindow', screenNumber, 1);





try
    % Open 'windowrect' sized window on screen, with black [0] background color:
    win = Screen('OpenWindow', screenNumber, 0, windowrect);
    
    % Open movie file:
    movie = Screen('OpenMovie', win, moviename);
    
    % Start playback engine:
    Screen('PlayMovie', movie, 1);
    
    % Playback loop: Runs until end of movie or keypress:
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
    
    % Close Screen, we're done:
    Screen('CloseAll');
    
catch %#ok<CTCH>
    sca;
    psychrethrow(psychlasterror);
end

%}

%% End
close all;
clear all;
sca


end
