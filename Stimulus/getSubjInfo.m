function [ subj ] = getSubjInfo( )
%% Get experiment and subject info

%% Get subject ID number from user input
subNum = upper(input('Enter a subject number: ', 's'));	% === 6 digit subject ID ===



subj.dir	= subNum(1:3);								% === XXXooo ===
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

