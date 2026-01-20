# 🛠️ Assistente de TI - TS (V04 Master)
> **Desenvolvido por:** [@th_spagnolDev](https://github.com/th_spagnolDev)  
> **Versão:** V04.2 (Stable/Master)

Ferramenta CLI (Command Line Interface) avançada para automação de suporte técnico, manutenção e backup em ambientes Windows.

Este projeto consolida scripts de manutenção em uma interface modular, substituindo a execução manual de dezenas de comandos por um menu intuitivo e seguro.

## 🚀 Novidades da Versão V04
- **Arquitetura Modular:** Menus divididos por categorias (Manutenção, Rede, Produtividade).
- **Módulo de Backup:** Integração com **Robocopy** para backup incremental automático de documentos.
- **Recuperação de Wi-Fi:** Ferramenta nativa para consulta de senhas de redes salvas (Security Audit).

## 📋 Funcionalidades

### 🔧 1. Manutenção & Sistema
- **Limpeza Profunda:** Remoção de temporários do Windows e User Profile.
- **Spooler Fix:** Reinício forçado de serviços de impressão travados.
- **Health Check:** Verificação de integridade (SFC) e espaço em disco.

### 🌐 2. Rede & Conectividade
- **Diagnóstico:** Testes de latência (Ping) e renovação de IP/DNS.
- **Wi-Fi Audit:** Exibição de dados de perfis Wireless salvos (incluindo chaves de segurança).

### 💼 3. Produtividade
- **Work Mode:** Launcher configurável para abrir ERP, E-mail e Comunicadores simultaneamente.
- **Smart Backup:** Rotina de espelhamento de pastas críticas (Documentos -> Destino Externo).

## ⚙️ Instalação e Configuração

1.  Baixe o arquivo `AssistenteV4.bat`.
2.  Edite a seção **[ AREA DE CONFIGURACAO ]** no início do arquivo para definir:
    * Caminhos dos softwares (Navegador, ERP).
    * Origem e Destino do Backup (Ex: `set "BACKUP_DESTINO=F:\Backups"`).
3.  Execute como **Administrador** para acesso total.

## 🛡️ Segurança e Logs
O sistema gera automaticamente um arquivo `log_atividades.txt` local, registrando data, hora e usuário de cada execução, garantindo rastreabilidade do uso técnico.

---
*Projeto Open-Source sob licença MIT.*
