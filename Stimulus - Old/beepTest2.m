% close all;
% clear all;
% sca;

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
openWindow	= f;
% window		= Window;
% openWindow	= t;
ortho		= getOrtho(phrase);
ortho2		= getOrtho(phrase2);
phase		= getPhase(5);
reps		= 1;
root		= 'C:\Users\SpeechLab\Google Drive\SRP 2015\Experiments\';
rass		= ' RASS Stimuli\';
outfile		= [root 'DEBUG' '\' 'DEBUG' ' - ' match ' - ' stimulus '.txt'];


logfile = f;

%% Log file
if(logfile)
	
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
end

%% Set up Audapter
addpath c:/speechres/commonmcode
cds('audapter_matlab');
% Audapter('deviceName', 'AudioBox');
% Audapter(3, 'srate', 12000);
% Audapter(3, 'downfact', 4);
% Audapter(3, 'framelen', 64);

%% What to Run:
%{

% Audapter playTone;

% Wait for key press
% KbStrokeWait;



% Beeper(400, 0.4, 0.15)

% MakeBeep(44100,0.5,22254.5454545454);


% devices = PsychPortAudio('GetDevices');

% count = PsychPortAudio('GetOpenDeviceCount');

% pahandle = PsychPortAudio('Open');



% pitches = {[1,3,5],[542,25,235],[6,234,567],[333,5,852],[9,45,3]};
% 
% meanPitches = [];
% for n = 1:length(pitches)
%     meanPitches = [meanPitches, mean(pitches{n})]
% end
%}

exDataFN	= 'E:\Users\SpeechLab\Google Drive\Audapt\Test Code Backup\TS_FMT_20140213_FMT02'; 
% ../example_data/trial-1-2.mat';
% m			= matfile(exDataFN,'Writable',t);
% data		= m.data;
load(exDataFN);


% data.params

%{
% fs			= data.params.sr;					% === Sample Rate? === %
% sigIn		= data.signalIn;					% === Gets input signal === %
% infile = 'G:\SRP2015\RB SRP Data\Screenings\002_MB\002_MB_Screening.wav';
% 
% [sigIn, fs] = audioread(infile);
% 
% sigIn		= resample(sigIn, data.params.sr * data.params.downfact, fs);
% sigInCell	= makecell(sigIn, data.params.frameLen * data.params.downfact);
% 
% AudapterIO('init', p);
% 
% Audapter('setParam', 'rmsthr', 5e-3, 0);
% 
% Audapter('reset');
% 
% for n = 1 : length(sigInCell)
% 	Audapter('runFrame', sigInCell{n});
% end
% 
% data1		= AudapterIO('getData');
% 
% 
% player = audioplayer(sigIn, fs);
% 
% play(player);
% 
% pause(10);
% 
% stop(player);
%}


% infile		= 'C:\speechres\audapter_matlab\mcode\Test Code\ah.wav';
% [sigIn, fs] = audioread(infile);
% sr			= fs / 4;

% getPitch(sigIn, sr, 'female');

% a = lpc(sigIn, sr);

% plot(100:length(sigIn), sigIn(100:length(sigIn)), 100:length(a), a(100:length(a)))

% plot(1:length(sigIn), sigIn)

fs			= data.params.sr;					% === Sample Rate? === %
sigIn		= data.signalIn;					% === Gets input signal === %
sigIn		= resample(sigIn, data.params.sr * data.params.downfact, fs);
sigInCell	= makecell(sigIn, data.params.frameLen * data.params.downfact);
% p = getAudapterParamSet();

p = data.params;


% Audapter('reset');

for n = 1 : length(sigInCell)
	Audapter('runFrame', sigInCell{n});
end

data1 = AudapterIO('getData');
[sig, dat] = Audapter(4);
% data1 = Audapter(4);


% plot(1:length(dat), dat)
% plot(1:length(sig(:,1)), sig(:,1))
% plot(1:length(sig), sig, 1:length(sigIn), sigIn)
% show_spectrogram(sig(:,1), fs);

figure('Position', [100, 100, 1400, 600], 'Name', 'Input spectrogram');
show_spectrogram(sig(:,1), fs, 'noFig');
frameDur	= data1.params.frameLen / data1.params.sr;
tAxis		= 0 : frameDur : frameDur * 2103;

	plot(tAxis, data1.fmts(:, 1 : 2), 'b');



%{
figure('Position', [100, 100, 1400, 600], 'Name', 'Input spectrogram');
show_spectrogram(sig(:,1), fs, 'noFig');
frameDur	= data1.params.frameLen / data1.params.sr;
tAxis		= 0 : frameDur : frameDur * 2103;

	plot(tAxis, data1.fmts(:, 1 : 2), 'b');

frameDur	= data.params.frameLen / data.params.sr;
tAxis		= 0 : frameDur : frameDur * (size(data.rms, 1) - 1);
plot(tAxis, data1.ost_stat * OST_MULT, 'k-');

if isequal(pertMode, 'formant')
	legend({'F1 (original)', 'F2 (oringina)', sprintf('OST status * %d', OST_MULT)});
else
	legend({sprintf('OST status * %d', OST_MULT)});
end

xlabel('Time (s)');
ylabel('Frequency (Hz)');
%}


















%% Housecleaning
if(logfile)
	diary off;
end

if(openWindow)
	close all;
	clear all;
	sca;
end



