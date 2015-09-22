function tongen(Td)
Fs=44140;
Ft=440;
s=2*sin([1:Fs*Td]*2*pi*Ft/Fs);
soundsc(s, 44140);