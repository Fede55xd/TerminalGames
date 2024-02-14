@echo off
title Simulador de Batalla
color 0B

set jugadorSalud=100
set enemigoSalud=100
set /a turno=1

echo Bienvenido al Simulador de Batalla!

:turno
cls
echo ---------------------------------
echo             Turno %turno%
echo ---------------------------------
echo TU TIENES: %jugadorSalud% de salud
echo ROBLEUY TIENE: %enemigoSalud% de salud
echo.

echo Opciones:
echo 1. Atacar
echo 2. Defender

set /p opcion="Elige tu accion: "

if %opcion% equ 1 (
    call :atacar
) else if %opcion% equ 2 (
    call :defender
) else (
    echo Opcion no valida. Intenta de nuevo.
    timeout /nobreak /t 2 >nul
    goto turno
)

call :verificarGanador
set /a turno+=1
goto turno

:atacar
set /a quitaVidaJugador=%RANDOM% %% 20 + 10
set /a quitaVidaEnemigo=%RANDOM% %% 15 + 5

echo.
echo ¡Atacas a RobleUY!
echo Quitas %quitaVidaJugador% de vida.
set /a enemigoSalud-=%quitaVidaJugador%

echo.
echo RobleUY contraataca.
echo Te quita %quitaVidaEnemigo% de vida.
set /a jugadorSalud-=%quitaVidaEnemigo%

timeout /nobreak /t 2 >nul
goto :eof

:defender
set /a quitaVidaEnemigo=%RANDOM% %% 10 + 5

echo.
echo Te pones en posicion defensiva.
echo Reduces el dano recibido.

echo.
echo El enemigo ataca.
echo Te quita %quitaVidaEnemigo% de vida (reducido por la defensa).
set /a jugadorSalud-=%quitaVidaEnemigo%

timeout /nobreak /t 2 >nul
goto :eof

:verificarGanador
if %jugadorSalud% leq 0 (
    echo Has sido derrotado. ¡RobleUY gana!
    goto :fin
) else if %enemigoSalud% leq 0 (
    echo ¡Has derrotado a RobleUY! ¡Eres el ganador!
    goto :fin
)
goto :eof

:fin
echo.
echo Juego terminado.
pause >nul
