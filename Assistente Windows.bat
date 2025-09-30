@echo off
title Assistente Windows V1.0
color 0B

:inicio
cls
echo =====================================================
echo              Assistente Windows V1.0
echo            POR JOAO VITOR ALVIM NOBRE
echo             joao.vittor15@outlook.com
echo =====================================================
echo.
echo [1 ] Desligar PC daqui 1 hora
echo [2 ] Desligar PC daqui 2 horas
echo [3 ] Cancelar desligamento agendado
echo [4 ] Resolver PC com Lentidao (limpeza leve)
echo [5 ] Resolver Internet Lenta
echo [6 ] Iniciar Reparo no PC (DISM + SFC) [Admin]
echo [7 ] Teste de internet (Speedtest por Ookla)
echo [8 ] Ver IP
echo [9 ] Mostrar DNS cache
echo [10] Abrir prompt como admin (UAC)
echo [11] Abrir Gestor de Tarefas
echo [12] Testar conectividade (ping 8.8.8.8)
echo [13] Mostrar adaptadores de rede
echo [14] Gerar log do Windows Update (Desktop)
echo [15] Mostrar informacao do sistema
echo [16] Flush DNS
echo [17] Reset Winsock e IP [Admin]
echo [18] Otimizar disco C: (defrag/trim) [Admin]
echo [19] Desligar Firewall (NAO RECOMENDADO) [Admin]
echo [20] Ligar Firewall [Admin]
echo [21] Abrir Event Viewer
echo [22] Teste de desempenho de disco (winsat disk)
echo [23] Criar Ponto de Restauracao Manual [Admin]
echo [24] Atualizar pacotes com winget (se disponivel)
echo [25] Forcar gpupdate
echo [0 ] Sair
echo =====================================================
set /p op="Escolha uma opcao (0-25): "

if "%op%"=="1" shutdown -s -t 3600
if "%op%"=="2" shutdown -s -t 7200
if "%op%"=="3" shutdown -a
if "%op%"=="4" cleanmgr /sagerun:1
if "%op%"=="5" ipconfig /release && ipconfig /renew
if "%op%"=="6" dism /online /cleanup-image /restorehealth && sfc /scannow
if "%op%"=="7" start https://www.speedtest.net/
if "%op%"=="8" ipconfig
if "%op%"=="9" ipconfig /displaydns
if "%op%"=="10" powershell -Command "Start-Process cmd -Verb RunAs"
if "%op%"=="11" taskmgr
if "%op%"=="12" ping 8.8.8.8
if "%op%"=="13" ipconfig /all
if "%op%"=="14" powershell Get-WindowsUpdateLog > "%userprofile%\Desktop\WindowsUpdateLog.txt"
if "%op%"=="15" systeminfo
if "%op%"=="16" ipconfig /flushdns
if "%op%"=="17" netsh winsock reset && netsh int ip reset
if "%op%"=="18" defrag C: /O
if "%op%"=="19" netsh advfirewall set allprofiles state off
if "%op%"=="20" netsh advfirewall set allprofiles state on
if "%op%"=="21" eventvwr
if "%op%"=="22" winsat disk
if "%op%"=="23" powershell Checkpoint-Computer -Description "PontoManual" -RestorePointType "MODIFY_SETTINGS"
if "%op%"=="24" winget upgrade --all
if "%op%"=="25" gpupdate /force
if "%op%"=="0" exit

pause
goto inicio
