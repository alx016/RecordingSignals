%% Experiment_1
% Audio recording & collection of data

% Uncomment the next section if needed.

%  recording = audiorecorder(8000,16,1); %applys a 8000 Hz, 16 bits per sample, and one number of chanels
%  disp('Start');
%  recordblocking(recording, 5); %makes a recording of 5 seconds
%  disp('Stop');
%  play(recording);
%  recordingData = getaudiodata(recording); %gets the important data out of the recording
%  save ("audio", "recordingData");

%% Part 2
clear all
close all
clc

% Loading Data
load('audio.mat')
n=length(recordingData);
Fs = 8000;%Sampling Frequency
t  = 0:5/(n-1):5; %Time vector

% plot
nexttile
plot(recordingData)
title('Recording Data')

nexttile
plot(t,recordingData)
title('Recording Data vs Time')
xlabel('t') ,ylabel('x(t)')

% Stadistic Analysis
m = mean(recordingData);%Media
v = var(recordingData);%Varianza
e = std(recordingData);%Desviación estandar
a = skewness(recordingData);%Asimetría
c = kurtosis(recordingData);%Curtosis
d = v/e;% Dispersión = varianza / desviación estandar

% Frequency Spectrum, data recovery and plot
recordingDatafft = fft(recordingData);%Obtenemos la transformada
recordingDatafft_abs = abs(recordingDatafft/n);
recordingDatafft_abs = recordingDatafft_abs(1:n/2+1);
f = Fs*(0:n/2)/n;

nexttile
plot(f,recordingDatafft_abs)
title('Frequency vs X(t)')
xlabel('Frequency'), ylabel('X(t)')
