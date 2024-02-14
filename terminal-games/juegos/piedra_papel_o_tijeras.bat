@echo off
title Piedra, Papel o Tijeras - RobleUY

set victorias=0
set derrotas=0

:inicio
cls
echo ---------------------------------------
echo          Piedra, Papel o Tijeras         
echo              RobleUY vs. Tu             
echo ---------------------------------------
echo 1. Piedra
echo 2. Papel
echo 3. Tijeras
echo.
echo Victorias: %victorias%  Derrotas: %derrotas%
set /p opcion=Elige tu opcion (1-3):
set /a eleccionRoble=%random% %%3 + 1

if %opcion% lss 1 goto error
if %opcion% gtr 3 goto error

echo.
echo RobleUY ha elegido %eleccionRoble%!

if %opcion% equ %eleccionRoble% (
    echo Empate. ¡Intenta de nuevo!
) else if %opcion% equ 1 (
    if %eleccionRoble% equ 2 (
        echo Perdiste. ¡Papel envuelve la piedra!
        set /a derrotas+=1
    ) else (
        echo ¡Ganaste! ¡La piedra rompe las tijeras!
        set /a victorias+=1
    )
) else if %opcion% equ 2 (
    if %eleccionRoble% equ 1 (
        echo ¡Ganaste! ¡Papel envuelve la piedra!
        set /a victorias+=1
    ) else (
        echo Perdiste. ¡Las tijeras cortan el papel!
        set /a derrotas+=1
    )
) else (
    if %eleccionRoble% equ 1 (
        echo Perdiste. ¡La piedra rompe las tijeras!
        set /a derrotas+=1
    ) else (
        echo ¡Ganaste! ¡Las tijeras cortan el papel!
        set /a victorias+=1
    )
)

pause
goto inicio

:error
echo Opcion no valida. Por favor, elige un numero entre 1 y 3.
pause
goto inicio
