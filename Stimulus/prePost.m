function prePost( phrase, reps, rass, maskFirst, maskLast )
% prePost( phrase, reps[, rass, maskFirst, maskLast])

if nargin < 1 || isempty(phrase)
	error('No phrase entered!');
end
if nargin < 2 || isempty(reps)
	reps = 10;
end
if nargin < 3 || isempty(rass)
	rass = true;
end
if nargin < 4 || isempty(maskFirst)
	maskFirst = false;
	% maskFirst = true;
end
if nargin < 5 || isempty(maskLast)
	maskLast = false;
end

% window = Window;

time	= 7;
half	= (reps / 2);
begin	= ['\n\n****** Beginning "' phrase '" ******\n\n'];
fprintf (begin);

for i = 1:reps
	repNum = ['Repetition ' num2str(i)];
	fprintf (repNum);
	
	if (maskFirst && (i <= half)) || (maskLast && (i > half))
		fprintf('\t(Masked)');
	end
	
	fprintf('\n');
	
	drawOrtho(phrase);
	Beep;
	
	if (maskFirst && (i <= half)) || (maskLast && (i > half))
		if (rass)
			WaitSecs(0.10);
			audioGate(time, true);
		else
			Masking(time);
		end
	else
		if (rass)
			WaitSecs(0.10);
			audioGate(time, false);
		else
			WaitSecs(time);
		end
	end	
	
	
	if(i == half)
		knob = '\n\t=== Halfway Point ===\n\n';
		fprintf (knob);
		WaitSecs(1);
	end

end

	endof = ['\n****** End of "' phrase '" ******\n\n\n'];
	fprintf (endof);
end

