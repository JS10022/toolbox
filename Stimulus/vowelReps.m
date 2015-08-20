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


half = (reps / 2);


begin = '\n\n****** Beginning 6-vowel production ******\n\n';
fprintf (begin);
	

%% Run all repetitions
for i = 1:reps

	repNum = ['Cycle ' num2str(i)];
	fprintf (repNum);
	
	if (maskFirst && (i <= half)) || (maskLast && (i > half))
		fprintf('\t(Masked)');
	end
	
	fprintf('\n');
	
	
	for a = 1:2
		
		% if(~rass)
			% fprintf(['\tRep ' num2str(a) '\n']);
		% end
		
		playVowel(a);
		WaitSecs(0.2);
		Beep;
	
	
	
		% WaitSecs(0.10);
		
		if (maskFirst && (i <= half)) || (maskLast && (i > half)) 		% 
		
			if (rass)
				% WaitSecs(0.10);
				audioGate(4, true);
			else
				Masking(4);
			end
		else
			if (rass)
				WaitSecs(0.10);
				audioGate(4, false);
			else
				WaitSecs(4);
			end
		end
		WaitSecs(1);
	end
	
	if(i == half)
		knob = '\n\t=== Halfway Point ===\n\n';
		fprintf (knob);
		WaitSecs(1);
	end
	
% 	error('end')							% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
end

	endof = '\n****** End of 6-vowel production ******\n\n\n';
	fprintf (endof);
	
end

