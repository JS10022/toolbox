function playVowel( num )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

vowel	= {'i', 'o', 'u', 'ay', 'ah', 'ae'};
file	= strcat('C:\toolbox\Stimulus\Extended RASS Stimuli\', vowel{num}, '.wav');
audio	= audioread(file);
player	= audioplayer(audio, 16000);


playblocking(player);

WaitSecs(0.25);

end

