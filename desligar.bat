Editado por josemarcio15

@echo off
:inicio
cls
chcp 65001 > nul
echo 1 para desligar:
echo 2 para cancelar:

set /p choice=Escolha a opção: 

if "%choice%"=="1" goto desligar
if "%choice%"=="2" goto cancelar

goto invalido

:invalido
echo Opcao Invalida. Retornando para o inicio...
timeout /t 5
goto inicio

:desligar
set /p input=Quantos minutos deseja desligar: 

rem Verifica se a entrada é um número
for /f "delims=0123456789" %%a in ("%input%") do (
    echo Entrada inválida. Retornando para o inicio...
    timeout /t 5
    goto inicio
)

set /a seconds=%input%*60
shutdown /s /f /t %seconds%
echo para cancelar aperte qualquer tecla e depois siga as instrucoes
timeout /t %seconds%
echo pressione 2 para cancelar o desligamento:
set /p choice=Escolha a opção:
if "%choice%"=="2" goto cancelarAgendamento


goto fim

:cancelar
shutdown /a
echo Desligamento cancelado.
goto fim

:cancelarAgendamento
shutdown /a
echo Desligamento cancelado.
timeout /t 3
goto inicio

:fim

pause
