%% runExperiment

close all;
clear all;
sca; 

%% Create & draw window
window = Window();


%% Get subject info and phrase
% [ subject, match, stimulus, phraseNum ] = getSubjInfo();



subject		= '002_MB';						% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
match		= 'Matched';					% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
% stimulus	= 'Visual';						% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
stimulus	= 'Auditory';					% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
pair		= 2;							% ~~~ DEVELOPMENT PURPOSES ONLY ~~~

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

phrase	= getPhrase(phraseNum);
phrase2	= getPhrase(phraseNum + 1);
ortho	= getOrtho(phrase);
ortho2	= getOrtho(phrase2);



%% ~~~ Debug & development stuff ~~~ 
root	= 'C:\Users\SpeechLab\Google Drive\SRP 2015\RASS Stimuli\';
outfile = [root subject '\' subject ' - ' match ' - ' stimulus '.txt'];
diary(outfile);

DEBUG	= true;
% DEBUG	= false;


%% Set up Audapter
addpath c:/speechres/commonmcode
cds('audapter_matlab');
Audapter('deviceName', 'AudioBox');
Audapter(3, 'srate', 12000);
Audapter(3, 'downfact', 4);
Audapter(3, 'framelen', 256);



%% Define some variables
ask		= '\nDid the phase successfully complete? y or n \n';
f		= false;
t		= true;
bobo	= 'Buy Bobo a yo-yo';
yoyo	= 'I owe you a yo-yo';
wait	= '\n	Press ENTER to continue\n';


%% Output Experiment info to log file

fprintf(['\n\n === Information ===\n\n' ...
			'\nSubject:\t'	subject		...
			'\nMatch:\t\t'	match		...
			'\nStimulus:\t'	stimulus	...
			'\nPhrase 1:\t'	phrase		...
			'\t\t('			ortho ')'	...
			'\nPhrase 2:\t'	phrase2		...
			'\t\t('			ortho2		...
			')\n\n\n'		]);
	

%% Pre-Experiment
% %{

disp('Prompting Directive 1');
Directive(1);
disp('Prompting Directive 2');
Directive(2);

disp('Have the subject read the Caterpillar script');
drawText(window, 'Please read Caterpillar', 60);
input(wait);

disp('Prompting Directive 3');
Directive(3);
vowelReps(6, f, f, t);					% Run vowelReps with last 3 cycles masked, no RASS


disp('Prompting Directive 4');
Directive(4);
input(wait);
prePost(window, yoyo, 10, f, f, t);		% Prompt yoyo with last 5 masked, no RASS
input(wait);
prePost(window, bobo, 10, f, f, t);		% Prompt bobo with last 5 masked, no RASS


%%%%%%%%%%%%% Start RASS here %%%%%%%%%%%%% 


disp('Prompting Directive 5');
Directive(5);
input(wait);
vowelReps(6, t, f, t);					% Run vowelReps with RASS, last 3 cycles masked


disp('Prompting Directive 6');
Directive(6);
input(wait);
prePost(window, bobo, 10, t, f, f);		% Prompt bobo with RASS, no masking


%}

%% Run First Phase of Experiment 
% %{

disp('Prompting Directive 7');
Directive(7);
% input(wait);
input('\n	Press ENTER to begin Learning Phase');
Learning( window, phrase, subject, match, stimulus );

%% Generalization Phase

% phrase	= getPhrase(phraseNum + 1);

Generalization( window, phrase2, subject, match, stimulus )


% Begin Post Assessment - Phase 1

disp('Prompting Directive 8');
Directive(8);
vowelReps(6, t, t, f);					% Run vowelReps with RASS and first 3 cycles masked


disp('Prompting Directive 9');
Directive(9);
input(wait);
prePost(window, bobo, 6, t, t, f);		% Prompt bobo with RASS and last 3 reps masked


disp('Prompting Directive 10');
Directive(10);
input(wait);
vowelReps(3, f, t, t);					% Run vowelReps with full masking


disp('Prompting Directive 11');
Directive(11);
input(wait);
prePost(window, yoyo, 5, f, t, t);		% Prompt yoyo with full masking, no RASS
prePost(window, bobo, 5, f, t, t);		% Prompt bobo with full masking, no RASS
%}

%% Set up Second Phase
%{
[phraseNum, stimulus] = nextPhase(phraseNum, stimulus);

phrase	= getPhrase(phraseNum);

input('Press ENTER to begin Second Phase');



%% Run Second Phase of Experiment 
% %{
Directive(7);

Learning( window, phrase, subject, match, stimulus );

% Generalization Phase

phrase	= getPhrase(phraseNum + 1);

Generalization( window, phrase, subject, match, stimulus )

% Begin Post Assessment - Phase 2
% %{
Directive(8);
vowelReps(6, t, t, f);					% Run vowelReps with alternating masking

Directive(9);
prePost(window, bobo, 6, t);				% Run prePost with alternating masking

Directive(10);
vowelReps(3, f, t, t);					% Run vowelReps with masking

Directive(11);
prePost(window, yoyo, 5, f, t);				% Run prePost with masking
prePost(window, bobo, 5, f, t);				% Run prePost with masking
%}

close all;
clear all;
sca;

