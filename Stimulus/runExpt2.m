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


%% Define some variables
f		= false;
t		= true;
bobo	= 'Buy Bobo a yo-yo';
yoyo	= 'I owe you a yo-yo';
wait	= '\n	Press ENTER to continue\n';
new		= f;

%% ~~~ Debug & development stuff ~~~  
root	= dataDir;		
% 'E:\SharePoint\Subject Data - Documents\##X\##XXX#\log.txt'
outfile = [root subj.dir '\' subj.id '\log.txt'];

if(exist([root subj.dir], 'file') == 0)
	mkdir([root subj.id]);
end

if(exist(outfile, 'file') == 0)
	new 	= t;
	resume 	= 0;
end

diary(outfile);


%% Restart Experiment
if(~new)
	% === Asks the proctor to continue === %
	fprintf('\n\nIt looks like an experiment log file already exists for this subject.');
		
	cont = input('\n\nWould you like to resume the previous experiment? y or n \n', 's');
	
	if(cont == 'y')		% === Asks what directive to begin at === %
		resume = input('\n\nAlright, what directive number would you like to begin at?\n');
		
		replay = input('\n\nWould you like to play the directive? y or n\n', 's');
		if(replay == 'y')
			Directive2(resume);
		end
	else
		resume = 0;		% === Begins at Directive 1 === %
	end
end


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





input('\nPress ENTER to begin the experiment\n');


%% Pre-Experiment
% %{
if(resume == 0)
	fprintf('\nPrompting Directives 1 & 2\n');
	Directive2(1);
end

if (resume <= 1)
	Caterpillar( );
	input(wait);
	
	fprintf('\nPrompting Directive 2\n');
	Directive2(2);
end

if (resume <= 2)
	vowelReps(6, f, f, t);			% Run vowelReps with last 3 cycles masked, no RASS
	fprintf('\nPrompting Directive 4\n');
	Directive2(3);
	input(wait);
end

if (resume <= 3)
	prePost(yoyo, 10, f, f, t);		% Prompt yoyo with last 5 masked, no RASS
	input(wait);
	prePost(bobo, 10, f, f, t);		% Prompt bobo with last 5 masked, no RASS
	fprintf('\n\n\t############ Start RASS here ############\n\n\n\n');
	input(wait);
	fprintf('\nPrompting Directive 4\n');
	Directive2(4);
	input(wait);
end

if (resume <= 4)
	vowelReps(6, t, f, t);			% Run vowelReps with RASS, last 3 cycles masked
	fprintf('\nPrompting Directive 5\n');
	Directive2(5);
	input(wait);
end

if (resume <= 5)
	prePost(bobo, 10, t, f, f);		% Prompt bobo with RASS, no masking

	% --- Learning Phase --- %
	fprintf('\nPrompting Directive 6\n');
	Directive2(6);
	input('\n	Press ENTER to begin Learning Phase');
end

if (resume <= 6)
	Learning( subj );
	
	% --- Generalization Phase --- %
	Generalization( subj );
	
	% Begin Post Assessment - Phase 1
	fprintf('\n\n\nPrompting Directive 7\n');
	Directive2(7);
	input(wait);
end

if (resume <= 7)
	vowelReps(6, t, t, f);			% Run vowelReps with RASS and first 3 cycles masked

	fprintf('\nPrompting Directive 8\n');
	Directive2(8);
	input(wait);
end

if (resume <= 8)
	prePost(bobo, 6, t, t, f);		% Prompt bobo with RASS and last 3 reps masked

	fprintf('\nPrompting Directive 9\n');
	Directive2(9);
	input(wait);
end

if (resume <= 9)
	vowelReps(3, f, t, t);			% Run vowelReps x3 with full masking

	fprintf('\nPrompting Directive 10\n');
	Directive2(10);
	input(wait);
end

if (resume <= 10)
	prePost(yoyo, 5, f, t, t);		% Prompt yoyo with full masking, no RASS
	prePost(bobo, 5, f, t, t);		% Prompt bobo with full masking, no RASS
end





%% Housecleaning
diary off;
close all;
clear all;
sca;

allDone;