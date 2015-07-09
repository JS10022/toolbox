function prePost( window, phrase, reps, mask, maskAll )
% prePost( window, phrase, reps[, mask, maskAll])

if nargin < 1 || isempty(window)
	error('No PTB window opened!');
end
if nargin < 2 || isempty(phrase)
	error('No phrase entered!');
end
if nargin < 3 || isempty(reps)
	reps = 10;
end
if nargin < 4 || isempty(mask)
	mask = false;
end
if nargin < 5 || isempty(maskAll)
	maskAll = false;
end


%% Draw window
% window = Window();

cycle = mask;


for i = 1:reps
	drawText(window, phrase);
	Beep();
	
	if(cycle || maskAll)
		Masking(4);
	end
		
	if(mask && ~maskAll)
		cycle = ~cycle;
	end
	
	WaitSecs(4);
end

end

