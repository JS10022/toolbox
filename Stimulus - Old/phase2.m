%% Set up Second Phase
%{
[phraseNum, stimulus] = nextPhase(phraseNum, stimulus);

phrase	= getPhrase(phraseNum);

input('Press ENTER to begin Second Phase');



%% Run Second Phase of Experiment 
% %{
Directive(7);

Learning( window, phrase, subject, match, stimulus );

% Generalization Phase

phrase	= getPhrase(phraseNum + 1);

Generalization( window, phrase, subject, match, stimulus )

% Begin Post Assessment - Phase 2
% %{
Directive(8);
vowelReps(6, t, t, f);					% Run vowelReps with alternating masking

Directive(9);
prePost(window, bobo, 6, t);				% Run prePost with alternating masking

Directive(10);
vowelReps(3, f, t, t);					% Run vowelReps with masking

Directive(11);
prePost(window, yoyo, 5, f, t);				% Run prePost with masking
prePost(window, bobo, 5, f, t);				% Run prePost with masking
%}