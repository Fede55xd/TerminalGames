@echo off
setlocal enabledelayedexpansion

title Juego de Ordenar Palabras - Presiona Ctrl+C para salir

set "score=0"

:gameLoop
cls
echo Puntuacion: !score!

REM Genera una palabra aleatoria
call :generateRandomWord

REM Muestra la palabra desordenada
echo Ordena la palabra: %randomWord%

REM Lee la respuesta del jugador
set /p "userInput=Tu respuesta: "

REM Comprueba si la respuesta es correcta
if /i "!userInput!"=="!sortedWord!" (
    echo ¡Correcto!
    set /a "score+=1"
) else (
    echo Respuesta incorrecta. La palabra correcta es: !sortedWord!
)

REM Espera antes de la próxima iteración
timeout /nobreak /t 2 >nul
goto gameLoop

:generateRandomWord
REM Lista de palabras y sus palabras ordenadas correspondientes
set "words[0]=TGOA"
set "sortedWords[0]=GATO"

set "words[1]=IDCMOA"
set "sortedWords[1]=COMIDA"

set "words[2]=CEHLEUP"
set "sortedWords[2]=PELUCHE"

set "words[3]=PATLPO"
set "sortedWords[3]=LAPTOP"

set "words[4]=ÁIPDOR"
set "sortedWords[4]=RAPIDO"

set "words[5]=PÁZLI"
set "sortedWords[5]=LAPIZ"

set "words[6]=LDEUC"
set "sortedWords[6]=DULCE"

set "words[7]=CSUMIA"
set "sortedWords[7]=MUSICA"

set "words[8]=EMIITL"
set "sortedWords[8]=LIMITE"

set "words[9]=MRÁACA"
set "sortedWords[9]=CÁMARA"

set "words[10]=TORTARE"
set "sortedWords[10]=RETRATO"

set "words[11]=CÉHILE"
set "sortedWords[11]=HELICE"

set "words[12]=NELUT"
set "sortedWords[12]=TUNEL"

set "words[13]=ARBNA"
set "sortedWords[13]=BANAR"

set "words[14]=ANJRMA"
set "sortedWords[14]=MANJAR"

set "words[15]=STICHE"
set "sortedWords[15]=CHISTE"

set "words[16]=USEOQB"
set "sortedWords[16]=BOSQUE"

set "words[17]=IRTGAR"
set "sortedWords[17]=GRITAR"

set "words[18]=ELUOCL"
set "sortedWords[18]=CUELLO"

set "words[19]=INDARJ"
set "sortedWords[19]=JARDIN"

set "words[20]=ECAMTA"
set "sortedWords[20]=MACETA"

set "words[21]=UGPLAR"
set "sortedWords[21]=PULGAR"

set "words[22]=RECRAR"
set "sortedWords[22]=CERRAR"

set "words[23]=HULCRA"
set "sortedWords[23]=LUCHAR"

set "words[24]=NABCLO"
set "sortedWords[24]=BLANCO"

set "words[25]=ARLBILR"
set "sortedWords[25]=BRILLAR"

set "words[26]=ILBORL"
set "sortedWords[26]=BRILLO"

set "words[27]=ECZAIN"
set "sortedWords[27]=CENIZA"

set "words[28]=MOSRBA"
set "sortedWords[28]=SOMBRA"

set "words[29]=RSEETU"
set "sortedWords[29]=SUERTE"

set "words[30]=NICBOA"
set "sortedWords[30]=BOCINA"

set "words[31]=AFRAIJ"
set "sortedWords[31]=JIRAFA"

set "words[32]=CCOEH"
set "sortedWords[32]=COCHE"

set "words[33]=SMAUPE"
set "sortedWords[33]=ESPUMA"

set "words[34]=AMRATP"
set "sortedWords[34]=TRAMPA"

set "words[35]=TLAFUA"
set "sortedWords[35]=FLAUTA"

set "words[36]=ARECDU"
set "sortedWords[36]=CUERDA"

set "words[37]=AVODEN"
set "sortedWords[37]=VENADO"

set "words[38]=REPOR"
set "sortedWords[38]=PERRO"

set "words[39]=DLARLIA"
set "sortedWords[39]=ARDILLA"

set "words[40]=CDRUAO"
set "sortedWords[40]=CUADRO"

set "words[41]=PRUECO"
set "sortedWords[41]=CUERPO"

set "words[42]=OLEBATL"
set "sortedWords[42]=BOTELLA"

set "words[43]=PAMLRAA"
set "sortedWords[43]=LAMPARA"

set "words[44]=FERPUEM"
set "sortedWords[44]=PERFUME"

set "words[45]=SCODI"
set "sortedWords[45]=DISCO"

set "words[46]=TANPIUR"
set "sortedWords[46]=PINTURA"

set "words[47]=RUITGARA"
set "sortedWords[47]=GUITARRA"

set "words[48]=TANMA"
set "sortedWords[48]=MANTA"

set "words[49]=AMRARIO"
set "sortedWords[49]=ARMARIO"

set "words[50]=CLIOABEBIT"
set "sortedWords[50]=BIBLIOTECA"

set "words[51]=RRILIABE"
set "sortedWords[51]=LIBRERIA"

set "words[52]=CSELEUA"
set "sortedWords[52]=ESCUELA"

set "words[53]=IVERUSDDAIN"
set "sortedWords[53]=UNIVERSIDAD"

set "words[54]=TARUEP"
set "sortedWords[54]=PUERTA"

set "words[55]=JOEESP"
set "sortedWords[55]=ESPEJO"

set "words[56]=ENAATNV"
set "sortedWords[56]=VENTANA"

set "words[57]=TIBBSCOMULE"
set "sortedWords[57]=COMBUSTIBLE"

set "words[58]=LATAPN"
set "sortedWords[58]=PLANTA"

set "words[59]=DOCAMER"
set "sortedWords[59]=MERCADO"

set "words[60]=CARMADOR"
set "sortedWords[60]=MARCADOR"

set "words[61]=PLTARNAE"
set "sortedWords[61]=PARLANTE"

set "words[62]=LARCLUE"
set "sortedWords[62]=CELULAR"

set "words[63]=PUTDAOCOMRA"
set "sortedWords[63]=COMPUTADORA"

set "words[64]=TERNEF"
set "sortedWords[64]=FERNET"

set "words[65]=ULCICHLO"
set "sortedWords[65]=CUCHILLO"

set /a "randomIndex=!random! %% 3"

set "randomWord=!words[%randomIndex%]!"
set "sortedWord=!sortedWords[%randomIndex%]!"

exit /b
