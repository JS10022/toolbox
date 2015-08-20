function [ subj ] = getSubjInfo( )
%% Get experiment and subject info

%{
while (length(subNum) < 3)
	subNum = strcat('0', subNum);
end
% subInit = upper(input('Please enter the subject''s initials: ', 's'));
% subject = strcat(subNum, '_', subInit);


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
%}

%% Parse subject ID number
subNum = upper(input('Enter a subject number: ', 's'));	% === 6 digit subject ID ===



% subj.number		= subNum(1:2);							% === XXoooo ===
subj.id		= subNum;									% === XXXXXX ===

if(subNum(3) == 'M')									% === ooXooo ===
	subj.sex	= 'Male';
elseif(subNum(3) == 'F')
	subj.sex	= 'Female';
else
	error('Invalid sex');
end

if(subNum(4) == 'M')									% === oooXoo ===
	subj.match	= 'Matched';
elseif(subNum(4) == 'U')
	subj.match	= 'Unmatched';
else
	error('Invalid RASS condition');
end

if(subNum(5) == 'A')									% === ooooXo ===
	subj.stim	= 'Auditory';
elseif(subNum(5) == 'V')
	subj.stim	= 'Visual';
else
	error('Invalid stimulus type');
end

pair = str2double(subNum(6));
if(pair > 0 && pair < 5)
	subj.pair	= getPair(pair);						% === oooooX ===
else
	error('Invalid phrase pair');
end




end

