function [ subject, match, stimulus, phraseNum ] = getSubjInfo()
%% Get experiment and subject info

subNum = input('Please enter a subject number: ', 's');					% ===  ===
while (length(subNum) < 3)
	subNum = strcat('0', subNum);
end
subInit = upper(input('Please enter the subject''s initials: ', 's'));
subject = strcat(subNum, '_', subInit);


match = upper(input('Will this be [M]atched or [U]nmatched? ', 's'));
switch(match)
	case 'M'
		match = 'Matched';
	case 'U'
		match = 'Unmatched';
	otherwise
		error('Invalid input.  Must be M or U.');
end

stimulus = upper(input('Will this be [A]uditory or [V]isual? ', 's'));
switch(stimulus)
	case 'A'
		stimulus = 'Auditory';
	case 'V'
		stimulus = 'Visual';
	otherwise
		error('Invalid input.  Must be A or V.');
end


option = input(['\n	(1)	 /ja biau bue/ - /je buai bai/' ...
				'\n	(2)	 /ji beau bea/ - /ju baue bio/' ...
				'\n	(3)	 /je boia bui/ - /ji baoi bau/' ...
				'\n	(4)	 /ju boau beo/ - /je bauo bua/' ...
				'\n\nPlease enter a phrase pair number: ']);
switch(option)
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


end

