function vowelReps( window, reps, mask, maskAll )
% prePost( window[, mask, masked]);
%   Detailed explanation goes here
if nargin < 1 || isempty(window)
% 	error('No PTB window opened!');
	window = Window();
end
if nargin < 2 || isempty(reps)
	reps = 6;
end
if nargin < 3 || isempty(mask)
	mask = true; % false;
end
if nargin < 4 || isempty(maskAll)
	maskAll = false;
end

%% Draw window
% window = Window();

cycle	= mask;



for i = 1:reps
	for a = 1:2
		playVowel(a)

		Beep();
		
		if(cycle || maskAll)
			Masking(4);
		end
		
		WaitSecs(4);
	end
	
	if(mask && ~maskAll)					% If maskAll = FALSE, cycle switches on/off
		cycle = ~cycle;
	end
	
% 	error('end')							% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
end

end

