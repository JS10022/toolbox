function [ file ] = audioStim( phrase, subject, match, stimulus )
% returns the address of the audio stimulus file needed

%% Handles omitted input arguments
if nargin < 1 || isempty(phrase)
	error('No phrase!');
end
if nargin < 2 || isempty(subject)
	error('No subject entered!');
end
if nargin < 3 || isempty(match)
	error('No match entered');
end
if nargin < 4 || isempty(stimulus)
	stimulus = 'Auditory';				% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
end

%% Creates file path name
% root	= 'C:\Users\SpeechLab\Google Drive\SRP 2015\RASS Stimuli\';
root	= 'C:\Users\SpeechLab\Google Drive\SRP 2015\';
slash	= '\';
wav		= '.wav';
rass	= ' RASS Stimuli';

% file = strcat(root, subject, slash, phrase, wav);
% file = strcat(root, subject, slash, match, slash, stimulus, slash, phrase, wav);
% file = strcat(root, match, slash, subject, slash, phrase, wav);
file = [root match rass '\' stimulus '\' subject '\' phrase wav];


