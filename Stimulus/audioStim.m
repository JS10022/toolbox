function [ file ] = audioStim( phrase, subject, match, stimulus )
% returns the address of the audio stimulus file needed

root	= 'C:\Users\SpeechLab\Google Drive\SRP 2015\RASS Stimuli\';
slash	= '\';
wav		= '.wav.';

% file = strcat(root, subject, slash, phrase, wav);
file = strcat(root, subject, slash, match, slash, stimulus, slash, phrase, wav);
