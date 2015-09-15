function Masking( seconds )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if nargin < 1 || isempty(seconds)
	seconds = 20;
	setup	= true;
% 	seconds = 2;
else
	setup	= false;
end


masking = audioread('C:\toolbox\Stimulus\noise.wav');
player	= audioplayer(masking, 28000);

play(player);

if setup
	while ~KbCheck 
	end 
else
	WaitSecs(seconds);
end

stop(player);

	
end

