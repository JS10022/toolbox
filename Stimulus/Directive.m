function Directive( num )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

file = strcat('C:\toolbox\Stimulus\SRP 2015 Directives\Part_', num2str(num), '.wav');

part	= audioread(file);
player	= audioplayer(part, 44100);
playblocking(player);

end

