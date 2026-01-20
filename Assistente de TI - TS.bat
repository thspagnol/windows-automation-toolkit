@echo off
rem ============================================================================
rem NOME DO PROJETO: Assistente de TI
rem VERSAO: V04 (Master Edition)
rem AUTOR: @th_spagnolDev
rem ============================================================================

rem --- [ AREA DE CONFIGURACAO GLOBAL ] ----------------------------------------
set "TITULO_JANELA=Assistente de TI - V04 - @th_spagnolDev"
set "ARQUIVO_LOG=log_atividades.txt"

rem Apps de Trabalho
set "NAVEGADOR= chrome.exe"
set "LINK_ERP= google.com.br"
set "APP_WHATSAPP= whatsapp:"
set "APP_EMAIL= outlook.exe"

rem Configuracao de Backup (V04)
rem Origem: Pasta que voce quer salvar (Ex: Meus Documentos)
set "BACKUP_ORIGEM=%USERPROFILE%\Documents"
rem Destino: Pen Drive ou Rede (Ex: D:\Backup ou Z:\Bkp)
set "BACKUP_DESTINO=C:\Backup_Automatico"
rem ----------------------------------------------------------------------------

title %TITULO_JANELA%
color 0

:MAIN_MENU
cls
echo.
echo ==========================================================
echo      ASSISTENTE TECNICO E AUTOMACAO - THIAGO SPAGNOL
echo                   V04 - Master Edition
echo                  Dev: @th_spagnolDev
echo ==========================================================
echo.
echo   SELECIONE UMA CATEGORIA:
echo.
echo   [1] Ferramentas de Manutencao (Limpeza/Reparo)
echo   [2] Diagnostico de Rede (Internet/Wi-Fi)
echo   [3] Produtividade e Backup (Trabalho/Arquivos)
echo   [4] Informacoes do Sistema
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
echo   [5] Verificar Disco (Storage)
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
echo   [3] Ver Senha do Wi-Fi Atual (Admin) [NOVO]
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
echo   [3] Fazer Backup de Documentos (Robocopy) [NOVO]
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
cls
echo === Limpando Arquivos Temporarios ===
del /q/f/s %TEMP%\* >nul 2>&1
del /q/f/s C:\Windows\Temp\* >nul 2>&1
echo.
echo === Limpando Cache de Internet ===
ipconfig /flushdns
echo.
echo Limpeza concluida.
pause
goto SUB_MANUTENCAO

:IMPRESSORA
call :REGISTRAR_LOG "Executou Fix de Impressora"
cls
echo === Reiniciando Servico de Impressao ===
net stop spooler
del /F /Q /S C:\Windows\System32\spool\PRINTERS\* >nul 2>&1
net start spooler
echo Concluido.
pause
goto SUB_MANUTENCAO

:WINUPDATE
call :REGISTRAR_LOG "Executou Fix Windows Update"
cls
echo === Reiniciando Servicos de Update ===
net stop wuauserv
net stop bits
net stop cryptsvc
echo Iniciando servicos...
net start wuauserv
net start bits
net start cryptsvc
echo Concluido.
pause
goto SUB_MANUTENCAO

:REPARO
cls
echo =================================================
echo        ATENCAO - LEIA ANTES DE CONTINUAR
echo =================================================
echo.
echo Voce escolheu o Verificador de Integridade (SFC).
echo 1. Isso vai escanear todo o Windows buscando erros.
echo 2. Esse processo pode levar de 15 a 40 MINUTOS.
echo 3. O computador pode ficar lento durante o processo.
echo.
set /p confirma=Deseja continuar? (S/N): 
if /I "%confirma%" NEQ "S" goto SUB_MANUTENCAO

echo.
echo Iniciando o Scan... Por favor, aguarde.
echo Nao feche esta janela.
sfc /scannow
echo.
echo Processo finalizado. Verifique a mensagem acima.
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
call :REGISTRAR_LOG "Executou Teste de Conexao"
cls
echo === Testando Conexao ===
echo Testando acesso ao Google...
ping www.google.com -n 4
echo.
echo Testando acesso ao DNS Cloudflare (Geral)...
ping 1.1.1.1 -n 4
echo.
echo Se houver "Esgotado o tempo limite", sua internet esta instavel.
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
rem Mostra o perfil completo para evitar erros de filtro
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
rem /E = Subpastas, /XO = Excluir arquivos mais antigos (Soh copia novos), /R:1 = Tentar 1 vez se falhar
robocopy "%BACKUP_ORIGEM%" "%BACKUP_DESTINO%" /E /XO /R:1 /W:1
echo.
echo Backup finalizado. Verifique a pasta de destino.
pause
goto SUB_PRODUTIVIDADE

:INFO
cls
echo === Informacoes do Sistema ===
echo.
echo Hostname: %computername%
echo Usuario:  %username%
echo.
echo --- Enderecos IP ---
ipconfig | find "IPv4"
echo.
pause
goto MAIN_MENU

rem --- LOGS ---
:REGISTRAR_LOG
echo [%DATE% - %TIME%] User: %USERNAME% - %~1 >> %ARQUIVO_LOG%
goto :eof