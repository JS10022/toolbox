% function symb = spSymbols( phrase, seconds )

a		= hex2dec('00E3');
a2		= hex2dec('00F5');
qm		= hex2dec('00F1');
test	= hex2dec('00F3');


phrase	= ['hola! ' qm ' ' a ' ' a2 ' ' test ' Que pasa?'];


% qm = char(191);




drawOrtho(phrase);



sca;

% end