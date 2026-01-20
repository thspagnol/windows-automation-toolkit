@echo off
rem ============================================================================
rem NOME DO PROJETO: Assistente de TI - TS
rem VERSAO: V05 (Final Edition)
rem AUTOR: @th_spagnolDev
rem ============================================================================

rem --- [ AREA DE CONFIGURACAO GLOBAL ] ----------------------------------------
set "TITULO_JANELA=Assistente de TI - V05 Final - @th_spagnolDev"
set "ARQUIVO_LOG=log_atividades.txt"

rem Apps de Trabalho
set "NAVEGADOR=chrome.exe"
rem ATENCAO: Mantenha link generico para o GitHub
set "LINK_ERP=http://seu-sistema-aqui.com"
set "APP_WHATSAPP=whatsapp:"
set "APP_EMAIL=outlook.exe"

rem Configuracao de Backup
set "BACKUP_ORIGEM=%USERPROFILE%\Documents"
set "BACKUP_DESTINO=D:\Backup_Automatico"
rem ----------------------------------------------------------------------------

title %TITULO_JANELA%
color 1F

:MAIN_MENU
cls
echo.
echo ==========================================================
echo      ASSISTENTE TECNICO E AUTOMACAO - THIAGO SPAGNOL
echo                   V05 - Final Edition
echo                   Dev: @th_SpagnolDev
echo ==========================================================
echo.
echo   SELECIONE UMA CATEGORIA:
echo.
echo   [1] Ferramentas de Manutencao (Limpeza/Reparo)
echo   [2] Diagnostico de Rede (Internet/Wi-Fi)
echo   [3] Produtividade e Backup (Trabalho/Arquivos)
echo   [4] Identidade do Hardware (Asset Tag/Serial) [NOVO]
echo   [0] Sair
echo.
echo ==========================================================
set /p main_opt=Digite a categoria: 

if "%main_opt%"=="1" goto SUB_MANUTENCAO
if "%main_opt%"=="2" goto SUB_REDE
if "%main_opt%"=="3" goto SUB_PRODUTIVIDADE
if "%main_opt%"=="4" goto INFO
if "%main_opt%"=="0" exit

goto MAIN_MENU

rem --- [ SUBMENU 1: MANUTENCAO ] ----------------------------------------------
:SUB_MANUTENCAO
cls
echo ==========================================================
echo               CATEGORIA: MANUTENCAO
echo ==========================================================
echo.
echo   [1] Limpeza Geral (Temp)
echo   [2] Destravar Impressora (Spooler)
echo   [3] Corrigir Windows Update
echo   [4] Reparar Sistema (SFC - Lento)
echo   [5] Verificar Disco (Storage - GB)
echo   [V] Voltar ao Menu Principal
echo.
echo ==========================================================
set /p sub1_opt=Opcao: 

if /I "%sub1_opt%"=="V" goto MAIN_MENU
if "%sub1_opt%"=="1" goto LIMPEZA
if "%sub1_opt%"=="2" goto IMPRESSORA
if "%sub1_opt%"=="3" goto WINUPDATE
if "%sub1_opt%"=="4" goto REPARO
if "%sub1_opt%"=="5" goto DISCO
goto SUB_MANUTENCAO

rem --- [ SUBMENU 2: REDE ] ----------------------------------------------------
:SUB_REDE
cls
echo ==========================================================
echo                  CATEGORIA: REDE
echo ==========================================================
echo.
echo   [1] Teste de Conexao (Ping Google)
echo   [2] Renovar IP e DNS (Flush)
echo   [3] Ver Senha do Wi-Fi Atual (Admin)
echo   [V] Voltar ao Menu Principal
echo.
echo ==========================================================
set /p sub2_opt=Opcao: 

if /I "%sub2_opt%"=="V" goto MAIN_MENU
if "%sub2_opt%"=="1" goto PING
if "%sub2_opt%"=="2" goto RENOVAR_IP
if "%sub2_opt%"=="3" goto WIFI_SENHA
goto SUB_REDE

rem --- [ SUBMENU 3: PRODUTIVIDADE ] -------------------------------------------
:SUB_PRODUTIVIDADE
cls
echo ==========================================================
echo              CATEGORIA: PRODUTIVIDADE
echo ==========================================================
echo.
echo   [1] Iniciar Modo Trabalho (Apps)
echo   [2] Agendar Desligamento
echo   [3] Fazer Backup de Documentos (Robocopy)
echo   [V] Voltar ao Menu Principal
echo.
echo ==========================================================
set /p sub3_opt=Opcao: 

if /I "%sub3_opt%"=="V" goto MAIN_MENU
if "%sub3_opt%"=="1" goto TRABALHO
if "%sub3_opt%"=="2" goto TIMER
if "%sub3_opt%"=="3" goto BACKUP
goto SUB_PRODUTIVIDADE

rem --- [ FUNCOES DE EXECUCAO ] ------------------------------------------------

