@echo off
setlocal EnableDelayedExpansion

color 0A

set /a puntaje=0
set /a max_puntaje=5
set /a num_intentos=3
set /a rango_inicio=1
set /a rango_fin=5

echo ------------------------------------------------------------
echo            Juego de Adivinanza de Numeros
echo ------------------------------------------------------------
echo Hola, soy Sebastian(RobleUY) y he pensado en un numero entre %rango_inicio% y %rango_fin%.
echo Trata de adivinarlo. Tienes %num_intentos% intentos.
echo ------------------------------------------------------------

set /a numero_pensado=!random! %% (%rango_fin% - %rango_inicio% + 1) + %rango_inicio%

for /l %%i in (1, 1, %num_intentos%) do (
    set /p intento=¿Cual es el numero que he pensado?: 

    if !intento! equ !numero_pensado! (
        echo ¡Correcto! Has adivinado el numero.
        set /a puntaje+=1

        if !puntaje! geq !max_puntaje! (
            goto fin_juego
        )
        
        goto siguiente_juego
    ) else (
        echo Respuesta incorrecta. Intenta de nuevo.
    )
)

:siguiente_juego
echo ------------------------------------------------------------
echo Has agotado tus intentos. El numero que pense era: !numero_pensado!
echo Siguiente juego...
echo ------------------------------------------------------------
goto fin_juego

:fin_juego
echo ------------------------------------------------------------
echo Gracias por jugar. Tu puntaje final es: !puntaje! / !max_puntaje!
echo ------------------------------------------------------------
pause >nul
 