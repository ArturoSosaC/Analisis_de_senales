clear
clc

q=6;
f1=2500;

% Grabar voz 1
recObj = audiorecorder;
disp('Persona 1:')
recordblocking(recObj, q);
disp('Fin de la grabación');
% Store data in double-precision array.
myRecording = getaudiodata(recObj);
% Time axis
qa=recObj.TotalSamples;
t=(0:q/qa:q-q/qa)';

% Grabar voz 2
recObj2 = audiorecorder;
disp('Persona 2: ')
recordblocking(recObj2, q);
disp('Fin de la grabación');
% Store data in double-precision array.
myRecording2 = getaudiodata(recObj2); 
% Time axis
qa2=recObj2.TotalSamples;
t=(0:q/qa2:q-q/qa2)';

% Grabar voz de prueba
recObj3 = audiorecorder;
disp('Persona de prueba: ')
recordblocking(recObj3, q);
disp('Fin de la grabación');
% Store data in double-precision array.
myRecording3 = getaudiodata(recObj3); 
% Time axis
qa3=recObj3.TotalSamples;
t=(0:q/qa3:q-q/qa3)';

% Dominio de frecuencia 1
Ts=q/qa; %sampling time
fs=1/Ts; %sampling frequency
[na,nb]=size(t(:)); % na=number of points of signal
ff=fs*[0:na-1]/na-fs/2;
dom_frec = fftshift(abs(fft(myRecording)));

% Dominio en frecuencia 2
Ts2=q/qa2; %sampling time
fs2=1/Ts2; %sampling frequency
[na,nb]=size(t(:)); % na=number of points of signal
ff2=fs*[0:na-1]/na-fs2/2;
dom_frec2 = fftshift(abs(fft(myRecording2)));

% Dominio en frecuencia de prueba
Ts3=q/qa3; %sampling time
fs3=1/Ts3; %sampling frequency
[na,nb]=size(t(:)); % na=number of points of signal
ff3=fs*[0:na-1]/na-fs3/3;
dom_frec3 = fftshift(abs(fft(myRecording3)));

%cdf frecuencia 
pd = makedist('Normal');
cdf_1 = cdf(pd, dom_frec);
cdf_2 = cdf(pd, dom_frec2);
cdf_3 = cdf(pd, dom_frec3);

%pdf frecuencia
pdf_1 = pdf(pd,dom_frec);
pdf_2 = pdf(pd,dom_frec2);
pdf_3 = pdf(pd,dom_frec3);

%correlación frecuencia
corr_frec_1 = corrcoef(dom_frec, dom_frec3);
corr_frec_2 = corrcoef(dom_frec2, dom_frec3);

%Correlación pdf
corr_pdf_1 = corrcoef(pdf_1, pdf_3);
corr_pdf_2 = corrcoef(pdf_2, pdf_3);

%Correlación cdf
corr_cdf_1 = corrcoef(cdf_1, cdf_3);
corr_cdf_2 = corrcoef(cdf_2, cdf_3);

%Promedio correlaciones
promedio_c_1 = (corr_frec_1(1,2) + corr_pdf_1(1,2) + corr_cdf_1(1,2))/3;
promedio_c_2 = (corr_frec_2(1,2) + corr_pdf_2(1,2) + corr_cdf_2(1,2))/3;


if (promedio_c_1 > 0.5) && (promedio_c_1 > promedio_c_2)
    disp('Habló la persona 1 ')
elseif (promedio_c_2 > 0.5) && (promedio_c_2 > promedio_c_1)
    disp('Habló la persona 2 ')
else
    disp('No se puede diferenciar la voz')
end


