function [ file ] = getStim( phrase, subject, match, stimulus )
% returns the address of the audio stimulus file needed

root	= 'E:\Users\SpeechLab\Google Drive\SRP 2015\RASS Stimuli\';
slash	= '\';
mp4		= '.mp4';

file = strcat(root, subject, slash, match, slash, stimulus, slash, phrase, mp4);
% file = 'C:\toolbox\Stimulus\test3.mp4';
