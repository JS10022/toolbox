function prePost( window, phrase, reps, rass, maskFirst, maskLast )
% prePost( window, phrase, reps[, rass, mask, maskAll])

if nargin < 1 || isempty(window)
	error('No PTB window opened!');
end
if nargin < 2 || isempty(phrase)
	error('No phrase entered!');
end
if nargin < 3 || isempty(reps)
	reps = 10;
end
if nargin < 4 || isempty(rass)
	rass = true;
end
if nargin < 3 || isempty(maskFirst)
	maskFirst = false;
	% maskFirst = true;
end
if nargin < 4 || isempty(maskLast)
	maskLast = false;
end


%% Draw window
% window = Window();

% cycle	= mask;
time	= 7;

for i = 1:reps
	drawText(window, phrase);
	Beep();
	WaitSecs(0.25);
	
	if (maskFirst && (i <= (reps / 2))) || (maskLast && (i > (reps / 2)))
		if (rass)
			audioGate(time, true);
		else
			Masking(time);
		end
	else
		if (rass)
			audioGate(time, false);
		else
			WaitSecs(time);
		end
	end	
end

end

