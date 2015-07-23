%% runExperiment

% close all;
% clear all;
sca;

%% Create & draw window
window = Window;


%% Get subject info and phrase
% [ subject, match, stimulus, phraseNum ] = getSubjInfo;


subject		= '018_RU';						% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
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
root	= 'C:\Users\SpeechLab\Google Drive\SRP 2015\Experiments\';
outfile = [root subject '\' subject ' - ' match ' - ' stimulus '.txt'];

if(exist([root subject], 'file') == 0)
	mkdir([root subject]);
end

diary(outfile);

% DEBUG	= true;
DEBUG	= false;


%% Define some variables
ask		= '\nDid the phase successfully complete? y or n \n';
f		= false;
t		= true;
bobo	= 'Buy Bobo a yo-yo';
yoyo	= 'I owe you a yo-yo';
wait	= '\n	Press ENTER to continue\n';


%% Output Experiment info to log file

fprintf(['\t=== Information ===\n'		...
			'\nSubject:\t'	subject		...
			'\nMatch:\t\t'	match		...
			'\nStimulus:\t'	stimulus	...
			'\nPhrase 1:\t'	phrase		...
			'\t\t('			ortho ')'	...
			'\nPhrase 2:\t'	phrase2		...
			'\t\t('			ortho2		...
			')\n\n\n'		]);

%% Set up Audapter

fprintf('\n\n\t=== Audapter ===\n');
addpath c:/speechres/commonmcode
cds('audapter_matlab');
Audapter('deviceName', 'AudioBox');
Audapter(3, 'srate', 12000);
Audapter(3, 'downfact', 4);
Audapter(3, 'framelen', 256);


fprintf('\n\n');

%% Pre-Experiment
%{

fprintf('\nPrompting Directive 1\n');
Directive(1);
fprintf('Prompting Directive 2\n');
Directive(2);


fprintf('\nHave the subject read the Caterpillar script\n');
drawText(window, 'Please read Caterpillar', 60);
input(wait);
% %}

% %{
fprintf('\nPrompting Directive 3\n');
Directive(3);
vowelReps(6, f, f, t);					% Run vowelReps with last 3 cycles masked, no RASS

% %}
fprintf('\nPrompting Directive 4\n');
Directive(4);
input(wait);
prePost(window, yoyo, 10, f, f, t);		% Prompt yoyo with last 5 masked, no RASS
input(wait);
prePost(window, bobo, 10, f, f, t);		% Prompt bobo with last 5 masked, no RASS


fprintf('\n\n\t############ Start RASS here ############\n\n\n\n');

%}
% fprintf('\nPrompting Directive 5\n');
% Directive(5);
% input(wait);
vowelReps(6, t, f, t);					% Run vowelReps with RASS, last 3 cycles masked


fprintf('\nPrompting Directive 6\n');
Directive(6);
input(wait);
prePost(window, bobo, 10, t, f, f);		% Prompt bobo with RASS, no masking


%}

%% Run First Phase of Experiment 
% %{

% --- Learning Phase --- %
fprintf('\nPrompting Directive 7\n');
Directive(7);
input('\n	Press ENTER to begin Learning Phase');
% fprintf('\n');
Learning( window, phrase, subject, match, stimulus );
%}


% --- Generalization Phase --- %
Generalization( window, phrase2, subject, match, stimulus );


%% Begin Post Assessment - Phase 1
% %{
fprintf('\n\n\nPrompting Directive 8\n');
Directive(8);
input(wait);
vowelReps(6, t, t, f);					% Run vowelReps with RASS and first 3 cycles masked


fprintf('\nPrompting Directive 9\n');
Directive(9);
input(wait);
prePost(window, bobo, 6, t, t, f);		% Prompt bobo with RASS and last 3 reps masked


fprintf('\nPrompting Directive 10\n');
Directive(10);
input(wait);
vowelReps(3, f, t, t);					% Run vowelReps with full masking


fprintf('\nPrompting Directive 11\n');
Directive(11);
input(wait);
prePost(window, yoyo, 5, f, t, t);		% Prompt yoyo with full masking, no RASS
prePost(window, bobo, 5, f, t, t);		% Prompt bobo with full masking, no RASS
%}



%% Housecleaning
diary off;
close all;
clear all;
sca;

allDone;