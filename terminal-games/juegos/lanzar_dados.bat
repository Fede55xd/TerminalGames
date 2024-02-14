@echo off
title Juego de Dados
color 0B

set jugadorPuntuacion=0
set RobleUYPuntuacion=0

echo ¡Bienvenido al Juego de Dados!

:iniciarJuego
cls
echo Puntuación actual:
echo Tu: %jugadorPuntuacion%
echo RobleUY: %RobleUYPuntuacion%
echo.

set /p "lanzar=Lanzar los dados (S/N): "
if /i "%lanzar%" equ "S" (
    call :lanzarDado jugador
    call :lanzarDado RobleUY

    echo.
    echo Resultados del lanzamiento:
    echo Tu: %jugadorDadoResultado%
    echo RobleUY: %RobleUYDadoResultado%
    echo.

    set /a "jugadorPuntuacion+=jugadorDadoResultado"
    set /a "RobleUYPuntuacion+=RobleUYDadoResultado"

    echo Nueva Puntuación:
    echo Tu: %jugadorPuntuacion%
    echo RobleUY: %RobleUYPuntuacion%

    if %jugadorPuntuacion% geq 20 (
        echo ¡Felicidades! ¡Has ganado el juego!
        goto :finJuego
    ) else if %RobleUYPuntuacion% geq 20 (
        echo ¡RobleUY ha ganado el juego!
        goto :finJuego
    ) else (
        timeout /nobreak /t 2 >nul
        goto :iniciarJuego
    )
) else (
    echo Gracias por jugar. ¡Hasta la próxima!
)

:finJuego
echo.
echo Puntuación final:
echo Tu: %jugadorPuntuacion%
echo RobleUY: %RobleUYPuntuacion%
pause >nul
goto :eof

:lanzarDado
setlocal enabledelayedexpansion
set /a "dadoResultado=!random! %% 6 + 1"
endlocal & set "%1DadoResultado=%dadoResultado%"
goto :eof
