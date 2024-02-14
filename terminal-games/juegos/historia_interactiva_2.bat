@echo off
title Arena Epica
color 0F

set vidaJugador=100
set vidaOponente=120
set /a turno=1

echo Bienvenido a la Arena Epica!

:turno
cls
echo ---------------------------------
echo             Turno %turno%
echo ---------------------------------
echo TU VIDA: %vidaJugador%
echo Oponente VIDA: %vidaOponente%
echo.

echo Opciones:
echo 1. Atacar con espada
echo 2. Lanzar hechizo de fuego
echo 3. Utilizar poción de fuerza
echo 4. Intentar esquivar
echo 5. Gritar desafiante
echo 6. Usar arco y flecha
echo 7. Invocar aliado
echo 8. Realizar ataque especial
echo 9. Rendirse y abandonar la arena

set /p opcion="Elige tu accion: "

if %opcion% equ 1 (
    call :atacarConEspada
) else if %opcion% equ 2 (
    call :lanzarHechizoDeFuego
) else if %opcion% equ 3 (
    call :utilizarPocionDeFuerza
) else if %opcion% equ 4 (
    call :intentarEsquivar
) else if %opcion% equ 5 (
    call :gritarDesafiante
) else if %opcion% equ 6 (
    call :usarArcoYFlecha
) else if %opcion% equ 7 (
    call :invocarAliado
) else if %opcion% equ 8 (
    call :ataqueEspecial
) else if %opcion% equ 9 (
    echo Has decidido rendirte. El Oponente gana.
    goto :fin
) else (
    echo Opcion no valida. Intenta de nuevo.
    timeout /nobreak /t 2 >nul
    goto turno
)

call :verificarGanador
set /a turno+=1
goto turno

:atacarConEspada
set /a danoJugador=%RANDOM% %% 20 + 10
set /a danoOponente=%RANDOM% %% 15 + 5

echo.
echo ¡Atacas con tu espada!
echo Infliges %danoJugador% de daño al Oponente.
set /a vidaOponente-=%danoJugador%

echo.
echo El Oponente contraataca.
echo Te quita %danoOponente% de vida.
set /a vidaJugador-=%danoOponente%

timeout /nobreak /t 2 >nul
goto :eof

:lanzarHechizoDeFuego
set /a danoJugador=%RANDOM% %% 25 + 15
set /a danoOponente=%RANDOM% %% 10 + 5

echo.
echo ¡Lanzas un hechizo de fuego!
echo Quemas al Oponente y le infliges %danoJugador% de daño.
set /a vidaOponente-=%danoJugador%

echo.
echo El Oponente resiste el fuego y te quita %danoOponente% de vida.
set /a vidaJugador-=%danoOponente%

timeout /nobreak /t 2 >nul
goto :eof

:utilizarPocionDeFuerza
echo.
echo Las pociones de fuerza están prohibidas en esta arena. No puedes curarte.
timeout /nobreak /t 2 >nul
goto :eof

:intentarEsquivar
set /a exitoEsquivar=%RANDOM% %% 2

echo.
if %exitoEsquivar% equ 1 (
    echo Logras esquivar el ataque del Oponente.
) else (
    echo Intentas esquivar, pero el Oponente te atrapa y te quita %danoOponente% de vida.
    set /a danoOponente=%RANDOM% %% 15 + 5
    set /a vidaJugador-=%danoOponente%
)

timeout /nobreak /t 2 >nul
goto :eof

:gritarDesafiante
set /a exitoGrito=%RANDOM% %% 2

echo.
if %exitoGrito% equ 1 (
    echo Tu grito desafiante desconcierta al Oponente.
    set /a danoOponente=%RANDOM% %% 15 + 5
    echo Le infliges %danoOponente% de daño.
    set /a vidaOponente-=%danoOponente%
) else (
    echo El Oponente ignora tu grito y te quita %danoOponente% de vida.
    set /a danoOponente=%RANDOM% %% 15 + 5
    set /a vidaJugador-=%danoOponente%
)

timeout /nobreak /t 2 >nul
goto :eof

:usarArcoYFlecha
set /a danoJugador=%RANDOM% %% 30 + 15
set /a danoOponente=%RANDOM% %% 10 + 5

echo.
echo ¡Utilizas tu arco y flecha con precisión!
echo Le infliges %danoJugador% de daño al Oponente.
set /a vidaOponente-=%danoJugador%

echo.
echo El Oponente contraataca.
echo Te quita %danoOponente% de vida.
set /a vidaJugador-=%danoOponente%

timeout /nobreak /t 2 >nul
goto :eof

:invocarAliado
set /a exitoInvocacion=%RANDOM% %% 2

echo.
if %exitoInvocacion% equ 1 (
    echo Invocas a un aliado para que te ayude en la batalla.
    set /a danoAliado=%RANDOM% %% 20 + 10
    echo Tu aliado inflige %danoAliado% de daño al Oponente.
    set /a vidaOponente-=%danoAliado%
) else (
    echo Tu invocación falla y no obtienes ayuda.
)

timeout /nobreak /t 2 >nul
goto :eof

:ataqueEspecial
set /a exitoAtaqueEspecial=%RANDOM% %% 2

echo.
if %exitoAtaqueEspecial% equ 1 (
    echo Realizas un ataque especial devastador.
    set /a danoEspecial=%RANDOM% %% 40 + 20
    echo Infliges %danoEspecial% de daño al Oponente.
    set /a vidaOponente-=%danoEspecial%
) else (
    echo Tu intento de ataque especial falla y te quedas vulnerable.
    set /a danoOponente=%RANDOM% %% 15 + 5
    set /a vidaJugador-=%danoOponente%
)

timeout /nobreak /t 2 >nul
goto :eof

:verificarGanador
if %vidaJugador% leq 0 (
    echo Has sido derrotado. ¡El Oponente gana!
    goto :fin
) else if %vidaOponente% leq 0 (
    echo ¡Has derrotado al Oponente! ¡Eres el ganador!
    goto :fin
)
goto :eof

:fin
echo.
echo Juego terminado.
pause >nul
