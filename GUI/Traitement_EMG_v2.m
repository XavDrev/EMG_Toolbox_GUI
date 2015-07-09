function varargout = Traitement_EMG_v2(varargin)
% TRAITEMENT_EMG_V2 MATLAB code for Traitement_EMG_v2.fig
%      TRAITEMENT_EMG_V2, by itself, creates a new TRAITEMENT_EMG_V2 or raises the existing
%      singleton*.
%
%      H = TRAITEMENT_EMG_V2 returns the handle to a new TRAITEMENT_EMG_V2 or the handle to
%      the existing singleton*.
%
%      TRAITEMENT_EMG_V2('CALLBACK',hObject,eventdata,handles,...) calls the local
%      function named CALLBACK in TRAITEMENT_EMG_V2.M with the given input arguments.
%
%      TRAITEMENT_EMG_V2('Property','Value',...) creates a new TRAITEMENT_EMG_V2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Traitement_EMG_v2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Traitement_EMG_v2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Traitement_EMG_v2

% Last Modified by GUIDE v2.5 24-Oct-2014 10:23:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Traitement_EMG_v2_OpeningFcn, ...
    'gui_OutputFcn',  @Traitement_EMG_v2_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Traitement_EMG_v2 is made visible.
function Traitement_EMG_v2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)
% varargin   command line arguments to Traitement_EMG_v2 (see VARARGIN)
global haxes1 haxes2

% Choose default command line output for Traitement_EMG_v2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Test_APA_v3e wait for user response (see UIRESUME)
% uiwait(handles.Test_APA_v3e);
scrsz = get(0,'ScreenSize');
set(hObject,'Position',[scrsz(3)/30 scrsz(4)/30 scrsz(3)*7/10 scrsz(4)*7/10]);

set(gcf,'Name','Traitement des EMG');


ylabel(haxes1,'EMG Brut','FontName','Times New Roman','FontSize',10);
set(haxes1,'Visible','Off');

ylabel(haxes2,'TKEO','FontName','Times New Roman','FontSize',10);
set(haxes2,'Visible','Off');

set(findobj('Tag','listbox1'), 'Visible','Off');
set(findobj('Tag','text1'), 'Visible','Off');

set(findobj('Tag','listbox2'), 'Visible','Off');
set(findobj('Tag','text2'), 'Visible','Off');

set(findobj('Tag','save'), 'Enable','Off');
set(findobj('Tag','calculer'), 'Enable','Off');
set(findobj('Tag','bouffees'), 'Enable','Off');

set(findobj('Tag','TKEO'), 'Value',1);
set(findobj('Tag','SampEn'), 'Value',0);
set(findobj('Tag','uipanel_TKEO'), 'Visible','On');
set(findobj('Tag','uipanel_SampEn'), 'Visible','Off');
set(findobj('Tag','uipanel_bouffees'), 'Visible','On');



% UIWAIT makes Traitement_EMG_v2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Traitement_EMG_v2_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
draw_emg

% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2
draw_emg

% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global haxes1
% hObject    handle to axes1 (see GCBO)
haxes1 = hObject;
% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global haxes2
% hObject    handle to axes1 (see GCBO)
haxes2 = hObject;
% Hint: place code in OpeningFcn to populate axes2

% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)
global EMG list_EMG
EMG = [];
list_EMG = [];

% --- Executes on button press in pushbutton10.
function Infos(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)
global EMG nom_fich

if ~isfield(EMG,'Infos')
    
    Tag_items = {'Protocole','Session','Code_Sujet','Traitement','Vitesse'};
    items = {'GBMOV','Preop/LFP/M3','XXXXx00','ON/OFF','S/R'};
    items = inputdlg(Tag_items,'Infos',1,items);
    if ~isempty(items)
        nom_fich = [items{1} '_' items{2} '_' items{3} '_' items{4} '_' items{5}];
        EMG.info('Protocole') = items{1};
        EMG.info('Session') = items{2};
        EMG.info('Subject') = items{3};
        EMG.info('MedCondition') = items{4};
        EMG.info('SpeedCondition') = items{5};
        EMG.info('FileName') = nom_fich;
    else
        nom_fich = '';
    end
    
else
    Tag_items = {'Protocole','Session','Code_Sujet','Traitement','Vitesse'};
    items = {EMG.Infos.Protocole,EMG.Infos.Session,EMG.Infos.Subject,EMG.Infos.MedCondition,EMG.Infos.SpeedCondition};
    items = inputdlg(Tag_items,'Infos',1,items);
    
    if ~isempty(items)
        nom_fich = [items{1} '_' items{2} '_' items{3} '_' items{4} '_' items{5}];
        EMG.info('Protocole') = items{1};
        EMG.info('Session') = items{2};
        EMG.info('Subject') = items{3};
        EMG.info('MedCondition') = items{4};
        EMG.info('SpeedCondition') = items{5};
        EMG.info('FileName') = nom_fich;
    else
        nom_fich = '';
    end
end

%% Chargement des données EMG
% --- Executes on button press in pushbutton1.
function charger_c3d(varargin)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)
global EMG list_EMG dossier nom_fich

if isempty(varargin)
    %Choix manuel des fichiers
    [files1 dossier] = uigetfile('*.c3d; *.xls','Choix du/des fichier(s) c3d ','Multiselect','on');
else
    files1 = varargin{1};
    dossier = varargin{2};
end
files = setdiff(files1,{'zero_EMG.c3d'});
%Initialisation
EMG = Segment;

Tag_items = {'Protocole','Session','Code_Sujet','Traitement','Vitesse'};

Protocole ='GBMOV';

if ~isempty(strfind(fullfile(dossier,files{1}),'Preop'))
    Session = 'Preop';
elseif ~isempty(strfind(fullfile(dossier,files{1}),'LFP'))
    Session = 'LFP';
elseif ~isempty(strfind(fullfile(dossier,files{1}),'M3Stim1'))
    Session = 'M3Stim1';
elseif ~isempty(strfind(fullfile(dossier,files{1}),'M3Stim2'))
    Session = 'M3Stim2';
end

if ~isempty(strfind(fullfile(dossier,files{1}),'OFF'))
    traitement = 'OFF';
elseif ~isempty(strfind(fullfile(dossier,files{1}),'ON'))
    traitement = 'ON';
