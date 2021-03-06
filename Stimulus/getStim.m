function [ file ] = getStim( phrase, subj )
% returns the address of the audio stimulus file needed

mp4		= '.mp4';

% file = [root match rass '\' stimulus '\' subject '\' phrase mp4];
% file = [dataDir subj.dir '\' subj.id '\' phrase mp4];

if(strcmp(phrase, 'ja biau bue') || strcmp(phrase, 'ji beau bea'))
	file = [dataDir subj.dir '\' subj.id '\' subj.id 'a' mp4];
else
	file = [dataDir subj.dir '\' subj.id '\' subj.id 'b' mp4];
end