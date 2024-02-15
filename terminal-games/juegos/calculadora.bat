@echo off
setlocal enabledelayedexpansion

:inicio
set /p "expresion=Ingrese una operacion matematica (o escriba 'salir' para salir): "

if /i "%expresion%"=="salir" (
    echo Saliendo de la calculadora. ¡Hasta luego!
    exit /b
) else (
    set "resultado="
    set /a "resultado=!expresion!" 2>nul
    if not defined resultado (
        echo Operacion no valida. Intentelo de nuevo.
    ) else (
        echo Resultado: !resultado!
    )
    goto inicio
)
