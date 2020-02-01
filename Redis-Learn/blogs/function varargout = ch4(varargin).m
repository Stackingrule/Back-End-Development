function varargout = ch4(varargin)
% CH4 M-file for ch4.fig
%      CH4, by itself, creates a new CH4 or raises the existing
%      singleton*.
%
%      H = CH4 returns the handle to a new CH4 or the handle to
%      the existing singleton*.
%
%      CH4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CH4.M with the given input arguments.
%
%      CH4('Property','Value',...) creates a new CH4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ch4_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ch4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help ch4

% Last Modified by GUIDE v2.5 18-Oct-2007 08:57:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ch4_OpeningFcn, ...
                   'gui_OutputFcn',  @ch4_OutputFcn, ...
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


% --- Executes just before ch4 is made visible.
function ch4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ch4 (see VARARGIN)

% Choose default command line output for ch4
handles.inputtype=0;
xlabel(handles.plot1,'freqency(Hz)');
xlabel(handles.plot2,'freqency(Hz)');
xlabel(handles.plot3,'freqency(Hz)');
xlabel(handles.plot4,'freqency(Hz)');
xlabel(handles.plot5,'freqency(Hz)');
ylabel(handles.plot1,'amplitude');
ylabel(handles.plot2,'phase(rad)');
ylabel(handles.plot3,'real');
ylabel(handles.plot4,'Imaginary');
ylabel(handles.plot5,'power');
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ch4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ch4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes on button press in timeanalyse.
function timeanalyse_Callback(hObject, eventdata, handles)
% hObject    handle to timeanalyse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs=str2double(get(findobj('Tag','samplerate'),'String'));
N=str2double(get(findobj('Tag','samplenum'),'String'));
if handles.inputtype==0
        msgbox('No wave exist! Please choose a input type!');
        return;
end
%guo ling jian ce
n=1;
ymax=max([handles.y(1) handles.y(2)]);
ymin=min([handles.y(1) handles.y(2)]);
from=str2double(get(handles.pointfrom,'String'));
to=str2double(get(handles.pointto,'String'));
if from<1 | to-from<5;
    msgbox('Error range!');
    return;
end
for i=from+2:to-1;
    if handles.y(i-1)<0 & handles.y(i-2)<0 & handles.y(i)>=0 & handles.y(i+1)>0
        if handles.y(i)==0
            ti(n)=i;
        else
            ti(n)=i-handles.y(i)/(handles.y(i)-handles.y(i-1));
%             x1=i-1;
%             y1=handles.y(i-1);
%             x2=i;
%             y2=handles.y(i);
%             a=handles.y(i)-handles.y(i-1);
%             b=a*x1-y1;
%             ti(n)=b/a;
        end
        amp(n)=(ymax-ymin)/2;
        ymax=0;
        ymin=0;
        n=n+1;
    else
        if ymax<handles.y(i)
            ymax=handles.y(i);
        end
        if ymin>handles.y(i)
            ymin=handles.y(i);
        end
    end
end
n=n-1;
%freqence and periodicity
for i=1:n-1
    T(i)=ti(i+1)-ti(i);
end
freq=Fs/mean(T);
set(handles.outt,'String',1/freq);
set(handles.outfreq,'String',num2str(freq));
%amplitude
set(handles.outamp,'String',num2str(mean(amp(2:n-1))));
%phase
phase=2*pi*(1-(ti(1:n-1)-1)./T+floor((ti(1:n-1)-1)./T));
set(handles.outphase,'String',num2str(mean(phase)));
%peak
set(handles.outpeak,'String',(max(handles.y(from:to))-min(handles.y(from:to)))/2);
%mean
set(handles.outmean,'String',mean(handles.y(from:to)));
%meansquare
set(handles.outmeansquare,'String',mean(handles.y(from:to).^2));
%s
set(handles.outs,'String',std(handles.y(from:to))^2);

% --- Executes on button press in WAVfile.
function WAVfile_Callback(hObject, eventdata, handles)
% hObject    handle to WAVfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=findobj('Tag','filename');
set(h,'enable','on');
h=findobj('Tag','freq');
set(h,'enable','off');
h=findobj('Tag','amp');
set(h,'enable','off');
h=findobj('Tag','phase');
set(h,'enable','off');
set(findobj('Tag','recordtime'),'enable','off');
set(handles.channel,'enable','on');
set(handles.fileopen,'enable','on');
set(handles.gensig,'enable','off');
set(handles.wavetype,'enable','off');
set(handles.add,'enable','off');
set(handles.startrecord,'enable','off');

