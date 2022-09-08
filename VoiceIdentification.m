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

recording = audiorecorder(8000,16,1);%records audio data from the microphone;SamplingFrequency/Bitspersample/numberofChannels
disp('Start');
recordblocking(recording, 5); %records for 5 senconds
disp('Stop');
play(recording);//plays the recording
recordingData = getaudiodata(recording);//saves the recording data in a new variable
save ("audioM", "recordingData"); //saves the data in the computer HDD

load audioM.mat
curtosis = kurtosis(recordingData);%Curtosis

if (curtosis < 9)
    disp('Ariadna')
elseif (curtosis < 15)
    disp('Natalia')
elseif (curtosis < 27 )
    disp('Manuel')  
else
    disp('Voz no reconocida. Intruso. Intruso. Intruso')
end
