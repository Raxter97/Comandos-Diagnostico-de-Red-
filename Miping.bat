:menu
cls
echo ===================================================
echo        PANEL DE HERRAMIENTAS DE CONECTIVIDAD
echo ===================================================
echo 1. Comprobacion de Interfaz Local (Loopback)
echo 2. Consultar configuracion de red (IPCONFIG)
echo 3. Envio de Paquetes Basico
echo 4. Supervision Permanente (Ctrl+C para interrumpir)
echo 5. Transmision Limitada (10 paquetes)
echo 6. Evaluacion de Rendimiento (Paquetes de 1000 bytes)
echo 7. Traduccion de Direcciones (IP a Nombre de Host)
echo 8. Rastreo de Ruta hasta Destino (TRACERT)
echo 9. Consulta de Servidor DNS (NSLOOKUP)
echo 10. Abandonar
echo ===================================================
echo.
set /p opcion=Elija una alternativa (1-10): 
if "%opcion%"=="1" goto loopback
if "%opcion%"=="2" goto ipconfig
if "%opcion%"=="3" goto estandar
if "%opcion%"=="4" goto continuo
if "%opcion%"=="5" goto paquetes
if "%opcion%"=="6" goto carga
if "%opcion%"=="7" goto resolucion
if "%opcion%"=="8" goto tracert
if "%opcion%"=="9" goto nslookup
if "%opcion%"=="10" goto salir

:: Entrada no reconocida
echo Alternativa no valida. Vuelva a intentarlo.
pause
goto menu

:loopback
cls
echo [INICIANDO] Comprobacion de interfaz local (127.0.0.1)...
ping 127.0.0.1
echo.
pause
goto menu

:ipconfig
cls
echo [INICIANDO] Mostrando configuracion de red con IPCONFIG...
echo.
echo --- Informacion basica (IP, Mascara, Gateway, DNS) ---
ipconfig
echo.
echo --- Informacion detallada (MAC, DHCP, etc.) ---
ipconfig /all
echo.
pause
goto menu

:estandar
cls
set /p url=Escriba la URL o IP de destino (ej: www.inet.edu.ar): 
echo [INICIANDO] Transmision basica hacia %url%...
ping %url%
echo.
pause
goto menu

:continuo
cls
set /p url_cont=Escriba la URL o IP para supervision continua: 
echo [INICIANDO] Transmision ininterrumpida hacia %url_cont%...
echo Presione Ctrl+C cuando desee finalizar el proceso.
echo.
ping %url_cont% -t
echo.
pause
goto menu

:paquetes
cls
set /p url_paq=Escriba la URL o IP para la transmision limitada: 
echo [INICIANDO] Enviando secuencia de 10 paquetes a %url_paq%...
ping %url_paq% -n 10
echo.
pause
goto menu

:carga
cls
set /p url_carga=Escriba la URL o IP para la evaluacion de rendimiento: 
echo [INICIANDO] Transmitiendo paquetes de 1000 bytes a %url_carga%...
ping %url_carga% -l 1000
echo.
pause
goto menu

:resolucion
cls
set /p ip_res=Escriba la IP a identificar (ej: 8.8.8.8): 
echo [INICIANDO] Buscando nombre de host asociado a %ip_res%...
ping -a %ip_res%
echo.
pause
goto menu

:tracert
cls
echo [INICIANDO] Rastreo de ruta con TRACERT
echo Muestra cada salto (router) entre su PC y el destino,
echo junto con los tiempos de respuesta en milisegundos.
echo Si aparece un "*", significa perdida de conexion en ese salto.
echo.
set /p url_tracert=Escriba la URL o IP de destino (ej: www.utn.edu.ar): 
echo.
echo [EJECUTANDO] Trazando ruta hacia %url_tracert%...
echo.
tracert %url_tracert%
echo.
pause
goto menu

:nslookup
cls
echo [INICIANDO] Consulta DNS con NSLOOKUP
echo Permite conocer la direccion IP asociada a un nombre de dominio
echo y el servidor DNS utilizado para resolver la consulta.
echo.
set /p dominio=Escriba el dominio a consultar (ej: www.inet.edu.ar): 
echo.
echo [EJECUTANDO] Consultando servidor DNS para %dominio%...
echo.
nslookup %dominio%
echo.
pause
goto menu

:salir
cls
echo Operacion finalizada. La herramienta se ha cerrado correctamente.
pause
exit