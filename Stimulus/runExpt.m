%% runExperiment

Screen('Preference', 'SuppressAllWarnings', 1);
sca;


%% Masking test
mask = input('\n\nMasking test? y or n \n', 's');
if(mask == 'y')
	while(1)
		fprintf('\tPress ENTER to stop masking');
		
		Masking
		
		ask	= 'Done with Masking check? y or n \n';
		input('\n');
		cont = input(ask, 's');					% === Asks the proctor to continue === %
		if(cont == 'n')
												% === "Do nothing" (i.e. the while loop will restart) === %
		else
			break;								% === Breaks while loop if yes, else repeats === %
		end
	end
end


%% Get subject info and phrase
subj 	= getSubjInfo;
phrase	= subj.pair;
ortho	= subj.pair;


%% ~~~ Debug & development stuff ~~~  
root	= dataDir;		
% 'E:\SharePoint\Subject Data - Documents\##X\##XXX#\log.txt'
outfile = [root subj.dir '\' subj.id '\log.txt'];

if(exist([root subj.dir], 'file') == 0)
	mkdir([root subj.id]);
end

diary(outfile);


%% Define some variables
f		= false;
t		= true;
bobo	= 'Buy Bobo a yo-yo';
yoyo	= 'I owe you a yo-yo';
wait	= '\n	Press ENTER to continue\n';

%% Output Experiment info to log file
% %{
fprintf(['\t=== Information ===\n'		...
			'\nSubject:\t'	subj.id		...
			'\nSex:\t\t'	subj.sex	...
			'\nMatch:\t\t'	subj.match	...
			'\nStimulus:\t'	subj.stim	...
			'\nPhrase 1:\t'	phrase{1}	...
			'\t\t('			ortho{1} ')'...
			'\nPhrase 2:\t'	phrase{2}	...
			'\t\t('			ortho{2}	...
			')\n\n\n'		]);
%}


%% Set up Audapter

fprintf('\n\n\t=== Audapter ===\n');
addpath c:/speechres/commonmcode
cds('audapter_matlab');
Audapter('deviceName', 'AudioBox');
Audapter(3, 'srate', 	11025);
Audapter(3, 'downfact', 4);
Audapter(3, 'framelen', 128);
Audapter(3, 'rampLen', 0.1);


fprintf('\n\n');



% *************** RESUMING INTERRUPTED EXPERIMENTS *************** 
% *
% *	To resume a previous experiment, put the mouse cursor on the line
% * just below this dialog that currently reads "% %{" and press CTRL + Q.
% *  The line should then read "%{".  
% *
% * Then go to the line ABOVE (i.e. before) the phase you wish to begin
% * at, and create a new line.  On the new, blank line type a percentage
% * sign, and a closing curly bracket. The line should then read "%}".
% * There cannot be ANYTHING else on that line, even spaces.  It must 
% * contain ONLY "%}" (without the quotations of course).
% *
% * Be sure to save this script before attempting to run it in MATLAB.
% *

% %{









input('\nPress ENTER to begin the experiment\n');


%% Pre-Experiment
% %{

fprintf('\nPrompting Directive 1\n');
Directive(1);
fprintf('Prompting Directive 2\n');
Directive(2);


Caterpillar( );
input(wait);


% %}
fprintf('\nPrompting Directive 3\n');
Directive(3);
% %}
vowelReps(6, f, f, t);			% Run vowelReps with last 3 cycles masked, no RASS

% %}
fprintf('\nPrompting Directive 4\n');
Directive(4);
input(wait);
prePost(yoyo, 10, f, f, t);		% Prompt yoyo with last 5 masked, no RASS
input(wait);
prePost(bobo, 10, f, f, t);		% Prompt bobo with last 5 masked, no RASS
% %}

fprintf('\n\n\t############ Start RASS here ############\n\n\n\n');
input(wait);



% %}
fprintf('\nPrompting Directive 5\n');
Directive(5);
input(wait);
vowelReps(6, t, f, t);			% Run vowelReps with RASS, last 3 cycles masked
% %}

fprintf('\nPrompting Directive 6\n');
Directive(6);
input(wait);
prePost(bobo, 10, t, f, f);		% Prompt bobo with RASS, no masking
% %}

%% Run First Phase of Experiment 

% --- Learning Phase --- %
fprintf('\nPrompting Directive 7\n');
Directive(7);
input('\n	Press ENTER to begin Learning Phase');
% %}

Learning( subj );
% %}


% --- Generalization Phase --- %
Generalization( subj );


%% Begin Post Assessment - Phase 1
fprintf('\n\n\nPrompting Directive 8\n');
Directive(8);
input(wait);
vowelReps(6, t, t, f);			% Run vowelReps with RASS and first 3 cycles masked

% %}

fprintf('\nPrompting Directive 9\n');
% Directive(9);
input(wait);
prePost(bobo, 6, t, t, f);		% Prompt bobo with RASS and last 3 reps masked

% %}
fprintf('\nPrompting Directive 10\n');
Directive(10);
input(wait);
vowelReps(3, f, t, t);			% Run vowelReps x3 with full masking


fprintf('\nPrompting Directive 11\n');
Directive(11);
input(wait);
prePost(yoyo, 5, f, t, t);		% Prompt yoyo with full masking, no RASS
prePost(bobo, 5, f, t, t);		% Prompt bobo with full masking, no RASS
%}





%% Housecleaning
diary off;
close all;
clear all;
sca;

allDone;