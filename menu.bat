@echo off

MODE con:cols=70 lines=30


:inicio 
SET var=0
cls
color 6


echo    -------------------
echo    --   MENU 0.1    --
echo    -------------------

echo ----------------------------
echo Se recomienda ejecutar este 
echo menu como SuperUsuario
echo ----------------------------

echo 1 Detener Proceso Mysql
echo 2 Iniciar Mysqld
echo 3 Borrar Archivos Temporales
echo 4 Activar Windows Home Single Language
echo 5 Activar windows 10 Pro
echo u Habilitar Autologin
echo m Iniciar Cliente MYSQL
echo a Acerca de...
set /P var= Seleccione una opcion[1-5,u,a]:
if "%var%" == "1" goto pro 
if "%var%" == "2" goto pro1
if "%var%" == "3" goto op1
if "%var%" == "4" goto win10
if "%var%" == "5" goto win10pro
if "%var%" == "u" goto auto
if "%var%" == "m" goto base
if "%var%" == "a" goto acerca
                  

:base
echo Iniciando Cliente MYSQL
cd C:\Mariadb\bin
mysql -u root -psoftware
pause
goto:inicio

:pro
echo Deteniendo proceso Mysqld
taskkill /f /im mysqld.exe
pause
goto:inicio

:pro1
echo Iniciando proceso Mysqld
C:\Mariadb\bin\mysqld.exe
pause
goto:inicio

:op1
echo Borrando Archivos Temporales
cd %temp%
del * /s /q
pause
goto:inicio

:auto
echo Habilitando autologin, al terminar escriba "netplwiz" para configurar
REG Add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PasswordLess\Device" /V "DevicePasswordLessBuildVersion" /T REG_DWORD /D 0 /F
pause
netplwiz
pause
goto:inicio

:win10
echo Ingresando la clave, no cierre hasta que vea
echo la pantalla de confirmacion, puede tardar un poco
slmgr /ipk 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
pause
echo No cierre la pantalla, espere la confirmacion
slmgr /skms kms.digiboy.ir
pause
echo Realizando ultimo paso, espere....
slmgr /ato
echo espere...
pause
echo listo
pause
goto:inicio

:win10pro
echo Ingresando la clave, no cierre hasta que vea
echo la pantalla de confirmacion, puede tardar un poco
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
pause
echo No cierre la pantalla, espere la confirmacion
slmgr /skms kms.digiboy.ir
pause
echo Realizando ultimo paso, espere....
slmgr /ato
echo espere...
pause
echo listo
pause
goto:inicio

:acerca
cls
echo Este script fue escrito en batch por Jorge(Vegatronica)
echo y es de uso libre, se recomienda ampliamente ejecutar 
echo como Administrador
pause
goto:inicio