else
    traitement = '';
end

if ~isempty(strfind(fullfile(dossier,files{1}),'MN')) || ~isempty(strfind(fullfile(dossier,files{1}),'S'))
    vitesse = 'S';
elseif ~isempty(strfind(fullfile(dossier,files{1}),'MR')) || ~isempty(strfind(fullfile(dossier,files{1}),'R'))
    vitesse = 'R';
elseif ~isempty(strfind(fullfile(dossier,files{1}),'AI'))
    vitesse = 'AI';
else
    vitesse = '';
end
Tag_sujet = 'XXXXx00';

items = {Protocole,Session,Tag_sujet,traitement,vitesse};
items = inputdlg(Tag_items,'Infos',1,items);


if ~isempty(items)
    nom_fich = [items{1} '_' items{2} '_' items{3} '_' items{4} '_' items{5}];
    EMG.info('Protocole') = items{1};
    EMG.info('Session') = items{2};
    EMG.info('Subject') = items{3};
    EMG.info('MedCondition') = items{4};
    EMG.info('SpeedCondition') = items{5};
    EMG.info('FileName') = nom_fich;
else
    nom_fich = '';
end
set(findobj('Tag','nom_sujet'),'String',['Sujet : ' nom_fich])

if ischar(files)
    files = {files};
end

%Extraction des données d'intérêts
i_fich = 1;

clear acq analogs list_ana ind_EMG
acq = btkReadAcquisition(fullfile(dossier,files{i_fich}));
if isempty(list_EMG)
    analogs = btkGetAnalogs(acq);
    list_ana = fieldnames(analogs);
    ind_EMG = listdlg('ListString',list_ana,'SelectionMode','multiple','PromptString','Selectionner les voies EMG');
    list_EMG = list_ana(ind_EMG);
end
clear list_ana ind_EMG

for i_fich = 1 : length(files)
    clear acq analogs
    acq = btkReadAcquisition(fullfile(dossier,files{i_fich}));
    analogs = btkGetAnalogs(acq);
    Fech = btkGetAnalogFrequency(acq);   
    for j_EMG = 1 : length(list_EMG)
        temp(:, j_EMG) = (analogs.(list_EMG{j_EMG})- mean(analogs.(list_EMG{j_EMG})))';
    end
    EMG.data{i_fich} = Segment;
    EMG.data{i_fich}.data{1} = SampledProcess('values',temp,'Fs',Fech,'tStart',0,'labels',list_EMG(:));
    EMG.data{i_fich}.data{1}.info('TrialName') = files{i_fich}(1:strfind(files{i_fich},'.')-1);
    EMG.data{i_fich}.data{1}.info('TrialNum') = str2double(files{i_fich}(strfind(files{i_fich},'.')-2:strfind(files{i_fich},'.')-1));
    EMG.data{i_fich}.data{1}.info('Description') = 'EMG Raw Datas';
    EMG.data{i_fich}.data{1}.info('History') = '';
    EMG.data{i_fich}.data{1}.info('Type') = 'EMG_RAW';
    clear acq analogs temp   
    
end

EMG.info('History') = ''; 

% Mise à jour de la liste des acquisitions
set(findobj('Tag','text1'), 'Visible','On');
set(findobj('Tag','listbox1'), 'Visible','On');
set(findobj('Tag','listbox1'), 'Value',1);
liste_acq = cellfun(@(x) x.data{1}.info('TrialName'), EMG.data,'uni',0);
set(findobj('Tag','listbox1'),'String',liste_acq);

set(findobj('Tag','text2'), 'Visible','On');
set(findobj('Tag','listbox2'), 'Visible','On');
set(findobj('Tag','listbox2'), 'Value',1);
set(findobj('Tag','listbox2'),'String',list_EMG);

%Activation des axes
axess = findobj('Type','axes');
for i=1:length(axess)
    set(axess(i),'Visible','On');
end

draw_emg
set(findobj('Tag','save'), 'Enable','On');
set(findobj('Tag','calculer'), 'Enable','On');

%% Chargement des données EMG en batch
% --- Executes on button press in pushbutton1.
function charger_c3d_batch(varargin)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)
global EMG list_EMG dossier nom_fich

if isempty(varargin)
    %Choix manuel des fichiers
    [files1 dossier] = uigetfile('*.c3d; *.xls','Choix du/des fichier(s) c3d ','Multiselect','on');
else
    files1 = varargin{1};
    dossier = varargin{2};
end

files = setdiff(files1,{'zero_EMG.c3d'});
%Initialisation
EMG = [];

Protocole ='GBMOV';

if ~isempty(strfind(lower(fullfile(dossier,files{1})),'preop'))
    Session = 'Preop';
elseif ~isempty(strfind(lower(fullfile(dossier,files{1})),'lfp'))
    Session = 'POSTOP';
elseif ~isempty(strfind(lower(fullfile(dossier,files{1})),'m3stim1'))
    Session = 'M3Stim1';
elseif ~isempty(strfind(lower(fullfile(dossier,files{1})),'m3stim2'))
    Session = 'M3Stim2';
end

if ~isempty(strfind(lower(fullfile(dossier,files{1})),'_off'))
    traitement = 'OFF';
elseif ~isempty(strfind(lower(fullfile(dossier,files{1})),'_on'))
    traitement = 'ON';
else
    traitement = '';
end

if ~isempty(strfind(lower(fullfile(dossier,files{1})),'_mn')) || ~isempty(strfind(lower(fullfile(dossier,files{1})),'_s_'))
    vitesse = 'S';
elseif ~isempty(strfind(lower(fullfile(dossier,files{1})),'_mr')) || ~isempty(strfind(lower(fullfile(dossier,files{1})),'_r_'))
    vitesse = 'R';
elseif ~isempty(strfind(lower(fullfile(dossier,files{1})),'_ai'))
    vitesse = 'AI';
else
    vitesse = '';
end
ind_nom_sujet = strfind(files{1},'_');
Tag_sujet = files{1}(ind_nom_sujet(2)+1:ind_nom_sujet(3)-1);

items = {Protocole,Session,Tag_sujet,traitement,vitesse};
% items = inputdlg(Tag_items,'Infos',1,items);

