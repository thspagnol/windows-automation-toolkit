# 🛠️ Assistente de TI - TS (V03.1)
> **Desenvolvido por:** [@th_spagnolDev](https://github.com/th_spagnolDev)  
> **Versão:** Stable/Professional

Ferramenta de automação CLI (Command Line Interface) desenvolvida em Batch Script para otimizar rotinas de manutenção, diagnóstico de rede e produtividade em ambientes Windows corporativos.

Diferente de scripts comuns, este projeto implementa **logs de auditoria**, **centralização de configurações** e **tratamento de erros**, seguindo boas práticas de desenvolvimento.

## 🚀 Funcionalidades Principais

### ⚙️ Arquitetura e Controle
- **Central de Configuração:** Variáveis globais no início do código para fácil adaptação (Hardcode-free).
- **Sistema de Logs:** Registro automático de todas as ações executadas em `log_atividades.txt` para auditoria.
- **Interface Robusta:** Menu interativo com tratamento de erros de input e encoding ANSI.

### 🛠️ Ferramentas Inclusas
1.  **Modo Trabalho:** Inicialização simultânea de ERP (Web), E-mail e Comunicadores configuráveis.
2.  **Manutenção:** Limpeza de arquivos temporários e cache DNS.
3.  **Correção:** Reinício de serviços de impressão (Spooler) e Windows Update.
4.  **Diagnóstico:** Verificação de latência (Ping), integridade de sistema (SFC) e espaço em disco.
5.  **Utils:** Info de Hostname/IP e agendamento de desligamento.

## 📋 Pré-requisitos

- Sistema Operacional: Windows 10 ou 11.
- Permissões: Execução como **Administrador** recomendada para acesso total às ferramentas de sistema.

## 🔧 Instalação e Configuração

1.  Baixe o arquivo `AssistenteV3.bat`.
2.  Abra o arquivo com um editor de texto (Bloco de Notas ou VS Code).
3.  Edite a seção **[ AREA DE CONFIGURACAO ]** no topo do arquivo:
    ```batch
    set "NAVEGADOR=chrome.exe"
    set "LINK_ERP=[http://seu-sistema-aqui.com](http://seu-sistema-aqui.com)"
    ```
4.  Salve e execute.

## 📄 Histórico de Versões

- **V01:** Protótipo funcional com limpeza e rede.
- **V02:** Adição de ferramentas de disco e SFC.
- **V03:** Refatoração completa (Code Cleanup), implementação de Logs e Variáveis Globais.

---
*Este projeto é open-source sob a licença MIT.*
