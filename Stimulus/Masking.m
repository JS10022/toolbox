function Masking( seconds )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

masking = audioread('noise.mp3');
player	= audioplayer(masking, 28000);

play(player);
WaitSecs(seconds);
stop(player);

end

