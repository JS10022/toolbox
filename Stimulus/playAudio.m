function playAudio( phrase, subj )
% Plays the audio stimulus


file	= audioStim(phrase, subj);			% === Reads in file ===
stim	= audioread(file);					% === Creates a matrix of the audio file ===
tone	= 16000;							% === 16 KHz === 

player = audioplayer(stim, tone);

playblocking(player);						% === Plays the audio file at 16 kHz ===

WaitSecs(0.5);

end

