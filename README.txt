# 🛠️ Assistente de TI - TS (V05 Final Edition)
> **Desenvolvido por:** [@th_spagnolDev](https://github.com/th_spagnolDev)  
> **Status:** Final / Stable

Ferramenta CLI profissional para automação de suporte, diagnóstico e gestão de ativos em ambientes Windows.

O projeto evoluiu de scripts simples para uma **Suíte de Ferramentas** completa, utilizando Batch Script integrado com PowerShell para superar limitações nativas do CMD.

## 🚀 O Que Há de Novo na V05?
- **Scanner de Identidade (Asset Tag):** Leitura direta da BIOS para exibir **Número de Série (Service Tag)**, Modelo e Fabricante. Essencial para abertura de chamados de garantia (Dell/Lenovo/HP).
- **Correção de Compatibilidade:** Substituição de comandos obsoletos (`WMIC`) por chamadas modernas via **PowerShell**, garantindo funcionamento no Windows 11 (24H2+).

## 📋 Funcionalidades Completas

### 🔧 1. Manutenção
- **Limpeza:** Remoção de temporários e cache.
- **Correção:** Reinício de Spooler de Impressão e Windows Update.
- **Storage:** Análise de espaço em disco com conversão automática para GB.

### 🌐 2. Rede
- **Conectividade:** Testes de Ping e Flush DNS.
- **Wi-Fi Audit:** Recuperação de senhas de redes salvas (Security Audit).

### 💼 3. Produtividade & Gestão
- **Smart Backup:** Espelhamento incremental de documentos via Robocopy.
- **Work Mode:** Launcher de aplicativos corporativos.
- **Logs:** Auditoria local de uso com proteção de integridade (se configurado com NTFS).

## ⚙️ Instalação

1.  Baixe o arquivo `AssistenteV5.bat`.
2.  Edite a seção **[ AREA DE CONFIGURACAO ]** para personalizar caminhos e links.
3.  Execute como **Administrador**.

---
*Projeto Open-Source sob licença MIT.*
