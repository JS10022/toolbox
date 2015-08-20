function vowelReps( reps, rass, mask, maskAll )
% vowelReps( reps[, rass, mask, maskAll]);
if nargin < 1 || isempty(reps)
	reps = 6;
end
if nargin < 2 || isempty(rass)
	rass = true;
end
if nargin < 3 || isempty(mask)
% 	mask = false;
	mask = true;
end
if nargin < 4 || isempty(maskAll)
	maskAll = false;
end


first	= (mask && ~maskAll);		% Doesn't start masking until second cycle, unless maskAll
cycle	= (mask && ~first);			% Basically cycle will be false unless mask and maskAll are both true

%% Run all repetitions
for i = 1:reps
	for a = 1:2
		playVowel(a);

		Beep();
		
		if (cycle || maskAll) && ~first			% 
			if (rass)
				audioGate(4, true);
			else
				Masking(4);
			end
		else
			if (rass)
				audioGate(4, false);
			else
				WaitSecs(4);
			end
		end
		WaitSecs(1);
	end
	
	if first
		first = false;
	end
	
	if(mask && ~maskAll)					% If maskAll = FALSE, cycle switches on/off
		cycle = ~cycle;
	end
	
% 	error('end')							% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
end

end

