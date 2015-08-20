sca;


a		= hex2dec('02DC');
qm		= hex2dec('0061');
subject	= 'DEBUG';
match	= 'Matched';
stim	= 'Visual';
phrase	= getPhrase(1);
% phrase	= ['hola! ' a qm ' Que pasa?'];

%{
drawOrtho(phrase);

Beep;
WaitSecs(1);

playStim( phrase, subject, match, stim );

drawOrtho(phrase);

Beep;
WaitSecs(1);

playStim( phrase, subject, match, stim );

drawOrtho(phrase);

%}

%{
% qm = char(191);
% qm = hex2dec('00BF');



drawOrtho(phrase);
% %}

window = Window;

open = winChk;  %Screen('Windows');

if(open)
	disp('open!');
else
	disp('null!');
end

%}





sca;