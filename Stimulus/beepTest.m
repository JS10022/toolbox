	
%{
beep = audioread('noise.mp3');

sound(beep, 16000)

% audioStim('ja biau bue', '000_NH')


% recorder1 = audiorecorder(44100,16,1,1); 
% recorder2 = audiorecorder(48000,16,1,2);

disp('Start speaking.')
% record(recorder1);
% record(recorder2); 
% pause(5);
% stop(recorder1);
% stop(recorder2);


recObj = audiorecorder;
% disp('Start speaking.')
recordblocking(recObj, 5);


% record(recObj); 
% pause(5);
% stop(recObj);

disp('End of Recording.');

play(recObj);
% play(recorder1);

disp('End of Playback.');




options = {	'\n		(1)	 /ja biau bue/ - /je buai bai/', '\n		(2)	 /ji beau bea/ - /ju baue bio/', '\n		(3)	 /je boia bui/ - /ji baoi bau/',	...
			'\n		(4)	 /ju boau beo/ - /je bauo bua/'}	;

		options(2)


option = input(['\n	(1)	 /ja biau bue/ - /je buai bai/' ...
				'\n	(2)	 /ji beau bea/ - /ju baue bio/' ...
				'\n	(3)	 /je boia bui/ - /ji baoi bau/' ...
				'\n	(4)	 /ju boau beo/ - /je bauo bua/' ...
				'\n\nPlease enter a phrase pair number: '])	;

% minute = 1;

% while (minute > 0)	
	
% end


% minutes = {'1:42.69', '4:52.23', '3:35.17', '4:58.72', '1:37.80'};


% beep = audioread('noise.mp3');

% sound(beep, 28000)


% drawText(Window(), getVowel(2))

% prePost(true)

% beep = audioread('noise.mp3');
% player = audioplayer(beep, 28000);
% play(player);
% 
% WaitSecs(2);
% 
% stop(player);

% num = 2;

% file = strcat('C:\toolbox\Stimulus\Part ', num, '.wav')

% Directive(num)

% Beep();

% num

% num = ~num;

% num

% playVowel(num)

% subjInfo = getSubjInfo();

% subjInfo

% 
% options = {'\n	(1)	 /ja biau bue/ - /je buai bai/', ...
% 			'\n	(2)	 /ji beau bea/ - /ju baue bio/', ...
% 			'\n	(3)	 /je boia bui/ - /ji baoi bau/', ...
% 			'\n	(4)	 /ju boau beo/ - /je bauo bua/' };
% 
% opts = ['\n	(1)	 /ja biau bue/ - /je buai bai/' ...
% 		'\n	(2)	 /ji beau bea/ - /ju baue bio/' ...
% 		'\n	(3)	 /je boia bui/ - /ji baoi bau/' ...
% 		'\n	(4)	 /ju boau beo/ - /je bauo bua/' ...
% 		'\n\nPlease enter a phrase pair number: '];
% 	
% 		input(options{2})


		% make movie
		window=Screen('OpenWindow', 0, 0);
		rect=[0 0 200 200];
      white = WhiteIndex(window);
		for i=1:100
			movie(i)=Screen('OpenOffscreenWindow', window, 0, rect);
			Screen('FillOval', movie(i), white, [0 0 2 2]*(i-1));
		end;

		% show movie
		for i=[1:100 100:-1:1] % forwards and backwards
			Screen('CopyWindow',movie(i),window,rect,rect);
			Screen('Flip', window);
		end;
		Screen('CloseAll');
%}

%{
% Directive( 1 )
% beep = audioread('beep.wav');
% sound(beep, 44100)
% audioStim('ja biau bue', '000_NH')

% masking = audioread('noise2.wav');
% player	= audioplayer(masking, 28000);
% 
% play(player);
% WaitSecs(seconds);
% stop(player);

% AFR = dsp.AudioFileReader('beep.wav');
% H = dsp.AudioPlayer

% name = audiodevinfo(0,3)
% name = 'Speakers (AudioBox 22VSL Audio)';

% AP = dsp.AudioPlayer('DeviceName', name);
% N = getNumOutputs(AP)


% while ~isDone(AFR)
%   audio = step(AFR);
%   nUnderrun = step(AP,audio);
%   if nUnderrun > 0
%     fprintf('Audio player queue underrun by %d samples.\n'...
% 	     ,nUnderrun);
%   end
% end
% pause(AP.QueueDuration); % wait until audio is played to the end
% release(AFR);            % close the input file
% release(AP);             % close the audio output device
% Masking(2)
%}

