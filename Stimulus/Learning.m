function Learning( window, phrase, subject, match, stimulus )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

%% Define variables
ask		= '\nContinue?\n';
f		= false;
t		= true;

% DEBUG	= true;								% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
DEBUG	= false;							% ~~~ DEVELOPMENT PURPOSES ONLY ~~~

%% Run phases
for i = 1:5

% 	break;									% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
% 	reps = 2;								% ~~~ DEVELOPMENT PURPOSES ONLY ~~~

	while(1)								% === Allows for re-running phases if needed
	phase	= getPhase(i);
	reps	= getReps(phase);
	
	begin	= ['\n\n\n****** Beginning Learning "' phase '" phase ******\n\n'];
	endof	= ['\n****** End of Learning "' phase '" phase ******\n\n\n'];

	fprintf (begin);

	switch(phase)
	case 'baseline'
		prompt(window, reps, phrase, subject, match, stimulus, f, t);	% reps = 10
	case 'learning'
		prompt(window, reps, phrase, subject, match, stimulus, t);		% reps = 20, present stim each time = TRUE
	case 'sustained_5'
		for a = 1:2							% Runs first sust. learning 2 times
			prompt(window, reps, phrase, subject, match, stimulus);		% reps = 5
			if (a == 1)
				fprintf (['\n\t*** "' phase '" - Part 2 ***\n\n']);
			end
		end
	case 'sustained_10'
		for a = 1:2							% Runs second sust. learning 2 times
			prompt(window, reps, phrase, subject, match, stimulus);		% reps = 10
			
			if (a == 1)
				fprintf (endof);
				input(ask);
				fprintf (['\n\n****** Beginning Learning "' phase '" phase - Part 2 ******\n\n']);	
			end
		end
	case 'proficiency'
		prompt(window, reps, phrase, subject, match, stimulus, f, f, t);	% reps = 10
	otherwise,
		error('Bruh, you didn''t enter a phase');
	end

	fprintf (endof);

	cont = input(ask, 's');					% === Asks the proctor to continue ===
	if(cont == 'n')
											% === "Do nothing" (i.e. the while loop will restart) ===
	else
		break;								% === Breaks while loop if yes, else repeats ===
	end
	
	end										% === End of while loop ===
	
	
	if(DEBUG)								% ~~~ Allows for interruption of test ~~~
		cont = input('Exit? \n', 's');
		if(cont == 'y')
			sca;
			error('DEBUG exit')
		end
	end
end

end

