%{
 ---- Old Code Scraps ---- %
%{
 A = importdata('Caterpillar.txt');
% fid = fopen('Caterpillar.m');

% M = fscanf(fid,'%s\n',10);
% M = fgetl(fid);

% A = Fscanf('Caterpillar.txt');
% A
% M

% caterpillar = cell(1,16);
% caterpillar{1}	= 'Do you like amusement parks?  ';
% caterpillar{2}	= 'Well, I sure do.  ';

% words	= cell(1,0);
% caterpillar
% fid

nMainPanels				= 1;
leftMargin				= 0.075;
panelSpacing			= 0.025;

 						  (1 - 2 * 0.075	  - (3			 - 1) * 0.025		) / 3
	nMainPanels = 1 -> panelWidth = 0.996
	nMainPanels = 3 -> panelWidth = 0.267


panelWidth				= (1 - 2 * leftMargin - (nMainPanels - 1) * panelSpacing) / nMainPanels;
panelHeight				= 0.525;

hsp						= nan(1, nMainPanels);

for i1 = 1 : nMainPanels
% 	hsp(i1)	= subplot('Position', [0.05, 0.45, 0.9, 0.5]);
    hsp(i1)	= leftMargin + (i1 - 1) * (panelWidth + panelSpacing);	% , 0.375, panelWidth, panelHeight]);
%     set(gca, 'XTick', [], 'YTick', []);
%     set(gca, 'XColor', 'w', 'YColor', 'w');
end

% panelWidth
hsp
%}

%{
thisphase = 'natural';

msgTxt = getStimStr('pre');

msgTxt

%}

%{
%% ---- Runs "Caterpillar" Stimulus ---- %%
fclose			all;
close			all force;												% Closes all previous instances


% exptConfigFN = 'expt_config_fmt.vowels.txt';							% 
exptConfigFN = 'expt_config_fmt.caterpillar.txt';						% 
check_file(exptConfigFN);												% Retrieves experimental peramaters from config file
expt_config		= read_parse_expt_config(exptConfigFN);					% 

expt.stimUtter	= expt_config.STIM_UTTER;

expt.script.pre.nReps	= expt_config.PRE_REPS;
expt.script.pract1.nReps= expt_config.PRACT1_REPS;						
expt.script.pract2.nReps= expt_config.PRACT2_REPS;

expt.script.pre		= genPhaseScript('pre', expt.script.pre.nReps, expt.stimUtter);
expt.script.pract1	= genPhaseScript('pract1', expt.script.pract1.nReps, expt.stimUtter);
expt.script.pract2	= genPhaseScript('pract2', expt.script.pract2.nReps, expt.stimUtter);


hkf					= figure('Position', [1760, 390, 760, 600], 'Color', 'w', ...		
							 'Name', 'Participant window', 'NumberTitle', 'off', ...
							 'Toolbar', 'none', 'Menubar', 'none');


%{
uiConfigFN = fullfile(dirname, 'uiConfig.mat');

    load(uiConfigFN);									% gives uiConfig
    showWordHint		= uiConfig.showWordHint;
    showWarningHint		= uiConfig.showWarningHint;
    showInfoOnlyErr		= uiConfig.showInfoOnlyErr;
    showCorrCount		= uiConfig.showCorrCount;
    bShowCorrAnim		= uiConfig.bShowCorrAnim;
    trialStartWithAnim	= uiConfig.trialStartWithAnim;
    trialPresetDur		= uiConfig.trialPresetDur;
    promptMode			= uiConfig.promptMode;
    promptVol			= uiConfig.promptVol;								 
%}

dirname = 'C:\DATA\APE\TS_FMT_20140113_FMT02';
% figIdDat = makeFigDataMon;

								 
% hgui = UIRecorder('figIdDat', figIdDat, 'dirname', dirname);			% ==== Creates the UIRecorder ("Control") window ====
% set(hgui.UIRecorder, 'Position', [1300, 290, 440, 700]);				% JS Position of "Control" window



msg = 'JS_test_1';

% play_prompt(msg, 'audio', 10^(uiConfig.promptVol / 20));
%}

%

% getCater(2)

% test = cell(1,16);
% 
% test{2} = getCater(2);
% test{3} = getCater(3);

%}


test = getStim;

% iscellstr(test)

test{1}