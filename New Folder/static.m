function varargout = static(varargin)
% STATIC MATLAB code for static.fig
%      STATIC, by itself, creates a new STATIC or raises the existing
%      singleton*.
%
%      H = STATIC returns the handle to a new STATIC or the handle to
%      the existing singleton*.
%
%      STATIC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STATIC.M with the given input arguments.
%
%      STATIC('Property','Value',...) creates a new STATIC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before static_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to static_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help static

% Last Modified by GUIDE v2.5 03-Apr-2012 16:18:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @static_OpeningFcn, ...
                   'gui_OutputFcn',  @static_OutputFcn, ...
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

% --- Executes just before static is made visible.
function static_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to static (see VARARGIN)

% Choose default command line output for static
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes static wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = static_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in angry.
function angry_Callback(hObject, eventdata, handles)
[myV1 p1]=uigetfile();
n1 = horzcat(p1, myV1);
s1= wavread(n1);
s=[s s1];
drawnow()
axes(handles.axes1);
plot(handles.axes1, s1)

%axes(handles.axes1);
guidata (hObject, myV1);

guidata(hObject, handles);


% hObject    handle to angry (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in bore.
function bore_Callback(hObject, eventdata, handles)
[myV2 p2]=uigetfile()
n2 = horzcat(p2, myV2)
s2= wavread(n2);
axes(handles.axes2);
plot(handles.axes2, s2)
guidata (hObject, myV2);

guidata(hObject, handles);

% hObject    handle to bore (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in happy.
function happy_Callback(hObject, eventdata, handles)
[myV3 p3]=uigetfile()
n3 = horzcat(p3, myV3)
s3= wavread(n3);

%axes(handles.axes3);
plot(handles.axes3, s3)
guidata (hObject, myV3);

guidata(hObject, handles);

% hObject    handle to happy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in sad.
function sad_Callback(hObject, eventdata, handles)
[myV4 p4]=uigetfile()
n4 = horzcat(p4, myV4)
s4= wavread(n4);
axes(handles.axes4);
plot(handles.axes4, s4)
guidata (hObject, myV4);

guidata(hObject, handles);

% hObject    handle to sad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in neutral.
function neutral_Callback(hObject, eventdata, handles)
[myV5 p5]=uigetfile()
n5 = horzcat(p5, myV5)
s5= wavread(n5);
axes(handles.axes5);
plot(handles.axes5, s5)
guidata (hObject, myV5);
guidata(hObject, handles);

% hObject    handle to neutral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in test.
function test_Callback(hObject, eventdata, handles)
[myV6 p6]=uigetfile()
n6 = horzcat(p6, myV6)
s6= wavread(n6);
axes(handles.axes6)
plot(handles.axes6, s6)
guidata (hObject, myV6);

a = get(handles.samperc,'String');
sp = str2num(a)/100;

drawnow();

newnetwork(s1,s2,s3,s4,s5,s6,sp)

guidata(hObject, handles);

% hObject    handle to test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in recog.
function recog_Callback(hObject, eventdata, handles)
emorec
% hObject    handle to recog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
arrayfun(@cla,findall(0,'type','axes'))

% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function samperc_Callback(hObject, eventdata, handles)
input = str2num(get(hObject,'String'));
%checks to see if input is empty. if so, default input1_editText to zero
if (isempty(input))
set(hObject,'String','60')
end
guidata(hObject, handles);
% hObject    handle to samperc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samperc as text
%        str2double(get(hObject,'String')) returns contents of samperc as a double


% --- Executes during object creation, after setting all properties.
function samperc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to samperc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
