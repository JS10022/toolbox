function Half()
%UNTITLED4 Summary of this function goes here
% Information needed to open & play beep signal

file	= 'C:\toolbox\Stimulus\Sounds\half.wav';
audio	= audioread(file);
tone	= 44100;									% === 28 KHz ===
player	= audioplayer(audio, tone);

playblocking(player);

end