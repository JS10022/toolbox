function Generalization( subj )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

%% Define variables
ask		= '\nContinue?\n';
f		= false;
t		= true;
phrase	= subj.pair{2};

DEBUG	= false;
% DEBUG	= true;

%% Run phases
for i = 1:5

% 	break;									% ~~~ DEVELOPMENT PURPOSES ONLY ~~~ %
% 	reps = 2;								% ~~~ DEVELOPMENT PURPOSES ONLY ~~~ %
	
	
	while(1)								% === Allows for re-running phases if needed === %
	phase	= getPhase(i);
	reps	= getReps(phase);
	
	begin = ['\n\n\n****** Beginning Generalization "' phase '" phase ******\n\n'];
	fprintf (begin);
	
	
	switch(phase)
	case 'baseline'
		prompt(reps, phrase, subj, f, t);				% === reps = 10 === %
	case 'learning'
		prompt(   5, phrase, subj, t);					% === reps = 5, stim each time = TRUE === %
	case 'sustained_5'
		prompt(reps, phrase, subj);						% === reps = 5 === %
	case 'sustained_10'
		prompt(reps, phrase, subj);						% === reps = 10 === %
	case 'proficiency'
		prompt(reps, phrase, subj, f, f, t);			% === reps = 10 === %
	otherwise,
		error('Bruh, you didn''t enter a phase');
	end
	
	endof = ['\n****** End of "' phase '" phase ******\n\n\n'];
	fprintf (endof);

	cont = input(ask, 's');					% === Asks the proctor to continue === %
	if(cont == 'n')
											% === "Do nothing" (i.e. the while loop will restart) === %
	else
		break;								% === Breaks while loop if yes, else repeats === %
	end
	
	end
	
	
	if(DEBUG)								% ~~~ Allows for interruption of test ~~~ %
		cont = input('Exit? \n', 's');
		if(cont == 'y')
			break;
		end
	end
end

end

