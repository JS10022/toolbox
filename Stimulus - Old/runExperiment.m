%% runExperiment

close all;
clear all;
sca

ask		= 'Did the phase successfully complete? y or n \n';
subj	= '000_NH';								% *** MUST BE ENTERED FOR EACH subj ***
f		= false;
t		= true;

% ~~~ Temporary, for development purposes ~~~
rng('shuffle');
a = 1;
b = 8;
r = (b - a) .* rand(1000, 1) + a;
r = round(r(1));


addpath c:/speechres/commonmcode
	cds('audapter_matlab');



phrase	= getPhrase(r);
DEBUG	= true;
% DEBUG	= false;

for i = 1:5
	
	while(1)								% === Allows for re-running phases if needed
	phase	= getPhase(i);
% 	reps	= getReps(phase);
	
	reps = 2;								% ~~~ Development purposes ~~~
	
	
	
	
	
	switch(phase)
	case 'baseline'
		prompt(reps, phrase, subj);			% reps = 10
	case 'learning'
		prompt(reps, phrase, subj, t);		% reps = 20, present stim each time = TRUE
	case 'sustained_5'
		for a = 1:4							% Runs first sust. learning 4 times
			prompt(reps, phrase, subj);		% reps = 5
		end
	case 'sustained_10'
		for a = 1:3							% Runs second sust. learning 3 times
			prompt(reps, phrase, subj);		% reps = 10
		end
	case 'proficiency'
		prompt(reps, phrase, subj, f, t);	% reps = 10
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
