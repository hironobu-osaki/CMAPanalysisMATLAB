function varargout = CMAP(varargin)
% CMAP MATLAB code for CMAP.fig
%      CMAP, by itself, creates a new CMAP or raises the existing
%      singleton*.
%
%      H = CMAP returns the handle to a new CMAP or the handle to
%      the existing singleton*.
%
%      CMAP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CMAP.M with the given input arguments.
%
%      CMAP('Property','Value',...) creates a new CMAP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CMAP_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CMAP_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CMAP

% Last Modified by GUIDE v2.5 28-Aug-2017 09:12:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CMAP_OpeningFcn, ...
                   'gui_OutputFcn',  @CMAP_OutputFcn, ...
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


% --- Executes just before CMAP is made visible.
function CMAP_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CMAP (see VARARGIN)

% Choose default command line output for CMAP
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CMAP wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CMAP_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in SelectB.
function SelectB_Callback(hObject, eventdata, handles)
% hObject    handle to SelectB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.txt'},'File Selector','D:\CMAP\');
Fullfilename = [pathname filename];
% set(handles.Folder2, 'String', FullFileName(9:16));
set(handles.FileN, 'String', Fullfilename);

% FolderName1 = get(handles.Folder1, 'string');
% FolderName2 = get(handles.Folder2, 'string');
% FileName = get(handles.FileN, 'string');
% Fullfilename = [FolderName1 FolderName2 '\' FileName '.txt'];
% Fullfilename = get(handles.FileN, 'string');
handles.Data = CMAPtxtRead(Fullfilename);
TotalTrials = length(handles.Data)/808;
set(handles.TotalT, 'string', num2str(TotalTrials))
set(handles.EndT, 'string', num2str(TotalTrials))
set(handles.StartT, 'string', num2str(TotalTrials-9))
% Update handles structure
handles.ExpFigON = 0;
guidata(hObject, handles)
AnalyzeB_Callback(hObject, eventdata, handles)



function Folder1_Callback(hObject, eventdata, handles)
% hObject    handle to Folder1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Folder1 as text
%        str2double(get(hObject,'String')) returns contents of Folder1 as a double


% --- Executes during object creation, after setting all properties.
function Folder1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Folder1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Folder2_Callback(hObject, eventdata, handles)
% hObject    handle to Folder2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Folder2 as text
%        str2double(get(hObject,'String')) returns contents of Folder2 as a double


% --- Executes during object creation, after setting all properties.
function Folder2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Folder2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FileN_Callback(hObject, eventdata, handles)
% hObject    handle to FileN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FileN as text
%        str2double(get(hObject,'String')) returns contents of FileN as a double


% --- Executes during object creation, after setting all properties.
function FileN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FileN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% % --- Executes on button press in ReadB.
% function ReadB_Callback(hObject, eventdata, handles)
% % hObject    handle to ReadB (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% FolderName1 = get(handles.Folder1, 'string');
% FolderName2 = get(handles.Folder2, 'string');
% FileName = get(handles.FileN, 'string');
% Fullfilename = [FolderName1 FolderName2 '\' FileName '.txt'];
% handles.Data = CMAPtxtRead(Fullfilename);
% TotalTrials = length(handles.Data)/808;
% set(handles.TotalT, 'string', num2str(TotalTrials))
% set(handles.EndT, 'string', num2str(TotalTrials))
% set(handles.StartT, 'string', num2str(TotalTrials-9))
% guidata(hObject, handles)


function StartT_Callback(hObject, eventdata, handles)
% hObject    handle to StartT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of StartT as text
%        str2double(get(hObject,'String')) returns contents of StartT as a double
StartTrial = str2double(get(handles.StartT, 'string'));
EndTrial = StartTrial +9;
set(handles.EndT, 'string', num2str(EndTrial))
AnalyzeB_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function StartT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StartT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EndT_Callback(hObject, eventdata, handles)
% hObject    handle to EndT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EndT as text
%        str2double(get(hObject,'String')) returns contents of EndT as a double
EndTrial = str2double(get(handles.EndT, 'string'));
StartTrial = EndTrial - 9;
set(handles.StartT, 'string', num2str(StartTrial))
AnalyzeB_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function EndT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EndT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in AnalyzeB.
function AnalyzeB_Callback(hObject, eventdata, handles)
% hObject    handle to AnalyzeB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Data = handles.Data;
Time = 0:0.000025:0.019975;
Time = Time*1000-1;

StartTrial = str2double(get(handles.StartT, 'string'));
EndTrial = StartTrial + 9;

TotalTrial = str2double(get(handles.TotalT, 'String'));

if EndTrial > TotalTrial
    EntTrial = TotalTrial;
    StartTrial = EndTrial - 9;
end


for Reverse = 0:1
if Reverse
    Data = -Data;
end


for i = 1:10
    Rec(i).RecData = Data(9+808*(StartTrial-2+i):808*(StartTrial+i-1),2)*0.001;
end

MeanData = Rec(1).RecData;
for i = 2:10
    MeanData = MeanData + Rec(i).RecData;
end
MeanData = MeanData./10;

if handles.ExpFigON
    figure(10)
    FullFileName = get(handles.FileN, 'String');
    title(FullFileName);

else
    axes(handles.axes1)
end
hold off
for i = 1:10
    if Reverse
%         plot(Time,-Rec(i).RecData, 'y-')
    else
        if handles.ExpFigON
        else
            plot(Time,-Rec(i).RecData, 'g-')
        end
    end
    hold on
end

Loc = 1:800;
Loc = Loc';
if Reverse == 0
    plot(Time,-MeanData,'k-')
end

MeanData_withoutStim = MeanData;
Start = round(str2double(get(handles.StartPoint, 'String'))/0.025)+1/0.025;
End = round(str2double(get(handles.EndPoint, 'String'))/0.025)+1/0.025;
MeanData_withoutStim(1:Start) = 0;
MeanData_withoutStim(End:2000) = 0;
[PeakAmplitude,Peakloc] = findpeaks(-MeanData_withoutStim,'MinPeakHeight', max(-MeanData_withoutStim)-10/1000,'MinPeakDistance',100);
MeanDataShorterPeakLoc = -MeanData(Loc<Peakloc);
TimeShorterPeakLoc = Loc(Loc<Peakloc);
LocNegative1 = max(Loc(MeanDataShorterPeakLoc < 0));
TimeZero1 = Time(LocNegative1)+0.025*abs(MeanData(LocNegative1))/(abs(MeanData(LocNegative1))+abs(MeanData(LocNegative1+1)));

LocNegative2 = min(Loc(-MeanData<0&Loc>Loc(Peakloc)));
TimeZero2 = Time(LocNegative2-1)+0.025*(-MeanData(LocNegative2-1))/(abs(MeanData(LocNegative2-1))+abs(MeanData(LocNegative2)));

Latency = TimeZero1;
Duration = TimeZero2-TimeZero1;
if Reverse
    handles.TableDat(:,1) = [Latency; Time(Peakloc); PeakAmplitude; Duration];
    plot(TimeZero1, 0, 'ro')
    plot(TimeZero2, 0, 'ro')
    plot(Time(Peakloc), -PeakAmplitude, 'rv')


else
    handles.TableDat(:,2) = [Latency; Time(Peakloc); PeakAmplitude; Duration];
    plot(TimeZero1, 0, 'ro')
    plot(TimeZero2, 0, 'ro')
    plot(Time(Peakloc), PeakAmplitude, 'r^')

end

set(handles.uitable1, 'data', handles.TableDat)

plot([-1 10], [0 0], 'b-')
plot([str2double(get(handles.StartPoint, 'String')) str2double(get(handles.EndPoint, 'String'))], [0 0], 'r-')
plot([0 0],[-0.5 0.5], 'r-')
xlim([-1 10])
if PeakAmplitude < 4
    ylim([-4 4])
else
    ylim([-round(PeakAmplitude+1) round(PeakAmplitude+1)])
end

end

handles.ExpFigON = 0;
guidata(hObject,handles)



function StartPoint_Callback(hObject, eventdata, handles)
% hObject    handle to StartPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of StartPoint as text
%        str2double(get(hObject,'String')) returns contents of StartPoint as a double
AnalyzeB_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function StartPoint_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StartPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EndPoint_Callback(hObject, eventdata, handles)
% hObject    handle to EndPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EndPoint as text
%        str2double(get(hObject,'String')) returns contents of EndPoint as a double
AnalyzeB_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function EndPoint_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EndPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Pre.
function Pre_Callback(hObject, eventdata, handles)
% hObject    handle to Pre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PreStartT = str2double(get(handles.StartT, 'String'));
StartT = PreStartT -1;
PreEndT = str2double(get(handles.EndT, 'String'));
EndT = PreEndT -1;
if StartT < 1
    StartT = 1;
    EndT = 10;
end
set(handles.StartT, 'String', num2str(StartT))
set(handles.EndT, 'String', num2str(EndT))
AnalyzeB_Callback(hObject, eventdata, handles)

% --- Executes on button press in Post.
function Post_Callback(hObject, eventdata, handles)
% hObject    handle to Post (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PreStartT = str2double(get(handles.StartT, 'String'));
StartT = PreStartT +1;
PreEndT = str2double(get(handles.EndT, 'String'));
EndT = PreEndT +1;
TotalT = str2double(get(handles.TotalT, 'String'));
if EndT > TotalT
    StartT = TotalT - 9;
    EndT = TotalT;
end
set(handles.StartT, 'String', num2str(StartT))
set(handles.EndT, 'String', num2str(EndT))
AnalyzeB_Callback(hObject, eventdata, handles)


% --- Executes on button press in ExpFig.
function ExpFig_Callback(hObject, eventdata, handles)
% hObject    handle to ExpFig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.ExpFigON = 1;
guidata(hObject,handles)
AnalyzeB_Callback(hObject, eventdata, handles)