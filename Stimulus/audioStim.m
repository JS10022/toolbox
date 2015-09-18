function [ file ] = audioStim( phrase, subj )
% returns the address of the audio stimulus file needed

%% Handles omitted input arguments
if nargin < 1 || isempty(phrase)
	error('No phrase!');
end
if nargin < 2 || isempty(subj)
	error('No subject entered!');
end
%{
if nargin < 3 || isempty(match)
	error('No match entered');
end
if nargin < 4 || isempty(stimulus)
	stimulus = 'Auditory';				% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
end
%}


%% Creates file path name
wav		= '.wav';

if(strcmp(phrase, 'ja biau bue') || strcmp(phrase, 'ji beau bea'))
	file = [dataDir subj.dir '\' subj.id '\' subj.id 'a' wav];
else
	file = [dataDir subj.dir '\' subj.id '\' subj.id 'b' wav];
end
