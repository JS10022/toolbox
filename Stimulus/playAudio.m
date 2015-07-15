function playAudio( phrase, subject, match, stimulus )
% Plays the audio stimulus


file	= audioStim(phrase, subject, match, stimulus);		% === Reads in file ===
stim	= audioread(file);					% === Creates a matrix of the audio file ===
tone	= 16000;							% === 16,000 Hz === 

% sound(stim, tone);							% === Plays the audio file at 16 KHz ===

player = audioplayer(stim, tone);

playblocking(player);

WaitSecs(0.5);

end

