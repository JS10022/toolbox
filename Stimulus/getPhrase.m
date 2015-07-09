function [ phrase ] = getPhrase( num )
% Returns the phrase to be presented to the subject

phonetic  = cell(1, 8);

phonetic{1}	= 'ja biau bue';
phonetic{2}	= 'je buai bai';

phonetic{3}	= 'ji beau bea';
phonetic{4}	= 'ju baue bio';

phonetic{5}	= 'je boia bui';
phonetic{6}	= 'ji baoi bau';

phonetic{7}	= 'ju boau beo';
phonetic{8}	= 'je bauo bua';

phrase = phonetic{num};





end

