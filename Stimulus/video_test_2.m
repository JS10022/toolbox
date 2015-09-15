sca;


subject	= 'DEBUG';
match	= 'Matched';
stim	= 'Visual';
phrase	= getPhrase(1);

%{
drawOrtho(phrase);

Beep;
WaitSecs(1);

playStim( phrase, subject, match, stim );

drawOrtho(phrase);

Beep;
WaitSecs(1);

playStim( phrase, subject, match, stim );

drawOrtho(phrase);

%}

%{
window	= Window;

open	= winChk;  %Screen('Windows');

if(open)
	disp('open!');
else
	disp('null!');
end
%}


vidObj		= VideoReader('stim1.mp4');
nFrames		= vidObj.NumberOfFrames;
vidHeight	= vidObj.Height;
vidWidth	= vidObj.Width;

mov(1:nFrames) = struct('cdata',zeros(vidHeight,vidWidth, 3,'uint8'), 'colormap',[]);

for k = 1 : nFrames
    mov(k).cdata = read(vidObj,k);
end

hf = figure;
set(hf, 'position', [0 0 vidWidth vidHeight])


movie(hf, mov, 1, vidObj.FrameRate);


sca;