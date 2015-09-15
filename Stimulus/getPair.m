function [ msg ] = getPair( num )
% Returns the phrase pairs to be presented to the subject

pair  = cell(2, 4);

pair{1}	= {'ja biau bue', 'je buai bai'};
pair{2}	= {'ji beau bea', 'ju baue bio'};
pair{3}	= {'je boia bui', 'ji baoi bau'};
pair{4}	= {'ju boau beo', 'je bauo bua'};

msg		= pair{num};

end

