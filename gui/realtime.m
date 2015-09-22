function varargout = realtime(varargin)
% REALTIME MATLAB code for realtime.fig
%      REALTIME, by itself, creates a new REALTIME or raises the existing
%      singleton*.
%
%      H = REALTIME returns the handle to a new REALTIME or the handle to
%      the existing singleton*.
%
%      REALTIME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REALTIME.M with the given input arguments.
%
%      REALTIME('Property','Value',...) creates a new REALTIME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before realtime_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to realtime_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help realtime

% Last Modified by GUIDE v2.5 20-Apr-2012 13:40:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @realtime_OpeningFcn, ...
                   'gui_OutputFcn',  @realtime_OutputFcn, ...
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


% --- Executes just before realtime is made visible.
function realtime_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to realtime (see VARARGIN)

% Choose default command line output for realtime
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes realtime wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = realtime_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in angryrecordtag.
function angryrecordtag_Callback(hObject, eventdata, handles)
global s1
cd '../Codes'
temp=recordreal;
global z
if z==1
    s1=temp;
    plot(handles.axes1, s1);
end
% hObject    handle to angryrecordtag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in fearrecordtag.
function fearrecordtag_Callback(hObject, eventdata, handles)
global s2 
cd '../Codes'
temp=recordreal;
global z
if z==1
    s2=temp;
    plot(handles.axes2, s2);
end
% hObject    handle to fearrecordtag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in happyrecordtag.
function happyrecordtag_Callback(hObject, eventdata, handles)
global s3 
cd '../Codes'
temp=recordreal;
global z
if z==1
    s3=temp;
    plot(handles.axes3, s3);
end
% hObject    handle to happyrecordtag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in sadrecordtag.
function sadrecordtag_Callback(hObject, eventdata, handles)
global s4
cd '../Codes'
temp=recordreal;
global z
if z==1
    s4=temp;
    plot(handles.axes4, s4);
end
% hObject    handle to sadrecordtag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in neutralrecordtag.
function neutralrecordtag_Callback(hObject, eventdata, handles)
global s5
cd '../Codes'
temp=recordreal;
global z
if z==1
    s5=temp;
    plot(handles.axes5, s5);
end
% hObject    handle to neutralrecordtag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in testrecordtag.
function testrecordtag_Callback(hObject, eventdata, handles)
global s6 Y
Y=[];
cd '../Codes'
temp=recordreal;
global z
if z==1
    s6=temp;
    plot(handles.axes6, s6);
end
% hObject    handle to testrecordtag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in recognizetag.
function recognizetag_Callback(hObject, eventdata, handles)
global s1 s2 s3 s4 s5 s6
if isempty(s6)
    msgbox('Please select Test input.','Warning','warn');
else
    if isempty(s1)||isempty(s2)||isempty(s3)||isempty(s4)||isempty(s5)
        directmodal
        global dreq
        if dreq==1
             perctag_Callback(hObject, eventdata, handles)
             cd '../Codes'
             directcompare
             cd '../gui'
             output
        end
    else
        cd '../Codes'
        newnetwork
        cd '../gui'
        output
    end
end
% hObject    handle to recognizetag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cleartag.
function cleartag_Callback(hObject, eventdata, handles)
cla(handles.axes1);
cla(handles.axes2);
cla(handles.axes3);
cla(handles.axes4);
cla(handles.axes5);
cla(handles.axes6);
global s1 s2 s3 s4 s5 s6
s1=[];
s2=[];
s3=[];
s4=[];
s5=[];
s6=[];
msgbox('All files are cleared.','Warning','warn');
% hObject    handle to cleartag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in angryplaytag.
function angryplaytag_Callback(hObject, eventdata, handles)
global s1 fs
if isempty(s1)
    msgbox('Nothing is recorded.','Warning','warn');
else
    soundsc(s1,fs);
end
% hObject    handle to angryplaytag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in fearplaytag.
function fearplaytag_Callback(hObject, eventdata, handles)
global s2 fs
if isempty(s)
    msgbox('Nothing is recorded.','Warning','warn');
else
    soundsc(s2,fs);
end
% hObject    handle to fearplaytag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in happyplaytag.
function happyplaytag_Callback(hObject, eventdata, handles)
global s3 fs
if isempty(s3)
    msgbox('Nothing is recorded.','Warning','warn');
else
    soundsc(s3,fs);
end
% hObject    handle to happyplaytag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in sadplaytag.
function sadplaytag_Callback(hObject, eventdata, handles)
global s4 fs
if isempty(s4)
    msgbox('Nothing is recorded.','Warning','warn');
else
    soundsc(s4,fs);
end
% hObject    handle to sadplaytag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in neutralplaytag.
function neutralplaytag_Callback(hObject, eventdata, handles)
global s5 fs
if isempty(s5)
    msgbox('Nothing is recorded.','Warning','warn');
else
    soundsc(s5,fs);
end
% hObject    handle to neutralplaytag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in testplaytag.
function testplaytag_Callback(hObject, eventdata, handles)
global s6 fs
if isempty(s6)
    msgbox('Nothing is recorded.','Warning','warn');
else
    soundsc(s6,fs);
end
% hObject    handle to testplaytag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function perctag_Callback(hObject, eventdata, handles)
input = str2num(get(hObject,'String'));
%checks to see if input is empty. if so, default input1_editText to zero
if (isempty(input))
input=60;
end
global p
p=input/100;
guidata(hObject, handles);
% hObject    handle to perctag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of perctag as text
%        str2double(get(hObject,'String')) returns contents of perctag as a double


% --- Executes during object creation, after setting all properties.
function perctag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to perctag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% This creates the 'background' axes
ha = axes('units','normalized','position',[0 0 1 1]);
% Move the background axes to the bottom
uistack(ha,'bottom');
% Load in a background image and display it using the correct colors
% The image used below, is in the Image Processing Toolbox. If you do not have %access to this toolbox, you can use another image file instead.
I=imread('Start.jpg');
hi = imagesc(I);
colormap gray
% Turn the handlevisibility off so that we don't inadvertently plot into the axes again
% Also, make the axes invisible
set(ha,'handlevisibility','off','invisible','off')
global s1 s2 s3 s4 s5 s6
s1=[];
s2=[];
s3=[];
s4=[];
s5=[];
s6=[];
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
gui2
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
