@echo off
echo Lista de Juegos en la Carpeta "juegos":
echo --------------------------------------

rem Cambia la ruta de la carpeta según tu ubicación
set "carpeta=juegos"

rem Verificar si la carpeta existe
if not exist "%carpeta%\" (
    echo La carpeta "%carpeta%" no existe.
    pause
    exit /b
)

rem Listar los juegos con números
setlocal enabledelayedexpansion
set "contador=1"
for %%i in ("%carpeta%\*.bat") do (
    echo !contador!. %%~nxi
    set /a "contador+=1"
)

echo --------------------------------------

rem Solicitar al usuario elegir un juego
set /p "opcion=Ingresa el numero del juego que deseas jugar (0 para salir): "

rem Validar la opción
if "%opcion%" equ "0" (
    echo Saliendo del programa.
    pause
    exit /b
)

set /a "opcionValida=%opcion%"
if !opcionValida! leq 0 goto opcionInvalida
if !opcionValida! gtr !contador! goto opcionInvalida

rem Obtener el nombre del juego seleccionado
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

rem Ejecutar el juego seleccionado con el comando "start"
start "" "%carpeta%\!juegoSeleccionado!"

echo Presiona una tecla para continuar...
pause >nul
exit /b
