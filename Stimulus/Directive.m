function Directive( num )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

file = strcat('C:\toolbox\Stimulus\SRP 2015 Directives\Part_', num2str(num), '.wav');

part	= audioread(file);
player	= audioplayer(part, 44100);

% WaitSecs(1.5);
% playblocking(player);
% WaitSecs(1.5);


play(player);					% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
WaitSecs(1);					% ~~~ DEVELOPMENT PURPOSES ONLY ~~~
stop(player);					% ~~~ DEVELOPMENT PURPOSES ONLY ~~~

end

