function newnetwork2()
global p
h=waitbar(50,'Please wait while quantizing.');
vq=vquantize();
delete(h);
h=waitbar(50,'Please wait while training');
%prog loads the databases
load angrymfccDBall.mat
load fearmfccDBall.mat
load happymfccDBall.mat
load sadmfccDBall.mat
load neutralmfccDBall.mat

%Calculating Number Of Training Samples
noa=round(p*noa);
nof=round(p*nof);
noh=round(p*noh);
nos=round(p*nos);
non=round(p*non);

P=[];
%Feature Vector From Angry Database
for i=1:noa
    P=[P;vqa(i,:)];
end
P=[P;vq(1,:)];
%Feature Vector From Bored Database
for i=1:nof
    P=[P;vqf(i,:)];
end
P=[P;vq(2,:)];
%Feature Vector From Happy Database
for i=1:noh
    P=[P;vqh(i,:)];
end
P=[P;vq(3,:)];
%Feature Vector From Sad Database
for i=1:nos
    P=[P;vqs(i,:)];
end
P=[P;vq(4,:)];
%Feature Vector From Fear Database
for i=1:non
    P=[P;vqn(i,:)];
end
P=[P;vq(5,:)];
%Target Matrix
T=[repmat([1 0 0 0 0],(noa+1),1);repmat([0 1 0 0 0],(nof+1),1);repmat([0 0 1 0 0],(noh+1),1);repmat([0 0 0 1 0],(nos+1),1);repmat([0 0 0 0 1],(non+1),1)];
net=newrb(P',T',0.0011);
close
pause(1);
global Y
Y=sim(net,vq(6,:)');
[SortedScores,IX] = sort(Y);               %Sort scores increasing
global emo
if IX(5,1)== 1
     emo='Angry';
     elseif IX(5,1)== 2
         emo='Fear';
         elseif IX(5,1)== 3
            emo='Happy';
            elseif IX(5,1)== 4
                  emo='Sad';
                  elseif IX(5,1)==5
                          emo='Neutral';
end
delete(h);