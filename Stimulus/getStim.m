function [ file ] = getStim( phrase, subj )
% returns the address of the audio stimulus file needed

% root	= 'E:\Users\SpeechLab\Google Drive\SRP 2015\RASS Stimuli\';
% root	= 'E:\Users\SpeechLab\Google Drive\SRP 2015\';
% rass	= ' RASS Stimuli';
mp4		= '.mp4';

% file = strcat(root, subject, slash, match, slash, stimulus, slash, phrase, mp4);
% file = 'C:\toolbox\Stimulus\test3.mp4';
% file = strcat(root, match, ' RASS Stimuli\', stimulus, '\', subject, '\' phrase, mp4);
% file = [root match rass '\' stimulus '\' subject '\' phrase mp4];
file = [dataDir subj.id '\' phrase mp4];