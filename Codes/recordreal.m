function s1=recordreal()
global fs
fs=44100;
nbit=16;
channel=1;
myVoice = audiorecorder(fs,nbit,channel);

cd '../gui'
realmodal

global z
if z==1
    h=msgbox('Start speaking after the beep.Recording is only for 3 sec.','Warning','warn');
    waitfor(h);
    cd '../Codes'
    tongen(1);
    pause(1);
    recordblocking(myVoice, 3);
    msgbox('End of recording.','Thank You','help');
    global s1
    s1=getaudiodata(myVoice,'double');
end
if z==0
    s1=[];
end
cd '../gui'