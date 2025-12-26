@echo off
title Painel de Ferramentas - Thiago
color 1F

:MENU
cls
echo ===============================================
echo           PAINEL DE CONTROLE - THIAGO
echo ===============================================
echo.
echo   [1] Limpeza Geral (Temp + Cache DNS)
echo   [2] Destravar Impressora (Reiniciar Spooler)
echo   [3] Corrigir Windows Update (Reiniciar Servico)
echo   [4] Teste de Conexao (Ping Google/DNS)
echo   [5] Info do PC (Para Suporte TI)
echo   [6] Modo Trabalho (Outlook + TOTVS HTML + Whats)
echo   [7] Agendar Desligamento
echo   [0] Sair
echo.
echo ===============================================
echo   Nota: Execute como ADMINISTRADOR para opcoes 1, 2 e 3.
echo ===============================================
set /p opcao=Digite sua opcao: 

if "%opcao%"=="1" goto LIMPEZA
if "%opcao%"=="2" goto IMPRESSORA
if "%opcao%"=="3" goto WINUPDATE
if "%opcao%"=="4" goto PING
if "%opcao%"=="5" goto INFO
if "%opcao%"=="6" goto TRABALHO
if "%opcao%"=="7" goto TIMER
if "%opcao%"=="0" exit

echo Opcao invalida!
pause
goto MENU

:LIMPEZA
cls
echo === Limpando Arquivos Temporarios ===
del /q/f/s %TEMP%\*
del /q/f/s C:\Windows\Temp\*
echo.
echo === Limpando Cache de Internet ===
ipconfig /flushdns
echo.
echo Limpeza concluida.
pause
goto MENU

:IMPRESSORA
cls
echo === Destravando Fila de Impressao ===
echo Parando servico de impressao...
net stop spooler
echo Limpando arquivos presos...
del /F /Q /S C:\Windows\System32\spool\PRINTERS\*
echo Reiniciando servico...
net start spooler
echo Concluido. Tente imprimir novamente.
pause
goto MENU

:WINUPDATE
cls
echo === Reiniciando Servicos do Windows Update ===
echo Isso pode demorar um pouco...
net stop wuauserv
net stop bits
net stop cryptsvc
echo.
echo Iniciando servicos novamente...
net start wuauserv
net start bits
net start cryptsvc
echo Concluido. Tente buscar atualizacoes agora.
pause
goto MENU

:PING
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
echo === Informacoes para Suporte ===
echo.
echo NOME DA MAQUINA:
hostname
echo.
echo SEU ENDERECO IP:
ipconfig | find "IPv4"
echo.
echo USUARIO: %username%
echo.
pause
goto MENU

:TRABALHO
cls
echo === Iniciando Modo Trabalho ===
echo.

echo 1. Abrindo Outlook Classic...
start outlook.exe
timeout /t 2 >nul

echo 2. Abrindo TOTVS Smart Client HTML...
rem --- ATENCAO: TROQUE O ENDERECO ABAIXO PELO LINK DO SEU TOTVS ---
start chrome.exe "http://link-do-seu-erp.com.br"
timeout /t 2 >nul

echo 3. Abrindo WhatsApp...
start whatsapp:

echo.
echo Todos os aplicativos foram chamados.
pause
goto MENU

:TIMER
cls
echo === Agendar Desligamento ===
set /p min=Quantos MINUTOS para desligar? 
set /a seg=min*60
shutdown -s -t %seg% -f
echo.
echo O computador desligara em %min% minutos.
echo Para CANCELAR, digite 'shutdown -a' no executar.
pause
goto MENU