%{
% AFR = dsp.AudioFileReader('beep.wav'); % points to a default audio file
% AP = dsp.AudioPlayer('SampleRate', AFR.SampleRate, 'QueueDuration', 2);
% while ~isDone(AFR)
%   audio = step(AFR);
%   nUnderrun = step(AP, audio);
%   if nUnderrun > 0
%     fprintf('Audio player queue underrun by %d samples.\n'...
% 	     ,nUnderrun);
%   end
% end
% pause(AP.QueueDuration); % wait until audio is played to the end
% release(AFR);            % close the input file
% release(AP);             % close the audio output device



% info = audiodevinfo;
% info.output(4)


% H = dsp.AudioFileReader('beep.wav');
% HAP = dsp.AudioPlayer;

% info(H)
% isLocked(H)

% getNumInputs(H)		% 0
% getNumOutputs(H)		% 3


% while ~isDone(H)
	% Hstep = step(H);
	% step(HAP, Hstep);
% end

% pause(HAP.QueueDuration);  % Wait until audio plays to the end

% release(H);
% release(HAP);
%}
close all;
clear all;
sca;

%% Define some variables
ask		= '\nDid the phase successfully complete? y or n \n';
f		= false;
t		= true;
bobo	= 'Buy Bobo a yo-yo';
yoyo	= 'I owe you a yo-yo';
wait	= '\n	Press ENTER to continue\n';
subject		= '000_NH';						% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
match		= 'Matched';					% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
stimulus	= 'Auditory';					% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
phraseNum	= 3;							% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
phrase		= getPhrase(phraseNum);
phrase2		= getPhrase(phraseNum + 1);
% window		= Window();
ortho		= getOrtho(phrase);
ortho2		= getOrtho(phrase2);
phase		= getPhase(5);


root	= 'C:\Users\SpeechLab\Google Drive\SRP 2015\RASS Stimuli\';
outfile = [root 'DEBUG' '\' subject ' - ' match ' - ' stimulus '.txt'];
diary(outfile);


addpath c:/speechres/commonmcode
cds('audapter_matlab');
Audapter('deviceName', 'AudioBox');
Audapter(3, 'srate', 12000);
Audapter(3, 'downfact', 4);
Audapter(3, 'framelen', 256);

%{
% diary(strcat(subject, ' Command Window.txt'))


% Generalization( Window(), phrase, subject, match, stimulus )

% audioStim( phrase, subject, match, stimulus )
% for i = 1:2
% 	playAudio(phrase, subject, match, stimulus);
% 	
% 	Beep();
% 	
% 	audioGate( 5, false );
% 	
% 	Masking(4);
% 	
% end


% drawText(window, ortho);
% ask		= ['\nDid "' phase '" successfully complete? y or n \n'];
% ask		= ['\nDid "' phase '" successfully complete? \n'];
% 	fprintf (ask);
%}


% Beep();

% prePost(window, bobo, 5, t, f, t);

info = ['\nSubject:\t'	subject		...
		'\nMatch:\t\t'	match		...
		'\nStimulus:\t'	stimulus	...
		'\nPhrase 1:\t'	phrase		...
		'\t\t('			ortho ')'	...
		'\nPhrase 2:\t'	phrase2		...
		'\t\t('			ortho2	')\n\n\n'];
% fprintf(endof);
% fprintf(info);

fprintf(['\nSubject:\t'	subject		...
		'\nMatch:\t\t'	match		...
		'\nStimulus:\t'	stimulus	...
		'\nPhrase 1:\t'	phrase		...
		'\t\t('			ortho ')'	...
		'\nPhrase 2:\t'	phrase2		...
		'\t\t('			ortho2	')\n\n\n']);



% fprintf(['\n****** End of "' phase '" phase ******\n\n']);

% '\n****** End of " %t', phase, '%s" phase ******\n\n');

%{
% ask		= 'Continue?\n';
% cont = input(ask, 's');
% 	if(cont == 'n')
% 											% === "Do nothing" (i.e. the while loop will restart) ===
% 	else
% 		disp('all good');								% === Breaks while loop if yes, else repeats ===
% 	end
%}	
% pause(2)
	
	


% begin = ['\n****** Beginning "' phase '" phase ******\n\n'];
% fprintf (begin);	






close all;
clear all;
sca;

diary off;