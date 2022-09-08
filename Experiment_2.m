%% Experiment_2
% Audio recording & collection of data
% This code is usefull to record 50 times and make an analysis of the
% output signals. 
%
% Phrase = "la clase de señales es los lunes y los jueves"


% Uncomment the next section to start with the 50 recordings, 
% use any key to pass from recording to recording

% recordingDataV = []; % Matrix initialization 
% for n=1:50 % Loop 1 to 50 
%     recording = audiorecorder(8000,16,1); % Assigns the recording data we demand
%     disp('Start');
%     recordblocking(recording, 5); %Initializa a 5 seconds recording
%     disp('Stop');
%     %play(recording); 
%     recordingData = getaudiodata(recording); %saves the recorded audio data in a variable 
%     recordingDataV = [recordingDataV,recordingData]; % saves and unifies the data in a matrix
%     pause
% end
% save ('audio1_50', "recordingDataV"); %Saves the data in the HDD

%% parte 2
clear all
close all
clc

load('audio1_50.mat'); 
n = length(recordingDataV);
Fs = 8000;
t  = 0:5/(n-1):5;

%Plots the recordingDataV data vs time
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

