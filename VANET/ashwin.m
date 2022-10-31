function varargout = ashwin(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ashwin_OpeningFcn, ...
                   'gui_OutputFcn',  @ashwin_OutputFcn, ...
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
function ashwin_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
function varargout = ashwin_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
function Simulate_Callback(hObject, eventdata, handles)
NumOfNodes=str2double(get(handles.edit1,'string'));
src_node=str2double(get(handles.edit2,'string'));
if isnan(src_node)
    src_node=round(1+(NumOfNodes-1).*rand);
end
if src_node>NumOfNodes
    errordlg('Source ID is more than Number of nodes','Index Exceeds')
    return
end

dst_node=str2double(get(handles.edit3,'string'));
if isnan(dst_node)
    dst_node=round(1+(NumOfNodes-1).*rand);
end
if dst_node>NumOfNodes
    errordlg('Destination ID is more than Number of nodes','Index Exceeds')
    return
end
[distance,energy,nw_liftime,throughput]=UrbanCitySimu(NumOfNodes,src_node,dst_node);
if exist('out.xls','file')
    delete out.xls
end
xlswrite('out',distance','Distance')
xlswrite('out',energy,'Energy')
xlswrite('out',nw_liftime,'Network Life Time')
xlswrite('out',throughput,'throughput')
winopen('out.xls')
function listbox3_Callback(~, eventdata, handles)
function listbox3_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Clear_Callback(hObject, eventdata, handles)
cla



function edit1_Callback(hObject, eventdata, handles)
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit2_Callback(hObject, eventdata, handles)
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function pushbutton3_Callback(hObject, eventdata, handles)
close all