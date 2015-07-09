function varargout = Traitement_EMG_v0(varargin)
% TRAITEMENT_EMG_V0 MATLAB code for Traitement_EMG_v0.fig
%      TRAITEMENT_EMG_V0, by itself, creates a new TRAITEMENT_EMG_V0 or raises the existing
%      singleton*.
%
%      H = TRAITEMENT_EMG_V0 returns the handle to a new TRAITEMENT_EMG_V0 or the handle to
%      the existing singleton*.
%
%      TRAITEMENT_EMG_V0('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRAITEMENT_EMG_V0.M with the given input arguments.
%
%      TRAITEMENT_EMG_V0('Property','Value',...) creates a new TRAITEMENT_EMG_V0 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Traitement_EMG_v0_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Traitement_EMG_v0_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Traitement_EMG_v0

% Last Modified by GUIDE v2.5 21-Jul-2014 16:16:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Traitement_EMG_v0_OpeningFcn, ...
    'gui_OutputFcn',  @Traitement_EMG_v0_OutputFcn, ...
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


% --- Executes just before Traitement_EMG_v0 is made visible.
function Traitement_EMG_v0_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Traitement_EMG_v0 (see VARARGIN)
global haxes1 haxes2

% Choose default command line output for Traitement_EMG_v0
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

set(findobj('tag','listbox1'), 'Visible','Off');
set(findobj('tag','text1'), 'Visible','Off');

set(findobj('tag','listbox2'), 'Visible','Off');
set(findobj('tag','text2'), 'Visible','Off');

set(findobj('tag','save'), 'Enable','Off');
set(findobj('tag','calculer'), 'Enable','Off');
set(findobj('tag','bouffees'), 'Enable','Off');

set(findobj('tag','TKEO'), 'Value',1);
set(findobj('tag','SampEn'), 'Value',0);
set(findobj('tag','uipanel_TKEO'), 'Visible','On');
set(findobj('tag','uipanel_SampEn'), 'Visible','Off');
set(findobj('tag','uipanel_bouffees'), 'Visible','On');



% UIWAIT makes Traitement_EMG_v0 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Traitement_EMG_v0_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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
% handles    structure with handles and user data (see GUIDATA)

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
% handles    structure with handles and user data (see GUIDATA)
global EMG list_EMG
EMG = [];
list_EMG = [];

%% Chargement des données EMG
% --- Executes on button press in pushbutton1.
function charger_c3d(varargin);
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EMG list_EMG dossier

if isempty(varargin)
    %Choix manuel des fichiers
    [files dossier] = uigetfile('*.c3d; *.xls','Choix du/des fichier(s) c3d ','Multiselect','on');
else
    files = varargin{1};
    dossier = varargin{2};
end
%Initialisation

set(findobj('tag','nom_sujet'),'String',['Sujet : ' dossier(find(dossier=='\',1,'last')+1:end)])

EMG = {};

if ischar(files)
    files = {files};
end

%Extraction des données d'intérêts
i_fich = 1;
nom_acq = strrep(files{i_fich}(1:end-4),' ','_');
EMG.(nom_acq) = [];
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
    nom_acq = strrep(files{i_fich}(1:end-4),' ','_');
    EMG.(nom_acq) = [];
    clear acq analogs
    acq = btkReadAcquisition(fullfile(dossier,files{i_fich}));
    analogs = btkGetAnalogs(acq);
    Fech = btkGetAnalogFrequency(acq);
    eval(['EMG.' nom_acq '.Fech = Fech;']);
    for j_EMG = 1 : length(list_EMG)
        eval(['EMG.' nom_acq '.RAW.' list_EMG{j_EMG} ' = analogs.' list_EMG{j_EMG} '- mean(analogs.' list_EMG{j_EMG} ');']);
    end
    clear acq analogs
    eval(['EMG.' nom_acq '.RAW.temps = (1:length(EMG.' nom_acq '.RAW.' list_EMG{1} ')'')/Fech;']);
    
end

% Mise à jour de la liste des acquisitions
set(findobj('tag','text1'), 'Visible','On');
set(findobj('tag','listbox1'), 'Visible','On');
set(findobj('tag','listbox1'), 'Value',1);
set(findobj('tag','listbox1'),'String',fieldnames(EMG));

set(findobj('tag','text2'), 'Visible','On');
set(findobj('tag','listbox2'), 'Visible','On');
set(findobj('tag','listbox2'), 'Value',1);
set(findobj('tag','listbox2'),'String',list_EMG);

%Activation des axes
axess = findobj('Type','axes');
for i=1:length(axess)
    set(axess(i),'Visible','On');
end

draw_emg
set(findobj('tag','save'), 'Enable','On');
set(findobj('tag','calculer'), 'Enable','On');

% --- Executes on button press in pushbutton7.
function charger_mat(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EMG list_EMG dossier file

[file dossier] = uigetfile('*.mat','Choix du fichier mat');
load(fullfile(dossier,file));

set(findobj('tag','nom_sujet'),'String',['Sujet : ' dossier(find(dossier(1:end-1)=='\',1,'last')+1:end-1) '\' file(1:end-4)])

% Mise à jour de la liste des acquisitions
set(findobj('tag','text1'), 'Visible','On');
set(findobj('tag','listbox1'), 'Visible','On');
set(findobj('tag','listbox1'), 'Value',1);
set(findobj('tag','listbox1'),'String',fieldnames(EMG));

champ = fieldnames(EMG);
list_EMG = setdiff(fieldnames(EMG.(champ{1}).RAW),{'temps'});
set(findobj('tag','text2'), 'Visible','On');
set(findobj('tag','listbox2'), 'Visible','On');
set(findobj('tag','listbox2'), 'Value',1);
set(findobj('tag','listbox2'),'String',list_EMG);

%Activation des axes
axess = findobj('Type','axes');
for i=1:length(axess)
    set(axess(i),'Visible','On');
end

draw_emg
set(findobj('tag','save'), 'Enable','On');
if isfield(EMG.(champ{1}),'RAW')
    set(findobj('tag','calculer'), 'Enable','On');
end
if isfield(EMG.(champ{1}),'SampEn')
    set(findobj('tag','bouffees'), 'Enable','On');
    SampEn_Callback;
end
if isfield(EMG.(champ{1}),'TKEO')
    set(findobj('tag','bouffees'), 'Enable','On');
    TKEO_Callback;
end


% On trace les EMG
function draw_emg
global EMG haxes1 haxes2

try
    val1 = get(findobj('tag','listbox1'),'Value');
catch
    val1 = 1;
    set(findobj('tag','listbox1'),'Value',val1);
end
list1 = get(findobj('tag','listbox1'),'String');
nom_acq = list1(val1);

try
    val2 = get(findobj('tag','listbox2'),'Value');
catch
    val2 = 1;
    set(findobj('tag','listbox2'),'Value',val1);
end
list2 = get(findobj('tag','listbox2'),'String');
nom_emg = list2(val2);

set(haxes1,'Nextplot','replace')
plot(haxes1,EMG.(nom_acq{1}).RAW.temps,EMG.(nom_acq{1}).RAW.(nom_emg{1}))
if isfield(EMG.(nom_acq{1}),'Bouffee') && isfield(EMG.(nom_acq{1}).Bouffee,nom_emg{1})
    set(haxes1,'Nextplot','add')
    plot(haxes1,EMG.(nom_acq{1}).RAW.temps,EMG.(nom_acq{1}).Bouffee.(nom_emg{1}),'Color',[1 0 0]);
end

if isfield(EMG.(nom_acq{1}),'TKEO') && get(findobj('tag','TKEO'), 'Value')
    set(haxes2,'Nextplot','replace')
    plot(haxes2,EMG.(nom_acq{1}).TKEO.temps,EMG.(nom_acq{1}).TKEO.(nom_emg{1}))
    if isfield(EMG.(nom_acq{1}),'Bouffee') && isfield(EMG.(nom_acq{1}).Bouffee,nom_emg{1})
        set(haxes2,'Nextplot','add')
        clear temp
        temp = EMG.(nom_acq{1}).TKEO.(nom_emg{1});
        temp(isnan(EMG.(nom_acq{1}).Bouffee.(nom_emg{1}))) = NaN;
        plot(haxes2,EMG.(nom_acq{1}).TKEO.temps,temp,'Color',[1 0 0]);
        clear temp
    end
end
if isfield(EMG.(nom_acq{1}),'SampEn') && get(findobj('tag','SampEn'), 'Value');
    set(haxes2,'Nextplot','replace')
    plot(haxes2,EMG.(nom_acq{1}).SampEn.temps,EMG.(nom_acq{1}).SampEn.(nom_emg{1}))
    if isfield(EMG.(nom_acq{1}),'Bouffee') && isfield(EMG.(nom_acq{1}).Bouffee,nom_emg{1})
        set(haxes2,'Nextplot','add')
        clear temp
        temp = EMG.(nom_acq{1}).SampEn.(nom_emg{1});
        temp(isnan(EMG.(nom_acq{1}).Bouffee.(nom_emg{1}))) = NaN;
        plot(haxes2,EMG.(nom_acq{1}).SampEn.temps,temp,'Color',[1 0 0]);
        clear temp
    end
end


% --- Executes on button press in save.
function sauvegarder(varargin)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EMG file dossier
if isempty(varargin) 
    [file_save, dossier_save] = uiputfile(fullfile(dossier,file));
else
    file_save = varargin{1};
    dossier_save = varargin{2};
end
if ischar(file_save)
    save(fullfile(dossier_save,file_save),'EMG');
    set(findobj('tag','nom_sujet'),'String',['Sujet : ' dossier_save(find(dossier_save(1:end-1)=='\',1,'last')+1:end-1) '\' file_save(1:end-4)])
    file = file_save;
    dossier = dossier_save;
end

% --- Executes on button press in pushbutton6.
function Batch()
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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
    
    charger_c3d(files,fullfile(chemin,liste_choix{i_choix}));
    calculer_Callback;
    bouffees;
    sauvegarder(liste_choix{i_choix},fullfile(chemin,liste_choix{i_choix}));
%     export_figure;
    
    cd('..')
    
    
    cd(chemin)
end

% export des figures
function export_figure()

global EMG

list1 = get(findobj('tag','listbox1'),'String');
list2 = get(findobj('tag','listbox2'),'String');

for i_list1 = 1 : length(list1)
    nom_acq = list1{i_list1};
    for j_list2 = 1 : length(list2)
        nom_emg = list2{j_list2};
        nom_fig = [nom_acq '_' nom_emg];
        f1 = figure('Color',[1 1 1],'units','Normalized','Position', [0.1 0.1 0.8 0.8]);
        f1_axes1 = subplot(2,1,1);
        f1_axes2 = subplot(2,1,2);
        set(f1_axes1,'Nextplot','replace')
        plot(f1_axes1,EMG.(nom_acq).RAW.temps,EMG.(nom_acq).RAW.(nom_emg))
        if isfield(EMG.(nom_acq),'Bouffee') && isfield(EMG.(nom_acq).Bouffee,nom_emg)
            set(f1_axes1,'Nextplot','add')
            plot(f1_axes1,EMG.(nom_acq).RAW.temps,EMG.(nom_acq).Bouffee.(nom_emg),'Color',[1 0 0]);
        end
        
        if isfield(EMG.(nom_acq),'TKEO') && get(findobj('tag','TKEO'), 'Value')
            set(f1_axes2,'Nextplot','replace')
            plot(f1_axes2,EMG.(nom_acq).TKEO.temps,EMG.(nom_acq).TKEO.(nom_emg))
            if isfield(EMG.(nom_acq),'Bouffee') && isfield(EMG.(nom_acq).Bouffee,nom_emg)
                set(f1_axes2,'Nextplot','add')
                clear temp
                temp = EMG.(nom_acq).TKEO.(nom_emg);
                temp(isnan(EMG.(nom_acq).Bouffee.(nom_emg))) = NaN;
                plot(f1_axes2,EMG.(nom_acq).TKEO.temps,temp,'Color',[1 0 0]);
                clear temp
            end
        end
        if isfield(EMG.(nom_acq),'SampEn') && get(findobj('tag','SampEn'), 'Value');
            set(f1_axes2,'Nextplot','replace')
            plot(f1_axes2,EMG.(nom_acq).SampEn.temps,EMG.(nom_acq).SampEn.(nom_emg))
            if isfield(EMG.(nom_acq),'Bouffee') && isfield(EMG.(nom_acq).Bouffee,nom_emg)
                set(f1_axes2,'Nextplot','add')
                clear temp
                temp = EMG.(nom_acq).SampEn.(nom_emg);
                temp(isnan(EMG.(nom_acq).Bouffee.(nom_emg))) = NaN;
                plot(f1_axes2,EMG.(nom_acq).SampEn.temps,temp,'Color',[1 0 0]);
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
% handles    structure with handles and user data (see GUIDATA)
global EMG

% Hint: get(hObject,'Value') returns toggle state of TKEO
set(findobj('tag','TKEO'), 'Value',1);
set(findobj('tag','SampEn'), 'Value',0);
set(findobj('tag','uipanel_TKEO'), 'Visible','On');
set(findobj('tag','uipanel_SampEn'), 'Visible','Off');

try
    val1 = get(findobj('tag','listbox1'),'Value');
catch
    val1 = 1;
    set(findobj('tag','listbox1'),'Value',val1);
end
list1 = get(findobj('tag','listbox1'),'String');
nom_acq = list1(val1);

if strncmp(get(findobj('tag','listbox1'), 'Visible'),'on',2) && isfield(EMG.(nom_acq{1}),'TKEO') ;
    draw_emg
end

% --- Executes on button press in SampEn.
function SampEn_Callback
% hObject    handle to SampEn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EMG

% Hint: get(hObject,'Value') returns toggle state of SampEn
set(findobj('tag','TKEO'), 'Value',0);
set(findobj('tag','SampEn'), 'Value',1);
set(findobj('tag','uipanel_TKEO'), 'Visible','Off');
set(findobj('tag','uipanel_SampEn'), 'Visible','On');

try
    val1 = get(findobj('tag','listbox1'),'Value');
catch
    val1 = 1;
    set(findobj('tag','listbox1'),'Value',val1);
end
list1 = get(findobj('tag','listbox1'),'String');
nom_acq = list1(val1);

if strncmp(get(findobj('tag','listbox1'), 'Visible'),'on',2) && isfield(EMG.(nom_acq{1}),'SampEn')
    draw_emg
end

%% calculer le critère choisi
% --- Executes on button press in calculer.
function  calculer_Callback();
% hObject    handle to calculer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EMG list_EMG

files = fieldnames(EMG);
list_EMG = get(findobj('tag','listbox2'),'String');
ind_TKEO = get(findobj('tag','TKEO'),'Value');
ind_SampEn = get(findobj('tag','SampEn'),'Value');

for i_fich = 1 : length(files)
    nom_acq = files{i_fich};
    Fech = EMG.(nom_acq).Fech;
    disp(['Traitement de : ' nom_acq ]);
    for j_EMG = 1 : length(list_EMG)
        disp(['EMG : ' list_EMG{j_EMG} ]);
        %         % on filtre les données brutes
        %         clear x a b r c temp
        %         x = EMG.(nom_acq).RAW.(list_EMG{j_EMG});
        %         [b,a] = butter(2,([20 250]./(Fech/2)),'high');
        %         [r,c]=size(x);
        %         if r>c
        %             x = x  - repmat(nanmean(x,1),r,1);
        %         else
        %             x = x  - repmat(nanmean(x,2),1,c);
        %             x = x';
        %         end
        %         x(isnan(x))=0;
        %         temp =  filtfilt (b,a,x);
        %         [b,a] = butter(6,(50/(Fech/2)),'low');
        %         x = temp;
        %         x(isnan(x))=0;
        %         temp2 =  filtfilt (b,a,x);
        %         eval(['EMG.' nom_acq '.FILTRE.' list_EMG{j_EMG} ' = temp2;']);
        %         clear x a b r c temp
        
        if ind_TKEO == 1
            % algortitmhe TKEO (Solnik2008)
            disp('Calcul TKEO');
            clear a b r c temp temp2
            x = EMG.(nom_acq).RAW.(list_EMG{j_EMG});
            [b,a] = butter(6,(20/(Fech/2)),'high');
            x(isnan(x))=0;
            temp =  filtfilt (b,a,x);
            temp2 = temp(2:end-1).*temp(2:end-1) - temp(1:end-2).*temp(3:end);
            [b,a] = butter(6,(50/(Fech/2)),'low');
            x = temp2;
            x(isnan(x))=0;
            temp2 =  filtfilt (b,a,x);
            eval(['EMG.' nom_acq '.TKEO.' list_EMG{j_EMG} ' = temp2;']);
        end
        
        if ind_SampEn == 1
            disp('Calcul SampEn');
            % Nonlinear sample Entropy (Zhang2012)
            x = EMG.(nom_acq).RAW.(list_EMG{j_EMG});
            r=0.25*std(x(:));
            t=1;
            duree = str2double(get(findobj('tag','duree_window'),'String'))/1000*Fech;
            increment = str2double(get(findobj('tag','incr_window'),'String'))/1000*Fech;
            while (t-1)*increment+duree<length(x)
                window(t,:) = x((t-1)*increment+1:(t-1)*increment+duree);
                t=t+1;
            end
            for i_windo = 1 : size(window,1)
                SamEn(i_windo) = SampEn(2,r,window(i_windo,:));
            end
            eval(['EMG.' nom_acq '.SampEn.' list_EMG{j_EMG} ' = SamEn;']);
        end
    end
    %     eval(['EMG.' nom_acq '.FILTRE.temps = (1:length(EMG.' nom_acq '.RAW.' list_EMG{1} ')'')/Fech;']);
    if ind_TKEO == 1
        eval(['EMG.' nom_acq '.TKEO.temps = (2:(length(EMG.' nom_acq '.RAW.' list_EMG{1} ')-1)'')/Fech;']);
    end
    if ind_SampEn == 1
        eval(['EMG.' nom_acq '.SampEn.temps = (1:length(EMG.' nom_acq '.RAW.' list_EMG{1} ')/length(EMG.' nom_acq '.SampEn.' list_EMG{1} '):length(EMG.' nom_acq '.RAW.' list_EMG{1} '))/Fech;']);
    end
    disp('Fin')
end

draw_emg
set(findobj('tag','uipanel_bouffees'), 'Visible','On');
set(findobj('tag','bouffees'), 'Enable','On');

%% détection des bouffées
% --- Executes on button press in bouffees.
function bouffees();
% hObject    handle to bouffees (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EMG list_EMG dossier

if get(findobj('tag','acq_zero_emg'), 'Value')
    acq_zero = btkReadAcquisition(fullfile(dossier,'zero_EMG.c3d'));
end

files = fieldnames(EMG);
for i_fich = 1 : length(files)
    nom_acq = files{i_fich};
    
    
    
    Fech = EMG.(nom_acq).Fech;
    disp(['Détection des bouffées pour : ' nom_acq ]);
    for j_emg = 1 : length(list_EMG)
        if get(findobj('tag','TKEO'), 'Value')
            
            clear temp duree_bruit seuil_TKEO temp periode ind
            if get(findobj('tag','debut_bruit'), 'Value');
                duree_bruit = str2double(get(findobj('tag','duree_bruit_ini'),'String'))*Fech;
                seuil_TKEO = str2double(get(findobj('tag','seuil_TKEO'),'String')) * std(EMG.(nom_acq).TKEO.(list_EMG{j_emg})(1:duree_bruit));
            elseif get(findobj('tag','fenetre_bruit'), 'Value')
                [a,b]=matchcells({nom_acq},get(findobj('tag','listbox1'),'String'));
                set(findobj('tag','listbox1'),'Value',find(b==1));
                [a,b]=matchcells(list_EMG(j_emg),get(findobj('tag','listbox2'),'String'));
                set(findobj('tag','listbox2'),'Value',find(b==1));
                draw_emg;
                P = ginput(2);
                P = floor(P*Fech);
                seuil_TKEO = str2double(get(findobj('tag','seuil_TKEO'),'String')) * std(EMG.(nom_acq).TKEO.(list_EMG{j_emg})(P(1,1):P(2,1)));
            elseif get(findobj('tag','acq_zero_emg'), 'Value')
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
                seuil_TKEO = str2double(get(findobj('tag','seuil_TKEO'),'String')) * std(filtfilt (b,a,x));
            end
            temp = EMG.(nom_acq).TKEO.(list_EMG{j_emg});
            EMG.(nom_acq).Bouffee.(list_EMG{j_emg}) = EMG.(nom_acq).RAW.(list_EMG{j_emg});
            EMG.(nom_acq).Bouffee.(list_EMG{j_emg})(temp<=seuil_TKEO)=NaN;
            
            periode = str2double(get(findobj('tag','duree_bouffees'),'String'))/1000*Fech;
            
            ind_inf = isnan(EMG.(nom_acq).Bouffee.(list_EMG{j_emg}));
            k = 1;
            while ~isempty(k)
                deb = find(ind_inf(k:end)==1,1,'first');
                fin = find(ind_inf(k+deb-1:end)==0,1,'first');
                if fin < 2000/1000*periode
                    EMG.(nom_acq).Bouffee.(list_EMG{j_emg})(k+deb-1:k+deb+fin-2)=EMG.(nom_acq).RAW.(list_EMG{j_emg})(k+deb-1:k+deb+fin-2);
                end
                if isempty(deb) || isempty(fin)
                    k=[];
                else
                    k=k+deb+fin-1;
                end
                clear deb fin
            end
            
            ind_sup = ~isnan(EMG.(nom_acq).Bouffee.(list_EMG{j_emg}));
            k = 1;
            while ~isempty(k)
                deb = find(ind_sup(k:end)==1,1,'first');
                fin = find(ind_sup(k+deb-1:end)==0,1,'first');
                if fin < 2000/1000*periode
                    EMG.(nom_acq).Bouffee.(list_EMG{j_emg})(k+deb-1:k+deb+fin-2)=NaN;
                end
                if isempty(deb) || isempty(fin)
                    k=[];
                else
                    k=k+deb+fin-1;
                end
                clear deb fin
            end
            
            EMG.(nom_acq).Activite.(list_EMG{j_emg}) = ~isnan(EMG.(nom_acq).Bouffee.(list_EMG{j_emg}));
            
            %         elseif get(findobj('tag','SampEn'), 'Value')
            %             clear temp duree_bruit seuil_SampEn temp periode ind
            %             duree_bruit = str2double(get(findobj('tag','duree_bruit_ini'),'String'));
            %             seuil_SampEn = str2double(get(findobj('tag','seuil_SampEn'),'String'));
            %             temp = EMG.(nom_acq).SampEn.(list_EMG{j_emg});
            %             EMG.(nom_acq).Bouffee.(list_EMG{j_emg}) = EMG.(nom_acq).RAW.(list_EMG{j_emg});
            %             EMG.(nom_acq).Bouffee.(list_EMG{j_emg})(temp<=seuil_TKEO)=NaN;
            %
            %             periode = str2double(get(findobj('tag','duree_bouffees'),'String'))/1000*Fech;
            %             ind = (temp>seuil_TKEO);
            %             k = 1;
            %             while ~isempty(k)
            %                 deb = find(ind(k:end)==1,1,'first');
            %                 fin = find(ind(k+deb-1:end)==0,1,'first');
            %                 if fin < 2000*0.001*periode
            %                    EMG.(nom_acq).Bouffee.(list_EMG{j_emg})(k+deb-1:k+deb+fin-2)=NaN;
            %                 end
            %                 k=k+deb+fin-1;
            %                 clear deb fin
            %             end
        end
    end
end
draw_emg

% --- Executes on button press in pushbutton8.
function tri_bouffees
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EMG haxes1 haxes2
try
    val1 = get(findobj('tag','listbox1'),'Value');
catch
    val1 = 1;
    set(findobj('tag','listbox1'),'Value',val1);
end
list1 = get(findobj('tag','listbox1'),'String');
nom_acq = list1(val1);

try
    val2 = get(findobj('tag','listbox2'),'Value');
catch
    val2 = 1;
    set(findobj('tag','listbox2'),'Value',val1);
end
list2 = get(findobj('tag','listbox2'),'String');
nom_emg = list2(val2);
champs = fieldnames(EMG);
% t=0;
P=ones(2,2);
while ~isempty(P)
    P = ginput(2);
    lim = get(haxes1,'XLim');
    if size(P,1)==2
        if P(1,1) < lim(2) && P(2,1) < lim(2) && P(1,1) > lim(1) && P(2,1) > lim(1) % on vérifie qu'on clique dans un des axes
            if get(findobj('tag','tri_bouffees_off'),'Value')
                EMG.(nom_acq{1}).Bouffee.(nom_emg{1})(floor(P(1,1)*EMG.(champs{1}).Fech):floor(P(2,1)*EMG.(champs{1}).Fech))=NaN;
                EMG.(nom_acq{1}).Activite.(nom_emg{1}) = ~isnan(EMG.(nom_acq{1}).Bouffee.(nom_emg{1}));
                draw_emg;
            elseif get(findobj('tag','tri_bouffees_on'),'Value')
                EMG.(nom_acq{1}).Bouffee.(nom_emg{1})(floor(P(1,1)*EMG.(champs{1}).Fech):floor(P(2,1)*EMG.(champs{1}).Fech))=EMG.(nom_acq{1}).RAW.(nom_emg{1})(floor(P(1,1)*EMG.(champs{1}).Fech):floor(P(2,1)*EMG.(champs{1}).Fech));
                EMG.(nom_acq{1}).Activite.(nom_emg{1}) = ~isnan(EMG.(nom_acq{1}).Bouffee.(nom_emg{1}));
                draw_emg;
            end
        else
            try
                val1 = get(findobj('tag','listbox1'),'Value');
            catch
                val1 = 1;
                set(findobj('tag','listbox1'),'Value',val1);
            end
            list1 = get(findobj('tag','listbox1'),'String');
            nom_acq = list1(val1);
            
            try
                val2 = get(findobj('tag','listbox2'),'Value');
            catch
                val2 = 1;
                set(findobj('tag','listbox2'),'Value',val1);
            end
            list2 = get(findobj('tag','listbox2'),'String');
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
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tri_bouffees_on
set(findobj('tag','tri_bouffees_on'),'Value',1)
set(findobj('tag','tri_bouffees_off'),'Value',0)


% --- Executes on button press in tri_bouffees_off.
function tri_bouffees_off_Callback(hObject, eventdata, handles)
% hObject    handle to tri_bouffees_off (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tri_bouffees_off
set(findobj('tag','tri_bouffees_on'),'Value',0)
set(findobj('tag','tri_bouffees_off'),'Value',1)


% --- Executes when selected object is changed in uipanel_bouffees.
function uipanel_bouffees_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel_bouffees
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
if get(findobj('tag','fenetre_bruit'), 'Value')
    set(findobj('tag','debut_bruit'), 'Value',0);
    set(findobj('tag','acq_zero_emg'), 'Value',0);
elseif get(findobj('tag','debut_bruit'), 'Value');
    set(findobj('tag','fenetre_bruit'), 'Value',0)
    set(findobj('tag','acq_zero_emg'), 'Value',0);
elseif get(findobj('tag','acq_zero_emg'), 'Value');
    set(findobj('tag','fenetre_bruit'), 'Value',0)
    set(findobj('tag','debut_bruit'), 'Value',0);
end



%% fonctions annexes


%% Calcul de SampEn
function saen = SampEn( dim, r, data, tau )
% SAMPEN Sample Entropy
%   calculates the sample entropy of a given time series data

%   SampEn is conceptually similar to approximate entropy (ApEn), but has
%   following differences:
%       1) SampEn does not count self-matching. The possible trouble of
%       having log(0) is avoided by taking logarithm at the latest step.
%       2) SampEn does not depend on the datasize as much as ApEn does. The
%       comparison is shown in the graph that is uploaded.

%   dim     : embedded dimension
%   r       : tolerance (typically 0.2 * std)
%   data    : time-series data
%   tau     : delay time for downsampling (user can omit this, in which case
%             the default value is 1)
%
%---------------------------------------------------------------------
% coded by Kijoon Lee,  kjlee@ntu.edu.sg
% Mar 21, 2012
%---------------------------------------------------------------------

if nargin < 4, tau = 1; end
if tau > 1, data = downsample(data, tau); end

N = length(data);
correl = zeros(1,2);
dataMat = zeros(dim+1,N-dim);
for i = 1:dim+1
    dataMat(i,:) = data(i:N-dim+i-1);
end

for m = dim:dim+1
    count = zeros(1,N-dim);
    tempMat = dataMat(1:m,:);
    
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
% handles    structure with handles and user data (see GUIDATA)

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
% handles    structure with handles and user data (see GUIDATA)

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
% handles    structure with handles and user data (see GUIDATA)

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
% handles    structure with handles and user data (see GUIDATA)

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
% handles    structure with handles and user data (see GUIDATA)

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
% handles    structure with handles and user data (see GUIDATA)

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
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of acq_zero_emg



