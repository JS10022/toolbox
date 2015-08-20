function [ reply ] = getPhase( iteration )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

	phase = {'baseline', 'learning', 'sustained_5', 'sustained_10', 'proficiency'};
	
	reply = phase{iteration};
end

