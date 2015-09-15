%% runExperiment

% close all;
% clear all;
sca;



%% Get subject info and phrase
subj = getSubjInfo;

%{
% subject		= '016_TP';						% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
subject		= 'DEBUG';						% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
match		= 'Matched';					% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
stimulus	= 'Visual';						% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
% stimulus	= 'Auditory';					% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
pair		= 1;							% ~~~ DEVELOPMENT PURPOSES ONLY ~~~

switch(pair)
	case 1
		phraseNum = 1;
	case 2
		phraseNum = 3;
	case 3
		phraseNum = 5;
	case 4
		phraseNum = 7;
	otherwise
		error('Invalid input.  Must be between 1-4.');
end
%}


phrase	= subj.pair;
ortho	= subj.pair;	% getOrtho(phrase);			% ### TODO - Fix getOrtho ### %


%% ~~~ Debug & development stuff ~~~  
root	= dataDir;
outfile = [root subj.dir '\' subj.id '\log.txt'];

if(exist([root subj.id], 'file') == 0)
	mkdir([root subj.id]);
end

diary(outfile);


%% Define some variables
ask		= '\nDid the phase successfully complete? y or n \n';
f		= false;
t		= true;
bobo	= 'Buy Bobo a yo-yo';
yoyo	= 'I owe you a yo-yo';
wait	= '\n	Press ENTER to continue\n';

%% Output Experiment info to log file
%{
fprintf(['\t=== Information ===\n'		...
			'\nSubject:\t'	subj.id		...
			'\nMatch:\t\t'	subj.match	...
			'\nStimulus:\t'	subj.stim	...
			'\nPhrase 1:\t'	phrase(1)	...
			'\t\t('			ortho(1) ')'...
			'\nPhrase 2:\t'	phrase(2)	...
			'\t\t('			ortho(2)	...
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
Audapter(3, 'rampLen', 0.085);


fprintf('\n\n');

%% Pre-Experiment
%{

fprintf('\nPrompting Directive 1\n');
Directive(1);
fprintf('Prompting Directive 2\n');
Directive(2);
%}

% Caterpillar( );
% input(wait);
% %}

%{
fprintf('\nPrompting Directive 3\n');
Directive(3);
vowelReps(6, f, f, t);					% Run vowelReps with last 3 cycles masked, no RASS

% %}

fprintf('\nPrompting Directive 4\n');
Directive(4);
input(wait);
prePost(yoyo, 10, f, f, t);		% Prompt yoyo with last 5 masked, no RASS
input(wait);
prePost(bobo, 10, f, f, t);		% Prompt bobo with last 5 masked, no RASS


fprintf('\n\n\t############ Start RASS here ############\n\n\n\n');

% %}
fprintf('\nPrompting Directive 5\n');
Directive(5);
input(wait);
vowelReps(6, t, f, t);					% Run vowelReps with RASS, last 3 cycles masked


fprintf('\nPrompting Directive 6\n');
Directive(6);
input(wait);
prePost(bobo, 10, t, f, f);		% Prompt bobo with RASS, no masking


% %}

%% Run First Phase of Experiment 
% %{

% --- Learning Phase --- %
fprintf('\nPrompting Directive 7\n');
Directive(7);
input('\n	Press ENTER to begin Learning Phase');
%}

Learning( subj );
% %}


% --- Generalization Phase --- %
Generalization( subj );


%% Begin Post Assessment - Phase 1
% %{
fprintf('\n\n\nPrompting Directive 8\n');
Directive(8);
input(wait);
vowelReps(6, t, t, f);					% Run vowelReps with RASS and first 3 cycles masked


fprintf('\nPrompting Directive 9\n');
Directive(9);
input(wait);
prePost(bobo, 6, t, t, f);		% Prompt bobo with RASS and last 3 reps masked

% %}
fprintf('\nPrompting Directive 10\n');
Directive(10);
input(wait);
vowelReps(3, f, t, t);					% Run vowelReps with full masking


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