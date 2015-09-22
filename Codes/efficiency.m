%function efficiency();
%prog loads the databases
h=waitbar(50,'Finding efficiency...');
load nnet.mat net
load angrymfccDBall.mat
load fearmfccDBall.mat
load happymfccDBall.mat
load sadmfccDBall.mat
load neutralmfccDBall.mat

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

%finding Efficiency
aerror=[];
ferror=[];
herror=[];
serror=[];
nerror=[];

n=length(T);
for i=1:n
    temp=sim(net,P(i,:)');
    [s is]=sort(temp');
    [t it]=sort(T(i,:));
    if(is(1,5)~=it(1,5))
        if(i>=1 & i<=noa)
            aerror=[aerror;i];
        end
        if(i>noa & i<=(noa+nof))
            ferror=[ferror;i];
        end
        if(i>(noa+nof) & i<=(noa+nof+noh))
            herror=[herror;i];
        end
        if(i>(noa+nof+noh) & i<=(noa+nof+noh+nos))
            serror=[serror;i];
        end
        if(i>(noa+nof+noh+nos))
            nerror=[nerror;i];
        end
        %pause
    end
end
e=[];
e(1,1)=100*(noa-length(aerror))/noa;
e(2,1)=100*(nof-length(ferror))/nof;
e(3,1)=100*(noh-length(herror))/noh;
e(4,1)=100*(nos-length(serror))/nos;
e(5,1)=100*(non-length(nerror))/non;

terror=[aerror;ferror;herror;serror;nerror];
e(6,1)=100*(n-length(terror))/n;

    fprintf('Efficiency for Angry =%f\n',e(1,1));
    fprintf('Efficiency for Bored =%f\n',e(2,1));
    fprintf('Efficiency for Happy =%f\n',e(3,1));
    fprintf('Efficiency for Sad   =%f\n',e(4,1));
    fprintf('Efficiency for Fear  =%f\n',e(5,1));
    fprintf('Efficiency for Total =%f\n',e(6,1));
delete(h);
bar(e);
title('Efficiency');
xlabel('Emotions');
ylabel('Efficiency (%)');