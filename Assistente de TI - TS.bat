@echo off
rem ============================================================================
rem NOME DO PROJETO: Assistente de TI - TS
rem VERSAO: V03.1 (Stable/Fix)
rem AUTOR: @th_spagnolDev
rem ============================================================================

rem --- [ AREA DE CONFIGURACAO ] -----------------------------------------------
set "TITULO_JANELA=Assistente de TI - V03.1 - @th_spagnolDev"
set "ARQUIVO_LOG=log_atividades.txt"

rem Apps de Trabalho
set "NAVEGADOR=chrome.exe"
set "LINK_ERP=http://link-do-seu-erp.com.br"
set "APP_WHATSAPP=whatsapp:"
set "APP_EMAIL=outlook.exe"
rem ----------------------------------------------------------------------------

title %TITULO_JANELA%
color 1F

:MENU
cls
echo.
echo ==========================================================
echo      ASSISTENTE TECNICO E AUTOMACAO - THIAGO SPAGNOL
echo                   V03.1 - Professional
echo                  Dev: @th_spagnolDev
echo ==========================================================
echo.
echo   [1] Limpeza Geral (Temp + Cache DNS)
echo   [2] Destravar Impressora (Spooler)
echo   [3] Corrigir Windows Update
echo   [4] Teste de Conexao (Ping)
echo   [5] Info do PC (Hostname/IP)
echo   [6] Modo Trabalho (Apps de Rotina)
echo   [7] Agendar Desligamento
echo   [8] Espaco em Disco (Storage)
echo   [9] Reparar Sistema (SFC - Lento)
echo   [0] Sair
echo.
echo ==========================================================
echo   Nota: Execute como ADMINISTRADOR para opcoes 1, 2, 3 e 9.
echo ==========================================================
set /p opcao=Digite a opcao desejada: 

if "%opcao%"=="1" goto LIMPEZA
if "%opcao%"=="2" goto IMPRESSORA
if "%opcao%"=="3" goto WINUPDATE
if "%opcao%"=="4" goto PING
if "%opcao%"=="5" goto INFO
if "%opcao%"=="6" goto TRABALHO
if "%opcao%"=="7" goto TIMER
if "%opcao%"=="8" goto DISCO
if "%opcao%"=="9" goto REPARO
if "%opcao%"=="0" exit

echo.
echo [ERRO] Opcao invalida.
timeout /t 2 >nul
goto MENU

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
goto MENU

:IMPRESSORA
call :REGISTRAR_LOG "Executou Fix de Impressora"
cls
echo === Reiniciando Servico de Impressao ===
net stop spooler
del /F /Q /S C:\Windows\System32\spool\PRINTERS\* >nul 2>&1
net start spooler
echo Concluido.
pause
goto MENU

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
goto MENU

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
goto MENU

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
goto MENU

:TRABALHO
call :REGISTRAR_LOG "Iniciou Modo Trabalho"
cls
echo === Iniciando Ambiente de Trabalho ===
echo.
echo [1/3] Iniciando E-mail (%APP_EMAIL%)...
start %APP_EMAIL%
timeout /t 2 >nul

echo [2/3] Acessando ERP Web...
start %NAVEGADOR% "%LINK_ERP%"
timeout /t 2 >nul

echo [3/3] Abrindo Comunicador...
start %APP_WHATSAPP%
echo.
echo Ambiente carregado.
pause
goto MENU

:TIMER
cls
echo === Agendar Desligamento ===
set /p min=Minutos para desligar: 
set /a seg=min*60
call :REGISTRAR_LOG "Agendou desligamento para %min% minutos"
shutdown -s -t %seg% -f
echo Agendado.
pause
goto MENU

:DISCO
cls
echo === Verificando Espaco em Disco ===
echo.
echo Listando unidades de armazenamento...
echo.
wmic logicaldisk get size,freespace,caption
echo.
echo Nota: Os valores estao em Bytes.
echo Para converter: 1073741824 Bytes = 1 GB
pause
goto MENU

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
if /I "%confirma%" NEQ "S" goto MENU

echo.
echo Iniciando o Scan... Por favor, aguarde.
echo Nao feche esta janela.
sfc /scannow
echo.
echo Processo finalizado. Verifique a mensagem acima.
pause
goto MENU

rem --- FUNCAO DE LOG ---
:REGISTRAR_LOG
echo [%DATE% - %TIME%] Usuario: %USERNAME% - Acao: %~1 >> %ARQUIVO_LOG%
goto :eof
