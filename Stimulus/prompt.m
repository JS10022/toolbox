function prompt( reps, phrase, subj, stimEach, isBaseline, isProf)
%		prompt( reps, phrase, subject, match, stimulus [, stimEach, isBaseline, isProf])


%% Handles omitted input arguments
if nargin < 1 || isempty(reps)
	reps = 10;
end
if nargin < 2 || isempty(phrase)
	phrase = 'ja biau bue';
end
if nargin < 3 || isempty(subj)
	error('bro, no subject entered');
	% subject	= '000_NH';				% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
end
if nargin < 4 || isempty(stimEach)
	stimEach = false;
end
if nargin < 5 || isempty(isBaseline)
	isBaseline = false;
end
if nargin < 6 || isempty(isProf)
	isProf = false;
end

%{
if nargin < 4 || isempty(match)
	match = 'Matched';				% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
	match = 'Unmatched';
end
if nargin < 5 || isempty(stimulus)
	stimulus = 'Auditory';
% 	stimulus = 'Visual';			% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
end

%}

prof	= isProf;
ortho	= phrase;	% getOrtho(phrase);


%% Set up PTB window
% window = Window;					% === Creates a new window if none are open === %



%% Run
for i = 1:reps

% 	break;

	% Draw all the text in one go
% 	drawText(ortho);
	drawOrtho(ortho);
	
	switch(subj.stim)
		case 'Auditory'
			% Plays stimulus each run if indicated, but only once for the proficiency run
			if(stimEach || ~prof)
				
				playAudio(phrase, subj);
				
				% Don't show stimulus next time
				prof = true;
			end
		case 'Visual'
			% Plays stimulus each run if indicated, but only once for the proficiency run
			if(stimEach || ~prof)
				
				% Displays RASS output
				playStim(phrase, subj);
				
				% Creates a new window because playStim closes the old one
				window = Window;
				
				WaitSecs(5);
				
				% Don't show stimulus next time
				prof = true;
			end			
		otherwise
			error('No stimuli entered');
	end
	
	Beep;
	
	if (isProf || isBaseline)
		audioGate(6, true);							% Feedback with masking
	else
		audioGate(6, false);						% Feedback without masking
	end
end
end

