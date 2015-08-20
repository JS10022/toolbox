%{
 ---- Old Code Scraps ---- %
%{
 A = importdata('Caterpillar.txt');
% fid = fopen('Caterpillar.m');

% M = fscanf(fid,'%s\n',10);
% M = fgetl(fid);

% A = Fscanf('Caterpillar.txt');
% A
% M

% caterpillar = cell(1,16);
% caterpillar{1}	= 'Do you like amusement parks?  ';
% caterpillar{2}	= 'Well, I sure do.  ';

% words	= cell(1,0);
% caterpillar
% fid

nMainPanels				= 1;
leftMargin				= 0.075;
panelSpacing			= 0.025;

 						  (1 - 2 * 0.075	  - (3			 - 1) * 0.025		) / 3
	nMainPanels = 1 -> panelWidth = 0.996
	nMainPanels = 3 -> panelWidth = 0.267


panelWidth				= (1 - 2 * leftMargin - (nMainPanels - 1) * panelSpacing) / nMainPanels;
panelHeight				= 0.525;

hsp						= nan(1, nMainPanels);

for i1 = 1 : nMainPanels
% 	hsp(i1)	= subplot('Position', [0.05, 0.45, 0.9, 0.5]);
    hsp(i1)	= leftMargin + (i1 - 1) * (panelWidth + panelSpacing);	% , 0.375, panelWidth, panelHeight]);
%     set(gca, 'XTick', [], 'YTick', []);
%     set(gca, 'XColor', 'w', 'YColor', 'w');
end

% panelWidth
hsp
%}

%{
thisphase = 'natural';

msgTxt = getStimStr('pre');

msgTxt

%}

%{
%% ---- Runs "Caterpillar" Stimulus ---- %%
fclose			all;
close			all force;												% Closes all previous instances


% exptConfigFN = 'expt_config_fmt.vowels.txt';							% 
exptConfigFN = 'expt_config_fmt.caterpillar.txt';						% 
check_file(exptConfigFN);												% Retrieves experimental peramaters from config file
expt_config		= read_parse_expt_config(exptConfigFN);					% 

expt.stimUtter	= expt_config.STIM_UTTER;

expt.script.pre.nReps	= expt_config.PRE_REPS;
expt.script.pract1.nReps= expt_config.PRACT1_REPS;						
expt.script.pract2.nReps= expt_config.PRACT2_REPS;

expt.script.pre		= genPhaseScript('pre', expt.script.pre.nReps, expt.stimUtter);
expt.script.pract1	= genPhaseScript('pract1', expt.script.pract1.nReps, expt.stimUtter);
expt.script.pract2	= genPhaseScript('pract2', expt.script.pract2.nReps, expt.stimUtter);


hkf					= figure('Position', [1760, 390, 760, 600], 'Color', 'w', ...		
							 'Name', 'Participant window', 'NumberTitle', 'off', ...
							 'Toolbar', 'none', 'Menubar', 'none');


%{
uiConfigFN = fullfile(dirname, 'uiConfig.mat');

    load(uiConfigFN);									% gives uiConfig
    showWordHint		= uiConfig.showWordHint;
    showWarningHint		= uiConfig.showWarningHint;
    showInfoOnlyErr		= uiConfig.showInfoOnlyErr;
    showCorrCount		= uiConfig.showCorrCount;
    bShowCorrAnim		= uiConfig.bShowCorrAnim;
    trialStartWithAnim	= uiConfig.trialStartWithAnim;
    trialPresetDur		= uiConfig.trialPresetDur;
    promptMode			= uiConfig.promptMode;
    promptVol			= uiConfig.promptVol;								 
%}

dirname = 'C:\DATA\APE\TS_FMT_20140113_FMT02';
% figIdDat = makeFigDataMon;

								 
% hgui = UIRecorder('figIdDat', figIdDat, 'dirname', dirname);			% ==== Creates the UIRecorder ("Control") window ====
% set(hgui.UIRecorder, 'Position', [1300, 290, 440, 700]);				% JS Position of "Control" window



msg = 'JS_test_1';

% play_prompt(msg, 'audio', 10^(uiConfig.promptVol / 20));
%}

%

% getCater(2)

% test = cell(1,16);
% 
% test{2} = getCater(2);
% test{3} = getCater(3);



% test = getStim(2);

% iscellstr(test)

%}

close all;
clear all;
sca

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

% Get the centre coordinate of the window in pixels
% For help see: help RectCenter
[xCenter, yCenter] = RectCenter(windowRect);

% Lets write three lines of text, the first and second right after one
% another, and the third with a line space in between. To add line spaces
% we use the special characters "\n"
lines	= getPhrase(2);
null	= ' ';


% [window, windowrect]	= Screen('OpenWindow', screenNumber, 1);



moviename	= 'C:\toolbox\Stimulus\test3.mp4';
% beepfile	= 'C:\toolbox\Stimulus\beep.wav';

% beep		= audioread(beepfile);
% tone		= 28000;									% === 28,000 Hz ===






for i = 1:5

% 	break;
	
	
	% Draw all the text in one go
	Screen('TextSize', window, screenXpixels * 0.05);			% === Font size ===
	DrawFormattedText(window, lines,'center', screenYpixels * 0.5, white);

	% Flip to the screen
	Screen('Flip', window);
	
	% Give the subject a few seconds to read the prompt
	WaitSecs(3);
	
	% Clear the screen
	DrawFormattedText(window, null,'center', screenYpixels * 0.5, white);
	Screen('Flip', window);
	
% 	sound(beep, tone);
	
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




% %{


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


