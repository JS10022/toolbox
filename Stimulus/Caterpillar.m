function Caterpillar(  )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%% Create & draw window
window	= Window;

img		= imread('caterpillar2.png');
texture = Screen('MakeTexture', window, img);

fprintf('\nHave the subject read the Caterpillar script\n');
Screen('DrawTextures', window, texture, [0,-350,750,250]);
drawText(window, 'Please read Caterpillar', 6);


% Close texture window
Screen('Close', texture);
end

