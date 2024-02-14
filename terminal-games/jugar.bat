@echo off
echo Bienvenid@ a TerminalGames
echo Este es un programa el cual es capaz de ejecutar juegos básicos directamente desde la terminal (cmd) de Windows.
echo Este programa y los juegos que están en el fueron creados por Sebastian (RobleUY) y están dirigidos principalmente a usuarios con computadoras no tan potentes.
echo puede ser ejecutado en computadoras de gama alta pero está enfocado principalmente para aquellas personas que no tienen la posibilidad de ejecutar juegos más elaborados.
echo con este programa la posibilidad de divertirse amplia el público y hace posible que aquellas personas con recursos limitados puedan divertirse y enfrentar el aburrimiento
echo 
echo Gracias por leer y por descargar.
echo --------------------------------------


set "carpeta=juegos"


if not exist "%carpeta%\" (
    echo La carpeta "%carpeta%" no existe.
    pause
    exit /b
)


setlocal enabledelayedexpansion
set "contador=1"
for %%i in ("%carpeta%\*.bat") do (
    echo !contador!. %%~nxi
    set /a "contador+=1"
)

echo --------------------------------------


set /p "opcion=Ingresa el numero del juego que deseas jugar o escribe (0 para salir): "


if "%opcion%" equ "0" (
    echo Saliendo del programa.
    pause
    exit /b
)

set /a "opcionValida=%opcion%"
if !opcionValida! leq 0 goto opcionInvalida
if !opcionValida! gtr !contador! goto opcionInvalida


set "juegoSeleccionado="
set /a "indice=0"
for %%i in ("%carpeta%\*.bat") do (
    set /a "indice+=1"
    if !indice! equ !opcionValida! (
        set "juegoSeleccionado=%%~nxi"
        goto jugarJuego
    )
)

:opcionInvalida
echo Opcion no valida. Por favor, ingresa un numero de juego valido.
pause
exit /b

:jugarJuego
echo Jugando al juego: !juegoSeleccionado!

start "" "%carpeta%\!juegoSeleccionado!"

echo Presiona una tecla para continuar...
pause >nul
exit /b
