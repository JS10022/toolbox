function Masking( seconds )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if nargin < 1 || isempty(seconds)
	seconds = 25;
% 	seconds = 2;
end
 
masking = audioread('C:\toolbox\Stimulus\noise.wav');
player	= audioplayer(masking, 28000);

play(player);
WaitSecs(seconds);
stop(player);

end

