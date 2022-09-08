% Código que nos permite introducir una señal de voz, la cuál es procesada
% y a partir de ahí se obtienen los datos pertinentes para poder calcular
% la curtosis. Dicha variable es la que comparamos con ciertos rangos para
% determinar de que participante del equipo proviene la señal. 


%Se considera que para un análisis más exacto, y poder determinar con mayor
%precisión la persona que esta hablando utilizar los análisis estadísticos.
%Realizar un número n de grabaciones de cada integrante, para después
%sacar un promedio de cada variable estadística y respecto ello determinar
%ciertos límites ysacar un margen de error para determinar a quién 
% pertenece la voz. 
% Frase: La clase de señales es los lunes y los jueves 

recording = audiorecorder(8000,16,1);%Assigns the wanted audio data from the microphone;SamplingFrequency/Bitspersample/numberofChannels
disp('Start');
recordblocking(recording, 5); %Records for 5 senconds and assigns the wanted audio data
disp('Stop');
play(recording);%Plays the recording
recordingData = getaudiodata(recording);%saves the recording data in a new variable
save ("audioM", "recordingData"); %Saves the data in the computer HDD

load audioM.mat  %loads the saved data
curtosis = kurtosis(recordingData);%Makes the analisis of the curtosis

% This part returns whose the person in the recording, due to the limits we assign
if (curtosis < 9)
    disp('Ariadna')
elseif (curtosis < 15)
    disp('Natalia')
elseif (curtosis < 27 )
    disp('Manuel')  
else
    disp('Voz no reconocida. Intruso. Intruso. Intruso')
end
