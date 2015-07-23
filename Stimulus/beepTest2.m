close all;
clear all;
sca;

%% Define some variables
ask			= '\nDid the phase successfully complete? y or n \n';
f			= false;
t			= true;
bobo		= 'Buy Bobo a yo-yo';
yoyo		= 'I owe you a yo-yo';
wait		= '\n\tPress ENTER to continue\n';
subject		= '000_NH';						% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
match		= 'Matched';					% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
stimulus	= 'Auditory';					% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
phraseNum	= 1;							% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
phrase		= getPhrase(phraseNum);
phrase2		= getPhrase(phraseNum + 1);
% window		= Window;
ortho		= getOrtho(phrase);
ortho2		= getOrtho(phrase2);
phase		= getPhase(5);
reps		= 1;
root		= 'C:\Users\SpeechLab\Google Drive\SRP 2015\Experiments\';
rass		= ' RASS Stimuli\';
outfile		= [root 'DEBUG' '\' 'DEBUG' ' - ' match ' - ' stimulus '.txt'];

%% Log file
% if(logfile)
if(exist([root subject], 'file') == 0)
	mkdir([root subject]);
end

diary(outfile);

fprintf(['\n === Information ===\n'		...
			'\nSubject:\t'	subject		...
			'\nMatch:\t\t'	match		...
			'\nStimulus:\t'	stimulus	...
			'\nPhrase 1:\t'	phrase		...
			'\t\t('			ortho ')'	...
			'\nPhrase 2:\t'	phrase2		...
			'\t\t('			ortho2		...
			')\n\n\n'		]);

fprintf('\n\n');
% end
%% Set up Audapter
addpath c:/speechres/commonmcode
cds('audapter_matlab');
Audapter('deviceName', 'AudioBox');
Audapter(3, 'srate', 12000);
Audapter(3, 'downfact', 4);
Audapter(3, 'framelen', 256);

%% What to Run:
	
% vowelReps(4, f, f, t);

% audioStim( phrase, subject, match, stimulus )

% Learning( window, phrase, subject, match, stimulus );

% Audapter playTone;

audioGate( 5, f )









%% Housecleaning
diary off;
close all;
clear all;
sca;