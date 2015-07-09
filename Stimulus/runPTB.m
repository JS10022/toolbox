%% runExperiment

close all;
clear all;
sca; 


ask		= '\nDid the phase successfully complete? y or n \n';
F		= false;
T		= true;
bobo	= 'Buy Bobo a yo-yo';
yoyo	= 'I owe you a yo-yo';

% Create & draw window
% window = Window();

%{
%% Audapter
	addpath c:/speechres/commonmcode
	cds('audapter_matlab');
% 	Audapter('setParam', 'srate', 16000);
% 	Audapter('setParam', 'frameLen', 32);
% 	Audapter('setParam', 'downFact', 3);
	Audapter('start');
%}

% [ subject, match, stimulus, phraseNum ] = getSubjInfo();

%% ~~~ Debug & development stuff ~~~ 
subject		= '000_NH';						% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
match		= 'Matched';					% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
% stimulus	= 'Visual';						% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
stimulus	= 'Auditory';					% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
phraseNum	= 1;							% ~~~ DEVELOPMENT PURPOSES ONLY ~~~

DEBUG	= true;
% DEBUG	= false;

phrase	= getPhrase(phraseNum);

%% Pre-Experiment
%{
Directive(1);
Directive(2);

disp('Have the subject read the Caterpillar script');
input('Press ENTER to continue');

Directive(3);
vowelReps(window, 6, T);					% Run vowelReps with alternating masking

input('Press ENTER to continue');

Directive(4);
prePost(window, yoyo, 10, T);
input('Press ENTER to continue');
prePost(window, bobo, 10, T);

input('Press ENTER to continue');

Directive(5);
vowelReps(window, 5);

input('Press ENTER to continue');

Directive(6);
prePost(window, yoyo, 10, F);

input('Press ENTER to begin Learning Phase');
%}

%% Run First Phase of Experiment 
%{
Directive(7);

Learning( window, phrase, subject, match, stimulus );

% Generalization Phase

phrase	= getPhrase(phraseNum + 1);

Generalization( window, phrase, subject, match, stimulus )


% Begin Post Assessment - Phase 1

Directive(8);
vowelReps(window, 6, T);					% Run vowelReps with alternating masking

Directive(9);
prePost(window, bobo, 6, T);				% Run prePost with alternating masking

Directive(10);
vowelReps(window, 3, F, T);					% Run vowelReps with masking

Directive(11);
prePost(window, yoyo, 5, F, T);				% Run prePost with masking
prePost(window, bobo, 5, F, T);				% Run prePost with masking
%}

%% Set up Second Phase

[phraseNum, stimulus] = nextPhase(phraseNum, stimulus);

phrase	= getPhrase(phraseNum);

input('Press ENTER to begin Second Phase');



%% Run Second Phase of Experiment 
%{
Directive(7);

Learning( window, phrase, subject, match, stimulus );

% Generalization Phase

phrase	= getPhrase(phraseNum + 1);

Generalization( window, phrase, subject, match, stimulus )

% Begin Post Assessment - Phase 2
% %{
Directive(8);
vowelReps(window, 6, T);					% Run vowelReps with alternating masking

Directive(9);
prePost(window, bobo, 6, T);				% Run prePost with alternating masking

Directive(10);
vowelReps(window, 3, F, T);					% Run vowelReps with masking

Directive(11);
prePost(window, yoyo, 5, F, T);				% Run prePost with masking
prePost(window, bobo, 5, F, T);				% Run prePost with masking
%}

close all;
clear all;
sca;

