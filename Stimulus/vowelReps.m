function vowelReps( reps, rass, maskFirst, maskLast )
% vowelReps( reps[, rass, mask, maskAll]);
if nargin < 1 || isempty(reps)
	reps = 6;
end
if nargin < 2 || isempty(rass)
	rass = true;
end
if nargin < 3 || isempty(maskFirst)
	maskFirst = false;
	% maskFirst = true;
end
if nargin < 4 || isempty(maskLast)
	maskLast = false;
end


%% Run all repetitions
for i = 1:reps
	for a = 1:6
		playVowel(a);
		WaitSecs(0.5);
		Beep();
		
		WaitSecs(0.25);
		
		if (maskFirst && (i <= (reps / 2))) || (maskLast && (i > (reps / 2))) 		% 
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
	
	
% 	error('end')							% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
end

end

