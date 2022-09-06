%% Experiment_2
% Audio recording & collection of data
% This code is usefull to record 50 times and make an analysis of the
% output signals. 
%
% Phrase = "la clase de señales es los lunes y los jueves"

% recordingDataV = [];
% for n=1:50
%     recording = audiorecorder(8000,16,1);
%     disp('Start');
%     recordblocking(recording, 5);
%     disp('Stop');
%     %play(recording);
%     recordingData = getaudiodata(recording);
%     recordingDataV = [recordingDataV,recordingData];
%     pause
% end
% save ('audio1_50', "recordingDataV");

%% parte 2
clear all
close all
clc

load('audio1_50.mat');
n = length(recordingDataV);
Fs = 8000;
t  = 0:5/(n-1):5;

nexttile
plot(t,recordingDataV(:,2))% to select a specific column
title('Recording Data vs Time')
xlabel('t') ,ylabel('x(t)')

% Stadistic Analisis
m = mean(recordingDataV);%Media
v = var(recordingDataV);%Varianza
e = std(recordingDataV);%Desviación estandar
a = skewness(recordingDataV);%Asimetría
c = kurtosis(recordingDataV);%Curtosis
d = v/e;% Dispersión = varianza / desviación estandar

% Frequency Spectrum, data recovery and plot
recordingDatafft = fft(recordingDataV);%Obtenemos la transformada
recordingDatafft_abs = abs(recordingDatafft/n);
recordingDatafft_abs = recordingDatafft_abs(1:n/2+1);
f = Fs*(0:n/2)/n;

nexttile
plot(f,recordingDatafft_abs)
title('Frequency vs X(t)')
xlabel('Frequency'), ylabel('X(t)')

