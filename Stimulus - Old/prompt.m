function prompt( window, reps, phrase, subject, match, stimulus, stimEach, isBaseline, isProficiency)
%	prompt( window, reps, phrase, subject, match, stimulus [, stimEach, isProficiency])


%% Handles omitted input arguments
if nargin < 1 || isempty(window)
	error('No PTB window open!');
	% window = Window();
end
if nargin < 2 || isempty(reps)
	reps = 10;
end
if nargin < 3 || isempty(phrase)
	phrase = 'ja biau bue';
end
if nargin < 4 || isempty(subject)
	error('bro, no subject entered');
	% subject	= '000_NH';				% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
end
if nargin < 5 || isempty(match)
	match = 'Matched';				% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
% 	match = 'Unmatched';
end
if nargin < 6 || isempty(stimulus)
	stimulus = 'Auditory';
% 	stimulus = 'Visual';			% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
end
if nargin < 7 || isempty(stimEach)
	stimEach = false;
end
if nargin < 8 || isempty(isBaseline)
	isBaseline = false;
end
if nargin < 9 || isempty(isProficiency)
	isProficiency = false;
end


proficiency = isProficiency;

ortho = getOrtho(phrase);

%% Run
for i = 1:reps

% 	break;

	% Draw all the text in one go
	drawText(window, ortho);
	
	switch(stimulus)
		case 'Auditory'
			% Plays stimulus each run if indicated, but only once for the proficiency run
			if(stimEach || ~proficiency)
				
				playAudio(phrase, subject, match, stimulus);
				
				% Don't show stimulus next time
				proficiency = true;
			end
		case 'Visual'
			% Plays stimulus each run if indicated, but only once for the proficiency run
			if(stimEach || ~proficiency)
				
				% Displays RASS output
				playStim(phrase, subject, match, stimulus);
				
				window = Window;
				
				WaitSecs(5);
								
				% Don't show stimulus next time
				proficiency = true;
			end			
		otherwise
			error('No stimuli entered');
	end
	
	Beep;
	
	if (isProficiency || isBaseline)
		audioGate(6, true);							% Feedback with masking
	else
		audioGate(6, false);						% Feedback without masking
	end
end
end

