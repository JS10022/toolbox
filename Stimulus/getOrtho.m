function [ ortho ] = getOrtho( phrase )
% Returns the phrase to be presented to the subject
for i = 1:2
	switch(phrase(i))
		case 'phrase 1'
			ortho	= 'Yah bee~ow boo~ae';
		case 'phrase 2'
			ortho	= 'Yay boo~eye bye';
		case 'ji beau bea'
			ortho	= 'Yee bae~ow bae~ah';
		case 'ju baue bio'
			ortho	= 'You bow~ae bee~oh';
		case 'je boia bui'
			ortho	= 'Yay boy~ah boo~ee';
		case 'ji baoi bau'
			ortho	= 'Yee bah~oy bow';
		case 'ju boau beo'
			ortho	= 'You boe~ow bae~oh';
		case 'je bauo bua'
			ortho	= 'Yay bow~oh boo~ah';
		otherwise
			error('Whoa... no orthographic found')
	end
end