if ~isempty(items)
    nom_fich = [items{1} '_' items{2} '_' items{3} '_' items{4} '_' items{5}];
    EMG.Infos.Protocole = items{1};
    EMG.Infos.Session = items{2};
    EMG.Infos.Subject = items{3};
    EMG.Infos.MedCondition = items{4};
    EMG.Infos.SpeedCondition = items{5};
    EMG.Infos.FileName = nom_fich;
else
    nom_fich = '';
end
set(findobj('Tag','nom_sujet'),'String',['Sujet : ' nom_fich])

if ischar(files)
    files = {files};
end

%Extraction des données d'intérêts
i_fich = 1;

clear acq analogs list_ana ind_EMG
acq = btkReadAcquisition(fullfile(dossier,files{i_fich}));
if isempty(list_EMG)
    analogs = btkGetAnalogs(acq);
    list_ana = fieldnames(analogs);
    ind_EMG = listdlg('ListString',list_ana,'SelectionMode','multiple','PromptString','Selectionner les voies EMG');
    list_EMG = list_ana(ind_EMG);
end
clear list_ana ind_EMG

for i_fich = 1 : length(files)
    clear acq analogs
    acq = btkReadAcquisition(fullfile(dossier,files{i_fich}));
    analogs = btkGetAnalogs(acq);
    Fech = btkGetAnalogFrequency(acq);   
    for j_EMG = 1 : length(list_EMG)
        temp(j_EMG,:) = (analogs.(list_EMG{j_EMG})- mean(analogs.(list_EMG{j_EMG})))';
    end
    EMG.Trial(i_fich).RAW = Signal_EMG(temp,Fech,'tag',list_EMG,'units',repmat({'V'},1,size(list_EMG,1)));
    EMG.Trial(i_fich).RAW.TrialName = files{i_fich}(1:strfind(files{i_fich},'.')-1);
    EMG.Trial(i_fich).RAW.TrialNum = str2double(files{i_fich}(strfind(files{i_fich},'.')-2:strfind(files{i_fich},'.')-1));
    EMG.Trial(i_fich).RAW.Description = 'Enregistrements EMG brutes pour GBMOV';
    clear acq analogs temp   
    
end

eval('EMG.history =[]');

% Mise à jour de la liste des acquisitions
set(findobj('Tag','text1'), 'Visible','On');
set(findobj('Tag','listbox1'), 'Visible','On');
set(findobj('Tag','listbox1'), 'Value',1);
liste_acq = arrayfun(@(i) EMG.Trial(i).RAW.TrialName, 1:length(EMG.Trial),'uni',0);
set(findobj('Tag','listbox1'),'String',liste_acq);

set(findobj('Tag','text2'), 'Visible','On');
set(findobj('Tag','listbox2'), 'Visible','On');
set(findobj('Tag','listbox2'), 'Value',1);
set(findobj('Tag','listbox2'),'String',list_EMG);

%Activation des axes
axess = findobj('Type','axes');
for i=1:length(axess)
    set(axess(i),'Visible','On');
end

draw_emg
set(findobj('Tag','save'), 'Enable','On');
set(findobj('Tag','calculer'), 'Enable','On');

%% charger .mat
% --- Executes on button press in pushbutton7.
function charger_mat(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)
global EMG list_EMG dossier nom_fich

[file dossier] = uigetfile('*.mat','Choix du fichier mat');
load(fullfile(dossier,file));
eval(['EMG = '  file(1:end-4)]);
if ~isfield(EMG,'Infos') || isempty(EMG.Infos.FileName)
    
    Tag_items = {'Protocole','Session','Code_Sujet','Traitement','Vitesse'};
    
    Protocole ='GBMOV';
    
    if ~isempty(strfind(fullfile(dossier,file),'Preop'))
        Session = 'PREOP';
    elseif ~isempty(strfind(fullfile(dossier,file),'LFP'))
        Session = 'POSTOP';
    elseif ~isempty(strfind(fullfile(dossier,file),'M3Stim1'))
        Session = 'M3STIM1';
    elseif ~isempty(strfind(fullfile(dossier,file),'M3Stim2'))
        Session = 'M3STIM2';
    end
    
    if ~isempty(strfind(fullfile(dossier,file),'OFF'))
        traitement = 'OFF';
    elseif ~isempty(strfind(fullfile(dossier,file),'ON'))
        traitement = 'ON';
    else
        traitement = '';
    end
    
    if ~isempty(strfind(fullfile(dossier,file),'MN')) || ~isempty(strfind(fullfile(dossier,file),'S'))
        vitesse = 'S';
    elseif ~isempty(strfind(fullfile(dossier,file),'MR')) || ~isempty(strfind(fullfile(dossier,file),'R'))
        vitesse = 'R';
    elseif ~isempty(strfind(fullfile(dossier,files{1}),'AI'))
        vitesse = 'AI';
    else
        vitesse = '';
    end
    ind_nom_sujet = strfind(file,'_');
    Tag_sujet = files(ind_nom_sujet(2)+1:ind_nom_sujet(3)-1);
    
    items = {Protocole,Session,Tag_sujet,traitement,vitesse};
%     items = inputdlg(Tag_items,'Infos',1,items);
  
    nom_fich = upper([items{1} '_' items{2} '_' items{3} '_' items{4} '_' items{5}]);
else
    nom_fich = EMG.Infos.FileName;
end

set(findobj('Tag','nom_sujet'),'String',['Sujet : ' nom_fich])

% Mise à jour de la liste des acquisitions
set(findobj('Tag','text1'), 'Visible','On');
set(findobj('Tag','listbox1'), 'Visible','On');
set(findobj('Tag','listbox1'), 'Value',1);
files = arrayfun(@(i) EMG.Trial(i).RAW.TrialName, 1:length(EMG.Trial),'uni',0);
set(findobj('Tag','listbox1'),'String',files);

champ = fieldnames(EMG);
list_EMG = EMG.Trial(1).RAW.Tag;
set(findobj('Tag','text2'), 'Visible','On');
set(findobj('Tag','listbox2'), 'Visible','On');
set(findobj('Tag','listbox2'), 'Value',1);
set(findobj('Tag','listbox2'),'String',list_EMG);

%Activation des axes
axess = findobj('Type','axes');
for i=1:length(axess)
    set(axess(i),'Visible','On');
end

