# 🛠️ Windows Office Automation Toolkit

Este projeto consiste em um script em lote (`.bat`) desenvolvido para automatizar tarefas rotineiras de manutenção, diagnóstico de rede e produtividade em ambientes corporativos Windows.

O objetivo é simplificar processos que exigiriam múltiplos cliques ou comandos manuais, centralizando-os em um menu interativo de fácil uso.

## 🚀 Funcionalidades

O script oferece um menu interativo com as seguintes ferramentas:

### 🧹 Manutenção e Sistema
- **Limpeza de Arquivos Temporários:** Remove arquivos de cache do sistema e libera espaço.
- **Correção de Windows Update:** Reinicia serviços críticos de atualização travados.
- **Destravar Impressora:** Reinicia o Spooler de impressão e limpa filas travadas.
- **Agendamento de Desligamento:** Timer simples para desligamento automático.

### 🌐 Rede e Diagnóstico
- **Reparo de Conexão:** Renova endereços IP e limpa cache DNS.
- **Teste de Ping:** Verifica conectividade com serviços externos (Google/Cloudflare).
- **Info Rápida:** Exibe Hostname e IP para facilitar suporte técnico.

### 💼 Produtividade (Modo Trabalho)
- **Launcher Automático:** Inicia um conjunto de ferramentas de trabalho (E-mail, ERP via Web, Comunicadores) simultaneamente com apenas uma opção.

## ⚠️ Pré-requisitos

- Sistema Operacional: Windows 10 ou 11.
- Permissões: Algumas funções (Limpeza, Impressora, Update) exigem execução como **Administrador**.

## 🔧 Como Usar

1. Baixe o arquivo `Ferramentas.bat`.
2. **Configuração Inicial:**
   - Clique com botão direito > Editar.
   - Na seção `:TRABALHO`, atualize os caminhos dos executáveis ou URLs para corresponder ao seu ambiente.
3. **Execução:**
   - Recomenda-se criar um atalho e configurar para "Executar como Administrador" para funcionalidade completa.

## 📄 Isenção de Responsabilidade (Disclaimer)

Este script é fornecido "como está", para fins educacionais e de produtividade pessoal. Recomenda-se revisar o código antes de executá-lo em ambientes de produção sensíveis.

---
*Desenvolvido por Thiago Spagnol*