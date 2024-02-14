@echo off
setlocal enabledelayedexpansion

:inicio
cls
set /p "pregunta=Dime algo y yo respondere aleatoriamente con 'Si', 'No' o 'No lo se': "
call :responder
pause
goto inicio

:responder
set /a respuesta_aleatoria=!random! %% 3
if !respuesta_aleatoria! equ 0 (
    echo Yo digo que Si
) else if !respuesta_aleatoria! equ 1 (
    echo Yo creo que No
) else (
    echo No lo se
)
exit /b
