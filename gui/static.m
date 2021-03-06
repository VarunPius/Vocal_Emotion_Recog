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

% Last Modified by GUIDE v2.5 20-Apr-2012 13:39:01

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
[myV1 p1]=uigetfile({'*.wav','Audio Files';
'*.*','All Files' },'Select Audio For Angry Emotion','../Samples2\Angry');
if isequal(myV1,0)
    h=msgbox('No file is selected.','Warning','warn');
end
if ~isequal(myV1,0)
   n1 = horzcat(p1, myV1);
   global s1 fs
   [s1 fs]= wavread(n1);
   axes(handles.axes1);
   plot(handles.axes1, s1);
   h=msgbox(horzcat('User selected ', fullfile(p1,myV1)),'Thank You','help');
   %axes(handles.axes1);
   guidata (hObject, myV1);
   guidata(hObject, handles);
end

% hObject    handle to angry (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in fear.
function fear_Callback(hObject, eventdata, handles)
[myV2 p2]=uigetfile({'*.wav','Audio Files';
'*.*','All Files' },'Select Bored For Angry Emotion','../Samples2\Fear');
if isequal(myV2,0)
    h=msgbox('No file is selected.','Warning','warn');
end
if ~isequal(myV2,0)
    n2 = horzcat(p2, myV2);
    global s2 fs2
    [s2 fs2]= wavread(n2);
    axes(handles.axes2);
    plot(handles.axes2, s2);
    h=msgbox(horzcat('User selected ', fullfile(p2,myV2)),'Thank You','help');
    guidata (hObject, myV2);
    guidata(hObject, handles);
end
% hObject    handle to fear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in happy.
function happy_Callback(hObject, eventdata, handles)
[myV3 p3]=uigetfile({'*.wav','Audio Files';
'*.*','All Files' },'Select Audio For Happy Emotion','../Samples2\Happy');
if isequal(myV3,0)
    h=msgbox('No file is selected.','Warning','warn');
end
if ~isequal(myV3,0)
    n3 = horzcat(p3, myV3);
    global s3 fs3
    [s3 fs3]= wavread(n3);
    %axes(handles.axes3);
    plot(handles.axes3, s3);
    h=msgbox(horzcat('User selected ', fullfile(p3,myV3)),'Thank You','help');
    guidata (hObject, myV3);
    guidata(hObject, handles);
end
% hObject    handle to happy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in sad.
function sad_Callback(hObject, eventdata, handles)
[myV4 p4]=uigetfile({'*.wav','Audio Files';
'*.*','All Files' },'Select Audio For Sad Emotion','../Samples2\Sad');
if isequal(myV4,0)
    h=msgbox('No file is selected.','Warning','warn');
end
if ~isequal(myV4,0)
    n4 = horzcat(p4, myV4);
    global s4 fs4
    [s4 fs4]= wavread(n4);
    axes(handles.axes4);
    plot(handles.axes4, s4);
    h=msgbox(horzcat('User selected ', fullfile(p4,myV4)),'Thank You','help');
    guidata (hObject, myV4);
    guidata(hObject, handles);
end
% hObject    handle to sad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in neutral.
function neutral_Callback(hObject, eventdata, handles)
[myV5 p5]=uigetfile({'*.wav','Audio Files';
'*.*','All Files' },'Select Audio For Neutral Emotion','../Samples2\Neutral');
if isequal(myV5,0)
   h=msgbox('No file is selected.','Warning','warn');
end
if ~isequal(myV5,0)
    n5 = horzcat(p5, myV5);
    global s5 fs5
    [s5 fs5]= wavread(n5);
    axes(handles.axes5);
    plot(handles.axes5, s5);
    h=msgbox(horzcat('User selected ', fullfile(p5,myV5)),'Thank You','help');
    guidata (hObject, myV5);
    guidata(hObject, handles);
end
% hObject    handle to neutral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in test.
function test_Callback(hObject, eventdata, handles)
[myV6 p6]=uigetfile({'*.wav','Audio Files';
'*.*','All Files' },'Select Audio For Test Emotion','../Samples2\Test');
if isequal(myV6,0)
   h=msgbox('No file is selected.','Warning','warn');
end
if ~isequal(myV6,0)
    n6 = horzcat(p6, myV6);
    global s6 fs6
    [s6 fs6]= wavread(n6);
    plot(handles.axes6, s6);
    h=msgbox(horzcat('User selected ',fullfile(p6,myV6)),'Thank You','help');
    guidata (hObject, myV6);
    guidata(hObject, handles);
end
% hObject    handle to test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in recog.
function recog_Callback(hObject, eventdata, handles)
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
        perctag_Callback(hObject, eventdata, handles)
        cd '../Codes'
        newnetwork
        cd '../gui'
        output
    end
end
% hObject    handle to recog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
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
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in playangry.
function playangry_Callback(hObject, eventdata, handles)
global s1 fs
if isempty(s1)
    msgbox('Nothing is recorded.','Warning','warn');
else
    soundsc(s1,fs);
end
% hObject    handle to playangry (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in playfear.
function playfear_Callback(hObject, eventdata, handles)
global s2 fs2
if isempty(s2)
    msgbox('Nothing is recorded.','Warning','warn');
else
soundsc(s2,fs2);
end
% hObject    handle to playfear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in playhappy.
function playhappy_Callback(hObject, eventdata, handles)
global s3 fs3
if isempty(s3)
    msgbox('Nothing is recorded.','Warning','warn');
else
soundsc(s3,fs3);
end
% hObject    handle to playhappy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in playsad.
function playsad_Callback(hObject, eventdata, handles)
global s4 fs4
if isempty(s4)
    msgbox('Nothing is recorded.','Warning','warn');
else
soundsc(s4,fs4);
end
% hObject    handle to playsad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in playneutral.
function playneutral_Callback(hObject, eventdata, handles)
global s5 fs5
if isempty(s5)
    msgbox('Nothing is recorded.','Warning','warn');
else
soundsc(s5,fs5);
end
% hObject    handle to playneutral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in playtest.
function playtest_Callback(hObject, eventdata, handles)
global s6 fs6
if isempty(s6)
    msgbox('Nothing is recorded.','Warning','warn');
else
soundsc(s6,fs6);
end
% hObject    handle to playtest (see GCBO)
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
