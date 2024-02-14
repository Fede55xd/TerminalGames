@echo off
echo Bienvenido a TerminalGames
echo -
echo MENU DE SELECCION
echo Ingresa el numero del juego que deseas jugar o escribe (0 para salir): 
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

set /p "opcion=Elegir: "

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
echo Opción no válida. Por favor, ingresa un número de juego válido.
pause
exit /b

:jugarJuego
echo Jugando al juego: !juegoSeleccionado!

start "" "%carpeta%\!juegoSeleccionado!"

echo Presiona una tecla para continuar...
pause >nul