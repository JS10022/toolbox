function [ window ] = winChk( )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

window = Screen('Windows');

if(isempty(window))
	window = Window;
end

end

