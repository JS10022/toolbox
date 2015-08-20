function [ msg ] = getPair( num )
% Returns the phrase pairs to be presented to the subject

pair  = cell(2, 4);

pair{1}	= {'phrase 1', 'phrase 2'};
pair{2}	= {'phrase 3', 'phrase 4'};
pair{3}	= {'phrase 5', 'phrase 6'};
pair{4}	= {'phrase 7', 'phrase 8'};

msg		= pair{num};

end