% --- Executes on button press in soundcard.
function soundcard_Callback(hObject, eventdata, handles)
% hObject    handle to soundcard (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(findobj('Tag','recordtime'),'enable','on');
h=findobj('Tag','filename');
set(h,'enable','off');
h=findobj('Tag','freq');
set(h,'enable','off');
h=findobj('Tag','amp');
set(h,'enable','off');
h=findobj('Tag','phase');
set(h,'enable','off');
set(handles.channel,'enable','off');
set(handles.fileopen,'enable','off');
set(handles.gensig,'enable','off');
set(handles.wavetype,'enable','off');
set(handles.add,'enable','off');
set(handles.startrecord,'enable','on');

% --- Executes on button press in generator.
function generator_Callback(hObject, eventdata, handles)
% hObject    handle to generator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=findobj('Tag','filename');
set(h,'enable','off');
h=findobj('Tag','freq');
set(h,'enable','on');
h=findobj('Tag','amp');
set(h,'enable','on');
h=findobj('Tag','phase');
set(h,'enable','on');
set(findobj('Tag','recordtime'),'enable','off');
set(handles.channel,'enable','off');
set(handles.fileopen,'enable','off');
set(handles.gensig,'enable','on');
set(handles.wavetype,'enable','on');
set(handles.add,'enable','on');
set(handles.startrecord,'enable','off');

function filename_Callback(hObject, eventdata, handles)
% hObject    handle to filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of filename as text
%        str2double(get(hObject,'String')) returns contents of filename as a double


% --- Executes during object creation, after setting all properties.
function filename_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function freq_Callback(hObject, eventdata, handles)
% hObject    handle to freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freq as text
%        str2double(get(hObject,'String')) returns contents of freq as a double


% --- Executes during object creation, after setting all properties.
function freq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function amp_Callback(hObject, eventdata, handles)
% hObject    handle to amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of amp as text
%        str2double(get(hObject,'String')) returns contents of amp as a double


% --- Executes during object creation, after setting all properties.
function amp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function phase_Callback(hObject, eventdata, handles)
% hObject    handle to phase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of phase as text
%        str2double(get(hObject,'String')) returns contents of phase as a double


% --- Executes during object creation, after setting all properties.
function phase_CreateFcn(hObject, eventdata, handles)
% hObject    handle to phase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end





function samplerate_Callback(hObject, eventdata, handles)
% hObject    handle to samplerate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samplerate as text
%        str2double(get(hObject,'String')) returns contents of samplerate as a double


% --- Executes during object creation, after setting all properties.
function samplerate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to samplerate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function samplenum_Callback(hObject, eventdata, handles)
% hObject    handle to samplenum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samplenum as text
%        str2double(get(hObject,'String')) returns contents of samplenum as a double


% --- Executes during object creation, after setting all properties.
function samplenum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to samplenum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes during object creation, after setting all properties.
function ampfreq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ampfreq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate ampfreq


function recordtime_Callback(hObject, eventdata, handles)
% hObject    handle to recordtime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of recordtime as text
%        str2double(get(hObject,'String')) returns contents of recordtime as a double


% --- Executes during object creation, after setting all properties.
function recordtime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to recordtime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

% --- Executes on button press in startrecord.
function startrecord_Callback(hObject, eventdata, handles)
% hObject    handle to startrecord (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs=str2double(get(findobj('Tag','samplerate'),'String'));
handles.y=wavrecord(str2double(get(findobj('Tag','recordtime'),'String'))*Fs, Fs,'int16');
handles.inputtype=1;
guidata(hObject,handles);
plot(handles.time,handles.y);
title('WAVE');
ysize=size(handles.y)
set(handles.samplenum,'String',num2str(ysize(1)));

% --- Executes on button press in fileopen.
function fileopen_Callback(hObject, ~, handles)
% hObject    handle to fileopen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    temp = wavread(get(findobj('Tag','filename'),'String'));
channel=str2double(get(handles.channel,'String'));
handles.y=temp(:,channel);
handles.inputtype=2;
guidata(hObject,handles);
plot(handles.time,handles.y);
title('WAVE');
ysize=size(handles.y)
set(handles.samplenum,'String',num2str(ysize(1)));

% --- Executes on button press in gensig.
function gensig_Callback(hObject, eventdata, handles)
% hObject    handle to gensig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs=str2double(get(findobj('Tag','samplerate'),'String'));
N=str2double(get(findobj('Tag','samplenum'),'String'));
x=linspace(0,N/Fs,N);
soundtype=get(handles.wavetype,'Value');
frequency=str2double(get(handles.freq,'String'));
amp=str2double(get(handles.amp,'String'));
phase=str2double(get(handles.phase,'String'));
switch soundtype
    case 1
        y=amp*sin(2*pi*x*frequency+phase);
    case 2
        y=amp*sign(sin(2*pi*x*frequency+phase));
    case 3
        y=amp*sawtooth(2*pi*x*frequency+phase,0.5);
    case 4
        y=amp*sawtooth(2*pi*x*frequency+phase);
    case 5
        y=amp*(2*rand(size(x))-1);
    otherwise
        errordlg('Illegal wave type','Choose errer');
end
if get(handles.add,'Value')==0.0
    handles.y=y;
else
    handles.y=handles.y+y;
end
handles.inputtype=3;
guidata(hObject,handles);
plot(handles.time,handles.y);
title('WAVE');
axis([0 N -str2double(get(handles.amp,'String')) str2double(get(handles.amp,'String'))]);



function outfreq_Callback(hObject, eventdata, handles)
% hObject    handle to outfreq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outfreq as text
%        str2double(get(hObject,'String')) returns contents of outfreq as a double


% --- Executes during object creation, after setting all properties.
function outfreq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outfreq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function outamp_Callback(hObject, eventdata, handles)
% hObject    handle to outamp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outamp as text
%        str2double(get(hObject,'String')) returns contents of outamp as a double


% --- Executes during object creation, after setting all properties.
function outamp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outamp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function outphase_Callback(hObject, eventdata, handles)
% hObject    handle to outphase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outphase as text
%        str2double(get(hObject,'String')) returns contents of outphase as a double


% --- Executes during object creation, after setting all properties.
function outphase_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outphase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function outpeak_Callback(hObject, eventdata, handles)
% hObject    handle to outpeak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outpeak as text
%        str2double(get(hObject,'String')) returns contents of outpeak as a double


% --- Executes during object creation, after setting all properties.
function outpeak_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outpeak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function outmean_Callback(hObject, eventdata, handles)
% hObject    handle to outmean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outmean as text
%        str2double(get(hObject,'String')) returns contents of outmean as a double


% --- Executes during object creation, after setting all properties.
function outmean_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outmean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function outmeansquare_Callback(hObject, eventdata, handles)
% hObject    handle to outmeansquare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outmeansquare as text
%        str2double(get(hObject,'String')) returns contents of outmeansquare as a double


% --- Executes during object creation, after setting all properties.
function outmeansquare_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outmeansquare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function outs_Callback(hObject, eventdata, handles)
% hObject    handle to outs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outs as text
%        str2double(get(hObject,'String')) returns contents of outs as a double


% --- Executes during object creation, after setting all properties.
function outs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function foutfreq_Callback(hObject, eventdata, handles)
% hObject    handle to foutfreq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of foutfreq as text
%        str2double(get(hObject,'String')) returns contents of foutfreq as a double


% --- Executes during object creation, after setting all properties.
function foutfreq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to foutfreq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function foutamp_Callback(hObject, eventdata, handles)
% hObject    handle to foutamp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of foutamp as text
%        str2double(get(hObject,'String')) returns contents of foutamp as a double


% --- Executes during object creation, after setting all properties.
function foutamp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to foutamp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function foutphase_Callback(hObject, eventdata, handles)
% hObject    handle to foutphase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of foutphase as text
%        str2double(get(hObject,'String')) returns contents of foutphase as a double


% --- Executes during object creation, after setting all properties.
function foutphase_CreateFcn(hObject, eventdata, handles)
% hObject    handle to foutphase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in freqanalyse.
function freqanalyse_Callback(hObject, eventdata, handles)
% hObject    handle to freqanalyse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs=str2double(get(findobj('Tag','samplerate'),'String'));
N=str2double(get(findobj('Tag','samplenum'),'String'));
if handles.inputtype==0
        msgbox('No wave exist! Please choose a input type!');
        return;
end
from=str2double(get(handles.pointfrom,'String'));
to=str2double(get(handles.pointto,'String'));
sample=handles.y(from:to);
f=linspace(0,Fs/2,(to-from+1)/2);
Y=fft(sample,to-from+1);
[C,I]=max(abs(Y));
set(handles.foutt,'String',1/f(I));
set(handles.foutfreq,'String',f(I));
Y=Y(1:(to-from+1)/2);
plot(handles.plot1,f,2*sqrt(Y.*conj(Y)));
plot(handles.plot2,f,angle(Y));
plot(handles.plot3,f,real(Y));
plot(handles.plot4,f,imag(Y));
plot(handles.plot5,f,abs(Y).^2);
xlabel(handles.plot1,'freqency(Hz)');
xlabel(handles.plot2,'freqency(Hz)');
xlabel(handles.plot3,'freqency(Hz)');
xlabel(handles.plot4,'freqency(Hz)');
xlabel(handles.plot5,'freqency(Hz)');
ylabel(handles.plot1,'amplitude');
ylabel(handles.plot2,'phase(rad)');
ylabel(handles.plot3,'real');
ylabel(handles.plot4,'Imaginary');
ylabel(handles.plot5,'power');

function pointfrom_Callback(hObject, eventdata, handles)
% hObject    handle to pointfrom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pointfrom as text
%        str2double(get(hObject,'String')) returns contents of pointfrom as a double


% --- Executes during object creation, after setting all properties.
function pointfrom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pointfrom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function pointto_Callback(hObject, eventdata, handles)
% hObject    handle to pointto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pointto as text
%        str2double(get(hObject,'String')) returns contents of pointto as a double


% --- Executes during object creation, after setting all properties.
function pointto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pointto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs=str2double(get(findobj('Tag','samplerate'),'String'));
wavplay(handles.y,Fs);

% --- Executes on slider movement.
function scale_Callback(hObject, eventdata, handles)
% hObject    handle to scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val=get(hObject,'value');
val=10^(val*5+1);
x=get(handles.xmove,'Value')*str2double(get(handles.samplenum,'String'));
axis(handles.time,[x val+x min(handles.y) max(handles.y)]);

% --- Executes during object creation, after setting all properties.
function scale_CreateFcn(hObject, eventdata, handles)
% hObject    handle to scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --- Executes on slider movement.
function scale2_Callback(hObject, eventdata, handles)
% hObject    handle to scale2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val=get(hObject,'value');
val=10^(val*5+1);
xlim(handles.plot1,[0 val]);
xlim(handles.plot2,[0 val]);
xlim(handles.plot3,[0 val]);
xlim(handles.plot4,[0 val]);

% --- Executes during object creation, after setting all properties.
function scale2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to scale2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end





function channel_Callback(hObject, eventdata, handles)
% hObject    handle to channel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of channel as text
%        str2double(get(hObject,'String')) returns contents of channel as a double


% --- Executes during object creation, after setting all properties.
function channel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to channel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --- Executes on selection change in wavetype.
function wavetype_Callback(hObject, eventdata, handles)
% hObject    handle to wavetype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns wavetype contents as cell array
%        contents{get(hObject,'Value')} returns selected item from wavetype


% --- Executes during object creation, after setting all properties.
function wavetype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wavetype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in add.
function add_Callback(hObject, eventdata, handles)
% hObject    handle to add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of add


% --- Executes during object deletion, before destroying properties.
function add_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on slider movement.
function xmove_Callback(hObject, eventdata, handles)
% hObject    handle to xmove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val=get(handles.scale,'value');
val=10^(val*5+1);
x=get(hObject,'Value')*str2double(get(handles.samplenum,'String'));
axis(handles.time,[x val+x min(handles.y) max(handles.y)]);

% --- Executes during object creation, after setting all properties.
function xmove_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xmove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --- Executes on button press in analyseall.
function analyseall_Callback(hObject, eventdata, handles)
% hObject    handle to analyseall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value')==0.0
    set(handles.pointfrom,'Enable','on');
    set(handles.pointto,'Enable','on');
else
    set(handles.pointfrom,'String','1','Enable','off');
    set(handles.pointto,'String',get(handles.samplenum,'String'),'Enable','off');
end




function outt_Callback(hObject, eventdata, handles)
% hObject    handle to outt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outt as text
%        str2double(get(hObject,'String')) returns contents of outt as a double


% --- Executes during object creation, after setting all properties.
function outt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function foutt_Callback(hObject, eventdata, handles)
% hObject    handle to foutt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of foutt as text
%        str2double(get(hObject,'String')) returns contents of foutt as a double


% --- Executes during object creation, after setting all properties.
function foutt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to foutt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


