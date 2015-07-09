function Generalization( window, phrase, subject, match, stimulus )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here


for i = 1:5

% 	break;									% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
	
	while(1)								% === Allows for re-running phases if needed
	phase	= getPhase(i);
	reps	= getReps(phase);
	
% 	reps = 2;								% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
	
	
		
	switch(phase)
	case 'baseline'
		prompt(window, reps, phrase, subject, match, stimulus);			% reps = 10
	case 'learning'
		prompt(window, 5, phrase, subject, match, stimulus, T);			% reps = 5, present stim each time = TRUE
	case 'sustained_5'
		prompt(window, reps, phrase, subject, match, stimulus);			% reps = 5
	case 'sustained_10'
		prompt(window, reps, phrase, subject, match, stimulus);			% reps = 10
	case 'proficiency'
		prompt(window, reps, phrase, subject, match, stimulus, F, T);	% reps = 10
	otherwise,
		error('Bruh, you didn''t enter a phase');
	end
	
	
	
	
	cont = input(ask, 's');					% === Asks the proctor to continue ===
	if(cont == 'y')
		break;								% === Breaks while loop if yes, else repeats ===
	end
	
	end
	
	
	if(DEBUG)								% ~~~ Allows for interruption of test ~~~
		cont = input('Exit? \n', 's');
		if(cont == 'y')
			break;
		end
	end
end

end

