	
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
%}

options = {'\n	(1)	 /ja biau bue/ - /je buai bai/', ...
			'\n	(2)	 /ji beau bea/ - /ju baue bio/', ...
			'\n	(3)	 /je boia bui/ - /ji baoi bau/', ...
			'\n	(4)	 /ju boau beo/ - /je bauo bua/' };

opts = ['\n	(1)	 /ja biau bue/ - /je buai bai/' ...
		'\n	(2)	 /ji beau bea/ - /ju baue bio/' ...
		'\n	(3)	 /je boia bui/ - /ji baoi bau/' ...
		'\n	(4)	 /ju boau beo/ - /je bauo bua/' ...
		'\n\nPlease enter a phrase pair number: '];
	
		input(options{2})