:LIMPEZA
call :REGISTRAR_LOG "Executou Limpeza Geral"
del /q/f/s %TEMP%\* >nul 2>&1
del /q/f/s C:\Windows\Temp\* >nul 2>&1
echo Limpeza concluida.
pause
goto SUB_MANUTENCAO

:IMPRESSORA
call :REGISTRAR_LOG "Executou Fix Impressora"
net stop spooler
del /F /Q /S C:\Windows\System32\spool\PRINTERS\* >nul 2>&1
net start spooler
echo Spooler reiniciado.
pause
goto SUB_MANUTENCAO

:WINUPDATE
call :REGISTRAR_LOG "Executou Fix Update"
net stop wuauserv
net start wuauserv
echo Servicos reiniciados.
pause
goto SUB_MANUTENCAO

:REPARO
echo ATENCAO: Isso demora.
set /p c=Confirmar? (S/N): 
if /I "%c%" NEQ "S" goto SUB_MANUTENCAO
call :REGISTRAR_LOG "Iniciou SFC Scan"
sfc /scannow
pause
goto SUB_MANUTENCAO

:DISCO
cls
echo === Verificacao de Armazenamento (Via PowerShell) ===
echo.
echo Listando unidades (Valores em GB)...
echo ---------------------------------------------------
powershell -NoProfile -Command "Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object {$_.DriveType -eq 3} | Select-Object DeviceID, @{Name='Total(GB)';Expression={'{0:N2}' -f ($_.Size/1GB)}}, @{Name='Livre(GB)';Expression={'{0:N2}' -f ($_.FreeSpace/1GB)}} | Format-Table -AutoSize"
echo ---------------------------------------------------
pause
goto SUB_MANUTENCAO

:PING
call :REGISTRAR_LOG "Teste Ping"
ping 8.8.8.8 -n 4
pause
goto SUB_REDE

:RENOVAR_IP
call :REGISTRAR_LOG "Renovou IP/DNS"
ipconfig /release
ipconfig /renew
ipconfig /flushdns
pause
goto SUB_REDE

:WIFI_SENHA
cls
echo ==========================================================
echo               CONSULTA DE SENHA WI-FI
echo ==========================================================
echo.
echo Para ver a senha, voce precisa saber o NOME exato da rede.
echo (Ex: ALPBRAS_ESCRITORIO)
echo.
set /p manual_name=Digite o nome da Rede: 
echo.
echo Buscando dados de seguranca para: "%manual_name%"...
echo ==========================================================
echo PROCURE ABAIXO POR: "Conteudo da Chave" ou "Key Content"
echo ==========================================================
echo.
netsh wlan show profile name="%manual_name%" key=clear
echo.
echo ==========================================================
call :REGISTRAR_LOG "Consultou Wi-Fi: %manual_name%"
pause
goto SUB_REDE

:TRABALHO
call :REGISTRAR_LOG "Modo Trabalho"
start %APP_EMAIL%
timeout /t 2 >nul
start %NAVEGADOR% "%LINK_ERP%"
timeout /t 2 >nul
start %APP_WHATSAPP%
goto SUB_PRODUTIVIDADE

:TIMER
set /p min=Minutos: 
set /a seg=min*60
call :REGISTRAR_LOG "Timer %min% min"
shutdown -s -t %seg% -f
goto SUB_PRODUTIVIDADE

:BACKUP
cls
echo === Backup Automatico (Robocopy) ===
echo Origem: %BACKUP_ORIGEM%
echo Destino: %BACKUP_DESTINO%
echo.
echo Pressione ENTER para iniciar ou feche para cancelar.
pause >nul
call :REGISTRAR_LOG "Iniciou Backup"
robocopy "%BACKUP_ORIGEM%" "%BACKUP_DESTINO%" /E /XO /R:1 /W:1
echo.
echo Backup finalizado. Verifique a pasta de destino.
pause
goto SUB_PRODUTIVIDADE

:INFO
cls
echo ==========================================================
echo               IDENTIDADE DO HARDWARE (ASSET)
echo ==========================================================
echo.
echo Coletando dados da BIOS e Placa Mae...
echo ----------------------------------------------------------
echo.
powershell -NoProfile -Command "Get-CimInstance Win32_ComputerSystem | Select-Object -Property Manufacturer, Model, @{N='RAM(GB)';E={'{0:N0}' -f ($_.TotalPhysicalMemory/1GB)}} | Format-List"
powershell -NoProfile -Command "Get-CimInstance Win32_Bios | Select-Object -Property SerialNumber, SMBIOSBIOSVersion | Format-List"
powershell -NoProfile -Command "Get-CimInstance Win32_Processor | Select-Object -Property Name | Format-List"

echo ----------------------------------------------------------
echo.
echo [Hostname]: %computername%
echo [Usuario ]: %username%
echo [IP Local]:
ipconfig | findstr "IPv4"
echo.
echo ==========================================================
call :REGISTRAR_LOG "Consultou Info Hardware (Asset)"
pause
goto MAIN_MENU

rem --- LOGS ---
:REGISTRAR_LOG
echo [%DATE% - %TIME%] User: %USERNAME% - %~1 >> %ARQUIVO_LOG%
goto :eof