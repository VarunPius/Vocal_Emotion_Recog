function vq=vquantize()
global s1 s2 s3 s4 s5 s6 fs
global quant
quant=32;

s1 = s1(:,1);                            %pads with 150 ms silence
s1 =s1.*2;                               %Doubles the amplitude of the vector
s1 =s1 - mean(s1);                       %DC offset elimination
n1 = nreduce(s1,fs);                     %Normalises the Matrix
temp=mfccf(13,n1,fs);
[vq(1,:),vp(1,:)]=vqsplit(temp,quant);   %Vector Quantization

s2 = s2(:,1);                            %pads with 150 ms silence
s2 =s2.*2;                               %Doubles the amplitude of the vector
s2 =s2 - mean(s2);                       %DC offset elimination
n2 = nreduce(s2,fs);                     %Normalises the Matrix
temp=mfccf(13,n2,fs);
[vq(2,:),vp(2,:)]=vqsplit(temp,quant);   %Vector Quantization

s3 = s3(:,1);                            %pads with 150 ms silence
s3 =s3.*2;                               %Doubles the amplitude of the vector
s3 =s3 - mean(s3);                       %DC offset elimination
n3 = nreduce(s2,fs);                     %Normalises the Matrix
temp=mfccf(13,n3,fs);
[vq(3,:),vp(3,:)]=vqsplit(temp,quant);   %Vector Quantization

s4 = s4(:,1);                            %pads with 150 ms silence
s4 =s4.*2;                               %Doubles the amplitude of the vector
s4 =s4 - mean(s4);                       %DC offset elimination
n4 = nreduce(s4,fs);                     %Normalises the Matrix
temp=mfccf(13,n4,fs);
[vq(4,:),vp(4,:)]=vqsplit(temp,quant);   %Vector Quantization

s5 = s5(:,1);                            %pads with 150 ms silence
s5 =s5.*2;                               %Doubles the amplitude of the vector
s5 =s5 - mean(s5);                       %DC offset elimination
n5 = nreduce(s5,fs);                     %Normalises the Matrix
temp=mfccf(13,n5,fs);
[vq(5,:),vp(5,:)]=vqsplit(temp,quant);   %Vector Quantization

s6 = s6(:,1);                            %pads with 150 ms silence
s6 =s6.*2;                               %Doubles the amplitude of the vector
s6 =s6 - mean(s6);                       %DC offset elimination
n6 = nreduce(s6,fs);                     %Normalises the Matrix
temp=mfccf(13,n6,fs);
[vq(6,:),vp(6,:)]=vqsplit(temp,quant);   %Vector Quantization