draw_emg
set(findobj('Tag','save'), 'Enable','On');
if isfield(EMG.Trial(1),'RAW')
    set(findobj('Tag','calculer'), 'Enable','On');
end
if isfield(EMG.Trial(1),'SampEn')
    set(findobj('Tag','bouffees'), 'Enable','On');
    SampEn_Callback;
end
if isfield(EMG.Trial(1),'TKEO')
    set(findobj('Tag','bouffees'), 'Enable','On');
    TKEO_Callback;
end

%% Draw_EMG
% On trace les EMG
function draw_emg
global EMG haxes1 haxes2

try
    val1 = get(findobj('Tag','listbox1'),'Value');
catch
    val1 = 1;
    set(findobj('Tag','listbox1'),'Value',val1);
end
list1 = get(findobj('Tag','listbox1'),'String');
nom_acq = list1(val1);

try
    val2 = get(findobj('Tag','listbox2'),'Value');
catch
    val2 = 1;
    set(findobj('Tag','listbox2'),'Value',val1);
end
list2 = get(findobj('Tag','listbox2'),'String');
tag_EMG = list2(val2);

set(haxes1,'Nextplot','replace')
ind_RAW = matchcells(cellfun(@(x) x.info('Type'),EMG.data{val1}.data,'uni',0),{'EMG_RAW'});
temp = EMG.data{val1}.data{ind_RAW}.extract(tag_EMG);
plot(haxes1,temp.times,temp.values)
if ~isempty(matchcells(cellfun(@(x) x.info('Type'),EMG.data{val1}.data,'uni',0),{'EMG_Bouffee'}))
    set(haxes1,'Nextplot','add')
    ind_Bouffee = matchcells(cellfun(@(x) x.info('Type'),EMG.data{val1}.data,'uni',0),{'EMG_Boufee'});
    plot(haxes1,EMG.data{val1}.data{ind_Bouffee}.times{1},EMG.data{val1}.data{ind_Bouffee}.values{1}(:,val2),'Color',[1 0 0])
end

if  get(findobj('Tag','TKEO'), 'Value') && ...
        ~isempty(matchcells(cellfun(@(x) x.info('Type'),EMG.data{val1}.data,'uni',0),{'EMG_TKEO'}))
    set(haxes2,'Nextplot','replace')
    ind_TKEO = matchcells(cellfun(@(x) x.info('Type'),EMG.data{val1}.data,'uni',0),{'EMG_TKEO'});
    plot(haxes1,EMG.data{val1}.data{ind_TKEO}.times{1},EMG.data{val1}.data{ind_TKEO}.values{1}(:,val2));
    if ~isempty(matchcells(cellfun(@(x) x.info('Type'),EMG.data{val1}.data,'uni',0),{'EMG_Bouffee'}))
        set(haxes2,'Nextplot','add')
        clear temp
        temp = EMG.data{val1}.data{ind_TKEO}.values{1}(:,val2);
        ind_Bouffee = matchcells(cellfun(@(x) x.info('Type'),EMG.data{val1}.data,'uni',0),{'EMG_Boufee'});
        temp(isnan(EMG.data{val1}.data{ind_Bouffee}.values{1}(:,val2))) = NaN;
        plot(haxes1,EMG.data{val1}.data{ind_TKEO}.times{1},temp,'Color',[1 0 0]);
        clear temp
    end
end
if  get(findobj('Tag','SampEn'), 'Value') && ...
        ~isempty(matchcells(cellfun(@(x) x.info('Type'),EMG.data{val1}.data,'uni',0),{'EMG_SAMPEN'}))
    set(haxes2,'Nextplot','replace')
    ind_SAMPEN = matchcells(cellfun(@(x) x.info('Type'),EMG.data{val1}.data,'uni',0),{'EMG_SAMPEN'});
    plot(haxes1,EMG.data{val1}.data{ind_SAMPEN}.times{1},EMG.data{val1}.data{ind_SAMPEN}.values{1}(:,val2));
    if ~isempty(matchcells(cellfun(@(x) x.info('Type'),EMG.data{val1}.data,'uni',0),{'EMG_Bouffee'}))
        set(haxes2,'Nextplot','add')
        clear temp
        temp = EMG.data{val1}.data{ind_SAMPEN}.values{1}(:,val2);
        ind_Bouffee = matchcells(cellfun(@(x) x.info('Type'),EMG.data{val1}.data,'uni',0),{'EMG_Boufee'});
        temp(isnan(EMG.data{val1}.data{ind_Bouffee}.values{1}(:,val2))) = NaN;
        plot(haxes1,EMG.data{val1}.data{ind_SAMPEN}.times{1},temp,'Color',[1 0 0]);
        clear temp
    end
end


%% sauvegarde
% --- Executes on button press in save.
function sauvegarder(varargin)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)
global EMG nom_fich

if isempty(varargin)
    [file, dossier] = uiputfile([nom_fich '.mat']);
else
    file = varargin{1};
    dossier = varargin{2};
end

