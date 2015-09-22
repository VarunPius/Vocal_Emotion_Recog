function fearmfccDB()
h=waitbar(50,'Please wait while processing.');
global y
if y==1
    clc;
    tStart=tic();
    
    d=dir('../Samples2\Fear');
    a=struct2cell(d);
    a=a(1,3:length(a));
    nof=length(a);                           %Number Of files in the folder
    quant= 32;                              %Enter the order of Vector quantisation.(must b power of 2)
    
    for i=1:nof
        name=horzcat('../Samples2\Fear\',cell2mat(a(1,i)));
        [s1,fs]=wavread(name);
        s1 = s1(:,1);                            %pads with 150 ms silence
        s1 =s1.*2;                               %Doubles the amplitude of the vector
        s2 =s1 - mean(s1);                       %DC offset elimination
        n1 = nreduce(s2,fs);                     %Normalises the Matrix
        temp=mfccf(13,n1,fs);
        [vqf(i,:),vpf(i,:)]=vqsplit(temp,quant);   %Vector Quantization
    end

    %Followinf Statement generates the database of feature vectors for happy
    save fearmfccDBall.mat nof vqf
    t=horzcat('DATABASE FOR FEAR FEATURES IS SUCCESSFULLY CREATED.Time required is ',num2str(toc(tStart)),'Files loaded = ',num2str(length(a)));
    msgbox(t,'Congratulation','help');
end
if y==0
end
delete(h);
cd '../gui'