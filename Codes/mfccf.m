function FMatrix=mfccf(num,s,Fs)
%Author:        Olutope Foluso Omogbenigun
%Email:         olutopeomogbenigun at hotmail.com
%University:    London Metropolitan University
%Date:          11/09/07
%Syntax:        M=mfccf(num,s, Fs);
%Computes and returns the mfcc coefficients for a speech signal s
%where num is the required number of MFCC coefficients. It utilises the 
%function 'melbankm' from the toolbox 'Voicebox' by Mike Brooks 
%, freely available on the internet, to implement the triangular mel 
%filter bank

n=512;              %Number of FFT points
Tf=0.025;           %Frame duration in seconds
N=floor(Fs*Tf);            %Number of samples per frame
fn=24;              %Number of mel filters
l=length(s);        %total number of samples in speech
Ts=0.01;            %Frame step in seconds
FrameStep=Fs*Ts;    %Frame step in samples
a=1;
b=[1, -0.97];       %a and b are high pass filter coefficients

noFrames=floor(l/FrameStep);    %Maximum no of frames in speech sample
FMatrix=zeros(noFrames-2, num); %Matrix to hold cepstral coefficients
lifter=1:num;                   %Lifter vector index
lifter=1+floor((num)/2)*(sin(lifter*pi/num));%raised sine lifter version

if mean(abs(s)) > 0.01
    s=s/max(s);                     %Normalises to compensate for mic vol differences
end

%Segment the signal into overlapping frames and compute MFCC coefficients
for i=1:noFrames-2
    frame=s((i-1)*FrameStep+1:(i-1)*FrameStep+N);  %Holds individual frames
    Ce1=sum(frame.^2);          %Frame energy
    Ce2=max(Ce1,2e-22);         %floors to 2 X 10 raised to power -22
    Ce=log(Ce2);
    framef=filter(b,a,frame-1);   %High pass pre-emphasis filter
    F=framef.*hamming(N);       %multiplies each frame with hamming window
    FFTo=fft(F,N);              %computes the fft
    melf=melbankm(fn,n,Fs);     %creates 24 filter, mel filter bank
    halfn=1+floor(n/2);    
    spectr1=log10(melf*abs(FFTo(1:halfn)).^2);%result is mel-scale filtered
    spectr=max(spectr1(:),1e-22);
    c=dct(spectr);              %obtains DCT, changes to cepstral domain
    c(1)=Ce;                    %replaces first coefficient
    coeffs=c(1:num);            %retains first num coefficients
    ncoeffs=coeffs.*lifter';    %Multiplies coefficients by lifter value
    FMatrix(i, :)=ncoeffs';     %assigns mfcc coeffs to succesive rows i
end
FMatrix=to_row(FMatrix);        %%Converts to row matrix
%Call the deltacoeff function to compute derivatives of MFCC
%coefficients; add all together to yield a matrix with 3*num columns 
d=(deltacoeff(FMatrix)).*0.6;   %Computes delta-mfcc
d1=(deltacoeff(d)).*0.4;        %as above for delta-delta-mfcc
FMatrix=[FMatrix,d,d1];         %concatenates all together