nom_fich_EMG = upper([nom_fich '_EMG']);
eval([nom_fich_EMG ' = EMG;']);
% liste_trial = fieldnames(EMG);
% 
% for i_trial = 1 : length(liste_trial)
%     
%     if isnan(str2double(liste_trial{i_trial}(end-1)))
%         numTrial = ['0' liste_trial{i_trial}(end)];
%     elseif ~isnan(str2double(liste_trial{i_trial}(end)))
%         numTrial = ['' liste_trial{i_trial}(end-1:end)];
%     else
%         numTrial = '';
%     end
%     
%     nom_trial = [nom_fich '_' numTrial];
% 
%     eval([nom_fich_EMG '.Trial{' num2str(i_trial) '}.Fech =  EMG.' liste_trial{i_trial} '.Fech;']);
%     eval([nom_fich_EMG '.Trial{' num2str(i_trial) '}.RAW =  EMG.' liste_trial{i_trial} '.RAW;']);
%     eval([nom_fich_EMG '.Trial{' num2str(i_trial) '}.TKEO =  EMG.' liste_trial{i_trial} '.TKEO;']);
%     eval([nom_fich_EMG '.Trial{' num2str(i_trial) '}.Bouffees =  EMG.' liste_trial{i_trial} '.Bouffees;']);
%     eval([nom_fich_EMG '.Trial{' num2str(i_trial) '}.Activite =  EMG.' liste_trial{i_trial} '.Activite;']);
%     eval([nom_fich_EMG '.Trial{' num2str(i_trial) '}.file_name =  nom_trial;']);
%     eval([nom_fich_EMG '.history =  [];']);
% end
eval(['save(fullfile(dossier,[nom_fich_EMG ''.mat'']),''' nom_fich_EMG ''');']); 
eval(['clear ''' nom_fich_EMG '''']); 
set(findobj('Tag','nom_sujet'),'String',['Sujet : ' nom_fich ])

%% batch
% --- Executes on button press in pushbutton6.
function Batch()
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)
global list_EMG
% choix des patients
chemin = uigetdir([],'Choix des repertoires contenant les acquisitions c3d');
liste=dir(chemin);
liste_patients = cell(1,size(liste,1));
[liste_patients{1:size(liste,1)}] = deal(liste.name);
[s,v] = listdlg('PromptString',{'choisir les patients'},...
    'ListSize',[300 300],...
    'ListString',liste_patients);
cd(chemin);
liste_choix=liste_patients(s)';

for i_choix = 1 : length(liste_choix)
    cd(fullfile(chemin,liste_choix{i_choix}))
    b=dir();
    
    A = dir('*.c3d');
    files = {A(:).name};
    
    %Extraction des données d'intérêts
    clear acq analogs list_ana ind_EMG
    acq = btkReadAcquisition(fullfile(chemin,liste_choix{i_choix},files{1}));
    if i_choix == 1
        analogs = btkGetAnalogs(acq);
        list_ana = fieldnames(analogs);
        ind_EMG = listdlg('ListString',list_ana,'SelectionMode','multiple','PromptString','Selectionner les voies EMG');
        list_EMG = list_ana(ind_EMG);
    end
    clear acq analogs list_ana ind_EMG
    
    charger_c3d_batch(files,fullfile(chemin,liste_choix{i_choix}));
    calculer_Callback;
    bouffees;
    sauvegarder(liste_choix{i_choix},fullfile(chemin,liste_choix{i_choix}));
%     export_figure;    
    cd('..')   
    cd(chemin)
end

%% export des figures
function export_figure()

global EMG

list1 = get(findobj('Tag','listbox1'),'String');
list2 = get(findobj('Tag','listbox2'),'String');

for i_list1 = 1 : length(list1)
    nom_acq = list1{i_list1};
    for j_list2 = 1 : length(list2)
        nom_emg = list2{j_list2};
        nom_fig = [nom_acq '_' nom_emg];
        f1 = figure('Color',[1 1 1],'units','Normalized','Position', [0.1 0.1 0.8 0.8]);
        f1_axes1 = subplot(2,1,1);
        f1_axes2 = subplot(2,1,2);
        set(f1_axes1,'Nextplot','replace')
        plot(f1_axes1,EMG.Trial(i_list1).RAW.Time,EMG.Trial(i_list1).RAW.Data(j_list2,:))
        if isfield(EMG.Trial(i_list1),'Bouffee') && ~isempty(EMG.Trial(i_list1).Bouffee.Data)
            set(f1_axes1,'Nextplot','add')
            plot(f1_axes1,EMG.Trial(i_list1).Bouffee.Time,EMG.Trial(i_list1).Bouffee.Data(j_list2,:),'Color',[1 0 0]);
        end
        
        if isfield(EMG.Trial(i_list1),'TKEO') && get(findobj('Tag','TKEO'), 'Value')
            set(f1_axes2,'Nextplot','replace')
            plot(f1_axes2,EMG.Trial(i_list1).TKEO.temps,EMG.Trial(i_list1).TKEO.Data(j_list2,:))
            if isfield(EMG.Trial(i_list1),'Bouffee') && ~isempty(EMG.Trial(i_list1).Bouffee.Data)
                set(f1_axes2,'Nextplot','add')
                clear temp
                temp = EMG.Trial(i_list1).TKEO.Data(j_list2,:);
                temp(isnan(EMG.Trial(i_list1).Bouffee.Data(j_list2,:))) = NaN;
                plot(f1_axes2,EMG.Trial(i_list1).TKEO.temps,temp,'Color',[1 0 0]);
                clear temp
            end
        end
        if isfield(EMG.Trial(i_list1),'SampEn') && get(findobj('Tag','SampEn'), 'Value');
            set(f1_axes2,'Nextplot','replace')
            plot(f1_axes2,EMG.Trial(i_list1).SampEn.temps,EMG.Trial(i_list1).SampEn.Data(j_list2,:))
            if isfield(EMG.Trial(i_list1),'Bouffee') && ~isempty(EMG.Trial(i_list1).Bouffee.Data)
                set(f1_axes2,'Nextplot','add')
                clear temp
                temp = EMG.Trial(i_list1).SampEn.Data(j_list2,:);
                temp(isnan(EMG.Trial(i_list1).Bouffee.Data(j_list2,:))) = NaN;
                plot(f1_axes2,EMG.Trial(i_list1).SampEn.temps,temp,'Color',[1 0 0]);
                clear temp
            end
        end
        set(gcf,'Name',nom_fig)
        saveas(f1,[nom_fig '.tif']);
        close
    end
end

%% bouton radio pour choisir le critère calculé
% --- Executes on button press in TKEO.
function TKEO_Callback
% hObject    handle to TKEO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)
global EMG

% Hint: get(hObject,'Value') returns toggle state of TKEO
set(findobj('Tag','TKEO'), 'Value',1);
set(findobj('Tag','SampEn'), 'Value',0);
set(findobj('Tag','uipanel_TKEO'), 'Visible','On');
set(findobj('Tag','uipanel_SampEn'), 'Visible','Off');

try
    val1 = get(findobj('Tag','listbox1'),'Value');
catch
    val1 = 1;
    set(findobj('Tag','listbox1'),'Value',val1);
end
list1 = get(findobj('Tag','listbox1'),'String');
nom_acq = list1(val1);

if strncmp(get(findobj('Tag','listbox1'), 'Visible'),'on',2) && ...
        ~isempty(matchcells(cellfun(@(x) x.info('Type'),EMG.data{val1}.data,'uni',0),{'EMG_TKEO'}))
    draw_emg
end

% --- Executes on button press in SampEn.
function SampEn_Callback
% hObject    handle to SampEn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)
global EMG

% Hint: get(hObject,'Value') returns toggle state of SampEn
set(findobj('Tag','TKEO'), 'Value',0);
set(findobj('Tag','SampEn'), 'Value',1);
set(findobj('Tag','uipanel_TKEO'), 'Visible','Off');
set(findobj('Tag','uipanel_SampEn'), 'Visible','On');

try
    val1 = get(findobj('Tag','listbox1'),'Value');
catch
    val1 = 1;
    set(findobj('Tag','listbox1'),'Value',val1);
end
list1 = get(findobj('Tag','listbox1'),'String');
nom_acq = list1(val1);

if strncmp(get(findobj('Tag','listbox1'), 'Visible'),'on',2) && ...
        ~isempty(matchcells(cellfun(@(x) x.info('Type'),EMG.data{val1}.data,'uni',0),{'EMG_SAMPEN'}))
    draw_emg
end

%% calculer le critère choisi
% --- Executes on button press in calculer.
function  calculer_Callback();
% hObject    handle to calculer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)
global EMG list_EMG

files = cellfun(@(x) x.data{1}.info('TrialName'), EMG.data,'uni',0);
list_EMG = get(findobj('Tag','listbox2'),'String');
ind_TKEO = get(findobj('Tag','TKEO'),'Value');
ind_SampEn = get(findobj('Tag','SampEn'),'Value');

for i_fich = 1 : length(files)
    nom_acq = files{i_fich};
    ind_RAW = matchcells(cellfun(@(x) x.info('Type'),EMG.data{i_fich}.data,'uni',0),{'EMG_RAW'});
    Fech = EMG.data{i_fich}.data{ind_RAW}.Fs;
    disp(['Traitement de : ' nom_acq ]);
    if ind_TKEO == 1
        EMG.Trial(i_fich).TKEO = EMG.Trial(i_fich).RAW.TKEOprocess;
    end
    if ind_SampEn == 1
        EMG.Trial(i_fich).SampEn = Signal;
    end
    for j_EMG = 1 : length(list_EMG)
        if ind_SampEn == 1
            disp('Calcul SampEn');
            % Nonlinear sample Entropy (Zhang2012)
            
            x = EMG.Trial(i_fich).RAW.Data(j_EMG,:);
            r=0.25*std(x(:));
            t=1;
            duree = str2double(get(findobj('Tag','duree_window'),'String'))/1000*Fech;
            increment = str2double(get(findobj('Tag','incr_window'),'String'))/1000*Fech;
            while (t-1)*increment+duree<length(x)
                window(t,:) = x((t-1)*increment+1:(t-1)*increment+duree);
                t=t+1;
            end
            for i_windo = 1 : size(window,1)
                SamEn(i_windo) = SampEn(2,r,window(i_windo,:));
            end
            EMG.Trial(i_fich).SampEn.Data(j_EMG,:) = SamEn;
        end
    end
    
    if ind_SampEn == 1
        EMG.Trial(i_fich).SampEn.Fech = Fech/(length(EMG.Trial(i_fich).RAW.Data(1,:))/length(EMG.Trial(i_fich).SampEn.Data(1,:)));
        EMG.Trial(i_fich).SampEn.Tag = list_EMG;
        EMG.Trial(i_fich).SampEn.Time = (1:length(EMG.Trial(i_fich).RAW.Data(1,:))/length(EMG.Trial(i_fich).SampEn.Data(1,:)):length(EMG.Trial(i_fich).RAW.Data(1,:)))/Fech;
        EMG.Trial(i_fich).SampEn.TrialName = nom_acq;
        EMG.Trial(i_fich).SampEn.TrialNum = str2double(nom_acq(end-1:end));
        EMG.Trial(i_fich).SampEn.Description = 'Traitement par SampEn (Zhang et al 2012) sur le signal brut EMG';
        
    end
    disp('Fin')
end

draw_emg
set(findobj('Tag','uipanel_bouffees'), 'Visible','On');
set(findobj('Tag','bouffees'), 'Enable','On');

%% détection des bouffées
% --- Executes on button press in bouffees.
function bouffees();
% hObject    handle to bouffees (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)
global EMG list_EMG dossier

if get(findobj('Tag','acq_zero_emg'), 'Value')
    acq_zero = btkReadAcquisition(fullfile(dossier,'zero_EMG.c3d'));
end

files = arrayfun(@(i) EMG.Trial(i).RAW.TrialName, 1:length(EMG.Trial),'uni',0);
for i_fich = 1 : length(files)
    
    nom_acq = files{i_fich};
    Fech = EMG.Trial(i_fich).RAW.Fech;
    disp(['Détection des bouffées pour : ' nom_acq ]);
    EMG.Trial(i_fich).Bouffee = Signal_EMG(EMG.Trial(i_fich).RAW.Data,EMG.Trial(i_fich).RAW.Fech,...
        'tag',list_EMG,...
        'units',repmat({'V'},1,length(list_EMG)),...
        'trialname',nom_acq,...
        'trialnum',str2double(nom_acq(end-1:end)),...
        'description','Bouffees d activite des EMGs');
    EMG.Trial(i_fich).Activite = Signal_EMG(EMG.Trial(i_fich).RAW.Data,EMG.Trial(i_fich).RAW.Fech,...
        'tag',list_EMG,...
        'units',repmat({'V'},1,length(list_EMG)),...
        'trialname',nom_acq,...
        'trialnum',str2double(nom_acq(end-1:end)),...
        'description','Activite des EMGs');

    
    for j_emg = 1 : length(list_EMG)
        if get(findobj('Tag','TKEO'), 'Value')
            
            clear temp duree_bruit seuil_TKEO temp periode ind
            if get(findobj('Tag','debut_bruit'), 'Value');
                duree_bruit = str2double(get(findobj('Tag','duree_bruit_ini'),'String'))*Fech;
                seuil_TKEO = str2double(get(findobj('Tag','seuil_TKEO'),'String')) * std(EMG.Trial(i_fich).TKEO(1:duree_bruit,j_emg));
            elseif get(findobj('Tag','fenetre_bruit'), 'Value')
                [a,b]=matchcells({nom_acq},get(findobj('Tag','listbox1'),'String'));
                set(findobj('Tag','listbox1'),'Value',find(b==1));
                [a,b]=matchcells(list_EMG(j_emg),get(findobj('Tag','listbox2'),'String'));
                set(findobj('Tag','listbox2'),'Value',find(b==1));
                draw_emg;
                P = ginput(2);
                P = floor(P*Fech);
                seuil_TKEO = str2double(get(findobj('Tag','seuil_TKEO'),'String')) * std(EMG.Trial(i_fich).TKEO((P(1,1):P(2,1)),j_emg));
            elseif get(findobj('Tag','acq_zero_emg'), 'Value')
                EMG_zero = [];
                EMG_zero = btkGetAnalog(acq_zero,list_EMG{j_emg});
                
                clear a b r c temp temp2
                x = EMG_zero;
                [b,a] = butter(6,(20/(Fech/2)),'high');
                x(isnan(x))=0;
                temp =  filtfilt (b,a,x);
                temp2 = temp(2:end-1).*temp(2:end-1) - temp(1:end-2).*temp(3:end);
                [b,a] = butter(6,(50/(Fech/2)),'low');
                x = temp2;
                x(isnan(x))=0;
                seuil_TKEO = str2double(get(findobj('Tag','seuil_TKEO'),'String')) * std(filtfilt (b,a,x));
            end
            EMG.Trial(i_fich).Bouffee.Data(j_emg,EMG.Trial(i_fich).TKEO.Data(j_emg,:)<=seuil_TKEO)=NaN;
            
            periode = str2double(get(findobj('Tag','duree_bouffees'),'String'))/1000*Fech;
            
            ind_inf = isnan(EMG.Trial(i_fich).Bouffee.Data(j_emg,:));
            k = 1;
            while ~isempty(k)
                deb = find(ind_inf(k:end)==1,1,'first');
                fin = find(ind_inf(k+deb-1:end)==0,1,'first');
                if fin < 2000/1000*periode
                    EMG.Trial(i_fich).Bouffee.Data(j_emg,k+deb-1:k+deb+fin-2)=EMG.Trial(i_fich).RAW.Data(j_emg,k+deb-1:k+deb+fin-2);
                end
                if isempty(deb) || isempty(fin)
                    k=[];
                else
                    k=k+deb+fin-1;
                end
                clear deb fin
            end
            
            ind_sup = ~isnan(EMG.Trial(i_fich).Bouffee.Data(j_emg,:));
            k = 1;
            while ~isempty(k)
                deb = find(ind_sup(k:end)==1,1,'first');
                fin = find(ind_sup(k+deb-1:end)==0,1,'first');
                if fin < 2000/1000*periode
                    EMG.Trial(i_fich).Bouffee.Data(j_emg,k+deb-1:k+deb+fin-2)=NaN;
                end
                if isempty(deb) || isempty(fin)
                    k=[];
                else
                    k=k+deb+fin-1;
                end
                clear deb fin
            end
            
            EMG.Trial(i_fich).Activite.Data(j_emg,:) = ~isnan(EMG.Trial(i_fich).Bouffee.Data(j_emg,:));
            
            %         elseif get(findobj('Tag','SampEn'), 'Value')
            %             clear temp duree_bruit seuil_SampEn temp periode ind
            %             duree_bruit = str2double(get(findobj('Tag','duree_bruit_ini'),'String'));
            %             seuil_SampEn = str2double(get(findobj('Tag','seuil_SampEn'),'String'));
            %             temp = EMG.Trial(i_fich).SampEn(:,j_emg);
            %             EMG.Trial(i_fich).Bouffee(:,j_emg) = EMG.Trial(i_fich).RAW(:,j_emg);
            %             EMG.Trial(i_fich).Bouffee(:,j_emg)(temp<=seuil_TKEO)=NaN;
            %
            %             periode = str2double(get(findobj('Tag','duree_bouffees'),'String'))/1000*Fech;
            %             ind = (temp>seuil_TKEO);
            %             k = 1;
            %             while ~isempty(k)
            %                 deb = find(ind(k:end)==1,1,'first');
            %                 fin = find(ind(k+deb-1:end)==0,1,'first');
            %                 if fin < 2000*0.001*periode
            %                    EMG.Trial(i_fich).Bouffee(:,j_emg)(k+deb-1:k+deb+fin-2)=NaN;
            %                 end
            %                 k=k+deb+fin-1;
            %                 clear deb fin
            %             end
        end
    end
    

    
    
    
end

draw_emg

%% tri des bouffees
% --- Executes on button press in pushbutton8.
function tri_bouffees
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)
global EMG haxes1 haxes2
try
    val1 = get(findobj('Tag','listbox1'),'Value');
catch
    val1 = 1;
    set(findobj('Tag','listbox1'),'Value',val1);
end
list1 = get(findobj('Tag','listbox1'),'String');
nom_acq = list1(val1);

try
    val2 = get(findobj('Tag','listbox2'),'Value');
catch
    val2 = 1;
    set(findobj('Tag','listbox2'),'Value',val1);
end
list2 = get(findobj('Tag','listbox2'),'String');
nom_emg = list2(val2);
champs = fieldnames(EMG);
% t=0;
P=ones(2,2);
while ~isempty(P)
    P = ginput(2);
    lim = get(haxes1,'XLim');
    if size(P,1)==2
        if P(1,1)>P(2,1)
            P = flipud(P);
        end
        if P(1,1) < lim(2) && P(2,1) < lim(2) && P(1,1) > lim(1) && P(2,1) > lim(1) % on vérifie qu'on clique dans un des axes
            if get(findobj('Tag','tri_bouffees_off'),'Value')
                EMG.Trial(val1).Bouffee.Data(val2,floor(P(1,1)*EMG.Trial(val1).Bouffee.Fech):floor(P(2,1)*EMG.Trial(val1).Bouffee.Fech))=NaN;
                EMG.Trial(val1).Activite.Data(val2,:) = ~isnan(EMG.Trial(val1).Bouffee.Data(val2,:));
                draw_emg;
            elseif get(findobj('Tag','tri_bouffees_on'),'Value')
                EMG.Trial(val1).Bouffee.Data(val2,floor(P(1,1)*EMG.Trial(val1).Bouffee.Fech):floor(P(2,1)*EMG.Trial(val1).Bouffee.Fech))=EMG.Trial(val1).RAW.Data(val2,floor(P(1,1)*EMG.Trial(val1).Bouffee.Fech):floor(P(2,1)*EMG.Trial(val1).Bouffee.Fech));
                EMG.Trial(val1).Activite.Data(val2,:) = ~isnan(EMG.Trial(val1).Bouffee.Data(val2,:));
                draw_emg;
            end
        else
            try
                val1 = get(findobj('Tag','listbox1'),'Value');
            catch
                val1 = 1;
                set(findobj('Tag','listbox1'),'Value',val1);
            end
            list1 = get(findobj('Tag','listbox1'),'String');
            nom_acq = list1(val1);
            
            try
                val2 = get(findobj('Tag','listbox2'),'Value');
            catch
                val2 = 1;
                set(findobj('Tag','listbox2'),'Value',val1);
            end
            list2 = get(findobj('Tag','listbox2'),'String');
            nom_emg = list2(val2);
        end
    elseif size(P,1)==1
        P=[];
    end
end

% --- Executes on button press in tri_bouffees_on.
function tri_bouffees_on_Callback(hObject, eventdata, handles)
% hObject    handle to tri_bouffees_on (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tri_bouffees_on
set(findobj('Tag','tri_bouffees_on'),'Value',1)
set(findobj('Tag','tri_bouffees_off'),'Value',0)


% --- Executes on button press in tri_bouffees_off.
function tri_bouffees_off_Callback(hObject, eventdata, handles)
% hObject    handle to tri_bouffees_off (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tri_bouffees_off
set(findobj('Tag','tri_bouffees_on'),'Value',0)
set(findobj('Tag','tri_bouffees_off'),'Value',1)


% --- Executes when selected object is changed in uipanel_bouffees.
function uipanel_bouffees_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel_bouffees
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user Data (see GUIDATA)
if get(findobj('Tag','fenetre_bruit'), 'Value')
    set(findobj('Tag','debut_bruit'), 'Value',0);
    set(findobj('Tag','acq_zero_emg'), 'Value',0);
elseif get(findobj('Tag','debut_bruit'), 'Value');
    set(findobj('Tag','fenetre_bruit'), 'Value',0)
    set(findobj('Tag','acq_zero_emg'), 'Value',0);
elseif get(findobj('Tag','acq_zero_emg'), 'Value');
    set(findobj('Tag','fenetre_bruit'), 'Value',0)
    set(findobj('Tag','debut_bruit'), 'Value',0);
end



%% fonctions annexes


%% Calcul de SampEn
function saen = SampEn( dim, r, Data, tau )
% SAMPEN Sample Entropy
%   calculates the sample entropy of a given Time series Data

%   SampEn is conceptually similar to approximate entropy (ApEn), but has
%   following differences:
%       1) SampEn does not count self-matching. The possible trouble of
%       having log(0) is avoided by taking logarithm at the latest step.
%       2) SampEn does not depend on the Datasize as much as ApEn does. The
%       comparison is shown in the graph that is uploaded.

%   dim     : embedded dimension
%   r       : tolerance (typically 0.2 * std)
%   Data    : Time-series Data
%   tau     : delay Time for downsampling (user can omit this, in which case
%             the default value is 1)
%
%---------------------------------------------------------------------
% coded by Kijoon Lee,  kjlee@ntu.edu.sg
% Mar 21, 2012
%---------------------------------------------------------------------

if nargin < 4, tau = 1; end
if tau > 1, Data = downsample(Data, tau); end

N = length(Data);
correl = zeros(1,2);
DataMat = zeros(dim+1,N-dim);
for i = 1:dim+1
    DataMat(i,:) = Data(i:N-dim+i-1);
end

for m = dim:dim+1
    count = zeros(1,N-dim);
    tempMat = DataMat(1:m,:);
    
    for i = 1:N-m
        % calculate Chebyshev distance, excluding self-matching case
        dist = max(abs(tempMat(:,i+1:N-dim) - repmat(tempMat(:,i),1,N-dim-i)));
        
        % calculate Heaviside function of the distance
        % User can change it to any other function
        % for modified sample entropy (mSampEn) calculation
        D = (dist < r);
        
        count(i) = sum(D)/(N-dim);
    end
    
    correl(m-dim+1) = sum(count)/(N-dim);
end

saen = log(correl(1)/correl(2));


%% fonctions non utilisées


function seuil_TKEO_Callback(hObject, eventdata, handles)
% hObject    handle to seuil_TKEO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of seuil_TKEO as text
%        str2double(get(hObject,'String')) returns contents of seuil_TKEO as a double


% --- Executes during object creation, after setting all properties.
function seuil_TKEO_CreateFcn(hObject, eventdata, handles)
% hObject    handle to seuil_TKEO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function duree_window_Callback(hObject, eventdata, handles)
% hObject    handle to duree_window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of duree_window as text
%        str2double(get(hObject,'String')) returns contents of duree_window as a double


% --- Executes during object creation, after setting all properties.
function duree_window_CreateFcn(hObject, eventdata, handles)
% hObject    handle to duree_window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function incr_window_Callback(hObject, eventdata, handles)
% hObject    handle to incr_window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of incr_window as text
%        str2double(get(hObject,'String')) returns contents of incr_window as a double


% --- Executes during object creation, after setting all properties.
function incr_window_CreateFcn(hObject, eventdata, handles)
% hObject    handle to incr_window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function duree_bouffees_Callback(hObject, eventdata, handles)
% hObject    handle to duree_bouffees (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of duree_bouffees as text
%        str2double(get(hObject,'String')) returns contents of duree_bouffees as a double


% --- Executes during object creation, after setting all properties.
function duree_bouffees_CreateFcn(hObject, eventdata, handles)
% hObject    handle to duree_bouffees (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function duree_bruit_ini_Callback(hObject, eventdata, handles)
% hObject    handle to duree_bruit_ini (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of duree_bruit_ini as text
%        str2double(get(hObject,'String')) returns contents of duree_bruit_ini as a double


% --- Executes during object creation, after setting all properties.
function duree_bruit_ini_CreateFcn(hObject, eventdata, handles)
% hObject    handle to duree_bruit_ini (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in acq_zero_emg.
function acq_zero_emg_Callback(hObject, eventdata, handles)
% hObject    handle to acq_zero_emg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of acq_zero_emg
