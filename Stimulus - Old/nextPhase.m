function [ num, stim ] = nextPhase( phraseNum, stimulus )
%% Set up Second Phase



if(strcmp(stimulus, 'Auditory'))
	stim = 'Visual';
else
	stim = 'Auditory';
end

% phraseNum	= phraseNum + 1;				% ~~~ DEVELOPMENT PURPOSES ONLY ~~~

options = {'\n	(1)	 /ja biau bue/ - /je buai bai/', ...
			'\n	(2)	 /ji beau bea/ - /ju baue bio/', ...
			'\n	(3)	 /je boia bui/ - /ji baoi bau/', ...
			'\n	(4)	 /ju boau beo/ - /je bauo bua/', ...
			'\n\nPlease select one of the remaining phrase pairs: '};
		
pairs = {' (1) /ja biau bue/ - /je buai bai/', ...
		 ' (2) /ji beau bea/ - /ju baue bio/', ...
		 ' (3) /je boia bui/ - /ji baoi bau/', ...
		 ' (4) /ju boau beo/ - /je bauo bua/'};
	
switch(phraseNum)
	case 2
		option	= [options{2} options{3} options{4} options{5}];
		pair	= 1;
	case 4
		option	= [options{1} options{3} options{4} options{5}];
		pair	= 2;
	case 6
		option	= [options{1} options{2} options{4} options{5}];
		pair	= 3;
	case 8
		option	= [options{1} options{2} options{3} options{5}];
		pair	= 4;
	otherwise
		error('Invalid input.  Must be between 1-4.');
end

disp(strcat('The previous phrase pair was:	', pairs{pair}));

choice = input(option);

while(choice == pair)
	
	fprintf('\n\nInvalid selection!  Let''s try this again...\n\n');
	
	disp(strcat('The previous phrase pair was:	', pairs{pair}));
	
	choice = input(option);	
end

switch(choice)
	case 1
		num = 1;
	case 2
		num = 3;
	case 3
		num = 5;
	case 4
		num = 7;
	otherwise
		error('Invalid input.  Must be between 1-4.');
end


end

