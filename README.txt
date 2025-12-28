# 🛠️ Assistente de TI - TS (V02)
> Desenvolvido por @th_spagnolDev

Este projeto consiste em um script em lote (`.bat`) desenvolvido para automatizar tarefas rotineiras de manutenção, diagnóstico de rede e produtividade em ambientes corporativos Windows.

O objetivo é simplificar processos que exigiriam múltiplos cliques ou comandos manuais, centralizando-os em um menu interativo (CLI) de fácil uso.

## 🚀 Funcionalidades

### 🧹 Manutenção e Sistema
- **Limpeza de Arquivos Temporários:** Remove arquivos de cache do sistema e libera espaço.
- **Correção de Windows Update:** Reinicia serviços críticos de atualização travados.
- **Destravar Impressora:** Reinicia o Spooler de impressão e limpa filas travadas.
- **Reparar Sistema (NOVO):** Executa o *System File Checker* (SFC) para corrigir arquivos corrompidos do Windows.
- **Verificar Disco (NOVO):** Exibe o espaço livre e total das unidades de armazenamento.

### 🌐 Rede e Diagnóstico
- **Reparo de Conexão:** Renova endereços IP e limpa cache DNS.
- **Teste de Ping:** Verifica conectividade com serviços externos (Google/Cloudflare).
- **Info Rápida:** Exibe Hostname e IP para facilitar suporte técnico.

### 💼 Produtividade (Modo Trabalho)
- **Launcher Automático:** Inicia Outlook, ERP (TOTVS Web) e WhatsApp simultaneamente com apenas uma opção.
- **Agendamento de Desligamento:** Timer simples para desligamento automático.

## ⚠️ Pré-requisitos

- Sistema Operacional: Windows 10 ou 11.
- Permissões: Algumas funções (Limpeza, Impressora, Update, Reparo) exigem execução como **Administrador**.

## 🔧 Como Usar

1. Baixe o arquivo `Ferramentas.bat`.
2. **Configuração Inicial:**
   - Clique com botão direito > Editar.
   - Na seção `:TRABALHO`, atualize o link do ERP/Navegador para corresponder ao seu ambiente.
3. **Execução:**
   - Recomenda-se criar um atalho e configurar para "Executar como Administrador" para funcionalidade completa.

## 📄 Histórico de Versões
- **V01:** Lançamento inicial com funções básicas de rede e limpeza.
- **V02:** Adição de ferramentas avançadas de diagnóstico (Disco e SFC).

---
*Disclaimer: Este script é fornecido para fins educacionais e de produtividade pessoal.*