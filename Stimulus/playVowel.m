function playVowel( num )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

vowel	= {'ae', 'ah', 'ay', 'i', 'o', 'u'};
file	= strcat('C:\toolbox\Stimulus\Extended RASS Stimuli\', vowel{num}, '.wav');
audio	= audioread(file);
player	= audioplayer(audio, 16000);


playblocking(player);
end

