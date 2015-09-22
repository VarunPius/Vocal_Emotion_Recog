function directcompare()
global quant
quant=32;
global s6 fs p

h=waitbar(50,'Please wait while quantizing.');

s6 = s6(:,1);                            %pads with 150 ms silence
s6 =s6.*2;                               %Doubles the amplitude of the vector
s6 =s6 - mean(s6);                       %DC offset elimination
n6 = nreduce(s6,fs);                     %Normalises the Matrix
temp=mfccf(13,n6,fs);
[vq,vp]=vqsplit(temp,quant);             %Vector Quantization

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
%Feature Vector From Bored Database
for i=1:nof
    P=[P;vqf(i,:)];
end
%Feature Vector From Happy Database
for i=1:noh
    P=[P;vqh(i,:)];
end
%Feature Vector From Sad Database
for i=1:nos
    P=[P;vqs(i,:)];
end
%Feature Vector From Fear Database
for i=1:non
    P=[P;vqn(i,:)];
end
%Target Matrix
T=[repmat([1 0 0 0 0],noa,1);repmat([0 1 0 0 0],nof,1);repmat([0 0 1 0 0],noh,1);repmat([0 0 0 1 0],nos,1);repmat([0 0 0 0 1],non,1)];
%Training
net=newrb(P',T',0.0011);
close
pause(1);
global Y
Y=sim(net,vq');
[SortedScores,IX] = sort(Y);               %Sort scores increasing
global emo E
if IX(5,1)== 1
     emo='Angry';
     E=imread('ANGRY.jpg');
     elseif IX(5,1)== 2
         emo='Fear';
         E=imread('FEAR.jpg');
         elseif IX(5,1)== 3
            emo='Happy';
            E=imread('HAPPY.jpg');
            elseif IX(5,1)== 4
                  emo='Sad';
                  E=imread('SAD.jpg');
                  elseif IX(5,1)==5
                          emo='Neutral';
                          E=imread('NEUTRAL.jpg');
end
delete(h);