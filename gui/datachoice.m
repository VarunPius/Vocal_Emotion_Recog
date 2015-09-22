function varargout = datachoice(varargin)
% DATACHOICE MATLAB code for datachoice.fig
%      DATACHOICE, by itself, creates a new DATACHOICE or raises the existing
%      singleton*.
%
%      H = DATACHOICE returns the handle to a new DATACHOICE or the handle to
%      the existing singleton*.
%
%      DATACHOICE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATACHOICE.M with the given input arguments.
%
%      DATACHOICE('Property','Value',...) creates a new DATACHOICE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before datachoice_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to datachoice_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help datachoice

% Last Modified by GUIDE v2.5 27-Apr-2012 01:48:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @datachoice_OpeningFcn, ...
                   'gui_OutputFcn',  @datachoice_OutputFcn, ...
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


% --- Executes just before datachoice is made visible.
function datachoice_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to datachoice (see VARARGIN)

% Choose default command line output for datachoice
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes datachoice wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = datachoice_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in angryDBtag.
function angryDBtag_Callback(hObject, eventdata, handles)
datamodal
cd '../Codes'
angrymfccDB()
% hObject    handle to angryDBtag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in fearDBtag.
function fearDBtag_Callback(hObject, eventdata, handles)
datamodal
cd '../Codes'
fearmfccDB()
% hObject    handle to fearDBtag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in happyDBtag.
function happyDBtag_Callback(hObject, eventdata, handles)
datamodal
cd '../Codes'
happymfccDB()
% hObject    handle to happyDBtag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in sadDBtag.
function sadDBtag_Callback(hObject, eventdata, handles)
datamodal
cd '../Codes'
sadmfccDB()
% hObject    handle to sadDBtag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in neutralDBtag.
function neutralDBtag_Callback(hObject, eventdata, handles)
datamodal
cd '../Codes'
neutralmfccDB()
% hObject    handle to neutralDBtag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
gui2
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
gui2
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
