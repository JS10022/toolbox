function Beep()
%UNTITLED4 Summary of this function goes here
% Information needed to open & play beep signal

file	= 'C:\toolbox\Stimulus\beep.wav';
% beep	= audioread(file);
tone	= 28000;									% === 28 KHz ===
audio	= audioread(file);
player	= audioplayer(audio, tone);

% sound(beep, tone);

playblocking(player);

% WaitSecs(0.25);

end

