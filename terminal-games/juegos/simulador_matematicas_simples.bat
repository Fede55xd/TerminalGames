@echo off
setlocal EnableDelayedExpansion


color 0B


set /a puntaje=0
set /a num_preguntas=10
set /a max_valor=10

echo ------------------------------------------------------------
echo            Juego de Matemáticas
echo ------------------------------------------------------------
echo Responde las siguientes preguntas. Solo puedes ingresar números.
echo ------------------------------------------------------------


for /l %%i in (1, 1, %num_preguntas%) do (
    set /a num1=!random! %% %max_valor% + 1
    set /a num2=!random! %% %max_valor% + 1

   
    set /a operacion=!random! %% 4

    if !operacion! equ 0 (
        set /a resultado=num1+num2
        set operador=+
    ) else if !operacion! equ 1 (
        set /a resultado=num1-num2
        set operador=-
    ) else if !operacion! equ 2 (
        set /a resultado=num1*num2
        set operador=*
    ) else (
        set /a resultado=num1/num2
        set operador=/
    )

    set /p respuesta=¿Cuánto es !num1! !operador! !num2!? Respuesta: 

 
    if !respuesta! equ !resultado! (
        echo ¡Correcto!
        set /a puntaje+=1
    ) else (
        echo Respuesta incorrecta. La respuesta correcta es !resultado!.
    )
    echo ------------------------------------------------------------
)

echo ------------------------------------------------------------
echo Juego terminado. Tu puntaje final es: !puntaje! / %num_preguntas%
echo Gracias por jugar.
echo ------------------------------------------------------------
pause >nul
