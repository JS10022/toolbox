function [ reps ] = getReps( phase )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

switch(phase)
	case 'baseline'
		reps = 10;
	case 'learning'
		reps = 10;
	case 'sustained_5'
		reps = 5;
	case 'sustained_10'
		reps = 10;
	case 'proficiency'
		reps = 10;
	otherwise,
		reps = 0;

end

