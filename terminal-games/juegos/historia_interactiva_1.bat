@echo off
title Juego de Aventuras
color 0B

echo Bienvenido al Juego de Aventuras!

:inicio
echo.
echo Te encuentras en un misterioso bosque. Frente a ti, el camino se divide en dos.
echo Puedes sentir la emoci�n de la aventura en el aire.
echo.
echo Opciones:
echo 1. Tomar el camino de la izquierda.
echo 2. Tomar el camino de la derecha.

set /p eleccion="Elige tu camino (1/2): "

if "%eleccion%" equ "1" (
    call :caminoIzquierda
) else if "%eleccion%" equ "2" (
    call :caminoDerecha
) else (
    echo Elecci�n no v�lida. Intenta de nuevo.
    timeout /nobreak /t 2 >nul
    goto :inicio
)

:fin
echo.
echo Gracias por jugar. �Hasta la pr�xima!
pause >nul
goto :eof

:caminoIzquierda
echo.
echo Tomas el camino de la izquierda y te adentras en un denso bosque.
echo Sientes la frescura del aire y escuchas el canto de los p�jaros.
echo Llegas a un claro donde encuentras un arco y una flecha.
echo.
echo Opciones:
echo 1. Tomar el arco y explorar m�s el bosque.
echo 2. Continuar por el camino sin tomar el arco.

set /p eleccion="�Qu� decides hacer? (1/2): "

if "%eleccion%" equ "1" (
    echo Tomas el arco y exploras m�s el bosque.
    echo Encuentras una criatura m�gica amigable que te gu�a.
    echo Finalmente, llegas a un antiguo templo lleno de tesoros.
    goto :finalBueno
) else if "%eleccion%" equ "2" (
    echo Decides continuar por el camino sin tomar el arco.
    echo Te topas con un grupo de bandidos, pero logras esquivarlos.
    echo Encuentras un atajo que te lleva a un pueblo tranquilo.
    goto :finalNeutro
) else (
    echo Elecci�n no v�lida. Intenta de nuevo.
    timeout /nobreak /t 2 >nul
    goto :caminoIzquierda
)

:caminoDerecha
echo.
echo Tomas el camino de la derecha y te sumerges en una gruta oscura.
echo Escuchas susurros misteriosos y sientes un escalofr�o.
echo Encuentras una l�mpara antigua cerca del suelo.
echo.
echo Opciones:
echo 1. Tomar la l�mpara y explorar m�s la gruta.
echo 2. Continuar por el camino sin tomar la l�mpara.

set /p eleccion="�Qu� decides hacer? (1/2): "

if "%eleccion%" equ "1" (
    echo Tomas la l�mpara y exploras m�s la gruta.
    echo Descubres un pasaje secreto que te lleva a una ciudad subterr�nea.
    echo Te conviertes en amigo de los habitantes y compartes historias.
    goto :finalBueno
) else if "%eleccion%" equ "2" (
    echo Decides continuar por el camino sin tomar la l�mpara.
    echo Encuentras una salida que te lleva a una pradera soleada.
    echo Te cruzas con un mercader amistoso que te ofrece un regalo.
    goto :finalNeutro
) else (
    echo Elecci�n no v�lida. Intenta de nuevo.
    timeout /nobreak /t 2 >nul
    goto :caminoDerecha
)

:finalBueno
echo.
echo �Felicidades! Has tenido un final exitoso en tu emocionante aventura.
goto :fin

:finalNeutro
echo.
echo Has llegado al final de tu aventura. Aunque no fue extraordinaria, fue una experiencia interesante.
goto :fin
