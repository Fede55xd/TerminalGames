@echo off
title Juego de Dados
color 0B

set jugador1Puntuacion=0
set jugador2Puntuacion=0

echo ¡Bienvenido al Juego de Dados!

:iniciarJuego
cls
echo Puntuación actual:
echo Jugador 1: %jugador1Puntuacion%
echo Jugador 2: %jugador2Puntuacion%
echo.

REM Turno del Jugador 1
set /p "lanzar=Lanzar los dados Jugador 1 (S/N): "
if /i "%lanzar%" equ "S" (
    call :lanzarDado jugador1

    echo.
    echo Resultados del lanzamiento Jugador 1:
    echo Jugador 1: %jugador1DadoResultado%
    echo.

    set /a "jugador1Puntuacion+=jugador1DadoResultado"

    if %jugador1Puntuacion% geq 20 (
        echo ¡Felicidades Jugador 1! ¡Has ganado el juego!
        goto :finJuego
    ) else (
        timeout /nobreak /t 2 >nul
    )
) else (
    echo Gracias por jugar Jugador 1.
)

REM Turno del Jugador 2
set /p "lanzar=Lanzar los dados Jugador 2 (S/N): "
if /i "%lanzar%" equ "S" (
    call :lanzarDado jugador2

    echo.
    echo Resultados del lanzamiento Jugador 2:
    echo Jugador 2: %jugador2DadoResultado%
    echo.

    set /a "jugador2Puntuacion+=jugador2DadoResultado"

    if %jugador2Puntuacion% geq 20 (
        echo ¡Felicidades Jugador 2! ¡Has ganado el juego!
        goto :finJuego
    ) else (
        timeout /nobreak /t 2 >nul
        goto :iniciarJuego
    )
) else (
    echo Gracias por jugar Jugador 2. ¡Hasta la próxima!
)

:finJuego
echo.
echo Puntuación final:
echo Jugador 1: %jugador1Puntuacion%
echo Jugador 2: %jugador2Puntuacion%
pause >nul
goto :eof

:lanzarDado
setlocal enabledelayedexpansion
set /a "dadoResultado=!random! %% 6 + 1"
endlocal & set "%1DadoResultado=%dadoResultado%"
goto :eof
