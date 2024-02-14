@echo off
setlocal EnableDelayedExpansion

color 0a

set /a saldo=100
set /a ganancia_objetivo=1000
set porcentaje_ganar=70
:inicio
cls
echo ------------------------------------------------------------
echo           Juego de Apuestas
echo ------------------------------------------------------------
echo Creador del juego: Sebastian Mata
echo Saldo actual: !saldo!  Objetivo: %ganancia_objetivo%
echo ------------------------------------------------------------

set /p apuesta="Ingresa la cantidad para apostar ('salir' para salir): "
if "%apuesta%"=="salir" goto fin

if !apuesta! leq 0 (
    echo ------------------------------------------------------------
    echo Ingresa una apuesta valida.
    echo ------------------------------------------------------------
    timeout /nobreak /t 2 >nul
    goto inicio
)

if !apuesta! gtr !saldo! (
    echo ------------------------------------------------------------
    echo No puedes apostar mas de lo que tienes.
    echo ------------------------------------------------------------
    timeout /nobreak /t 2 >nul
    goto inicio
)

set /a resultado=!random! %% 100 + 1

if !resultado! lss %porcentaje_ganar% (
    set /a ganancia=apuesta
    set /a saldo+=ganancia
    echo ------------------------------------------------------------
    echo La moneda cayo en cara y ganaste: +!ganancia!
    echo ------------------------------------------------------------
) else (
    set /a perdida=apuesta
    set /a saldo-=perdida
    echo ------------------------------------------------------------
    echo La moneda cayo en cruz y perdiste: -!perdida!
    echo ------------------------------------------------------------
)

if !saldo! geq %ganancia_objetivo% (
    echo ------------------------------------------------------------
    echo ¡Felicidades! Has alcanzado el objetivo de %ganancia_objetivo%. Ganaste el juego.
    echo ------------------------------------------------------------
    goto fin
)

if !saldo! leq 0 (
    echo ------------------------------------------------------------
    echo ¡Oh no! Te has quedado sin saldo. Has perdido el juego.
    echo ------------------------------------------------------------
    goto fin
)

timeout /nobreak /t 2 >nul
goto inicio

:fin
echo ------------------------------------------------------------
echo Gracias por jugar.
echo Tu saldo final es: !saldo!
echo Pulsa una tecla para salir.
echo ------------------------------------------------------------
pause >nul
