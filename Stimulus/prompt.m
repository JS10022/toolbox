function prompt( window, reps, phrase, subject, match, stimulus, stimEach, isProficiency)
%	prompt( window, runs, phrase, subject, match, stimulus [, stimEach, isProficiency])
%   Detailed explanation goes here


%% Handles ommitted input arguments
if nargin < 1 || isempty(window)
	error('No PTB window open!');
end
if nargin < 2 || isempty(reps)
	reps = 2;
end
if nargin < 3 || isempty(phrase)
	phrase = 'ja biau bue';
end
if nargin < 4 || isempty(subject)
% 	error('bro, no subject entered');
	subject	= '000_NH';				% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
end
if nargin < 5 || isempty(match)
	match = 'Matched';				% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
% 	match = 'Unmatched';
end
if nargin < 6 || isempty(stimulus)
	stimulus = 'Visual';			% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
% 	stimulus = 'Auditory';
end
if nargin < 7 || isempty(stimEach)
	stimEach = false;
end
if nargin < 8 || isempty(isProficiency)
	isProficiency = false;
end

ortho = getOrtho(phrase);

%% Run
for i = 1:reps

% 	break;

	% Draw all the text in one go
	drawText(window, ortho);
	
	switch(stimulus)
		case 'Auditory'
			% Plays stimulus each run if indicated, but only once for the proficiency run
			if(stimEach || ~isProficiency)
				
				playAudio(phrase, subject, match, stimulus);
								
				WaitSecs(5);
				
				% Don't show stimulus next time
				isProficiency = true;
			end
		case 'Visual'
			% Plays stimulus each run if indicated, but only once for the proficiency run
			if(stimEach || ~isProficiency)
				
				% Displays RASS output
				playStim(phrase, subject, match, stimulus);
				
				WaitSecs(5);
								
				% Don't show stimulus next time
				isProficiency = true;
			end			
		otherwise
			error('No stimuli entered');
	end
	
	Beep();

	WaitSecs(5);
end
	

end
