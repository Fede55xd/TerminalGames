@echo off
setlocal enabledelayedexpansion

set "adivinanzas[0]=Blanca por dentro, verde por fuera. Si quieres que te lo diga, espera."
set "opciones[0]=A) Banana B) Manzana C) Sand�a"
set "respuesta_correcta[0]=A"

set "adivinanzas[1]=En un d�a de nieve, blanca como el papel, se forma en el suelo, una capa de... �Qu� es?"
set "opciones[1]=A) Nieve B) Hielo C) Arena"
set "respuesta_correcta[1]=A"

set "adivinanzas[2]=Cuatro patas tiene mi mesa, como tu gato o tu perra, pero yo no tengo orejas, ni cabeza ni cabellera."
set "opciones[2]=A) Silla B) Perro C) Mesa"
set "respuesta_correcta[2]=A"

set "adivinanzas[3]=Tiene ojos y no ve, tiene pico y no come, tiene alas y no vuela. �Qu� es?"
set "opciones[3]=A) Reloj B) P�jaro C) Libro"
set "respuesta_correcta[3]=B"

set "adivinanzas[4]=Aunque no es cami�n lleva carga, tiene ruedas y avanzar le embarga. �Qu� es?"
set "opciones[4]=A) Bicicleta B) Coche C) Tren"
set "respuesta_correcta[4]=B"

set "adivinanzas[5]=En la cara me maquillo, en la oreja brillante luzco. �Qu� soy?"
set "opciones[5]=A) Sol B) Luna C) Estrella"
set "respuesta_correcta[5]=B"

set "adivinanzas[6]=Blanca por dentro, verde por fuera. �Qu� es?"
set "opciones[6]=A) Lim�n B) Manzana C) Pepino"
set "respuesta_correcta[6]=C"

set "adivinanzas[7]=Es redonda como el sol, pero no da luz. �Qu� es?"
set "opciones[7]=A) Pelota B) Luna C) Naranja"
set "respuesta_correcta[7]=C"

set "adivinanzas[8]=De muchos colores me encuentras en el cielo. �Qu� soy?"
set "opciones[8]=A) Flor B) Mariposa C) Arco�ris"
set "respuesta_correcta[8]=C"

set "adivinanzas[9]=En el d�a estoy escondido, en la noche ilumino el camino. �Qu� soy?"
set "opciones[9]=A) Sol B) Luna C) Estrella"
set "respuesta_correcta[9]=C"

set "adivinanzas[10]=Tiene patas pero no camina, tiene cabeza pero no piensa. �Qu� es?"
set "opciones[10]=A) Silla B) Perro C) Mesa"
set "respuesta_correcta[10]=A"

set "adivinanzas[11]=Vuela sin alas, llora sin ojos. �Qu� es?"
set "opciones[11]=A) Viento B) Nube C) P�jaro"
set "respuesta_correcta[11]=B"

set "adivinanzas[12]=Es blanco como la leche y tiene dientes de papel. �Qu� es?"
set "opciones[12]=A) Tijeras B) Hueso C) Carta"
set "respuesta_correcta[12]=C"

set "adivinanzas[13]=Siempre estoy en el agua pero nunca me mojo. �Qu� soy?"
set "opciones[13]=A) Pez B) Sombra C) Agua"
set "respuesta_correcta[13]=B"

set "adivinanzas[14]=En la punta de un l�piz siempre estoy, pero no soy una letra ni soy una palabra. �Qu� soy?"
set "opciones[14]=A) Borrador B) Pluma C) Punta"
set "respuesta_correcta[14]=A"

set "adivinanzas[15]=Vuelo sin alas, siempre voy hacia adelante, nunca me detengo. �Qu� soy?"
set "opciones[15]=A) Flecha B) P�jaro C) Nube"
set "respuesta_correcta[15]=A"

set "adivinanzas[16]=Tengo ojos pero no veo, tengo piernas pero no camino. �Qu� soy?"
set "opciones[16]=A) Peluche B) Mu�eca C) Retrato"
set "respuesta_correcta[16]=C"

set "adivinanzas[17]=Me encuentras en la cocina, soy redonda y deliciosa. �Qu� soy?"
set "opciones[17]=A) Pizza B) Hamburguesa C) Tarta"
set "respuesta_correcta[17]=A"

set "adivinanzas[18]=Viste de verde y en el campo se encuentra, da sombra y ox�geno. �Qu� es?"
set "opciones[18]=A) R�o B) �rbol C) Monta�a"
set "respuesta_correcta[18]=B"

set "adivinanzas[19]=Soy una fuente de luz en el cielo, pero no soy el sol. �Qu� soy?"
set "opciones[19]=A) Estrella B) Luna C) Cometa"
set "respuesta_correcta[19]=C"

set /a total_adivinanzas=20

:inicio
cls
set /a indice_adivinanza=!random! %% total_adivinanzas

echo Adivinanza:
echo !adivinanzas[%indice_adivinanza%]!

echo Opciones:
echo !opciones[%indice_adivinanza%]!

set /p "respuesta=Tu respuesta (A/B/C): "

if /i "!respuesta!" equ "!respuesta_correcta[%indice_adivinanza%]!" (
    echo �Correcto!
) else (
    echo Respuesta incorrecta.
)

pause
goto inicio
