function Learning( window, phrase, subject, match, stimulus )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here


ask		= '\nDid the phase successfully complete? y or n \n';
F		= false;
T		= true;

DEBUG	= true;								% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
% DEBUG	= false;							% ~~~ DEVELOPMENT PURPOSES ONLY ~~~

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
		prompt(window, reps, phrase, subject, match, stimulus, T);		% reps = 20, present stim each time = TRUE
	case 'sustained_5'
		for a = 1:2							% Runs first sust. learning 2 times
			prompt(window, reps, phrase, subject, match, stimulus);		% reps = 5
		end
	case 'sustained_10'
		for a = 1:2							% Runs second sust. learning 2 times
			prompt(window, reps, phrase, subject, match, stimulus);		% reps = 10
			input('Press ENTER to continue');
		end
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
			error('DEBUG exit')
		end
	end
end

end

